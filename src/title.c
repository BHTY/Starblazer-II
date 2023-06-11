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

void title_init(){
	title_camera.x = 0;
	title_camera.y = 0;
	title_camera.z = 0;

	quat_create(0, 0, 0, &title_cam_ori);

	logo = load_model("assets\\star.obj");
	spawn_entity(logo, 0, 0, int_fixed(15), 0, 128, 0);

	SL_CENTER_Y = 40;
}

void title_module(){
}

void title_draw(){
	draw_scene(&title_camera, &title_cam_ori, 0);
	quat_yaw(16, &(StarblazerEntities[0]->orientation));
}