#include "../headers/ecs.h"
#include "../headers/slipstr.h"
#include "../headers/graphics.h"
#include "../headers/font.h"
#include "../headers/star_gen.h"
#include "../headers/ui.h"
#include "../headers/hyptest.h"
#include "../headers/blazer2.h"
#include <string.h>
#include <stdio.h>

uint8 color = 0;

TEMPLATE* logo;
VEC3 title_camera;
QUAT title_cam_ori;
QUAT stars_cam_ori;

void init_stars(){
	int i;
	for (i = 0; i < 500; i++){ init_star(&(title_stars[i])); }
}

void create_textbox(){
	uint32 id;
	ui_button_t* buttonData = malloc(sizeof(ui_button_t));
	ui_button_t* buttonData2 = malloc(sizeof(ui_button_t));
	ui_button_t* buttonData3 = malloc(sizeof(ui_button_t));
	buttonData->text = "CAMPAIGN";
	buttonData->text_box.text_props.scale_x = 3;
	buttonData->text_box.text_props.scale_y = 2;
	buttonData->text_box.text_props.color = 175;
	buttonData->text_box.text_props.spacing = 0;
	buttonData->text_box.box.size_x = 100;
	buttonData->text_box.box.size_y = 12;
	buttonData->text_box.box.bg_color = 175;
	buttonData->text_box.box.border_color_inactive = 255;
	buttonData->text_box.box.border_color_active = 255;

	memcpy(buttonData2, buttonData, sizeof(ui_button_t));
	memcpy(buttonData3, buttonData, sizeof(ui_button_t));

	buttonData2->text = "MULTIPLAYER";
	buttonData3->text = "OPTIONS";

	id = ui_create_widget(WIDGET_TYPE_BUTTON, 0, 110, 120, buttonData);
	id = ui_create_widget(WIDGET_TYPE_BUTTON, 0, 110, 140, buttonData2);
	id = ui_create_widget(WIDGET_TYPE_BUTTON, 0, 110, 160, buttonData3);
}

void title_init(){
	title_camera.x = 0;
	title_camera.y = 0;
	title_camera.z = 0;

	quat_create(0, 0, 0, &title_cam_ori);
	quat_create(0, 0, 0, &stars_cam_ori);

	logo = load_model("assets/star.obj");
	spawn_entity(logo, 0, 0, int_fixed(10), 0, 128, 0); //10

	SL_CENTER_Y = 45;

	init_stars();
	create_textbox();

	init_hypercraft();
}

void title_module(){
	rot_hypercraft();
}

void draw_cursor(int x, int y, uint8 clr){
	draw_line(x - 5, y - 5, x - 5, y + 5, clr);
	draw_line(x - 5, y + 5, x + 5, y + 5, clr);
	draw_line(x + 5, y + 5, x + 5, y - 5, clr);
	draw_line(x + 5, y - 5, x - 5, y - 5, clr);
}

void title_draw(){
	SG_mouse_t mouse;
	SG_ReadMouse(&mouse);

	if (mouse.buttons[0]){
		draw_cursor(mouse.x, mouse.y, 28);
		destroy_hypercraft();
		blazer2_init();
	}
	else{
		draw_cursor(mouse.x, mouse.y, 255);
	}

	vputs("STARBLAZER", 0, 0, 3, 2, 159, 0);
	vputs("    II", 0, 10, 3, 2, 239, 0); //252
	vputs("BY WILL KLEES AND JOSH PIETY", 30, 100, 3, 2, 255, 0);

	draw_scene(&title_camera, title_cam_ori, 0, 0, 0);
	quat_yaw(16, &(StarblazerEntities[0]->orientation));

	quat_pitch(8, &stars_cam_ori);
	quat_yaw(8, &stars_cam_ori);
	quat_roll(8, &stars_cam_ori);
	quat_tomat(&stars_cam_ori, &SL_CAMERA_ORIENTATION);
	draw_stars();

	ui_display_widgets();

	draw_hypercraft(265, 160);
}