#include "../headers/blazer.h"
#include "../headers/star_gen.h"
#include "../headers/graphics.h"
#include "../headers/font.h"
#include <stdio.h>

extern void title_draw();
extern void title_module();

int current_frame = 0;
uint8 BG_COLOR = 0;

void (*SG_Draw)();
void (*SG_Module)();

SG_config_t GAME_SETTINGS;

void SG_PresentFrame(){
	SG_Draw(); //render all graphical elements into the backbuffer
	swap_buffers(frontbuffer, BG_COLOR); //copy the back buffer into the front buffer
	SG_DrawFrame(); //blit to the screen
}

void SG_Tick(){
	SG_Module();

	if (current_frame == GAME_SETTINGS.vid_settings.frameskip){
		current_frame = 0;
		SG_PresentFrame();
	}
	else{
		current_frame++;
	}

	SG_WaitBlank();
}

void SG_LoadConfig(SG_config_t* cfg){

}

void SG_SaveConfig(SG_config_t* cfg){

}

void SG_GameInit(){
	SG_LoadConfig(&GAME_SETTINGS);
	SG_Draw = title_draw;
	SG_Module = title_module;

	unpack_glyphs("starfont.fnt");
}

void SG_InitPalette(){
	int i;
	uint8 r, g, b;

	for (i = 0; i < 256; i++){
		r = i & 224;
		g = (i & 28) << 3;
		b = (i & 3) << 6;

		SG_SetPaletteIndex(i, r, g, b);
	}
}

void SG_WelcomeMessage(){
	printf("Starblazer II Beta Version\n");
	printf("Build Time: %s %s\n", __DATE__, __TIME__);
	printf("By Will Klees (Captain Will Starblazer) and Josh \"Fixer\" Piety\n");
}