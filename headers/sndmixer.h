#ifndef __SND_H_
#define __SND_H_

#include "int.h"
#define MAX_CHANNELS 16
#define MAX_SOUNDS 16

void init_sound();
void mix();
void play_music(char*);
int play_soundfx(int);
void stop_music();
int load_soundfx(char*, uint8, bool_t);

typedef struct{
	uint8* samples;
	uint32 num_samples;
	int priority;
	bool_t loop;
} cached_sound;

typedef struct{
	bool_t playing;
	int sound_index;
	uint32 playback_position;
} mixer_channel;

extern uint8* buffer1;
extern uint8* buffer2;
extern int current_buffer;
extern bool_t sfx_enable;

#endif
