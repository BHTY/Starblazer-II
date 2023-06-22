#ifndef __STAR_GEN_H_
#define __STAR_GEN_H_

#include "int.h"

extern uint8* frontbuffer;
extern char* SG_platform;
extern uint32 mplayer_addr;

typedef struct{
	uint16 x, y;
	bool_t buttons[2];
} SG_joystick_t;

typedef struct{
	uint16 x, y;
	bool_t buttons[2];
} SG_mouse_t;

//Misc functions
void SG_Init(int, char**);
void SG_Close();

//Input functions
void SG_ReadStick(SG_joystick_t*);
void SG_ReadMouse(SG_mouse_t*);
bool_t SG_KeyDown(char);

//Graphics painting
void SG_DrawFrame();
void SG_SetPaletteIndex(uint8 index, uint8 r, uint8 g, uint8 b); //realizes palette

//Timing
uint32 SG_GetTicks();
void SG_WaitBlank();

//Networking
bool_t SG_OpenConnection(uint32);
int SG_RecievePacket(void*, int);
void SG_SendPacket(void*, int);
void SG_CloseConnection();

//Sound

#endif