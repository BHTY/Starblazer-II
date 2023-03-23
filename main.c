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
#include "serial.h"


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

int playerNumber = 0;

int w_starblazerinit(){

	char handshake[13];

        _settextcolor(3);
        _outtext("\nStarblazer II");
        _settextcolor(7);
        _outtext(" Milestone 0.2 ");
        _settextcolor(4);
        _outtext("INTERNAL");
        _settextcolor(7);
        _outtext(" by Will Klees and Joshua Piety\n");
        printf("\nBuilt %s %s\n", __DATE__, __TIME__);
	initSerial();
	clearBuffer();
        printf("\n%d %d\n", sizeof(SL_PACKET), isRecvReady());
        //_outtext("Press any key to begin.\n");
        //getch();
	printf("Press 1 or 2 to select player\n");
	if (getch() == '1') {
		playerNumber = 1;
	} else {
		playerNumber = 2;
	}
	printf("Handshaking...\n");
	if (playerNumber == 1) {
		putsSerial("STARBLAZER1", 11);
		getsSerial(handshake, 11);
		handshake[11] = 0;
		printf("%s\n", handshake);
		if (strcmp(handshake, "STARBLAZER2")) {
			printf("Handshake failed. Game over.\n");
			exit(1);
		} else {
			printf("Handshake succeeded. Get ready to blaze the stars.\n");
		}
	} else {
		putsSerial("STARBLAZER2", 11);
		getsSerial(handshake, 11);
		handshake[11] = 0;
		printf("%s\n", handshake);
		if (strcmp(handshake, "STARBLAZER1")) {
			printf("Handshake failed. Game over.\n");
			exit(1);
		} else {
			printf("Handshake succeeded. Get ready to blaze the stars.\n");
		}
	}
	//clearBuffer();
        graphicsInit();
}
void do_nothing_script(SL_ENTITY** input){    
    return;
}
void enemy_explode_test(SL_ENTITY **entity, int shards);
void do_something_script(SL_ENTITY** input) {
    //(*input)->roll++;
    /*(*input)->pitch+=2;
    (*input)->yaw+=3;*/
    entity_explode_test(input, 10 + rand() % 10);
}
int playerHP = 40;
SL_VEC3 cam;
int screenflash = 0;
void do_the_gun_script(SL_ENTITY** entity) {
	int i;
	if ((*entity)->state[0]) {
		(*entity)->roll ++;
		(*entity)->pitch ++;
		(*entity)->yaw ++;
	} else {
		(*entity)->roll = rand() % 256;
		(*entity)->pitch = rand() % 256;
		(*entity)->yaw = rand() % 256;
	}
	(*entity)->pos.vec[0] -= FixedMul(SL_SIN[(*entity)->state[1]], 0x20000);
	(*entity)->pos.vec[1] += FixedMul(FixedMul(SL_COS[(*entity)->state[1]], SL_SIN[(*entity)->state[2]]), 0x20000);
	(*entity)->pos.vec[2] += FixedMul(FixedMul(SL_COS[(*entity)->state[1]], SL_COS[(*entity)->state[2]]), 0x20000);
	(*entity)->state[0]++;
	if ((*entity)->state[0] == 45) {
		*entity = 0;
	} else if (((*entity)->type->flags & 2) == 0) {
		for(i = 0; i < MAX_ENTITIES; i++){
                    if(StarblazerEntities[i] && (StarblazerEntities[i]->type->flags & 1) && SL_COLLIDE(StarblazerEntities[i], *entity)){
                    	StarblazerEntities[i]->health--;
                    	*entity = 0;
                    	break;
                    }
                }
	} else {
		if (abs((*entity)->pos.vec[0] - cam.vec[0]) < 3*65536) {
			if (abs((*entity)->pos.vec[1] - cam.vec[1]) < 3*65536) {
				if (abs((*entity)->pos.vec[2] - cam.vec[2]) < 3*65536) {
					playerHP--;
					screenflash++;
					*entity = 0;
				}
			}
		}
	}
}
int ftest = 0;
void do_the_gun_script2(SL_ENTITY** entity) {
	(*entity)->pos.vec[0] += FixedMul(SL_SIN[(*entity)->pitch], 0x10000);
	(*entity)->pos.vec[1] += FixedMul(FixedMul(SL_COS[(*entity)->pitch], SL_SIN[(*entity)->yaw]), 0x10000);
	(*entity)->pos.vec[2] -= FixedMul(FixedMul(SL_COS[(*entity)->pitch], SL_COS[(*entity)->yaw]), 0x10000);
	(*entity)->state[0]++;
	if ((*entity)->state[0] == 200) {
		*entity = 0;
	}
	if (abs((*entity)->pos.vec[0] - cam.vec[0]) < 65536) {
		if (abs((*entity)->pos.vec[1] - cam.vec[1]) < 65536) {
			if (abs((*entity)->pos.vec[2] - cam.vec[2]) < 65536) {
				//cam.vec[2] = 0;
			}
		}
	}
}
/*
Railed enemy AI:
fly forwards until they reach a fixed distance, firing occasionally
once they reach a distance, pick a target point relative to the player
rotate in the direction of that and also move
once they reach that, retarget the player's position
fire the whole time at intervals
*/
void do_tumble_script(SL_ENTITY **entity) {
	if ((*entity)->state[0]) {
		(*entity)->roll ++;
		(*entity)->pitch ++;
		(*entity)->yaw ++;
	} else {
		(*entity)->roll = rand() % 256;
		(*entity)->pitch = rand() % 256;
		(*entity)->yaw = rand() % 256;
		(*entity)->state[1] = 3* ((rand() % 256) - 128);
		(*entity)->state[2] = 3* ((rand() % 256) - 128);
		(*entity)->state[3] = 3* ((rand() % 256) - 128);
	}
	(*entity)->state[0]++;
	(*entity)->pos.vec[0] += (*entity)->state[1] * 64;
	(*entity)->pos.vec[1] += (*entity)->state[2] * 64;
	(*entity)->pos.vec[2] += (*entity)->state[3] * 64;
	if (!(rand() % 45)) {
		*entity = 0;
	}
}
SL_TEMPLATE *triObj, *boltObj;
SL_TEMPLATE *opponentObj;
void railed_enemy_ai(SL_ENTITY **entity) {
	fixed zdist;
	fixed tarx, tary;
	fixed tarvx, tarvy;
	fixed ax, ay, am;
	int tp, ty;
	zdist = (*entity)->pos.vec[2] - cam.vec[2];
	/*if (zdist > 60*65536) {
		tarx = (*entity)->pos.vec[0];
		tary = (*entity)->pos.vec[1];
	} else if (zdist > 20*65536) {
		if ((*entity)->state[0] == 0) {
			(*entity)->state[0]++;
			(*entity)->state[1] = cam.vec[0];
			(*entity)->state[2] = cam.vec[1];
		}
		tarx = (*entity)->state[1];
		tary = (*entity)->state[2];
	} else {*/
		tarx = cam.vec[0];
		tary = cam.vec[1];
	//}
	
	// entity process
	// target velocity is the difference in the positions, divided by some amount
	// entity x is 0
	// tarx is 30
	tarvx = (tarx - (*entity)->pos.vec[0]) >> 5; // 3.75
	tarvy = (tary - (*entity)->pos.vec[1]) >> 5;
	//if (am > float2fixed(0.1)) {
	//(*entity)->state[3] += ax;
	//(*entity)->state[4] += ay;
	if (tarvx > 0x30000) tarvx = 0x30000;
	if (tarvx < -0x30000) tarvx = -0x30000;
	(*entity)->state[3] = tarvx;
	if (tarvy > 0x30000) tarvy = 0x30000;
	if (tarvy < -0x30000) tarvy = -0x30000;
	(*entity)->state[4] = tarvy;
	//} else {
	//	(*entity)->state[3] += ax;
	//	(*entity)->state[4] += ay;
	//}
	//(*entity)->state[3] += ax;
	//(*entity)->state[4] += ay;
	(*entity)->pos.vec[0] += (*entity)->state[3];
	(*entity)->pos.vec[1] += (*entity)->state[4];
	//(*entity)->state[5]--;
	if ((*entity)->state[5] < 0) {
		(*entity)->state[5] = 20;
		//ty = sl_atan2(tary - (*entity)->pos.vec[1], (*entity)->pos.vec[2] - cam.vec[2]);
		ty = sl_atan2(tary - (*entity)->pos.vec[1], (*entity)->pos.vec[2] - cam.vec[2]);
		//ty = sl_atan2(-1, 100);
		//tp = sl_atan2((*entity)->pos.vec[1] - tary, cam.vec[2] - (*entity)->pos.vec[2]);
		tp = sl_atan2(tarx - (*entity)->pos.vec[0], (*entity)->pos.vec[2] - cam.vec[2]);
		//tp = 0;
		spawnEntity(boltObj, tp, ty, 0x40, (*entity)->pos.vec[0], (*entity)->pos.vec[1], (*entity)->pos.vec[2]);
	}
    	entity_explode_test(entity, 50 + rand() % 5);
	//(*entity)->pitch = (*entity)->state[4];
}
void entity_explode_test(SL_ENTITY **entity, int shards) {
	int j;
	if ((*entity)->health <= 0 && (*entity)->type->flags & 1) {
        	if ((*entity)->health <= 0 && (*entity)->type->flags & 1) {
            		for (j = 0; j < shards; j++) {
            			spawnEntity(triObj, 0, 0, 0, (*entity)->pos.vec[0], (*entity)->pos.vec[1], (*entity)->pos.vec[2]); 
            		}
            	}
            	*entity = 0;
            }
}
int spawnEntity(SL_TEMPLATE *type, int pitch, int yaw, int roll, fixed x, fixed y, fixed z) {
    int i, chosen;
    for (i = 0; i < MAX_ENTITIES; i++) {
    	if (StarblazerEntities[i] == NULL) {
    		chosen = i;
    		break;
    	}
    }
    StarblazerEntities[chosen] = malloc(sizeof(SL_ENTITY));
    StarblazerEntities[chosen]->pitch = pitch;
    StarblazerEntities[chosen]->yaw = yaw;
    StarblazerEntities[chosen]->roll = roll;
    StarblazerEntities[chosen]->pos.vec[0] = x;
    StarblazerEntities[chosen]->pos.vec[1] = y;
    StarblazerEntities[chosen]->pos.vec[2] = z;
    for (i = 0; i < 8; i++) {
    	StarblazerEntities[chosen]->state[i] = 0;
    }
    StarblazerEntities[chosen]->health = type->maxhp;
    StarblazerEntities[chosen]->type = type;
    return chosen;
}

