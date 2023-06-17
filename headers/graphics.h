#ifndef __GRAPHICS_H_
#define __GRAPHICS_H_

#include "int.h"

extern uint8* FBPTR;

void plot_pixel(uint16 x, uint16 y, uint8 color);
void draw_line(int x1, int y1, int x2, int y2, uint8 color);
void draw_span(int x1, int x2, int y, uint8 color); //basically memset but with bounds checking
void fill_tri(int x1, int y1, int x2, int y2, int x3, int y3, uint8 color); //fills triangle with color
void scale_blit(int x, int y, int originalSizeX, int originalSizeY, int newSizeX, int newSizeY, uint8* pixmap);
void swap_buffers(uint8* front_buffer, uint8 clear_color);
void bitset_pixel(uint16 x, uint16 y, char c);

#endif