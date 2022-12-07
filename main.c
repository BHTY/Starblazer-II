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
#include "slipstream.h"


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
        printf("\nBuilt %s %s\n", __DATE__, __TIME__);
        _outtext("Press any key to begin.\n");
        getch();
        graphicsInit();
}

int main(int argc, char* *argv){

        int start;

        SL_VEC3 cam;
        int frames = 0;

        fixed z = 30*65536;
        fixed x = 0;
        fixed y = 0;

        SL_ENTITY cube = formCube(48, 10);
        SL_LOADMODEL("star.obj", &cube);

        cube.pitch = 0;
        cube.yaw = 0;
        cube.roll = 0;

        w_starblazerinit();

        start = *my_clock;



        while (!kbhit()){

                cam.vec[0] = x;
                cam.vec[1] = y;
                cam.vec[2] = z;

                SL_DRAWSCENE(&cube, 1, cam, 0, 0, 0, 0);
                //waitblank();
                flipbuffer();
                frames++;

                cube.yaw++;
        }

        getch();
        setmode(_textmode);

        printf("Welcome back to DOS. Average FPS: %f\n", (18.2 * frames) / (*my_clock - start));
        printf("Thank you for playing Starblazer II!\n");
        printf(" - The Starblazer II Dev Team");
}