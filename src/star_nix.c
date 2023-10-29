/*
Filename: star_nix.c
Description: Starblazer II for SDL2 on Linux
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

#include <sys/time.h>
#include <unistd.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/Xatom.h>
#include <X11/XKBlib.h>

#include <arpa/inet.h>
#include <sys/socket.h>

#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/graphics.h"

char* SG_platform = "nix";
char* SG_title = "Starblazer II for UNIX";
uint8* frontbuffer;

uint32 mplayer_addr;

#define X_256C 0
#define X_TRUE 1

uint32 palette_map[256];

uint32* framebuf;
static int X_colormode;
static XVisualInfo s_Info;
static Colormap colormap = NULL;
static Display *s_Display = NULL;
static Window s_Window = NULL;
static int s_Screen = 0;
static GC s_Gc = 0;
static XImage *s_Image = NULL;

float mouseFactorX, mouseFactorY;
bool_t mouseDownLeft = 0;
bool_t mouseDownRight = 0;

bool_t keys[256];

XColor X_palette[256];

struct sockaddr_in server_addr;
int server_connection;

bool_t SG_OpenConnection(uint32 addr){
	int iMode = 1;
	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(GAME_SETTINGS.com_settings.port);
	server_addr.sin_addr.s_addr = mplayer_addr;
	
	server_connection = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);
	
	if(server_connection == 0){
		return 0;
	}
	
	ioctl(server_connection, SOCK_NONBLOCK, &iMode);
	
	return 1;
}

int SG_RecievePacket(void* buf, int num_bytes){
	int return_value = recvfrom(server_connection, buf, num_bytes, MSG_DONTWAIT, 0, 0);
	
	if(return_value == -1){
		return 0;
	}
	else{
		return return_value;
	}
}

void SG_SendPacket(void* buf, int num_bytes){
	sendto(server_connection, buf, num_bytes, 0, &server_addr, sizeof(server_addr));
}

void SG_CloseConnection(){
	close(server_connection);
}

void SG_Init(int argc, char** argv){
	int blackColor, whiteColor, depth;
	XSetWindowAttributes attr;

	//do the generic initialization
	SG_GameInit();
	
	s_Display = XOpenDisplay(NULL);
	s_Screen = DefaultScreen(s_Display);
	blackColor = BlackPixel(s_Display, s_Screen);
	whiteColor = WhitePixel(s_Display, s_Screen);
	
	memset(&attr, 0, sizeof(XSetWindowAttributes));
	attr.event_mask = ExposureMask | KeyPressMask | ButtonPressMask | ButtonReleaseMask;
	attr.background_pixel = BlackPixel(s_Display, s_Screen);
	depth = DefaultDepth(s_Display, s_Screen);
	s_Window = XCreateSimpleWindow(s_Display, DefaultRootWindow(s_Display), 0, 0, 320, 200, 0, blackColor, blackColor);
	XStoreName(s_Display, s_Window, SG_title);
	XSelectInput(s_Display, s_Window, StructureNotifyMask | KeyPressMask | KeyReleaseMask);
	XMapWindow(s_Display, s_Window);
	s_Gc = XCreateGC(s_Display, s_Window, 0, NULL);
	XSetForeground(s_Display, s_Gc, whiteColor);
	XkbSetDetectableAutoRepeat(s_Display, 1, 0);
	
	mouseFactorX = 320.0 / 320;
	mouseFactorY = 200.0 / 200;
	
	FBPTR = malloc(320*200);
	frontbuffer = malloc(320*200);
	memset(keys, 0, 256 * sizeof(bool_t));
	
	if(!XMatchVisualInfo(s_Display, s_Screen, depth, DirectColor, &s_Info)){
		XMatchVisualInfo(s_Display, s_Screen, 8, PseudoColor, &s_Info);
		X_colormode = X_256C;
		printf("256c not supported!\n");
		exit(0);
	}else{
		X_colormode = X_TRUE;
		framebuf = malloc(320 * 200 * 4);
		s_Image = XCreateImage(s_Display, DefaultVisual(s_Display, s_Screen), depth, ZPixmap, 0, framebuf, 320, 200, 8, 0);
	}
}

void SG_ReadMouse(SG_mouse_t* mouse){
	Window w;
	int n;
	int mask;
	
	XQueryPointer(s_Display, s_Window, &w, &w, &n, &n, &(mouse->x), &(mouse->y), &mask);
	
	mouse->buttons[0] = 0;
	
	if(mask & 256){mouse->buttons[0] = 1;}
}

bool_t SG_KeyDown(unsigned char key){
	return keys[key];
}

void SG_DrawFrame(){
	int i;

	if(X_colormode == X_TRUE){
		for(i = 0; i < 320 * 200; i++){
			framebuf[i] = palette_map[frontbuffer[i]];
		}
	}

	XPutImage(s_Display, s_Window, s_Gc, s_Image, 0, 0, 0, 0, 320, 200);

	memset(FBPTR, 0, 320*200);
}

void SG_SetPaletteIndex(uint8 index, uint8 r, uint8 g, uint8 b){ 
	palette_map[index] = (r << 16) | (g << 8) | (b);
}

uint32 SG_GetTicks(){
	struct timeval tp;
	struct timezone tzp;
	
	gettimeofday(&tp, &tzp);
	
	return (tp.tv_sec * 1000) + (tp.tv_usec / 1000);
}

int gamerunning = 1;
void SG_WaitBlank(){
	
}

int map_key(KeySym sym){
	if(sym > 255) return 0;
	if(sym >= 97) sym -= 32;

	return sym;
}

void SG_ProcessEvents(){
	XEvent e;
	KeySym sym;
	
	if(s_Display){
		while(XPending(s_Display) > 0){
			XNextEvent(s_Display, &e);
			
			if(e.type == KeyPress){
				sym = XKeycodeToKeysym(s_Display, e.xkey.keycode, 0);
				keys[map_key(sym)] = 1;
			}
			else if(e.type == KeyRelease){
				sym = XKeycodeToKeysym(s_Display, e.xkey.keycode, 0);
				keys[map_key(sym)] = 0;
			}
		}
	}
}

void SG_ReadStick(SG_joystick_t* joy){

}

void SG_Sleep(int ms){
	usleep(ms * 1000);
}

int main(int argc, char** argv){
	SG_WelcomeMessage();
	SG_Init(argc, argv);
	SG_InitPalette();
	title_init();

	while (gamerunning){
		SG_Tick();
	}
}
