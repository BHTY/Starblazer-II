#include "../headers/ecs.h"
#include "../headers/slipstr.h"
#include "../headers/graphics.h"
#include "../headers/font.h"
#include <string.h>
#include <stdio.h>

uint8 color = 0;

TEMPLATE* logo;
VEC3 title_camera;
QUAT title_cam_ori;
QUAT stars_cam_ori;

VEC3 title_stars[500];

void init_star(VEC3* star){
	star->x = ((rand() % 1000) - 500) * 65536;
	star->y = ((rand() % 1000) - 500) * 65536;
	star->z = ((rand() % 1000) - 500) * 65536;
}

void init_stars(){
	int i;
	for (i = 0; i < 500; i++){ init_star(&(title_stars[i])); }
}

void draw_stars(){
	int i;
	for (i = 0; i < 500; i++){
		plotpoint_3d(title_stars[i], 255);
	}
}

void title_init(){
	title_camera.x = 0;
	title_camera.y = 0;
	title_camera.z = 0;

	quat_create(0, 0, 0, &title_cam_ori);
	quat_create(0, 0, 0, &stars_cam_ori);

	logo = load_model("assets\\star.obj");
	spawn_entity(logo, 0, 0, int_fixed(10), 0, 128, 0);

	SL_CENTER_Y = 45;

	init_stars();
}

void title_module(){
}

void title_draw(){
	vputs("HELLO WORLD", 0, 0, 3, 2, 255, 0);

	draw_scene(&title_camera, &title_cam_ori, 0);
	quat_yaw(16, &(StarblazerEntities[0]->orientation));

	quat_pitch(8, &stars_cam_ori);
	quat_yaw(8, &stars_cam_ori);
	quat_roll(8, &stars_cam_ori);
	quat_tomat(&stars_cam_ori, &SL_CAMERA_ORIENTATION);
	draw_stars();
}