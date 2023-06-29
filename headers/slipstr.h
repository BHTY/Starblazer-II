#ifndef __SLIPSTREAM_H_
#define __SLIPSTREAM_H_

#include "sl_math.h"

#define MAX_VERTS 2500
#define MAX_TRIS 2500

extern uint16 SL_VERTEX_INDEX;
extern uint16 SL_TRIANGLE_INDEX;
extern VEC3 SL_CAMERA_POS;
extern MAT3 SL_CAMERA_ORIENTATION;

extern int16 SL_CENTER_X;
extern int16 SL_CENTER_Y;
extern FIXED SL_FOV_X, SL_FOV_Y;

typedef struct{
	uint16 v0, v1, v2;
	uint8 color;
	FIXED z;
} TRI;

void render_begin(); //clears geometry buffers
void camera_translate(VEC3* v); //sets camera position
void put_vertex(VEC3*);
void put_vert3f(FIXED, FIXED, FIXED);
void put_triangles(TRI* tris, uint16 num_tris, uint16 vert_offset, uint8 color_override);
void polygon_zsort();
void plotpoint_3d(VEC3 pt, uint8 color);
void set_fov_x(FIXED);
void set_fov_y(FIXED);
FIXED find_illumination(VEC3 *x1, VEC3 *x2, VEC3 *x3, VEC3 *light); 
void render_end(bool_t); //draws geometry - true is flat shading, false is wireframe

#endif