struct Level {
	SL_TEMPLATE *type;
	fixed x;
	fixed y;
	fixed z;
	int pitch;
	int roll;
	int yaw;
	struct Level *next;
};
typedef struct Level Level;
struct WormSeg {
	fixed x;
	fixed y;
	int angle;
};
typedef struct WormSeg WormSeg;
SL_TEMPLATE *levelObjects[10];
Level *loadLevel(char *levelfile) {
	FILE *fp = fopen(levelfile, "rb");
	char modelname[64];
	int i;
	Level *root = malloc(sizeof(Level));
	Level *cur = root;
	
	while (1) {
		if (fscanf(fp, "%d", &i) == -1) break;
		cur->type = levelObjects[i];
		fscanf(fp, "%d %d %d %ld %ld %ld\n", &(cur->pitch), &(cur->roll), &(cur->yaw), &(cur->x), &(cur->y), &(cur->z));
		cur->next = malloc(sizeof(Level));
		cur = cur->next;
	}
	cur->type = 0;
	return root;
}
/*
TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO 
Current todo list:
- Enhance controls
- Improve UI, build game elements
- Create first level



TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO 
*/
SL_VEC3 stars[500];
double ppangle(unsigned char angle) {
	if (angle & 0x80) {
		return -((360.0/256.0)*(0x100-angle));
	}
	return (360.0/256.0)*angle;
}
unsigned char camPitch = 0;
unsigned char camYaw = 0;
unsigned char camRoll = 0x40;
int serialpd = 0;
int guncooldown = 0;
int gunpos = 0;
SL_TEMPLATE *triOppGunObj;
int gundiv1 = 0; // 0x30000
int gundiv2 = 0; // 0x10000
int gunrate = 2;
int dead = 0;
void syncserial() {
	SL_PACKET packet;
	int i, j;
	if (!isRecvReady()) {
		if (playerHP == 0) goto immsync;
		return;
	}
	getsSerial((unsigned char*)&packet, 16);
	// process the other's packet
	for(i = 0; i < MAX_ENTITIES; i++){
		if(StarblazerEntities[i] && StarblazerEntities[i]->type == opponentObj) {
			StarblazerEntities[i]->pos.vec[0] = packet.pos.vec[0];
			StarblazerEntities[i]->pos.vec[1] = packet.pos.vec[1];
			StarblazerEntities[i]->pos.vec[2] = packet.pos.vec[2];
			StarblazerEntities[i]->pitch = packet.pitch;
			StarblazerEntities[i]->yaw = packet.yaw + 0x80;
			StarblazerEntities[i]->roll = packet.roll;
			if (packet.firing == 0xff) {
				for (j = 0; j < 80; j++) {
		    			spawnEntity(triObj, 0, 0, 0, StarblazerEntities[i]->pos.vec[0], StarblazerEntities[i]->pos.vec[1], StarblazerEntities[i]->pos.vec[2]); 
		    		}
				StarblazerEntities[i] = 0;
			} else if (packet.firing) {
				j = spawnEntity(triOppGunObj, 0, 0, 0, packet.pos.vec[0], packet.pos.vec[1] + (packet.firing == 2 ? gundiv1 : -gundiv1), packet.pos.vec[2] + gundiv2);
				StarblazerEntities[j]->state[1] = packet.roll;
				StarblazerEntities[j]->state[2] = 0x100-packet.pitch;
				/*
				i = spawnEntity(triGunObj, 0, 0, 0, cam.vec[0], cam.vec[1] + (gunpos ? gundiv1 : -gundiv1), cam.vec[2] + gundiv2);
				StarblazerEntities[i]->state[1] = camPitch;
				StarblazerEntities[i]->state[2] = camYaw;
				gunpos = !gunpos;
				guncooldown = gunrate;
				*/
			}
		}
	}
immsync:
	packet.pos.vec[0] = cam.vec[0];
	packet.pos.vec[1] = cam.vec[1];
	packet.pos.vec[2] = cam.vec[2];
	//packet.pos = cam;
	packet.pitch = 0x100-camYaw;
	packet.yaw = camRoll;
	packet.roll = camPitch;
	// if cam values are (α, β, γ)
	// entity rotation values should be 
	packet.firing = guncooldown == gunrate-1 ? gunpos + 1 : 0; // 0: not firing, 1-2: firing (gun #)
	if (playerHP == 0) {
		 packet.firing = 0xff;
	}
	putsSerial((unsigned char*)&packet, 16);
	
	
}
int main(int argc, char* *argv){

        char c;
        int start;
        int i, j;

        SL_VEC3 dirVec;
        int frames = 0;

	int gunfire;

        int camPitchLo = 0;
        int camYawLo = 0;
        int camPitchV = 0;
        int camYawV = 0;
	int oldJPress = 0;
	int oldKPress = 0;
	SL_PACKET packet;

        fixed curSpeed = 256*4;
	int spinlock = 0;
	int railed = 0;
	unsigned char destPitch, destYaw;
	
	WormSeg worms[10];
	int wtx, wty, w0tx, w0ty;
	int wta;
	
	Level *level;
	fixed boostVel = 0x0000;
	fixed drawahead = 100*65536;

	SL_TEMPLATE *starObj, *triGunObj;
	SL_TEMPLATE *enemyObj;

	triGunObj = SL_LOADMODEL("tri.obj");
	triGunObj->flags &= ~3;
	triGunObj->script = do_the_gun_script;
	SL_HITBOX(triGunObj, 1, 1, 1);
	
	triOppGunObj = SL_LOADMODEL("tri3.obj");
	triOppGunObj->flags &= ~1;
	triOppGunObj->flags |= 2;
	triOppGunObj->script = do_the_gun_script;
	SL_HITBOX(triOppGunObj, 1, 1, 1);
	
	
	boltObj = SL_LOADMODEL("bolt.obj");
	boltObj->flags &= ~1;
	boltObj->script = do_the_gun_script2;
	SL_HITBOX(boltObj, 1, 1, 1);
	
	triObj = SL_LOADMODEL("tri2.obj");
	triObj->flags &= ~1;
	triObj->script = do_tumble_script;
	
	opponentObj = SL_LOADMODEL("hyper.obj");
	opponentObj->script = do_nothing_script;
	opponentObj->flags &= ~1;
	SL_HITBOX(opponentObj, 5, 5, 5);
	
	spawnEntity(opponentObj, 0x00, 0xc0, 0x00, 0, 0, 0);
	
	starObj = SL_LOADMODEL("star.obj");
	starObj->script = do_something_script;
	starObj->flags |= 1;
	starObj->maxhp = 20;
	levelObjects[0] = starObj;
	SL_HITBOX(starObj, 10, 10, 10);
	
	enemyObj = SL_LOADMODEL("star.obj");
	enemyObj->script = railed_enemy_ai;
	enemyObj->flags |= 1;
	enemyObj->maxhp = 10;
	levelObjects[1] = enemyObj;
	SL_HITBOX(enemyObj, 10, 10, 10);
	
        level = loadLevel("testlv.lvl");

        /*spawnEntity(starObj, 0, 128, 0, 0, 0, 20*65536);
        spawnEntity(starObj, 0, 128, 0, 20*65536, 0, 0);
        spawnEntity(starObj, 0, 128, 0, 0, 0, -20*65536);
        spawnEntity(starObj, 0, 128, 0, -20*65536, 0, 0);
        spawnEntity(starObj, 0, 128, 0, 0, 20*65536, 0);
        spawnEntity(starObj, 0, 128, 0, 0, -20*65536, 0);*/
        
        
        for (i = 0; i < 500; i++) {
        	//spawnEntity("dust.obj", 0, 0, 0, ((rand() % 60) - 30)*65536, ((rand() % 60) - 30)*65536, ((rand() % 60) - 30)*65536, do_nothing_script);
        	stars[i].vec[0] = ((rand() % 1000) - 500)*65536;
        	stars[i].vec[1] = ((rand() % 1000) - 500)*65536;
        	stars[i].vec[2] = ((rand() % 1000) - 500)*65536;
        }

	stars[0].vec[0] = 0;
	stars[0].vec[1] = 0;
	stars[0].vec[2] = 0;
       

	computeTanLut();/*
       setmode(_textmode);
       printf("atan2(-1, 100) = %f deg", ppangle(sl_atan2(-1*65536, 100*65536)));
	getch();
	// e2463
	// a0000
	return;*/
        w_starblazerinit();
        cam.vec[2] = playerNumber == 1 ? 80*65536 : -80*65536;
        if (playerNumber == 1) camYaw = 0x80;
        cam.vec[0] = 0;
        cam.vec[1] = 0;

        start = *my_clock;
	initSB();
	loadSB("papetoon.wav", 0xf);
	
	memcpy((unsigned char*)&packet, "willklees1234567", 16);
	
	putsSerial((unsigned char*)&packet, 16);
	
	
	/*for (i = 0; i < 10; i++) {
		worms[i].x = 0;
		worms[i].y = 0;
		worms[i].angle = 0;
	}
	w0tx = 160;
	w0ty = 100;
	while (1) {
		for (i = 0; i < 10; i++) {
			if (i == 0) {
				wtx = w0tx;
				wty = w0ty;
				j = 3;
			} else {
				wtx = worms[i-1].x - SL_COS[worms[i-1].angle]*4;
				wty = worms[i-1].y - SL_SIN[worms[i-1].angle]*4;
				j = 6;
			}
			wta = sl_atan2(worms[i].y - wty, worms[i].x - wtx);
			for (; j >= 0; j--) {
				if (wta > worms[i].angle) {
					worms[i].angle++;
				} else if (wta < worms[i].angle) {
					worms[i].angle--;
				}
			}
			worms[i].x += SL_COS[worms[i].angle] * 2;
			worms[i].y += SL_SIN[worms[i].angle] * 2;
		}
		for (i = 0; i < 9; i++) {
			drawline(worms[i].x, worms[i].y, worms[i+1].x, worms[i+1].y, 3);
		}
		flipbuffer();
		waitblank();
	}*/
	
        while (1){

                frames++;
                //StarblazerEntities[0]->yaw++;

                //Draw the screen
                // TODO: figure out why i have to swap roll and yaw
			for (i = 499; i >= 0; i--) {
				if (railed && stars[i].vec[2] < cam.vec[2]) {
					stars[i].vec[0] = ((rand() % 100) - 50)*65536;
					stars[i].vec[1] = ((rand() % 100) - 50)*65536;
					stars[i].vec[2] = ((rand() % 100) - 50)*65536 + cam.vec[2];
				}
				SL_PLOTPOINT(stars[i]);
			}
                SL_DRAWSCENE(StarblazerEntities, cam, camPitch, camRoll, camYaw, 0);
                //Calculate direction vector & move forward
                dirVec.vec[0] = 0;
                dirVec.vec[1] = 0;
                //dirVec.vec[2] = curSpeed;
                dirVec.vec[2] = 0;
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
/*
Control system

*/
		if (spinlock > 0) {
			if (spinlock == 1) {
				destPitch = sl_atan2(cam.vec[0], sl_hypot(cam.vec[1], cam.vec[2]));
				destYaw = 0x100-sl_atan2(cam.vec[1], cam.vec[2]);
				if (destPitch > 0x40 && destPitch < 0xc0) {
					if (destPitch & 0x80) {
						destPitch = 0xc0;
					} else {
						destPitch = 0x40;
					}
				}
				spinlock++;
			}
			if (camPitch < destPitch) {
				camPitch ++;
			} else if (camPitch > destPitch) {
				camPitch --;
			}
			if (camYaw < destYaw) {
				camYawV ++;
			} else if (camYaw > destYaw) {
				camYaw --;
			}
			camPitch = destPitch;
			camYaw = destYaw;
			if (camPitch == destPitch && camYaw == destYaw) spinlock = -1;
		} else {
		        if(keys['s']) {
		            camPitchV -= 35;
		           	//StarblazerEntities[0]->pitch--;
		        }

		        if(keys['w']) {
		            camPitchV += 35;
		            //StarblazerEntities[0]->pitch++;
		        }

		        if(keys['a']){
		            camYawV -= 35;
		            //StarblazerEntities[0]->yaw++;
		        }

		        if(keys['d']){
		            camYawV += 35;
		            //StarblazerEntities[0]->yaw--;
		        }

		       /*if(keys['q']){
		            camRoll--;
		            //StarblazerEntities[0]->roll--;
		        }

		        if(keys['e']){
		            camRoll++;
		            //StarblazerEntities[0]->roll++;
		        }*/
		        
                }
                camPitchV -= camPitchV >> 3;
		camYawV -= camYawV >> 3;
		if (abs(camPitchV) < 8) camPitchV = 0;
		if (abs(camYawV) < 8) camYawV = 0;
		if (railed) {
			if ((camYawV < 0) == ((camYaw & 0x80) != 0)) {
				if (camYaw > 0x20 && camYaw < 0xe0) {
					camYawV = 0;
				} /*else if (camYaw > 0x10 && camYaw < 0xf0) {
					camYawV -= camYawV >> 3;
				}*/
			}
			if ((camPitchV < 0) == ((camPitch & 0x80) != 0)) {
				if (camPitch > 0x20 && camPitch < 0xe0) {
					camPitchV = 0;
				} /*else if (camPitch > 0x10 && camPitch < 0xf0) {
					camPitchV -= camPitchV >> 3;
				}*/
			}
			if (!keys['a'] && !keys['d']) {
				if (camYaw < 0x02 || camYaw > 0xfe) {
					camYawV = 0;
					camYaw = 0;
				} else if (camYaw & 0x80) {
					camYawV += 10;
				} else if (camYaw != 0) {
					camYawV -= 10;
				}
			}
			if (!keys['w'] && !keys['s']) {
				if (camPitch < 0x02 || camPitch > 0xfe) {
					camPitchV = 0;
					camPitch = 0;
				} else if (camPitch & 0x80) {
					camPitchV += 10;
				} else if (camPitch != 0) {
					camPitchV -= 10;
				}
			}
			// TODO: make this feel better to use
		}
		/*if (!(camYaw & 0x80)) {
			camRoll = 0x40 + (camYaw >> 2);
		} else {
			camRoll = 0x40 - ((0x100-camYaw) >> 2);
		}
		// TODO make this better as well
		*/
		camPitchLo += camPitchV;
		camYawLo += camYawV;
		while (camPitchLo > 0x100) {
			camPitchLo -= 0x100;
			if (camPitch != 0x40) camPitch++;
			else camPitchV = 0;
		}
		while (camYawLo > 0x100) {
			camYawLo -= 0x100;
			camYaw++;
		}
		while (camPitchLo < -0x100) {
			camPitchLo += 0x100;
			if (camPitch != 0xc0) camPitch--;
			else camPitchV = 0;
		}
		while (camYawLo < -0x100) {
			camYawLo += 0x100;
			camYaw--;
		}
		if (keys['j'] && guncooldown == 0) {
			i = spawnEntity(triGunObj, 0, 0, 0, cam.vec[0], cam.vec[1] + (gunpos ? gundiv1 : -gundiv1), cam.vec[2] + gundiv2);
			StarblazerEntities[i]->state[1] = camPitch;
			StarblazerEntities[i]->state[2] = camYaw;
			gunpos = !gunpos;
			guncooldown = gunrate;
		}
		if (guncooldown > 0) guncooldown--;
                /*if (keys['i']) {
                	cam.vec[0] += 0x800;
                }
                if (keys['k']) {
                	cam.vec[0] -= 0x800;
                }
                if (keys['j']) {
                	cam.vec[1] -= 0x800;
                }
                if (keys['l']) {
                	cam.vec[1] += 0x800;
                }
                if (keys['u']) {
                
                	cam.vec[2] += 0x800;
                }
                if (keys['o']) {
                	cam.vec[2] -= 0x800;
                }*/
                //if (keys[' ']) {
                	cam.vec[0] -= FixedMul(SL_SIN[camPitch], boostVel);
                	cam.vec[1] += FixedMul(FixedMul(SL_COS[camPitch], SL_SIN[camYaw]), boostVel);
                	cam.vec[2] += FixedMul(FixedMul(SL_COS[camPitch], SL_COS[camYaw]), boostVel);
                	if (railed) {
                		if (cam.vec[0] > 20*65536) cam.vec[0] = 20*65536;
                		if (cam.vec[0] < -20*65536) cam.vec[0] = -20*65536;
                		if (cam.vec[1] > 20*65536) cam.vec[1] = 20*65536;
                		if (cam.vec[1] < -20*65536) cam.vec[1] = -20*65536;
                	}
                	// yaw 0: z
                	// yaw 90: y
                	// yaw 180 : -z
                	// yaw 270 : -y
                	// pitch 90 : -x
                	// pitch 270 : x
                	// we want:
                	// 0 -> cos=0 sin=1
                	// 90 -> cos=1 sin=0
                	// 270 -> cos=-1 sin=0
                	
                //}
                /*if ((abs(cam.vec[0]) > 64*65536 || abs(cam.vec[1]) > 64*65536 || abs(cam.vec[2]) > 64*65536 || keys['\\'])) {
                	if (spinlock >= 0) spinlock = 1;
                } else if (spinlock == -1) {
                	spinlock = 0;
                }*/
                if (railed) spinlock = 0;
		/*if(keys['j']) {
		   if (!oldJPress) {
		       camYaw ^= 0x80;
		   }
		   oldJPress = 1;
		} else {
			oldJPress = 0;
		}*/
                if(keys['t']){
                   // break;
                   playerHP = 0;
                   dead = 1;
                }

		if (keys['x']){
			for (i = 0; i < MAX_ENTITIES; i++) {
				if (StarblazerEntities[i]) StarblazerEntities[i]->health = 0;
			}
		}

		if (keys['b']) {
			boostVel = 0xf000;
		} else {
			boostVel = 0x1000;
		}
                //Run Entity Scripts

		for(i = 0; i < MAX_ENTITIES; i++){
			if(StarblazerEntities[i]){
				if (railed && StarblazerEntities[i]->pos.vec[2] < cam.vec[2]) {
					StarblazerEntities[i] = 0;
				} else {
					StarblazerEntities[i]->type->script(&StarblazerEntities[i]);
				}
			}
		}
                if (playerHP < 0) playerHP = 0;
                while (level->type && level->z - cam.vec[2] < drawahead) {
                	spawnEntity(level->type, level->pitch, level->yaw, level->roll, level->x, level->y, level->z);
                	level = level->next;
                }
                //Video stuff
                //	serialpd++;
                //    if (serialpd == 3) {
                    	syncserial();
                //    	serialpd = 0;
                //    }
                if (playerHP == 0) break;
                    flipbuffer(screenflash ? 192 : 0);
                    if (screenflash) screenflash--;
                /*if (!keys[' ']) {
                	
                } else {
                	printf("Cos%04x Sin%04x\n", SL_COS[camPitch], SL_SIN[camPitch]);
                }*/
                    //cockpit(); //and HUD display
                    waitblank();
                //printf("Hello world\n");
        }
	killSB();
        setmode(_textmode);

        printf("Welcome back to DOS. Average FPS: %f\n", (18.2 * frames) / (*my_clock - start));
        printf("Thank you for playing Starblazer II!\n");
        printf(" - The Starblazer II Dev Team");
}
