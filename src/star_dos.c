#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <i86.h>
#include <dos.h>
#include <conio.h>

#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/graphics.h"

void setmode(char mode){ //sets the VGA card to the given display mode
	union REGS regs;
	regs.x.eax = mode;
	int386(0x10, &regs, &regs);
}

uint8* frontbuffer;

unsigned char keys[256];
static unsigned char kbdus[128] =
{
	0, 27, '1', '2', '3', '4', '5', '6', '7', '8',     /* 9 */
	'9', '0', '-', '=', '\b',     /* Backspace */
	'\t',                 /* Tab */
	'Q', 'W', 'E', 'r',   /* 19 */
	't', 'y', 'u', 'i', 'o', 'P', '[', ']', '\n', /* Enter key */
	0,                  /* 29   - Control */
	'A', 'S', 'D', 'f', 'g', 'h', 'J', 'K', 'l', ';',     /* 39 */
	'\'', '`', 0,                /* Left shift */
	'\\', 'z', 'x', 'c', 'v', 'B', 'n',                    /* 49 */
	'm', ',', '.', '/', 0,                              /* Right shift */
	'*',
	0,  /* Alt */
	' ',  /* Space bar */
	0,  /* Caps lock */
	0,  /* 59 - F1 key ... > */
	0, 0, 0, 0, 0, 0, 0, 0,
	0,  /* < ... F10 */
	0,  /* 69 - Num lock*/
	0,  /* Scroll Lock */
	0,  /* Home key */
	1,  /* Up Arrow */
	0,  /* Page Up */
	'-',
	3,  /* Left Arrow */
	0,
	4,  /* Right Arrow */
	'+',
	0,  /* 79 - End key*/
	2,  /* Down Arrow */
	0,  /* Page Down */
	0,  /* Insert Key */
	0,  /* Delete Key */
	0, 0, 0,
	0,  /* F11 Key */
	0,  /* F12 Key */
	0,  /* All other keys are undefined */
};


void interrupt keyirq() {
	char scancode = inp(0x60);

	if (scancode & 0x80){ //key has been released
		keys[kbdus[scancode - 0x80]] = 0;
	}

	else{ //key has been pressed
		keys[kbdus[scancode]] = 1;
	}
	outp(0x20, 0x20);
}

void SG_Init(int argc, char** argv){
	memset(keys, 0, 256);

	SG_GameInit();
	frontbuffer = (char*)0xA0000L;
	FBPTR = malloc(64000);
	setmode(0x13);

	_dos_setvect(9, keyirq);
}

void SG_Close(){

}

void SG_ReadStick(SG_joystick_t* joy){

}

void SG_ReadMouse(SG_mouse_t* mouse){
	memset(mouse, 0, sizeof(SG_mouse_t));
	mouse->x = 160;
	mouse->y = 120;
	mouse->buttons[0] = SG_KeyDown(' ');
}

bool_t SG_KeyDown(char key){
	return keys[key];
}

void SG_DrawFrame(){
	//memcpy(frontbuffer, FBPTR, 64000);
}

void SG_SetPaletteIndex(uint8 index, uint8 r, uint8 g, uint8 b){
	outp(0x3c8, index);
	outp(0x3c9, r >> 2);
	outp(0x3c9, g >> 2);
	outp(0x3c9, b >> 2);
}

uint32 SG_GetTicks(){
	return 0;
}

void SG_WaitBlank(){
	while ((inp(0x03da) & 8));
	while (!(inp(0x3DA) & 8));
}

int main(int argc, char** argv){
	SG_WelcomeMessage();
	getch();
	SG_Init(argc, argv);
	SG_InitPalette();
	title_init();

	while (1){
		SG_Tick();
	}
}