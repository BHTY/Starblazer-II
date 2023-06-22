#ifndef __UI_H_
#define __UI_H_

#include "int.h"

#define TEXTBOX_STRING_SIZE 80
#define MAX_WIDGETS 200
#define WIDGET_TYPE_LABEL 1
#define WIDGET_TYPE_CHECKBOX 2
#define WIDGET_TYPE_DROPDOWN 3
#define WIDGET_TYPE_RADIO 4
#define WIDGET_TYPE_TEXTBOX 5
#define WIDGET_TYPE_BUTTON 6

typedef struct{
	int x1, x2, y1, y2;
} UI_SELECTION_RECT;

typedef struct{
	uint8 widgetType;
	uint32 widgetID;
	uint16 posX, posY;
	void *widgetData;
	void *state;
} UI_WIDGET;

typedef struct{
	uint8 scale_x;
	uint8 scale_y;
	uint8 color;
	uint8 spacing;
} ui_text_props_t;

typedef struct{
	ui_text_props_t props;
	char* text;
} ui_naked_text_t;

typedef struct{
	ui_text_props_t text_props;
	uint8 num_options;
	char **options;
	void(*callback)(uint32);
} ui_selection_t;

typedef struct{
	uint16 size_x;
	uint16 size_y;
	uint8 bg_color;
	uint8 border_color_inactive;
	uint8 border_color_active;
} ui_box_t;

typedef struct{
	ui_text_props_t text_props;
	ui_box_t box;
} ui_text_box_t;

typedef struct{
	ui_naked_text_t text;
} ui_label_t;

typedef struct{
	ui_naked_text_t text;
	void (*callback)(uint32);
} ui_checkbox_t;

typedef struct{
	ui_selection_t sel;
	ui_box_t box;
	uint8 text_offset_px;
} ui_dropdown_t;

typedef struct{
	ui_selection_t sel;
} ui_radio_t;

typedef struct{
	ui_text_box_t text_box;
	uint8 text_offset_px;
} ui_textbox_t;

typedef struct{
	ui_text_box_t text_box;
	char* text;
	void(*callback)(uint32);
} ui_button_t;

uint32 ui_create_widget(uint8 widgetType, uint32 widgetID, uint16 posX, uint16 posY, void* widgetData);

void ui_destroy_widget(uint32 widget_handle);

uint32 ui_get_handle_by_id(uint32 widgetID);

void* ui_get_state(uint32 widget_handle);

void ui_process_widgets();
void ui_display_widgets();

#endif