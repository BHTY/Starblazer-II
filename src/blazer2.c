/*
	Filename: blazer2.c
	Description: Starblazer II Core Game Engine
*/

#include "../headers/int.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/slipstr.h"

TEMPLATE *AX5, *LASER_PLAYER, *LASER_ENEMY, *EXPLOSION_SHARD, *ASTEROID, *TURRET_PLATFORM, *TURRET;

SANGLE angle_multiply(SANGLE angle, int8 joy_amount){
	return (angle * joy_amount) >> 8;
}

void vjoy_read(joystick_t* joy){
	//scan the mouse and joystick

	//read pitch
	if (SG_KeyDown('W')){
		joy->pitch = 127;
	}
	else if (SG_KeyDown('S')){
		joy->pitch = -127;
	}
	else{
		joy->pitch = 0;
	}

	//read yaw
	if (SG_KeyDown('A')){
		joy->yaw = 127;
	}
	else if (SG_KeyDown('D')){
		joy->yaw = -127;
	}
	else{
		joy->yaw = 0;
	}

	//read roll
	if (SG_KeyDown('Q')){
		joy->roll = 127;
	}
	else if (SG_KeyDown('E')){
		joy->roll = -127;
	}
	else{
		joy->roll = 0;
	}

	//read fire

	//read radar

	//read boost

	//read exit
}

/*
explode_at()
Parameters: VEC3* position, int num_shards

An explosion is spawned at the given position.
*/

/*
explode_entity()
Parameters: ENTITY** entity, int num_shards

The given entity is despawned and an explosion of the given shards number spawned from its position.
*/

void draw_game(){

}

void game_module(){

}