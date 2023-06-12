/*
	Filename: graphics.c
	Description: Core 2D Graphics Primitives
*/

#include "../headers/graphics.h"
#include "../headers/sl_math.h"
#include <string.h>

#define ADDR(x,y)	((y << 8) + (y << 6) + x)

uint8* FBPTR;

void plot_pixel(uint16 x, uint16 y, uint8 color){
	if ((x < 320) && (y < 200)){
		FBPTR[y*320+x] = color;
	}
}

void draw_line(int x, int y, int x2, int y2, unsigned char color) {
	int j, decInc;
	int i;
	char *address;
	int addrInc;

	int yLonger = 0;
	int incrementVal, endVal;

	int shortLen;
	int longLen;
	if ((x < 0 || y < 0 || x > 319 || y > 199) && (x2 < 0 || y2 < 0 || x2 > 319 || y2 > 199)) return;
	if (x2 < 0) {
		//y2 = 0;
		y2 = y - ((y2 - y)*x) / (x2 - x);
		x2 = 0;
	}
	if (x < 0) {
		//y = 0;
		y = y2 - ((y - y2)*x2) / (x - x2);
		x = 0;
	}

	if (x2 > 319) {
		//y2 = 0;
		y2 = y + ((y2 - y)*(320 - x)) / (x2 - x);
		x2 = 319;
	}
	if (x > 319) {
		//y = 0;
		y = y2 + ((y - y2)*(320 - x2)) / (x - x2);
		x = 319;
	}

	if (y2 < 0) {
		//y2 = 0;
		x2 = x - ((x2 - x)*y) / (y2 - y);
		y2 = 0;
	}
	if (y < 0) {
		//y = 0;
		x = x2 - ((x - x2)*y2) / (y - y2);
		y = 0;
	}

	if (y2 > 199) {
		//y2 = 0;
		x2 = x + ((x2 - x)*(200 - y)) / (y2 - y);
		y2 = 199;
	}
	if (y > 199) {
		//y = 0;
		x = x2 + ((x - x2)*(200 - y2)) / (y - y2);
		y = 199;
	}
	//if (x == 160 || y == 100 || x2 == 160 || y2 == 100) return;
	shortLen = y2 - y;
	longLen = x2 - x;
	if (abs(shortLen)>abs(longLen)) {
		int swap = shortLen;
		shortLen = longLen;
		longLen = swap;
		yLonger = 1;
	}
	endVal = longLen;
	if (longLen<0) {
		incrementVal = -1;
		addrInc = -320;
		longLen = -longLen;
	}
	else{
		incrementVal = 1;
		addrInc = 320;
	}
	if (longLen == 0) decInc = 0;
	else decInc = (shortLen << 16) / longLen;
	j = 0;
	address = FBPTR + (x)+(y)* 320;

	if (yLonger) {

		for (i = 0; i != endVal; i += incrementVal, address += addrInc) {
			//draw_pixel(x+(j >> 16),y+i, color);
			*(address + (j >> 16)) = color;

			j += decInc;
		}
	}
	else {
		for (i = 0; i != endVal; i += incrementVal, address += incrementVal) {
			*(address + (j >> 16) * 320) = color;
			//*(address+(j>>10)+(j>>8)) = color;
			//draw_pixel(x+i,y+(j >> 16), color);
			j += decInc;
		}
	}


}


void drawline(short x1, short y1, short x2, short y2, char color)
{
	short i, dx, dy, sdx, sdy, dxabs, dyabs, x, y, px, py, address;

	dx = x2 - x1;      /* the horizontal distance of the line */
	dy = y2 - y1;      /* the vertical distance of the line */
	dxabs = abs(dx);
	dyabs = abs(dy);
	sdx = sgn(dx);
	sdy = sgn(dy);
	x = dyabs >> 1;
	y = dxabs >> 1;
	px = x1;
	py = y1;

	if (px < 0 || px > 319 || py < 0 || py > 199){
		return;
	}

	address = (py << 8) + (py << 6) + px;
	//back[address] = color;

	plot_pixel(px, py, color);
	//VGA[(py << 8) + (py << 6) + px] = color;


	if (dxabs >= dyabs) /* the line is more horizontal than vertical */
	{
		for (i = 0; i < dxabs; i++)
		{
			y += dyabs;
			if (y >= dxabs)
			{
				y -= dxabs;
				py += sdy;
				address += (sdy)* 320;
			}
			px += sdx;

			if (px < 0 || px > 319 || py < 0 || py > 199){
				return;
			}

			address += sdx;
			plot_pixel(px, py, color);
		}
	}
	else /* the line is more vertical than horizontal */
	{
		for (i = 0; i < dyabs; i++)
		{
			x += dxabs;
			if (x >= dyabs)
			{
				x -= dyabs;
				px += sdx;
				address += sdx;
			}
			py += sdy;

			if (px < 0 || px > 319 || py < 0 || py > 199){
				return;
			}

			address += (sdy)* 320;
			plot_pixel(px, py, color);
			//back[address] = color;
		}
	}
}


void swap_buffers(uint8* front_buffer, uint8 clear_color){
	memcpy(front_buffer, FBPTR, 64000);
	memset(FBPTR, clear_color, 64000);
}