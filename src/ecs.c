/*
Filename: ecs.c
Description: Starblazer II Entity Component System
*/

#include "../headers/ecs.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

ENTITY* StarblazerEntities[MAX_ENTITIES]; //INITIALIZE THIS TO 0 OR YOU DIE!!!!!!

/*
	first_open_slot()
	Parameters: None

	Returns the first unpopulated entity slot.
*/

uint32 first_open_slot(){
	uint32 i;

	for (i = 0; i < MAX_ENTITIES; i++){
		if (StarblazerEntities[i] == 0){
			return i;
		}
	}

	return 0xDEADBEEF; //maybe we should have an assert here... if we're here, it's either a sign that we need a higher limit or there's a serious problem elsewhere
}

/*
	spawn_entity()
	Parameters: TEMPLATE* type, FIXED x, FIXED y, FIXED z, ANGLE pitch, ANGLE yaw, ANGLE roll

	Spawns an entity of the given type with the given euler angles and position, then returns its index in the entities table.
*/

uint32 spawn_entity(TEMPLATE* type, FIXED x, FIXED y, FIXED z, ANGLE pitch, ANGLE yaw, ANGLE roll){
	uint32 id = first_open_slot();

	StarblazerEntities[id] = malloc(sizeof(ENTITY));
	StarblazerEntities[id]->type = type;
	StarblazerEntities[id]->pos.x = x;
	StarblazerEntities[id]->pos.y = y;
	StarblazerEntities[id]->pos.z = z;
	quat_create(pitch, yaw, roll, &(StarblazerEntities[id]->orientation));
	memset(StarblazerEntities[id]->state, 0, 16 * sizeof(uint32));
	StarblazerEntities[id]->health = type->maxhp;
	StarblazerEntities[id]->color_override = 0;

	return id;
}

/*
	draw_scene()
	Parameters: VEC3* cam_pos, QUAT* cam_ori, bool_t shading

	All of the entities in the scene graph are rendered from the camera position and orientation. (shading settings dependent on flag)
*/

void draw_scene(VEC3* cam_pos, QUAT cam_ori, bool_t shading, VEC3* star_ptr, int num_stars){
	int i, p, cur_index;
	VEC3 temp_vert;
	MAT3 model_rotation_matrix;

	camera_translate(cam_pos); //translate the camera position
	quat_conjugate(&cam_ori);
	quat_tomat(&cam_ori, &SL_CAMERA_ORIENTATION); //convert the camera quaternion into the slipstream rotation matrix

	for (i = 0; i < num_stars; i++){
		plotpoint_3d(star_ptr[i], 255);
	}

	render_begin();

	for (i = 0; i < MAX_ENTITIES; i++){
		if (StarblazerEntities[i] == NULL){ continue; }

		cur_index = SL_VERTEX_INDEX;

		//convert per-model rotation quaternion into matrix
		quat_tomat(&(StarblazerEntities[i]->orientation), &model_rotation_matrix);

		//rotate every vertex about the local origin and vertex it in
		for (p = 0; p < StarblazerEntities[i]->type->num_verts; p++){
			mat3_mul(&model_rotation_matrix, &(StarblazerEntities[i]->type->verts[p]), &temp_vert); //rotate
			vec3_add(&(StarblazerEntities[i]->pos), &temp_vert);
			put_vertex(&temp_vert);
		}

		//load in tris
		put_triangles(StarblazerEntities[i]->type->mesh, StarblazerEntities[i]->type->num_tris, cur_index, StarblazerEntities[i]->color_override);
	}

	polygon_zsort();
	render_end(shading);
}

/*
	run_entity_scripts()
	Parameters: None

	Iterates through every entity and runs its script. This function is mostly just so my eyes don't bleed.
*/

void run_entity_scripts(){
	int i;

	for (i = 0; i < MAX_ENTITIES; i++){
		if (StarblazerEntities[i]){
			StarblazerEntities[i]->type->script(&(StarblazerEntities[i]));
		}
	}
}

/*
	test_collisions()
	Parameters: ENTITY* ent1, ENTITY* ent2

	This is a pretty shitty function that tests collisions between two entities. I'd try to fix it up and account for rotation with your hitbox, but the hope is to entirely overhaul the collision system
	in the future to allow for larger entities, probably using collision sub-boxes.
*/

bool_t test_collisions(ENTITY* ent1, ENTITY* ent2){
	if (abs(ent1->pos.x - ent2->pos.x) < ent1->type->hitbox.x >> 1) {
		if (abs(ent1->pos.y - ent2->pos.y) < ent1->type->hitbox.y >> 1) {
			if (abs(ent1->pos.z - ent2->pos.z) < ent1->type->hitbox.z >> 1) {
				return 1;
			}
		}
	}
	return 0;
}

/*
	create_hitbox()
	Parameters: FIXED x, y, z

	Creates a shitbox of the specified size. 'nuff said.
*/

void create_hitbox(TEMPLATE* tpl, FIXED x, FIXED y, FIXED z){
	tpl->hitbox.x = x;
	tpl->hitbox.y = y;
	tpl->hitbox.z = z;
}

/*
	load_model()
	Parameters: char* filename

	A wavefront OBJ model is loaded into an empty template, which is allocated and returned. There's no texture support (usemtl now just loads a color), but maybe we should eventually support normals for
	basic lighting.

	Note that this function works in a sort-of hacky way. It basically allocates enough space for an infinite number of vertices and polygons, and then once it's reached the end of the file and
	determined the actual number, it allocates enough memory for that, memcpys it over, and then frees the original. Why does it work this way? Pretty much because some code sample I found 2.5 years ago
	worked that way and I've been using that as my OBJ loader since then. Go figure.
	- Captain Will Starblazer
*/

TEMPLATE* load_model(char* filename){
	FILE* fp = fopen(filename, "r");
	int eof = 0;
	int res;
	char lineHeader[512];
	int currentVert = 0;
	int currentFace = 0;
	int face1, face2, face3;
	float x, y, z;
	int current_color;

	TRI* polys = malloc(sizeof(TRI)* 1000);
	VEC3* verts = malloc(sizeof(VEC3)* 1000);
	TEMPLATE* tpl = malloc(sizeof(TEMPLATE));

	while (!eof){
		res = fscanf(fp, "%s", lineHeader);
		if (res == -1){ eof = 1; break; }

		if (strcmp(lineHeader, "v") == 0){
			fscanf(fp, "%f %f %f\n", &x, &y, &z);
			verts[currentVert].x = float_fixed(x);
			verts[currentVert].y = float_fixed(y);
			verts[currentVert].z = float_fixed(z);
			currentVert++;
		}

		if (strcmp(lineHeader, "f") == 0){
			fscanf(fp, "%d %d %d\n", &face1, &face2, &face3);
			polys[currentFace].color = current_color;
			polys[currentFace].v0 = face1 - 1;
			polys[currentFace].v1 = face2 - 1;
			polys[currentFace].v2 = face3 - 1;
			currentFace++;
		}

		if (strcmp(lineHeader, "usemtl") == 0){
			fscanf(fp, "%d", &current_color);
		}
	}

	tpl->num_tris = currentFace;
	tpl->num_verts = currentVert;
	tpl->verts = malloc(sizeof(VEC3)* currentVert);
	tpl->mesh = malloc(sizeof(TRI)* currentFace);

	memcpy(tpl->verts, verts, sizeof(VEC3)* currentVert);
	memcpy(tpl->mesh, polys, sizeof(TRI)* currentFace);

	free(verts);
	free(polys);
	tpl->flags = 0;

	fclose(fp);

	return tpl;
}