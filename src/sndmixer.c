#include "../headers/sndmixer.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

cached_sound sounds[MAX_SOUNDS];
mixer_channel channels[MAX_CHANNELS];

uint8* buffer1;
uint8* buffer2;
uint8* music_buffer;
uint16* mix_buffer;

int current_buffer;
FILE* musicfp;
bool_t sfx_enable;

void init_sound(){
	memset(sounds, 0, sizeof(sounds));
	memset(channels, 0, sizeof(channels));
	buffer1 = malloc(BUFFER_SIZE);
	buffer2 = malloc(BUFFER_SIZE);
	music_buffer = malloc(BUFFER_SIZE);
	mix_buffer = malloc(BUFFER_SIZE * 2);
	memset(buffer1, 0, BUFFER_SIZE);
	memset(buffer2, 0, BUFFER_SIZE);
	memset(music_buffer, 0, BUFFER_SIZE);
	memset(mix_buffer, 0, BUFFER_SIZE * 2);

	current_buffer = 0;
	sfx_enable = 0;
}

void play_music(char* filename){
	musicfp = fopen(filename, "rb");
}

void stop_music(){
	if(musicfp){fclose(musicfp);}
	musicfp = 0;
}

/*
	load_soundfx: Loads a sound effect into memory
	Arguments:
	- (char*) filename: The filename of the WAV file containing the sound
	- (uint8) priority: The priority of the sound effect
	- (bool_t) loop: True if the sound loops, false if it doesn't
	Returns an indexi nto the cached_sounds table if available, -1 if not.
*/

int load_soundfx(char* filename, uint8 priority, bool_t loop){
	FILE* fp = fopen(filename, "rb");
	int i, sz;

	for(i = 0; i < MAX_SOUNDS; i++){
		if(sounds[i].samples == 0){
			sounds[i].loop = loop;
			sounds[i].priority = priority;
			fseek(fp, 0, SEEK_END);
			sz = ftell(fp);
			fseek(fp, 0, SEEK_SET);
			sounds[i].num_samples = sz - 100;
			sounds[i].samples = malloc(sz);
			fread(sounds[i].samples, 1, sz, fp);
			fclose(fp);
			sounds[i].samples += 70;
			return i;
		}
	}

	fclose(fp);
	return -1;	
}

/*
	play_soundfx: Commences playback of a sound effect
	Argument:
	- (int) index: An index into the cached_sounds table
	Returns a handle to the mixer channel on which the sound is played (-1 if no channels are available)
*/

int play_soundfx(int index){
	int i;

	//search for empty available channel
	for(i = 0; i < MAX_CHANNELS; i++){
		if(channels[i].playing == 0){
			channels[i].playing = 1;
			channels[i].playback_position = 0;
			channels[i].sound_index = index;
			return i;
		}
	}

	//overwrite the first channel with lower/equal priority
	for(i = 0; i < MAX_CHANNELS; i++){
		if(sounds[index].priority <= sounds[channels[i].sound_index].priority){
			channels[i].playing = 1;
			channels[i].playback_position = 0;
			channels[i].sound_index = index;
			return i;
		}
	}

	//if all else fails...
	return -1;
}

#define snd_min(a,b) (a > b ? b : a)

void mix_channel(int ch){
	uint32 samples, i, samples_remaining;

	if(channels[ch].playing == 0){
		return;
	}

	samples_remaining = sounds[channels[ch].sound_index].num_samples - channels[ch].playback_position;
	samples = snd_min(BUFFER_SIZE, samples_remaining);

	for(i = 0; i < samples; i++){
		mix_buffer[i] += sounds[channels[ch].sound_index].samples[channels[ch].playback_position++];
	}

	if(BUFFER_SIZE >= samples_remaining){ //release this channel
		channels[ch].playing = 0;
	}

	if(sounds[channels[ch].sound_index].loop){ //account for looping
	}
}

void copy_music(uint8* ptr){
	int bytes_read = fread(ptr, 1, BUFFER_SIZE, musicfp);

	if (bytes_read < BUFFER_SIZE){
		fseek(musicfp, 0, SEEK_SET);
		fread(ptr + bytes_read, 1, BUFFER_SIZE - bytes_read, musicfp);
	}
}

void mix_music(uint8* ptr){
	int i;

	//first, read in the music
	int bytes_read = fread(music_buffer, 1, BUFFER_SIZE, musicfp);

	if(bytes_read < BUFFER_SIZE){
		fseek(musicfp, 0, SEEK_SET);
		fread(music_buffer + bytes_read, 1, BUFFER_SIZE - bytes_read, musicfp);
	}

	for(i = 0; i < BUFFER_SIZE; i++){
		ptr[i] = 0.75 * (mix_buffer[i] >> 4) + 0.25 * music_buffer[i];//(music_buffer[i] + (mix_buffer[i] >> 4)) >> 1;
	}
}

void mix(){
	int i;
	uint8* ptr;

	if(current_buffer == 0){
		ptr = buffer1;
	}else{
		ptr = buffer2;
	}

	if (sfx_enable == 0 && musicfp){
		copy_music(ptr);
		return;
	}

	memset(mix_buffer, 0, BUFFER_SIZE * 2);

	for(i = 0; i < MAX_CHANNELS; i++){
		mix_channel(i);
	}

	if(musicfp){
		mix_music(ptr);
	}else{
		for(i = 0; i < BUFFER_SIZE; i++){
			ptr[i] = mix_buffer[i] >> 4;
		}
	}
}


/*
	The REAL mixing process, as explained below by yours truly, CWS
1.) Clear the mix buffer
2.) Mix each channel into the mix buffer
3.) If there is music, load it into its buffer and then mix into the output buffer
*/