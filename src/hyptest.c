/*
	Filename: hyptest.c
	Description: Hypercraft
*/

#include "../headers/hyptest.h"
#include "../headers/ecs.h"
#include "../headers/blazer2.h"

SANGLE MAX_ROT = 31;
ENTITY* hypercraft;
TEMPLATE* hc_template;
QUAT hyptest_ori;

void init_hypercraft(){
	uint32 id;
	hc_template = load_model("assets\\arwing.obj");

	id = spawn_entity(hc_template, 0, 0, int_fixed(25), 0, 0, 0);
	hypercraft = StarblazerEntities[id];
	StarblazerEntities[id] = 0;

	quat_create(0, 0, 0, &hyptest_ori);
}

void rot_hypercraft(){
	joystick_t joy;
	vjoy_read(&joy);

	//rotate on pitch
	quat_pitch(angle_multiply(MAX_ROT, joy.pitch), &(hypercraft->orientation));
	//rotate on yaw
	quat_yaw(angle_multiply(MAX_ROT, joy.yaw), &(hypercraft->orientation));
	//rotate on roll
	quat_roll(angle_multiply(MAX_ROT, joy.roll), &(hypercraft->orientation));
}

void draw_hypercraft(int centerX, int centerY){
	VEC3 vec;
	MAT3 mat;
	int i;

	int old_centerX = SL_CENTER_X;
	int old_centerY = SL_CENTER_Y;

	quat_tomat(&(hypercraft->orientation), &mat);

	vec.x = 0;
	vec.y = 0;
	vec.z = 0;

	SL_CENTER_X = centerX;
	SL_CENTER_Y = centerY;

	//feed geometry & draw
	quat_tomat(&hyptest_ori, &SL_CAMERA_ORIENTATION);
	render_begin();
	camera_translate(&vec);

	for (i = 0; i < hc_template->num_verts; i++){
		mat3_mul(&mat, &(hc_template->verts[i]), &vec);
		vec3_add(&(hypercraft->pos), &vec);
		put_vertex(&vec);
	}

	put_triangles(hc_template->mesh, hc_template->num_tris, 0, 0);

	polygon_zsort();
	render_end(0);

	SL_CENTER_X = old_centerX;
	SL_CENTER_Y = old_centerY;
}

void destroy_hypercraft(){
	free(hypercraft);
	free(hc_template->mesh);
	free(hc_template->verts);
	free(hc_template);
}