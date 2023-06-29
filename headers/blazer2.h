#ifndef __BLAZER_2_H_
#define __BLAZER_2_H_

#include "sl_math.h"
#include "ecs.h"
#include "stats.h"

typedef struct{
	int8 pitch, yaw, roll;
	bool_t fire, radar, boost, brake, exit;
} joystick_t;

extern VEC3 title_stars[500];
extern bool_t multiplayer, firing, dying;
extern uint32 impact_id, frames_respawning;
extern TEMPLATE *AX5, *LASER_PLAYER, *LASER_ENEMY, *EXPLOSION_SHARD, *ASTEROID, *TURRET_PLATFORM, *TURRET;
extern uint32 SND_EXPLODE, SND_HIT, SND_LASER, SND_LASER_ENEMY;
extern LASER ENEMY_LASER_SHREDDER, ENEMY_LASER_DRAGONBREATH;
extern bool_t laser_type;

void explode_at(VEC3*);
void explode_entity(ENTITY**); //frees the entity and spawns an explosion there
void vjoy_read(joystick_t* joy);
SANGLE angle_multiply(SANGLE angle, int8 joy_amount);
void init_star(VEC3* star);
void blazer2_module();
void blazer2_draw();
void draw_stars();

#endif