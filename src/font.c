/*
	Filename: font.c
	Description: 2D vector font library for Starblazer II
*/

#include "../headers/graphics.h"
#include "../headers/font.h"
#include <stdio.h>
#include <stdlib.h>

glyph_t* glyphs[NUM_GLYPHS];

void unpack_glyphs(char* filename){
	FILE *fp = fopen(filename, "r");
	int i;
	int sz;
	glyph_t* cur_ptr;
	char* og_ptr;
	char* pointer;

	fseek(fp, 0, SEEK_END);
	sz = ftell(fp);
	printf("File Size: %d bytes\n", sz);
	fseek(fp, 0, SEEK_SET);

	pointer = malloc(sz);
	fread(pointer, 1, sz, fp);
	fclose(fp);

	og_ptr = pointer;

	for (i = 0; i < NUM_GLYPHS; i++){
		glyphs[i] = pointer;
		cur_ptr = pointer;

		//printf("GLYPH #%d: %d strokes, starts at %d\n", i, cur_ptr->num_strokes, pointer - og_ptr);

		pointer += ((glyph_t*)(pointer))->num_strokes * sizeof(stroke_t)+sizeof(int);
	}
}

int current_glyph = 9999;

void _draw_glyph(glyph_t *glyph, int centerX, int centerY, char color, int scaleX, int scaleY){
	int i;
	scaleY = -scaleY;

	for (i = 0; i < glyph->num_strokes; i++){
		draw_line(centerX + glyph->lines[i].p0.x * scaleX, centerY + scaleY * glyph->lines[i].p0.y, centerX + scaleX * glyph->lines[i].p1.x, centerY + scaleY * glyph->lines[i].p1.y, color);
	}
}

void draw_glyph(int index, int centerX, int centerY, char color, int scaleX, int scaleY){
	_draw_glyph(glyphs[index], centerX, centerY, color, scaleX, scaleY);
}

void draw_string(const char* str, int upperRightX, int upperRightY, int scaleX, int scaleY, char color, int spacing){
	char c;

	while (*str){

		if (*str == ']'){
			color = *(str + 1);
			str += 2;
			continue;
		}

		if (*str == 39){
			c = 46;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str >= 65 && *str <= 90){
			c = *str - 65;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str >= 48 && *str <= 57){
			c = 26 + *str - 48;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 46){
			c = 36;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 44){
			c = 37;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 45){
			c = 38;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 63){
			c = 39;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 33){
			c = 40;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 58){
			c = 41;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 59){
			c = 42;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 116){
			c = 43;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 43){
			c = 44;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		if (*str == 120){
			c = 45;

			draw_glyph(c, upperRightX + 3 * scaleX / 2, upperRightY + 5 * scaleY / 2, color, scaleX, scaleY);
		}

		str++;
		upperRightX += scaleX * 3 + spacing;
	}
}

void vputs(char* str, int x, int y, int xscale, int yscale, char color, char spacing){
	draw_string(str, x, y, xscale, yscale, color, spacing);
}