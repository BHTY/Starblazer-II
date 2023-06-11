#ifndef _UI_H_
#define _UI_H_

#include "int.h"

typedef uint32 ui_handle_t;

//function to create ui element, function to read state from ui element, function to get name
void UI_delete_widget(ui_handle_t);
void UI_process_widgets();
void UI_draw_widgets();

#endif