#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <i86.h>
#include <dos.h>
#include <conio.h>
#include <graph.h>
#include <math.h>
#include "input.h"
#include "graphics.h"
#include "ecs.h"

short* my_clock = 0x46C;

void setPalette(){
	char* palette = malloc(768);
	int i;

	for (i = 0; i < 256; i++){
		palette[3 * i] = (i & 224) >> 2; //red
		palette[3 * i + 1] = (i & 28) << 1; //green
		palette[3 * i + 2] = (i & 3) << 4; //blue
	}

	set_palette(palette);
	free(palette);
}

void graphicsInit(){
	backbuffer = (char*)malloc(128000) + 32000;
	memset(backbuffer, 0, 64000);
	setmode(_graphicsmode);
	setPalette();
}

int w_starblazerinit(){
	_settextcolor(3);
	_outtext("\nStarblazer II");
	_settextcolor(7);
	_outtext(" Milestone 0.1 ");
	_settextcolor(4);
	_outtext("INTERNAL");
	_settextcolor(7);
	_outtext(" by Will Klees\n");
	_outtext("Version 11-12-22 2:15PM\n");
	_outtext("Press any key to begin.\n");
	getch();
	graphicsInit();
}

int zsort(const void *first, const void *second) {
	if (!first && !second){
		return 0;
	}

	if (!first){
		return 1;
	}

	if (!second){
		return -1;
	}

	return -((*(Entity**)first)->pos.z - (*(Entity**)second)->pos.z);
}

#define NUMOBJECTS 1000
#define NUMSTARS 75


Entity *StarblazerEntities[NUMOBJECTS];
Object TestObject;
Object TestObj2;

void incoming_script(Entity** input){
	(*input)->pos.z--;
	if ((*input)->pos.z == 0){
		(*input)->pos.z = 1000;
	}
}


void outgoing_script(Entity** input){
	int i;
	int collided = 0;

	(*input)->pos.z++;

	//loop through all bogeys
	for (i = 0; i < NUMOBJECTS; i++){
		if (!StarblazerEntities[i]) break; //we've reached the end of the line, therefore breaking
		if (StarblazerEntities[i] != *input){ //not colliding with ourselves lol
			if (StarblazerEntities[i]->pos.z == (*input)->pos.z){ //on the same Z level
				if (abs(StarblazerEntities[i]->pos.x - (*input)->pos.x) < 20 && abs(StarblazerEntities[i]->pos.y - (*input)->pos.y) < 20){
					outp(0x3C8, 0);
					outp(0x3C9, 63);
					outp(0x3C9, 31);
					outp(0x3C9, 0);
					collided = 1;

					//BOOOOOOOOOM
					//spawn explosion dots - Size 8

					free(StarblazerEntities[i]);
					StarblazerEntities[i] = 0;
				}
			}
		}
	}

	if (collided || (*input)->pos.z > 100){
		free(*input);
		*input = 0;
	}
}

