#include "../headers/blazer.h"
#include "../headers/star_gen.h"
#include "../headers/graphics.h"
#include "../headers/font.h"
#include <stdio.h>
#include <time.h>
#include <stdlib.h>

extern void title_draw();
extern void title_module();

uint32 last_ticks;
uint32 current_ticks;
uint32 leftover_ticks;

uint32 blazer_calcticks() {
	uint32 ms_elapsed, ticks_elapsed;
	last_ticks = current_ticks;
	current_ticks = SG_GetTicks();
	ms_elapsed = current_ticks + leftover_ticks - last_ticks;
	ticks_elapsed = ms_elapsed / 14;
	leftover_ticks = ms_elapsed % 14;
	return ticks_elapsed;
}

int current_frame = 0;
uint8 BG_COLOR = 0;
int tick_counter = 0;

int LAST_TICK_TIME = 14;
int LAST_FRAME_TIME = 14;

int time_at_which_last_frame_was_rendered = 0;
uint32 time_last_tick;
uint32 start_time;

void (*SG_Draw)();
void (*SG_Module)();

SG_config_t GAME_SETTINGS;

void SG_PresentFrame(){
	SG_Draw(); //render all graphical elements into the backbuffer
	swap_buffers(frontbuffer, BG_COLOR); //copy the back buffer into the front buffer
	SG_DrawFrame(); //blit to the screen
}

void SG_Tick(){
	uint32 current_time;

	tick_counter = blazer_calcticks();

	while(tick_counter){
		SG_Module();
		tick_counter--;
	}

	//GAME_SETTINGS.vid_settings.frameskip = 0;

	if (current_frame == GAME_SETTINGS.vid_settings.frameskip){
		current_frame = 0;
		SG_PresentFrame();
		current_time = SG_GetTicks();
		LAST_FRAME_TIME = current_time - time_at_which_last_frame_was_rendered;
		time_at_which_last_frame_was_rendered = current_time;
	}
	else{
		current_frame++;
	}

	SG_ProcessEvents();

	if(GAME_SETTINGS.sleep_time){
		SG_Sleep(GAME_SETTINGS.sleep_time);
	}
}

extern bool_t laser_type;
extern uint32 mplayer_addr;

#ifdef __unix__
int inet_addr(char*);
#else
int __stdcall inet_addr(char*);
#endif

void SG_LoadConfig(SG_config_t* cfg){
	char taddr[50];
	char pitchup, pitchdown, yawup, yawdown, rollup, rolldown, fire, boost, brake;

	FILE* fp = fopen("config.ini", "r");
	fscanf(fp, "addr= %s\n", taddr);
	fscanf(fp, "port= %d\n", &(cfg->com_settings.port));
	fscanf(fp, "name= %s\n", &(cfg->com_settings.player_name));
	fscanf(fp, "pin= %s\n", &(cfg->com_settings.player_pin));
	fscanf(fp, "x= %d\n", &(cfg->vid_settings.window_size_x));
	fscanf(fp, "y= %d\n", &(cfg->vid_settings.window_size_y));
	fscanf(fp, "laser= %d\n", &laser_type);
	fscanf(fp, "frameskip= %d\n", &(cfg->vid_settings.frameskip));
	fscanf(fp, "block= %d\n", &(cfg->snd_settings.buf_size));
	fscanf(fp, "sfx= %d\n", &(cfg->snd_settings.sfx));
	fscanf(fp, "music= %d\n", &(cfg->snd_settings.music));
	fscanf(fp, "sound= %d\n", &(cfg->snd_settings.sound));
	fscanf(fp, "sleep= %d\n", &(cfg->sleep_time));

	fscanf(fp, "sndport= %x\n", &(cfg->snd_settings.dos.port));
	fscanf(fp, "sndirq= %x\n", &(cfg->snd_settings.dos.irq));
	fscanf(fp, "comport= %x\n", &(cfg->com_settings.dos.port));
	fscanf(fp, "comirq= %x\n", &(cfg->com_settings.dos.irq));

	fscanf(fp, "joycal= %d %d %d %d %d %d\n", &(cfg->ctrl_settings.joystick.min_X), &(cfg->ctrl_settings.joystick.max_X), &(cfg->ctrl_settings.joystick.min_Y), &(cfg->ctrl_settings.joystick.max_Y));
	
	fscanf(fp, "pitch= %d\n", &(cfg->ctrl_settings.pitch.control_type));
	fscanf(fp, "pitchup= %c\n", &pitchup);
	fscanf(fp, "pitchdown= %c\n", &pitchdown);

	fscanf(fp, "yaw= %d\n", &(cfg->ctrl_settings.yaw.control_type));
	fscanf(fp, "yawup= %c\n", &yawup);
	fscanf(fp, "yawdown= %c\n", &yawdown);

	fscanf(fp, "roll= %d\n", &(cfg->ctrl_settings.roll.control_type));
	fscanf(fp, "rollup= %c\n", &rollup);
	fscanf(fp, "rolldown= %c\n", &rolldown);

	fscanf(fp, "fire= %d\n", &(cfg->ctrl_settings.fire.control_type));
	fscanf(fp, "firekey= %c\n", &fire);

	fscanf(fp, "boost= %d\n", &(cfg->ctrl_settings.boost.control_type));
	fscanf(fp, "boostkey= %c\n", &boost);

	fscanf(fp, "brake= %d\n", &(cfg->ctrl_settings.brake.control_type));
	fscanf(fp, "brakekey= %c\n", &brake);

	fclose(fp);

	mplayer_addr = inet_addr(taddr);
}

void SG_SaveConfig(SG_config_t* cfg){

}

void SG_GameInit(){
	SG_LoadConfig(&GAME_SETTINGS);
	SG_Draw = title_draw;
	SG_Module = title_module;
	
	unpack_glyphs("starfont.fnt");
	srand(time(NULL));

	current_ticks = SG_GetTicks();
	leftover_ticks = 0;
}

void SG_InitPalette(){
	int i, n, p;
	uint8 r, g, b;

	/*for (i = 0; i < 256; i++){
		r = i & 224;
		g = (i & 28) << 3;
		b = (i & 3) << 6;

		SG_SetPaletteIndex(i, r, g, b);
	}*/

	/*for (i = 0; i < 6; i++){
		for (n = 0; n < 6; n++){
			for (p = 0; p < 6; p++){
				SG_SetPaletteIndex(i * 36 + n * 6 + p, i * 51, n * 51, p * 51);
			}
		}
	}*/

	for (i = 0; i < 16; i++){ //color (RGBI)
		r = (i & 4) ? ((i & 8) ? 16 : 8) : 0;
		g = (i & 2) ? ((i & 8) ? 16 : 8) : 0;
		b = (i & 1) ? ((i & 8) ? 16 : 8) : 0;

		//reserve a few colors for special use that do not comply with the RGBI system
		if (i == 7){
			r = 16;
			g = 8;
			b = 0;
		}

		for (p = 0; p < 16; p++){ //intensity
			SG_SetPaletteIndex(16 * i + p, r * p, g * p, b * p);
		}
	}
}

void SG_WelcomeMessage(){
	printf("Starblazer II Beta Version\n");
	printf("Build Time: %s %s\n", __DATE__, __TIME__);
	printf("By Will Klees (Captain Will Starblazer) and Josh \"Fixer\" Piety\n");
}
