/**
    GRAPHICS.H
    This header file contains key functions for VGA hardware control and graphics output.
**/

#define _textmode 0x03
#define _graphicsmode 0x13

char* VGA = (char*)0xA0000L;
char* backbuffer;

void setmode(char mode){ //sets the VGA card to the given display mode
    union REGS regs;
    regs.x.eax = mode;
    int386(0x10, &regs, &regs);
}

void waitblank(){ //hangs execution until vertical blanking
    while((inp(0x03da) & 8));
    while (!(inp(0x3DA) & 8));
}

void flipbuffer(int fillcolor){ //copies the back buffer into VGA memory and then clears the back buffer for drawing
    memcpy(VGA, backbuffer, 64000);
    memset(backbuffer, fillcolor, 64000);
}

void set_palette(char* palette){ //sets the VGA palette to the given array
    int i;
    outp(0x3C8, 0);
    for(i = 0; i < 768; i++){
        outp(0x3C9, palette[i]);
    }
}

void draw_pixel(int x, int y, char c){
        if (x >= 0 && x < 320 && y >= 0 && y < 200){
                backbuffer[y * 320 + x] = c;
                //backbuffer[(y<<6) + (y<<8) + x] = c;
        }
}

typedef struct Object{
    long size;
    char* bits;
    long spriteSize;
    void (*script)(struct Entity**);
} Object;


#define sgn(x) ((x<0)?-1:((x>0)?1:0)) /* macro to return the sign of a
                                         number */

void drawline(int x, int y, int x2, int y2, unsigned char color) {
    int j, decInc;
    int i;
    char *address;
    int addrInc;

        int yLonger=0;
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
	shortLen = y2-y;
	longLen = x2-x;
        if (abs(shortLen)>abs(longLen)) {
                int swap=shortLen;
                shortLen=longLen;
                longLen=swap;
                yLonger=1;
        }
        endVal=longLen;
        if (longLen<0) {
                incrementVal=-1;
                addrInc=-320;
                longLen=-longLen;
        } else{incrementVal=1;
            addrInc = 320;
        }
        if (longLen==0) decInc=0;
        else decInc = (shortLen << 16) / longLen;
        j=0;
            address = backbuffer + (x) + (y)*320;

        if (yLonger) {

                for (i=0;i!=endVal;i+=incrementVal,address+=addrInc) {
                        //draw_pixel(x+(j >> 16),y+i, color);
                        *(address+(j>>16)) = color;

                        j+=decInc;
                }
        } else {
                for (i=0;i!=endVal;i+=incrementVal,address+=incrementVal) {
                        *(address+(j>>16)*320) = color;
                        //*(address+(j>>10)+(j>>8)) = color;
                        //draw_pixel(x+i,y+(j >> 16), color);
                        j+=decInc;
                }
        }


}


void draw_line(short x1, short y1, short x2, short y2, char color)
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

        if(px < 0 || px > 319 || py < 0 || py > 199){
                return;
        }

        address = (py << 8) + (py << 6) + px;
        //back[address] = color;

    draw_pixel(px, py, color);
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
                                address += (sdy) * 320;
            }
            px += sdx;

                        if(px < 0 || px > 319 || py < 0 || py > 199){
                return;
        }

                        address += sdx;
            draw_pixel(px, py, color);
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

                        if(px < 0 || px > 319 || py < 0 || py > 199){
                return;
        }

                        address += (sdy) * 320;
            draw_pixel(px, py, color);
                        //back[address] = color;
        }
    }
}
