#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <i86.h>
#include <dos.h>
#include <conio.h>

#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/graphics.h"
#include "../headers/blazer2.h"
#include "../headers/net.h"
#include "../headers/serial.h"

#define PIC_EOI 0x20
#define PIC2_COMMAND 0xA0
#define PIC1_COMMAND 0x20

void setmode(char mode){ //sets the VGA card to the given display mode
	union REGS regs;
	regs.x.eax = mode;
	int386(0x10, &regs, &regs);
}

int interrupt_tick = 0;
uint8* frontbuffer;

void (__interrupt __far* prev_int_08)();
void (__interrupt __far* prev_int_09)();

void interrupt timer_irq() {
	//cam_pos.z+=0x5C666;//0x18000;
	interrupt_tick++;
	outp(PIC2_COMMAND, PIC_EOI);
	outp(PIC1_COMMAND, PIC_EOI);
}

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

void init_timer() {
	prev_int_08 = _dos_getvect(0x08);
	_dos_setvect(0x08, timer_irq);

	outp(0x43, 52);
	outp(0x40, 0xA6);
	outp(0x40, 0x04);

	srand(time(NULL));
}

void SG_Init(int argc, char** argv){
	memset(keys, 0, 256);

	SG_GameInit();
	frontbuffer = (char*)0xA0000L;
	FBPTR = malloc(64000);
	setmode(0x13);
	
	initSerial();

	prev_int_09 = _dos_getvect(0x09);
	_dos_setvect(9, keyirq);
	init_timer();
}

void SG_Close(){

}

void SG_ReadStick(SG_joystick_t* joy){

}

int mouseX = 160;
int mouseY = 100;

void SG_ReadMouse(SG_mouse_t* mouse){
	joystick_t joy;
	memset(mouse, 0, sizeof(SG_mouse_t));
	vjoy_read(&joy);

	if (joy.yaw > 1) {
		mouseX -= 1;
	}
	else if (joy.yaw < -1) {
		mouseX += 1;
	}

	if (joy.pitch < -1) {
		mouseY += 1;
	}
	else if (joy.pitch > 1) {
		mouseY -= 1;
	}

	mouse->buttons[0] = joy.fire;

	mouse->x = mouseX;
	mouse->y = mouseY;
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
	return interrupt_tick;
}

void SG_WaitBlank(){
	while ((inp(0x03da) & 8));
	while (!(inp(0x3DA) & 8));
}

void SG_ProcessEvents() {
	SG_WaitBlank();
}

bool_t SG_OpenConnection(uint32 addr){
	//printf("Serial port initialized\n");
	return 1;
}

int SG_RecievePacket(void* buf, int num_bytes){
	//getsSerial(buf, num_bytes);
}

void SG_SendPacket(void* buf, int num_bytes){
	//putsSerial(buf, num_bytes);
}

void SG_CloseConnection(){
	// there's no way to do this, is there?
}

void SG_Sleep(int ms) {

}

void dos_exit() {
	_dos_setvect(0x09, prev_int_09); //reset ps2 irq
	_dos_setvect(0x08, prev_int_08); //reset pit irq
	setmode(0x03); //back to text mode!
}

int main(int argc, char** argv){
	SG_WelcomeMessage();
	printf("Press any key.\n");//printf("%d\n", sizeof(PACKET));
	getch();

	SG_Init(argc, argv);
	SG_InitPalette();
	title_init();
	

	while (1){
		SG_Tick();

		if (SG_KeyDown('x')) break;
		if (multiplayer && StarblazerEntities[0]->health <= 0) {
			send_death();
			break;
		}
	}

	dos_exit();
	printf("Thank you for playing Starblazer II!\n");
}
