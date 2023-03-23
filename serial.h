#include <dos.h>
#include <stdio.h>
#include <conio.h>
#include <i86.h>

#define SERIALPORT 0x3f8

int initSerial() {
	unsigned char c;
	outp(SERIALPORT+1, 0x00);
	outp(SERIALPORT+3, 0x80);
	outp(SERIALPORT+0, 0x03);
	outp(SERIALPORT+1, 0x00);
	outp(SERIALPORT+3, 0x03);
	outp(SERIALPORT+2, 0xc7);
	//outp(SERIALPORT+4, 0x0b);
	outp(SERIALPORT+4, 0x1e);
	//outp(SERIALPORT+0, 0xae);
	//c = inp(SERIALPORT+0);
	//if (c != 0xae) {
	//	return 1;
	//}
	outp(SERIALPORT+4, 0x0f);
	return 0;
}

int isTransmitEmpty() {
	return inp(SERIALPORT+5) & 0x20;
}

int isRecvReady() {
	return inp(SERIALPORT+5) & 0x1;
}

void writeSerial(unsigned char a) {
	while (isTransmitEmpty() == 0);
	outp(SERIALPORT+0, a);
}
unsigned char readSerial() {
	while (isRecvReady() == 0);
	return inp(SERIALPORT+0);
}
void putsSerial(unsigned char *s, int length) {
	while (length--) {
		writeSerial(*(s++));
	}
}
void getsSerial(unsigned char *s, int length) {
	while (length--) {
		*(s++) = readSerial();
	}
}
void clearBuffer() {
	while (isRecvReady()) readSerial();
}
