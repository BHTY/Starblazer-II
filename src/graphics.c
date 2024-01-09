/*
	Filename: graphics.c
	Description: Core 2D Graphics Primitives
*/

#include <stdlib.h>
#include "../headers/graphics.h"
#include "../headers/sl_math.h"
#include <string.h>

#define ADDR(x,y)	((y << 8) + (y << 6) + x)

uint8* FBPTR;

void plot_pixel(uint16 x, uint16 y, uint8 color){
	if ((x < 320) && (y < 200)){
		FBPTR[ADDR(x, y)] = color;
	}
}

void bitset_pixel(uint16 x, uint16 y, char c){
	if ((x < 320) && (y < 200)){
		FBPTR[y * 320 + x] |= c;
	}
}

void _draw_line(int x, int y, int x2, int y2, unsigned char color) {
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


void draw_line(int x, int y, int x2, int y2, unsigned char color){
	drawline(x, y, x2, y2, color);
}

void swap_buffers(uint8* front_buffer, uint8 clear_color){
	memcpy(front_buffer, FBPTR, 64000);
	memset(FBPTR, clear_color, 64000);
}
#define SWAP_T(a, b) t = a; a = b; b = t
void draw_span(int x1, int x2, int y, uint8 color) {
	int t;
	if (y < 0 || y >= 200) return;
	if (x1 < 0) x1 = 0;
	if (x1 >= 320) x1 = 319;
	if (x2 < 0) x2 = 0;
	if (x2 >= 320) x2 = 319;
	if (x1 > x2) {
		SWAP_T(x1, x2);
	}
	memset(FBPTR + (y * 320 + x1), color, x2 - x1);
}


void fill_tri(int x1, int y1, int x2, int y2, int x3, int y3, uint8 color) {
	int t;
	FIXED s1, s2, s3;
	FIXED ss, se;
	FIXED start, end;
	int xmid;
	int xa, xb;
	int y;
	if (x1 < -320 || x1 > 640 || x2 < -320 || x2 > 640 || x3 < -320 || x3 > 640 || y1 < -200 || y1 > 400 || y2 < -200 || y2 > 400 || y3 < -200 || y3 > 400) {
		// todo: this is a little sketchy, and could become obviously so eventually
		// figure out actually why this is necessary, and how to fix it
		return;
	}
	// envision the triangle as a long side and two short sides
	// the long side is the one from the top pt to the bottom pt
	// the other part contains a breakpoint where the direction changes
	// sort points first, top to bottom
	if (y1 > y2) {
		SWAP_T(x1, x2);
		SWAP_T(y1, y2);
	}
	if (y2 > y3) {
		SWAP_T(x2, x3);
		SWAP_T(y2, y3);
	}
	if (y1 > y2) {
		SWAP_T(x1, x2);
		SWAP_T(y1, y2);
	}
	y = y1;
	start = int_fixed(x1);
	end = start;
	// start and end are bounds for our slice
	//if (y1 == y2 || y1 == y3 || y2 == y3) return;
	if (y1 == y3) return;
	s1 = y1 == y2 ? 0 : fixed_div(int_fixed(x2 - x1), int_fixed(y2 - y1));
	s3 = fixed_div(int_fixed(x3 - x1), int_fixed(y3 - y1));
	s2 = y3 == y2 ? 0 : fixed_div(int_fixed(x3 - x2), int_fixed(y3 - y2));
	// the slopes for each segment
	if (y1 == y2) {
		// hardcode case
		if (x1 < x2) {
			start = int_fixed(x1);
			end = int_fixed(x2);
		} else {
			start = int_fixed(x2);
			end = int_fixed(x1);
		}
		while (y < y3) {
			xa = fixed_int(start);
			xb = fixed_int(end);
			// s1 is A to B, that's bad
			// s3 is A to C
			// s2 is B to C
			draw_span(xa, xb, y, color);
			start += (x1 < x2 ? s3 : s2);
			end += (x1 < x2 ? s2 : s3);
			y++;
		}
	}
	// xmid is the x coordinate of the long side, at the middle point
	xmid = x1 + fixed_int(fixed_mul(s3, int_fixed(y2 - y1)));
	
	// if xmid is less than x2, end sees the break point
	// else, start will see it
	if (xmid < x2) {
		se = s1;
		ss = s3;
	} else {
		se = s3;
		ss = s1;
	}
	// when we hit y = y2, we're at the break point
	// we want to set the one that was s1 to s2
	// that will probably change the sign
	// though not necessarily
	while (y < y3) {
		if (y == y2) {
			if (xmid < x2) {
				se = s2;
			} else {
				ss = s2;
			}
		}
		// fill from start to end
		// todo: don't do as much bounds checking
		xa = fixed_int(start);
		xb = fixed_int(end);
		draw_span(xa, xb, y, color);
		start += ss;
		end += se;
		y++;
	}
	/*draw_line(x1, y1, x2, y2, 191);// 0xe0);
	draw_line(x2, y2, x3, y3, 191);// 0xe0);
	draw_line(x1, y1, x3, y3, 191);// 0xe0);*/
}
