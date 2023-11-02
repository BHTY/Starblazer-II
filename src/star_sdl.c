/*
Filename: star_nix.c
Description: Starblazer II for SDL2 on Linux
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <SDL2/SDL.h>

#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>

#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/graphics.h"

extern void title_init();

char* SG_platform = "nix";
char* SG_title = "Starblazer II for SDL2";
uint8* frontbuffer;

uint32 mplayer_addr;
SDL_Window *window;
SDL_Renderer *renderer;
SDL_Surface *surface;
SDL_Texture *texture;
SDL_Palette *palette;

float mouseFactorX, mouseFactorY;
bool_t mouseDownLeft = 0;
bool_t mouseDownRight = 0;

bool_t keys[256];


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
	
	//ioctl(server_connection, SOCK_NONBLOCK, &iMode);
	
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

/*
What SG_Init needs to do
- Create window
- Create bitmap
- Set timer
*/

void SG_Init(int argc, char** argv){

	//do the generic initialization
	SG_GameInit();

	SDL_Init(SDL_INIT_VIDEO);
	SDL_CreateWindowAndRenderer(GAME_SETTINGS.vid_settings.window_size_x, GAME_SETTINGS.vid_settings.window_size_y, 0, &window, &renderer);
	SDL_SetWindowTitle(window, SG_title);
	
	mouseFactorX = 320.0 / GAME_SETTINGS.vid_settings.window_size_x;
	mouseFactorY = 200.0 / GAME_SETTINGS.vid_settings.window_size_y;
	//texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGB332, SDL_TEXTUREACCESS_STREAMING, 320, 200);
	surface = SDL_CreateRGBSurfaceWithFormat(0, 320, 200, 8, SDL_PIXELFORMAT_INDEX8);
	palette = SDL_AllocPalette(256);
	int *p;
	FBPTR = malloc(320*200);
	//SDL_LockTexture(texture, NULL, (void**)&frontbuffer, &p);
	frontbuffer = surface->pixels;
	memset(keys, 0, 256 * sizeof(bool_t));
	//joystick stuff...
}

void SG_ReadMouse(SG_mouse_t* mouse){
	
	int px, py;
	SDL_GetMouseState(&px, &py);
	
	mouse->x = px * mouseFactorX;
	mouse->y = py * mouseFactorY;
	mouse->buttons[0] = mouseDownLeft;
	mouse->buttons[1] = mouseDownRight;
}

bool_t SG_KeyDown(unsigned char key){
	uint8 *keystate = SDL_GetKeyboardState(NULL);
	return keystate[SDL_GetScancodeFromKey(tolower(key))];
}

void SG_DrawFrame(){
	//SDL_UnlockTexture(texture);
	texture = SDL_CreateTextureFromSurface(renderer, surface);
	SDL_RenderCopy(renderer, texture, NULL, NULL);
	SDL_RenderPresent(renderer);
	SDL_DestroyTexture(texture);
	int *p;
	//SDL_LockTexture(texture, NULL, (void**)&frontbuffer, &p);
	memset(FBPTR, 0, 320*200);
}

void SG_SetPaletteIndex(uint8 index, uint8 r, uint8 g, uint8 b){ //do the windows RealizePalette nonsense
	SDL_Color col = {r, g, b};
	SDL_SetPaletteColors(palette, &col, index, 1);
	SDL_SetSurfacePalette(surface, palette);
}

uint32 SG_GetTicks(){
	struct timespec cur;
	clock_gettime(CLOCK_MONOTONIC, &cur);
	return cur.tv_sec * 1000 + cur.tv_nsec / 1000000;
}

SDL_Event event;
int gamerunning = 1;
void SG_WaitBlank(){
	while (SDL_PollEvent(&event)) {
		if (event.type == SDL_QUIT) gamerunning = 0;
		if (event.type == SDL_MOUSEBUTTONDOWN || event.type == SDL_MOUSEBUTTONUP) {
			if (event.button.button == SDL_BUTTON_LEFT) {
				mouseDownLeft = (event.type == SDL_MOUSEBUTTONDOWN);
			} else {
				mouseDownRight = (event.type == SDL_MOUSEBUTTONDOWN);
			}
		}
	}
}

void SG_ProcessEvents(){
	SG_WaitBlank();
}

void SG_ReadStick(SG_joystick_t* joy){
}

void SG_Sleep(int ms){
	SDL_Delay(ms);
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
