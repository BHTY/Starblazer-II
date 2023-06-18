/*
Filename: star_nix.c
Description: Starblazer II for SDL2 on Linux
*/

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <SDL2/SDL.h>


#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/graphics.h"

char* SG_platform = "nix";
char* SG_title = "Starblazer II for SDL2";
uint8* frontbuffer;


int newFrame = 0;

int window_height;
int window_width;

SDL_Window *window;
SDL_Renderer *renderer;
SDL_Texture *texture;

float mouseFactorX, mouseFactorY;
bool_t mouseDownLeft = 0;
bool_t mouseDownRight = 0;

bool_t keys[256];


/*
What SG_Init needs to do
- Create window
- Create bitmap
- Set timer
*/

void SG_Init(int argc, char** argv){

	//do the generic initialization
	SG_GameInit();

	window_width = 640;
	window_height = 480;


	SDL_CreateWindowAndRenderer(window_width, window_height, 0, &window, &renderer);
	
	mouseFactorX = 320.0 / window_width;
	mouseFactorY = 200.0 / window_height;
	texture = SDL_CreateTexture(renderer, SDL_PIXELFORMAT_RGB332, SDL_TEXTUREACCESS_STREAMING, 320, 200);
	int *p;
	FBPTR = malloc(320*200);
	SDL_LockTexture(texture, NULL, (void**)&frontbuffer, &p);
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

bool_t SG_KeyDown(char key){
	uint8 *keystate = SDL_GetKeyboardState(NULL);
	return keystate[SDL_GetScancodeFromKey(tolower(key))];
}

void SG_DrawFrame(){
	SDL_UnlockTexture(texture);
	SDL_RenderCopy(renderer, texture, NULL, NULL);
	SDL_RenderPresent(renderer);
	int *p;
	SDL_LockTexture(texture, NULL, (void**)&frontbuffer, &p);
	memset(FBPTR, 0, 320*200);
}

void SG_SetPaletteIndex(uint8 index, uint8 r, uint8 g, uint8 b){ //do the windows RealizePalette nonsense
	
}

uint32 SG_GetTicks(){
	return 0;
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
	SDL_Delay(10);
	newFrame = 0;
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
