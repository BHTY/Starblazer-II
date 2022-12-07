
#include <dos.h>
#include <stdio.h>
#include <conio.h>
#include <i86.h>
#include "rm.h"
void resetSB(unsigned char r) {
	outp(0x226, r);
}
unsigned char readSB() {
	while (!(inp(0x22e) & 0x80)) ;
	return inp(0x22a);
}
void writeSB(unsigned char c) {
	while (inp(0x22c) & 0x80) ;
	outp(0x22c, c);
}
void initSB() {
	short delayLoop = 0;
	resetSB(1);
	do {
		delayLoop++;
	} while (delayLoop);
	resetSB(0);
	while (readSB() != 0xaa) ;
}
struct DMA_block {
	char page;
	unsigned short offset;
	unsigned short length;
};
typedef struct DMA_block DMA_block;


void LoadPageAndOffset(DMA_block *blk, RMptr data)
{
    unsigned int temp, segment, offset;
    unsigned long foo;

    segment = data.segment;
    offset  = data.offset;

    blk->page = (segment & 0xF000) >> 12;
    temp = (segment & 0x0FFF) << 4;
    foo = offset + temp;
    if (foo > 0xFFFF)
        blk->page++;
    blk->offset = (unsigned int)foo;
}

void getdmagoing(DMA_block blk) {
	_disable();
	outp(0x0a, 0x05);
	outp(0x0c, 0x00);
	outp(0x0b, 0x49);
	outp(0x02, (blk.offset) & 0xff);
	outp(0x02, (blk.offset) >> 8);
	outp(0x83, blk.page);
	outp(0x03, (blk.length) & 0xff);
	outp(0x03, (blk.length) >> 8);
	outp(0x0a, 0x01);
	_enable();
}
void ungodma() {
	outp(0x0a, 0x05);
	outp(0x0c, 0x00);
	outp(0x0a, 0x01);
}
DMA_block sbDmaBlk;
FILE *sbAfile;
RMptr sbAbuffer;
unsigned char sbAbuffer2[8192];
int sbFired = 0;
int sbInitialized = 0;
void __interrupt moredma();
void loadSB(char *filename, int interruptN) {
	sbAfile = fopen(filename, "rb");
	if (!sbInitialized) {
		do {
			sbAbuffer = getmem(16384);
			LoadPageAndOffset(&sbDmaBlk, sbAbuffer);
		} while (sbDmaBlk.offset > 0xe000);
		sbDmaBlk.length = 8191;
		sbInitialized++;
	}
	fseek(sbAfile, 0x50, SEEK_SET);
	fread(sbAbuffer2, 1, 8192, sbAfile);
	pm2rmcpy(sbAbuffer2, sbAbuffer, 8192);
	outp(0x21, 0);
	_dos_setvect(interruptN, moredma);
	getdmagoing(sbDmaBlk);
	writeSB(0x40); // set time constant
	writeSB(0xd2); // ~11khz?
	writeSB(0xd1); // turn on speaker?
	writeSB(0x14);
	writeSB(0xff);
	writeSB(0x1f);
	fread(sbAbuffer2, 1, 8192, sbAfile);
	sbFired = 1;
	moredma();
	sbFired = 0;
}
int updateSB() {
	if (sbFired) {
		//printf("Reading a new one!\n");
		fread(sbAbuffer2, 1, 8192, sbAfile);
		sbFired = 0;
	}
	return feof(sbAfile);
}
void killSB() {
	writeSB(0xd3); // turn off speaker?
	ungodma();
	sbFired = 0;
}


void __interrupt moredma() {
	if (!sbFired) pm2rmcpy(sbAbuffer2, sbAbuffer, 8192);
	sbFired++;
	getdmagoing(sbDmaBlk);
	inp(0x22e);
	writeSB(0x14);
	writeSB(0xff);
	writeSB(0x1f);
	outp(0x20, 0x20);
}
