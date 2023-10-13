#ifndef __BLAZER_H_
#define __BLAZER_H_

#define CONTROL_TYPE_JOYSTICK 0
#define CONTROL_TYPE_KEYBOARD 1
#define CONTROL_TYPE_MOUSE 2

#include "int.h"

typedef struct{
	uint16 window_size_x;
	uint16 window_size_y;
	uint8 frameskip;
	bool_t shading;
} video_settings_t;

typedef struct{
	uint16 io;
	uint8 irq;
} snd_settings_t;

typedef struct{
	uint16 recv_port;
	uint16 send_port;
	snd_settings_t dos;
	char player_name[16];
	char player_pin[16];
} com_settings_t;

typedef struct{
	int32 max_X;
	int32 min_X;
	int32 max_Y;
	int32 min_Y;
} joy_cal_t;

typedef struct{
	bool_t control_type;//joystick vs kbd
	uint8 primary_control; //keyboard for axis+ if keyboard, XvsY axis for joystick or mouse
	uint8 secondary_control; //keycode for axis- if keyboard
} axis_control_t;

typedef struct{
	uint8 control_type;
	uint8 code; //keycode for keyboard, joybutton for joystick
} trigger_control_t;

typedef struct{
	joy_cal_t joystick;
	axis_control_t pitch;
	axis_control_t yaw;
	axis_control_t roll;
	trigger_control_t fire;
	trigger_control_t boost;
	trigger_control_t radar;
	trigger_control_t exit;
} ctrl_settings_t;

typedef struct{
	video_settings_t vid_settings;
	com_settings_t com_settings;
	snd_settings_t snd_settings;
	ctrl_settings_t ctrl_settings;
} SG_config_t;

extern void (*SG_Draw)();
extern void (*SG_Module)();

void SG_Tick();
void SG_PresentFrame();
void SG_WelcomeMessage();
void SG_GameInit();

void SG_LoadConfig(SG_config_t*);
void SG_SaveConfig(SG_config_t*);

extern SG_config_t GAME_SETTINGS;
extern uint8 BG_COLOR;
extern int LAST_TICK_TIME, LAST_FRAME_TIME;
extern int tick_counter;
extern int SLEEP_TIME;
extern int FRAME_CAP, ready_frame;

#endif