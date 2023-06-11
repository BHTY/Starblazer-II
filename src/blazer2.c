/*
	Filename: blazer2.c
	Description: Starblazer II Core Game Engine
*/

#include "../headers/int.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"
#include "../headers/blazer.h"

TEMPLATE *AX5, *LASER_PLAYER, *LASER_ENEMY, *EXPLOSION_SHARD, *ASTEROID, *TURRET_PLATFORM, *TURRET;

typedef struct{
	uint8 pitch, yaw, roll;
	bool_t fire, radar, boost, exit;
} joystick_t;

void vjoy_read(joystick_t* joy){
	//scan the mouse and joystick

	//read pitch

	//read yaw

	//read roll

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