int main(){ 
	JoyState joy;
	vector camera;
	vector stars[NUMSTARS];
	int i;
	int start;
	FILE *fp;

	long xpos, ypos, scalefactor;
	
	int frames = 0;
	char faith = 0;

	char* spr = malloc(64);
	char* scratch = malloc(128000);
	char* filebuf = malloc(5000);
	char c = 252;
	char* fgbuf = malloc(65078);

	int laserCooldown = 0;

	char pattern[256] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,

		0, 0, 0, 0, 28, 28, 28, 28, 28, 28, 28, 28, 0, 0, 0, 0,

		0, 93, 93, 93, 93, 93, 28, 28, 28, 28, 93, 93, 93, 93, 93, 0,

		0, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 0,

		0, 93, 158, 158, 158, 158, 158, 158, 158, 158, 158, 158, 158, 158, 93, 0,

		0, 93, 158, 158, 158, 190, 190, 190, 190, 190, 190, 158, 158, 158, 93, 0,

		28, 28, 158, 158, 158, 190, 255, 255, 255, 255, 190, 158, 158, 158, 28, 28,
		28, 28, 158, 158, 158, 190, 255, 255, 255, 255, 190, 158, 158, 158, 28, 28,
		28, 28, 158, 158, 158, 190, 255, 255, 255, 255, 190, 158, 158, 158, 28, 28,
		28, 28, 158, 158, 158, 190, 255, 255, 255, 255, 190, 158, 158, 158, 28, 28,
		0, 93, 158, 158, 158, 190, 190, 190, 190, 190, 190, 158, 158, 158, 93, 0,

		0, 93, 158, 158, 158, 158, 158, 158, 158, 158, 158, 158, 158, 158, 93, 0,
		0, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 93, 0,
		0, 93, 93, 93, 93, 93, 28, 28, 28, 28, 93, 93, 93, 93, 93, 0,
		0, 0, 0, 0, 28, 28, 28, 28, 28, 28, 28, 28, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

	};

	for (i = 0; i < 64; i++){
		spr[i] = faith;
		faith = ~faith;

		if (i % 8 == 0){
			faith = ~faith;
		}
	}

	fp = fopen("tie.spr", "rb");
	fread(filebuf, 1, 4099, fp);
	fclose(fp);

	fp = fopen("idea.spr", "rb");
	fread(fgbuf, 1, 64003, fp);
	fclose(fp);

	TestObject.size = 16;
	TestObject.script = incoming_script;
	TestObject.bits = &c;
	TestObject.spriteSize = 1;

	TestObj2.size = 4;
	TestObj2.script = outgoing_script;
	TestObj2.bits = pattern;
	TestObj2.spriteSize = 16;


	camera.x = 0;
	camera.y = 0;
	camera.z = 0;

	for (i = 0; i < 50; i++){
		StarblazerEntities[i] = malloc(sizeof(Entity));
		StarblazerEntities[i]->pos.x = rand() % 640 - 320;
		StarblazerEntities[i]->pos.y = rand() % 400 - 200;
		StarblazerEntities[i]->pos.z = rand() % 1500;
		StarblazerEntities[i]->obj = TestObject;
	}

	for (i = 0; i < NUMSTARS; i++){
		stars[i].x = rand() % 640 - 320;
		stars[i].y = rand() % 400 - 200;
		stars[i].z = rand() % 1500;
	}
	
	w_starblazerinit();

	start = *my_clock;
	
	while (!kbhit()){
		outp(0x3c8, 0);
		outp(0x3c9, 0);
		outp(0x3c9, 0);
		outp(0x3c9, 0);

		readMouseKeyboard(&joy); 

		//check that the camera is within the bounds of the corridor
		if (joy.x > 160 && 1){
			camera.x += (joy.x - 160) / 40;
		}
		
		if (joy.x < 160 && 1){
			camera.x -= (160 - joy.x) / 40;
		}

		if (joy.y > 100 && 1){
			camera.y += (joy.y - 100) / 25;
		}

		if (joy.y < 100 && 1){
			camera.y -= (100 - joy.y) / 25;
		}

		if (joy.b1 && !laserCooldown){
			//find first free open slot

			for (i = 0; i < NUMOBJECTS; i++){
				if (!StarblazerEntities[i]){
					StarblazerEntities[i] = malloc(sizeof(Entity));
					StarblazerEntities[i]->pos.x = camera.x;
					StarblazerEntities[i]->pos.y = camera.y;
					StarblazerEntities[i]->pos.z = camera.z;
					StarblazerEntities[i]->obj = TestObj2;
					break;
				}
			}

			laserCooldown = 10;
			
		}
		
		draw_pixel(joy.x, joy.y, 224);

		for (i = 0; i < NUMSTARS; i++){

			scalefactor = FOV / (stars[i].z - camera.z);
			xpos = ((stars[i].x - camera.x) * scalefactor) >> 16;
			ypos = ((stars[i].y - camera.y) * scalefactor) >> 16;
			
			if (!(xpos >= 160 || xpos < -160 || ypos >= 100 || ypos < -100)){
				draw_pixel(xpos + 160, ypos + 100, 255);
			}

			stars[i].z--;

			if (stars[i].z == 0){
				stars[i].z = 1000;
			}
		}

		qsort(StarblazerEntities, NUMOBJECTS, sizeof(Entity*), zsort);
		for (i = 0; i < NUMOBJECTS; i++){

			if (StarblazerEntities[i]){

				DrawEntity(&camera, StarblazerEntities[i], scratch);
				/**StarblazerEntities[i]->pos.z--;
				if (StarblazerEntities[i]->pos.z == 0){
					StarblazerEntities[i]->pos.z = 1000;
				}**/
				StarblazerEntities[i]->obj.script(&StarblazerEntities[i]);

			}

		}

		if (laserCooldown){
			laserCooldown--;
		}

		blit(fgbuf + 3, 320, 200, 0, 0);
		waitblank();
		flipbuffer();
		frames++;
	}
	
	getch();
	setmode(_textmode);

	printf("Welcome back to DOS. Average FPS: %f\n", (18.2 * frames) / (*my_clock - start));
	printf("Thank you for playing Starblazer II!\n");
	printf(" - The Starblazer II Dev Team");
}