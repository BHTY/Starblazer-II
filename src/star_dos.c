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

void SG_Init(int argc, char** argv){
	SG_GameInit();
	frontbuffer = (char*)0xA0000L;
	FBPTR = malloc(64000);
	setmode(0x13);
}

void SG_Close(){

}

void SG_ReadStick(SG_joystick_t* joy){

}

void SG_ReadMouse(SG_mouse_t* mouse){
	memset(mouse, 0, sizeof(SG_mouse_t));
	mouse->x = 160;
	mouse->y = 100;
}

bool_t SG_KeyDown(char key){
	return 0;
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