/*
Filename: ui.c
Description: GUI lbrary for Starblazer II
*/

/*
UI Todo List
- Finish checkbox: draw the check
- Write dropdown
- Finish textbox
- Write the processing function
*/

#include "../headers/ui.h"
#include "../headers/font.h"
#include "../headers/graphics.h"
#include "../headers/star_gen.h"
#include <stdlib.h>
#include <string.h>

bool_t widget_can_focus[7] = { 0, 0, 1, 1, 1, 1, 1 };

UI_WIDGET *widgets[MAX_WIDGETS];
uint32 current_widget_focus = 0;
uint8 focused_textbox_ptr = 0; //resets to 0
bool_t cursor = 0; //flips

uint32 UI_OPEN_SLOT(int starting){
	int i;

	for (i = starting; i < MAX_WIDGETS; i++){
		if (widgets[i] == 0){ return i; }
	}

	return 0;
}

void UI_DRAW_RECT(uint16 x1, uint16 y1, uint16 x2, uint16 y2, uint8 color){
	draw_line(x1, y1, x2, y1, color);
	draw_line(x2, y1, x2, y2, color);
	draw_line(x2, y2, x1, y2, color);
	draw_line(x1, y2, x1, y1, color);
}

void UI_FILL_RECT(uint16 x1, uint16 y1, uint16 x2, uint16 y2, uint8 color){
	//void fill_span(x1, x2, y, color);
	int i;

	for (i = y1; i < y2; i++){
		//fill_span(x1, x2, i, color);
	}
}

void UI_DRAW_BOX(uint32 id, ui_box_t* ptr, ui_text_props_t* text, uint16 x, uint16 y, uint16 px_offset, char* txt){
	int text_size_y = (text->scale_y * 4) + 1;

	//if the box isn’t transparent, fill it
	if (ptr->bg_color != text->color){
		UI_FILL_RECT(x, y, x + ptr->size_x, y + ptr->size_y, ptr->bg_color);
	}

	//draw a border around the box
	UI_DRAW_RECT(x, y, x + ptr->size_x, y + ptr->size_y, (current_widget_focus == id) ? ptr->border_color_active : ptr->border_color_inactive);

	//draw the text
	vputs(txt, x + px_offset, y + ((ptr->size_y - text_size_y) >> 1), text->scale_x, text->scale_y, text->color, text->spacing);
}

void UI_DRAW_LABEL(uint32 widget_handle){
	UI_WIDGET *ptr = widgets[widget_handle];
	ui_label_t *label_data = ptr->widgetData;
	vputs(label_data->text.text, ptr->posX, ptr->posY, label_data->text.props.scale_x, label_data->text.props.scale_y, label_data->text.props.color, label_data->text.props.spacing);
}

void UI_DRAW_CHECKBOX(uint32 widget_handle){
	UI_WIDGET *ptr = widgets[widget_handle];
	ui_checkbox_t *checkbox_data = ptr->widgetData;
	int box_size_x = 2 * checkbox_data->text.props.scale_x + 1;
	int box_size_y = 4 * checkbox_data->text.props.scale_y + 1;

	//draw the box itself
	UI_DRAW_RECT(ptr->posX, ptr->posY, ptr->posX + box_size_x, ptr->posY + box_size_y, checkbox_data->text.props.color);

	//draw the text
	vputs(checkbox_data->text.text, ptr->posX + box_size_x + checkbox_data->text.props.spacing, ptr->posY, checkbox_data->text.props.scale_x, checkbox_data->text.props.scale_y, checkbox_data->text.props.color, checkbox_data->text.props.spacing);

	if (ptr->state == 1){ //checked, so we’re drawing a check

	}
}

void UI_DRAW_DROPDOWN(uint32 widget_handle){
	UI_WIDGET *ptr = widgets[widget_handle];
	ui_dropdown_t *dropdown_data = ptr->widgetData;

	//draw the one option that is currently selected

	//draw the dividing line

	//if we are unselected, draw the down icon, if selected, draw the up icon

	//if we are selected, draw each successive option
}

