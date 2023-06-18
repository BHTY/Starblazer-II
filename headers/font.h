#ifndef __FONT_H_
#define __FONT_H_

typedef struct{
	int x, y;
} point_t;

typedef struct{
	point_t p0, p1;
} stroke_t;

typedef struct{
	int num_strokes;
	stroke_t lines[1];
} glyph_t;

#define NUM_GLYPHS 48

void unpack_glyphs(char* filename);
void _draw_glyph(glyph_t *glyph, int centerX, int centerY, char color, int scaleX, int scaleY);
void draw_glyph(int index, int centerX, int centerY, char color, int scaleX, int scaleY);
void draw_string(const char* str, int upperRightX, int upperRightY, int scaleX, int scaleY, char color, int spacing);
void vputs(char* str, int x, int y, int xscale, int yscale, char color, char spacing);

#endif