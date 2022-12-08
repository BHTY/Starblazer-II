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
#include "slipstr.h"
#include "ps2.h"
#include "sb.h"


SL_ENTITY * StarblazerEntities[MAX_ENTITIES];


short* my_clock = 0x46C;

int w_firstopenslot(){
    int i;

    for(i = 0; i < MAX_ENTITIES; i++){
        if(StarblazerEntities[i] == 0){
            return i;
        }
    }
}

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
        _outtext(" Milestone 0.2 ");
        _settextcolor(4);
        _outtext("INTERNAL");
        _settextcolor(7);
        _outtext(" by Will Klees\n");
        printf("\nBuilt %s %s\n", __DATE__, __TIME__);
        _outtext("Press any key to begin.\n");
        getch();
        graphicsInit();
}
void do_nothing_script(SL_ENTITY** input){    
    return;
}
int main(int argc, char* *argv){

        char c;
        int start;
        int i;

        SL_VEC3 cam;
        SL_VEC3 dirVec;
        int frames = 0;

        unsigned char camPitch = 0;
        unsigned char camYaw = 0;
        unsigned char camRoll = 0;
	int oldJPress = 0;

        fixed curSpeed = 256*4;

        cam.vec[2] = 30*65536;
        cam.vec[0] = 0;
        cam.vec[1] = 0;

        StarblazerEntities[0] = malloc(sizeof(SL_ENTITY));

        SL_LOADMODEL("hyper.obj", StarblazerEntities[0]);

        StarblazerEntities[0]->pitch = 0;
        StarblazerEntities[0]->yaw = 0;
        StarblazerEntities[0]->roll = 0;
        StarblazerEntities[0]->pos.vec[0] = 0;
        StarblazerEntities[0]->pos.vec[1] = 1*65536;
        StarblazerEntities[0]->pos.vec[2] = 40*65536;
        StarblazerEntities[0]->script = do_nothing_script;

        w_starblazerinit();

        start = *my_clock;
	initSB();
	loadSB("papetoon.wav", 0xf);

        while (1){

                frames++;

                //StarblazerEntities[0]->yaw++;

                //Draw the screen
                SL_DRAWSCENE(StarblazerEntities, cam, camPitch, camYaw, camRoll, 0);

                //Calculate direction vector & move forward
                dirVec.vec[0] = 0;
                dirVec.vec[1] = 0;
                dirVec.vec[2] = curSpeed;
                //SL_MATMUL(SL_WORLD_ROTATION_MATRIX, dirVec, &dirVec);
                cam.vec[0] += dirVec.vec[0];
                cam.vec[1] += dirVec.vec[1];
                cam.vec[2] += dirVec.vec[2];
                //StarblazerEntities[0]->pitch++;
                //StarblazerEntities[0]->yaw+=2;
		if (updateSB()) {
			killSB();
			loadSB("papetoon.wav", 0xf);
		}
                //Read & handle input
                scan_kbd();

                if(keys['w']){
                    camPitch--;
                }

                if(keys['s']){
                    camPitch++;
                }

                if(keys['a']){
                    camYaw++;
                }

                if(keys['d']){
                    camYaw--;
                }

                if(keys['q']){
                    camRoll--;
                }

                if(keys['e']){
                    camRoll++;
                }
		if(keys['j']) {
		   if (!oldJPress) {
		       camYaw ^= 0x80;
		   }
		   oldJPress = 1;
		} else {
			oldJPress = 0;
		}
                if(keys['t']){
                    break;
                }

                //Run Entity Scripts

 for(i = 0; i < MAX_ENTITIES; i++){
                    if(StarblazerEntities[i]){
                        StarblazerEntities[i]->script(&StarblazerEntities[i]);
                    }
                }
                //Video stuff
                    flipbuffer();
                    //cockpit(); //and HUD display
                    waitblank();
        }
	killSB();
        getch();
        setmode(_textmode);

        printf("Welcome back to DOS. Average FPS: %f\n", (18.2 * frames) / (*my_clock - start));
        printf("Thank you for playing Starblazer II!\n");
        printf(" - The Starblazer II Dev Team");
}