void UI_DRAW_RADIO(uint32 widget_handle){
	UI_WIDGET *ptr = widgets[widget_handle];
	ui_radio_t *radio_data = ptr->widgetData;
	int i;

	int box_size_x = 2 * radio_data->sel.text_props.scale_x + 1;
	int box_size_y = 4 * radio_data->sel.text_props.scale_y + 1;
	int current_y = ptr->posY;

	for (i = 0; i < radio_data->sel.num_options; i++){
		//draw box
		UI_DRAW_RECT(ptr->posX, current_y, ptr->posX + box_size_x, current_y + box_size_y, radio_data->sel.text_props.color);

		//draw dot if checked
		if ((uint32)(ptr->state) == i){
			plot_pixel(ptr->posX + box_size_x >> 1, current_y + box_size_y >> 1, radio_data->sel.text_props.color);
		}

		//draw text
		vputs(radio_data->sel.options[i], ptr->posX + box_size_x + radio_data->sel.text_props.spacing, current_y, radio_data->sel.text_props.scale_x, radio_data->sel.text_props.scale_y, radio_data->sel.text_props.color, radio_data->sel.text_props.spacing);

		current_y += box_size_y + 1;
	}
}

void UI_DRAW_TEXTBOX(uint32 widget_handle){
	UI_WIDGET *ptr = widgets[widget_handle];
	ui_textbox_t *textbox_data = ptr->widgetData;

	//draw the textbox itself
	//UI_DRAW_BOX(widget_handle, textbox_data->text_box.box, textbox_data->text_box.text_props, 

	//if indeed we are selected, draw the flashing cursor at the appropriate position
	if (current_widget_focus == widget_handle){
		if (cursor){ //draw it

		}
		cursor = !cursor; //flip the bit
	}
}

void UI_DRAW_BUTTON(uint32 widget_handle){
	UI_WIDGET *ptr = widgets[widget_handle];
	ui_button_t *button_data = ptr->widgetData;

	int text_size_x = (strlen(button_data->text)) * ((button_data->text_box.text_props.scale_x * 2) + 2 + button_data->text_box.text_props.spacing) + 6;
	//printf("%d\n", text_size_x);

	//draw the button box itself
	UI_DRAW_BOX(widget_handle, &(button_data->text_box.box), &(button_data->text_box.text_props), ptr->posX, ptr->posY, (button_data->text_box.box.size_x - text_size_x) >> 1, button_data->text);
}

uint32 ui_create_widget(uint8 widgetType, uint32 widgetID, uint16 posX, uint16 posY, void* widgetData){
	uint32 handle = UI_OPEN_SLOT(1);

	if (handle == 0){ return handle; }

	widgets[handle] = malloc(sizeof(UI_WIDGET));
	widgets[handle]->widgetType = widgetType;
	widgets[handle]->widgetID = widgetID;
	widgets[handle]->posX = posX;
	widgets[handle]->posY = posY;
	widgets[handle]->widgetData = widgetData;

	switch (widgetType){
	case WIDGET_TYPE_TEXTBOX:
		widgets[handle]->state = malloc(TEXTBOX_STRING_SIZE);
		*(int*)(widgets[handle]->state) = 0;
		break;
	default:
		widgets[handle]->state = 0;
		break;
	}

	return handle;
}

void ui_destroy_widget(uint32 widget_handle){
	UI_WIDGET *ptr = widgets[widget_handle];
	widgets[widget_handle] = 0;

	if (ptr->widgetType == WIDGET_TYPE_TEXTBOX){
		free(ptr->state);
	}

	free(ptr);
}

uint32 ui_get_handle_by_id(uint32 widgetID){
	int i;

	for (i = 1; i < MAX_WIDGETS; i++){
		if (widgets[i] != 0){
			if (widgets[i]->widgetID == widgetID){
				return i;
			}
		}
	}

	return 0;
}

