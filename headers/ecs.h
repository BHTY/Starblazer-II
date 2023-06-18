#ifndef __ECS_H_
#define __ECS_H_

#include "slipstr.h"

#define MAX_ENTITIES 1000

typedef struct ENTITY{
	struct TEMPLATE* type;
	VEC3 pos;
	QUAT orientation;
	uint32 state[16];
	int32 health;
	uint8 color_override;
	int override_frames;
} ENTITY;

typedef struct TEMPLATE{
	TRI* mesh;
	VEC3* verts;
	uint16 num_verts;
	uint16 num_tris;
	void (*script)(ENTITY**);
	VEC3 hitbox;
	uint32 maxhp;
	uint32 flags; //essentially, one flag (2) controls radarability and the other (1) controls lockability/shootability
} TEMPLATE;

extern ENTITY* StarblazerEntities[MAX_ENTITIES];

uint32 first_open_slot(); //finds first open entity slot
uint32 spawn_entity(TEMPLATE* type, FIXED x, FIXED y, FIXED z, ANGLE pitch, ANGLE yaw, ANGLE roll);
void draw_scene(VEC3*, QUAT, bool_t, VEC3*, int); //draws/rasterizes every entity in the scene graph
void run_entity_scripts(); //iterates over every entity in a loop and runs its script
bool_t test_collisions(ENTITY*, ENTITY*);
void create_hitbox(TEMPLATE* tpl, FIXED x, FIXED y, FIXED z);
TEMPLATE* load_model(char* filename);

#endif