void* ui_get_state(uint32 widget_handle){
	return widgets[widget_handle]->state;
}

void ui_display_widgets(){
	int i;
	SG_mouse_t mouse;

	//draw mouse cursor
	SG_ReadMouse(&mouse);
	UI_DRAW_RECT(mouse.x - 5, mouse.y - 5, mouse.x + 5, mouse.y + 5, 255);

	for (i = 1; i < MAX_WIDGETS; i++){
		if (widgets[i] != 0){

			switch (widgets[i]->widgetType){
			case WIDGET_TYPE_LABEL:{
									   UI_DRAW_LABEL(i);
									   break;
			}

			case WIDGET_TYPE_CHECKBOX:{
										  UI_DRAW_CHECKBOX(i);
										  break;
			}

			case WIDGET_TYPE_DROPDOWN:{
										  UI_DRAW_DROPDOWN(i);
										  break;
			}

			case WIDGET_TYPE_RADIO:{
									   UI_DRAW_RADIO(i);
									   break;
			}

			case WIDGET_TYPE_TEXTBOX:{
										 UI_DRAW_TEXTBOX(i);
										 break;
			}

			case WIDGET_TYPE_BUTTON:{
										UI_DRAW_BUTTON(i);
										break;
			}

			default:{
						break;
			}
			}
		}
	}
}



void UI_GET_RECT(uint32 id, UI_SELECTION_RECT* rect){
	ui_button_t* button_data = widgets[id]->widgetData;

	rect->x1 = widgets[id]->posX;
	rect->y1 = widgets[id]->posY;

	switch (widgets[id]->widgetType){
		case WIDGET_TYPE_BUTTON:{
									rect->x2 = rect->x1 + button_data->text_box.box.size_x;
									rect->y2 = rect->y1 + button_data->text_box.box.size_y;
									break;
		}
		default:
		{
				   break;
		}
	}
}


void UI_HANDLE_CLICK(uint32 id){
	switch (widgets[id]->widgetType){
		case WIDGET_TYPE_BUTTON:{
									((ui_button_t*)widgets[id]->widgetData)->callback(id);
									break;
		}
		default:{
					break;
		}
	}
}



///HANDLING MOUSE/JOYSTICK INPUT
//1- Update cursor based on position
//2- Handle clicks (calculating mouse regions will be interesting) - check for every onscreen object and stop at the first hit
//If we’re within the mouse region of a checkbox, select it, flip its status, and call the callback
//If we’re within the mouse region of a button, select it and call the callback
//If we’re within the mouse region of a radio button, figure out which option we’re clicking on, select it, and call the callback
//If we’re within the mouse region of a textbox, select it
//If we’re within the mouse region of a dropdown, toggle whether we’re selected to it or not
//If a dropdown is selected and we’re within the mouse region of an option, set the dropdown’s current option and call the callback

///HANDLING KEYBOARD INPUT
//If we’re pressing tab, advance the widget with focus to the next focusable widget
//If we’re pressing enter
//If the current widget is a checkbox, toggle the check and call the callback
//If the current widget is a dropdown, set the current widget to 0
//If the current widget is a button, execute the callback and set the current widget to 0
//If we’re pressing arrow up/down
//If the current widget is a radio button or dropdown, change the option and call the callback
//If we’re typing
//If the current widget is a textbox, insert a character at the appropriate location and adjust the focused_textbox_ptr accordingly

void ui_process_widgets(){
	int i;
	SG_mouse_t mouse;
	UI_SELECTION_RECT rect;
	SG_ReadMouse(&mouse);

	if (mouse.buttons[0]){
		for (i = 1; i < MAX_WIDGETS; i++){
			if (!widgets[i]) continue;

			UI_GET_RECT(i, &rect);

			if (mouse.x >= rect.x1 && mouse.x <= rect.x2 && mouse.y >= rect.y1 && mouse.y <= rect.y2){
				UI_HANDLE_CLICK(i);
				return;
			}
		}
	}
}
