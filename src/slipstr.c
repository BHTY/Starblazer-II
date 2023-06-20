/*
Name: slipstr.h
Description: 3D rendering engine for Starblazer II
*/

#include <stdlib.h>
#include "../headers/slipstr.h"
#include "../headers/graphics.h"
#include <stdio.h>

uint16 SL_VERTEX_INDEX;
uint16 SL_TRIANGLE_INDEX;
VEC3 SL_CAMERA_POS;
MAT3 SL_CAMERA_ORIENTATION; //world rotation matrix

int16 SL_CENTER_X = 160;
int16 SL_CENTER_Y = 100;

TRI SL_TRIANGLES[MAX_TRIS];
VEC3 SL_VERTS[MAX_VERTS];

FIXED SL_FOV_X = 0x640000;
FIXED SL_FOV_Y = 0x640000;

/*
	render_begin()
	Parameters: None

	Description: Clears the geometry buffers and prepares to draw a new 3D scene.
*/

void render_begin(){
	SL_VERTEX_INDEX = 0;
	SL_TRIANGLE_INDEX = 0;
}

/*
	camera_translate()
	Parameters: VEC3 *v

	Description: Sets the camera position to the indicated vector. Translates all incoming vectors by that amount.
*/

void camera_translate(VEC3* v){
	SL_CAMERA_POS = *v;
}

/*
	put_vertex()
	Parameters: VEC3 *vec

	Description: The given vector is translated relative to the camera, rotated, and projected into screenspace.
*/

void put_vertex(VEC3* vec){
	VEC3 v; //temporary storage
	
	vec3_subtract(&SL_CAMERA_POS, vec); //translate the vector to camera-relative position
	mat3_mul(&SL_CAMERA_ORIENTATION, vec, &v); //rotate the vector around

	//transform/project into screenspace
	SL_VERTS[SL_VERTEX_INDEX].x = SL_CENTER_X - fixed_int(muldiv(v.x, SL_FOV_X, v.z));
	SL_VERTS[SL_VERTEX_INDEX].y = SL_CENTER_Y - fixed_int(muldiv(v.y, SL_FOV_Y, v.z));
	SL_VERTS[SL_VERTEX_INDEX].z = v.z;

	/*printf("v=(%f, %f, %f)\n", v.x/65536.0, v.y/65536.0, v.z/65536.0);
	printf("Vertex onscreen coordinates: (%d, %d)\n", SL_VERTS[SL_VERTEX_INDEX].x, SL_VERTS[SL_VERTEX_INDEX].y);*/

	SL_VERTEX_INDEX++;
}

//kinda pointless function but I'm leaving it here just in case!
void put_vert3f(FIXED x, FIXED y, FIXED z){
	VEC3 v;

	v.x = x;
	v.y = y;
	v.z = z;

	put_vertex(&v);
}

/*
	put_triangles()
	Parameters: TRI* tris, uint16 num_tris, uint16 vert_offset, uint8 color_override

	num_tris triangles from the tris buffer are copied in, with all vertices having the vertex offset added to them.
*/

void put_triangles(TRI* tris, uint16 num_tris, uint16 vert_offset, uint8 color_override){
	int i;
	uint16 v0index, v1index, v2index;

	for (i = 0; i < num_tris; i++){
		v0index = tris[i].v0 + vert_offset;
		v1index = tris[i].v1 + vert_offset;
		v2index = tris[i].v2 + vert_offset;

		SL_TRIANGLES[SL_TRIANGLE_INDEX].color = color_override ? color_override : tris[i].color;
		SL_TRIANGLES[SL_TRIANGLE_INDEX].v0 = v0index;
		SL_TRIANGLES[SL_TRIANGLE_INDEX].v1 = v1index;
		SL_TRIANGLES[SL_TRIANGLE_INDEX].v2 = v2index;
		SL_TRIANGLES[SL_TRIANGLE_INDEX].z = (SL_VERTS[v0index].z + SL_VERTS[v1index].z + SL_VERTS[v2index].z) / 3;

		SL_TRIANGLE_INDEX++;
	}
}

int compare_tris(TRI* tri1, TRI* tri2){
	return (tri1->z < tri2->z) - (tri1->z > tri2->z);
}

/*
	polygon_zsort()
	Parameters: None

	Description: Quicksorts all of the polygons in Z-order of their vertices, back to front.
*/

void polygon_zsort(){
	qsort(SL_TRIANGLES, SL_TRIANGLE_INDEX, sizeof(TRI), compare_tris);
}

/*
	plotpoint_3d()
	Paramaters: VEC3* pt, uint8 color

	The given point is drawn in 3D with the given color.
*/

void plotpoint_3d(VEC3 pt, uint8 color){
	VEC3 v;
	
	//translate
	vec3_subtract(&SL_CAMERA_POS, &pt);
	//rotate
	mat3_mul(&SL_CAMERA_ORIENTATION, &pt, &v);
	//project
	if (v.z > 0){ //clip
		v.x = SL_CENTER_X - fixed_int(muldiv(v.x, SL_FOV_X, v.z));
		v.y = SL_CENTER_Y - fixed_int(muldiv(v.y, SL_FOV_Y, v.z));
		plot_pixel(v.x, v.y, color); //draw
		//printf("(%d, %d)\n", v.x, v.y);
	}
}

/*
	set_fov_x()
	Paramaters: FIXED fov

	The X FOV is set.
*/

void set_fov_x(FIXED fov){
	SL_FOV_X = fov;
}

/*
	set_fov_y()
	Parameters: FIXED fov

	The Y field of view is set.
*/

void set_fov_y(FIXED fov){
	SL_FOV_Y = fov;
}

/*
	clip_polygon()
	Parameters: TRI* tri

	Description: If all three vertices of the triangle are either
		a.) Negative Z
		b.) In adjacent offscreen quadrants (all negative x, positive offscreen X, positive offscreen Y, or negative Y)
	then the polygon will be culled and not drawn (i.e. false will be returned). Otherwise, true will be returned
*/
FIXED find_illumination(VEC3 *x1, VEC3 *x2, VEC3 *x3, VEC3 *light) {
	VEC3 look;
	VEC3 norm;
	VEC3 v1 = *x2;
	VEC3 v2 = *x3;
	vec3_subtract(&x1, &v1);
	vec3_subtract(&x1, &v2);
	vec3_cross(&v1, &v2, &norm);
	vec3_normalize(&norm);
	look = *x1;
	vec3_subtract(light, &look);
	vec3_normalize(&look);
	return int_abs(vec3_dot(&look, &norm));
}
bool_t clip_polygon(TRI* tri){
	VEC3 v0 = SL_VERTS[tri->v0];
	VEC3 v1 = SL_VERTS[tri->v1];
	VEC3 v2 = SL_VERTS[tri->v2];

	if (v0.z <= 2048 || v1.z <= 2048 || v2.z <= 2048){ //they’re all behind the camera
		return 0;
	}

	if ((v0.x >= 320 && v1.x >= 320 && v2.x >= 320) || (v0.x < 0 && v1.x < 0 && v2.x < 0) || (v0.y >= 200 && v1.y >= 200 && v2.y >= 200) || (v0.y < 0 && v1.y < 0 && v2.y < 0)){ //they’re all in adjacent offscreen sections
		return 0;
	}

	return 1;
}

/*
	render_end()
	Parameters: bool_t shading

	Description: Rasterizes/draws all of the triangles in the buffer. If shading is true, the polygons will be filled with a flat color. If shading is false, the vertices will be connected via wireframe lines.
*/

void render_end(bool_t shading){
	int i;
	uint8 c;
	FIXED illum, r, g, b;
	int x1, y1, x2, y2, x3, y3;

	for (i = 0; i < SL_TRIANGLE_INDEX; i++){
		if (clip_polygon(&SL_TRIANGLES[i])){ //only drawing this polygon if it's onscreen!
			c = SL_TRIANGLES[i].color;

			x1 = SL_VERTS[SL_TRIANGLES[i].v0].x;
			y1 = SL_VERTS[SL_TRIANGLES[i].v0].y;
			x2 = SL_VERTS[SL_TRIANGLES[i].v1].x;
			y2 = SL_VERTS[SL_TRIANGLES[i].v1].y;
			x3 = SL_VERTS[SL_TRIANGLES[i].v2].x;
			y3 = SL_VERTS[SL_TRIANGLES[i].v2].y;

			if (shading){
				illum = find_illumination(&(SL_VERTS[SL_TRIANGLES[i].v0]), &(SL_VERTS[SL_TRIANGLES[i].v1]), &(SL_VERTS[SL_TRIANGLES[i].v2]), &(SL_CAMERA_POS));
				r = fixed_mul(c & 224, illum + 1);
				g = fixed_mul(c & 28, illum + 1);
				b = fixed_mul(c & 3, illum + 1);

				fill_tri(x1, y1, x2, y2, x3, y3, r | g | b);
			}
			else{
				//printf("Color: %d\n", c);
				//printf("About to draw triangle with verts (%d, %d) (%d, %d) (%d, %d)\n", x1, y1, x2, y2, x3, y3);
				drawline(x1, y1, x2, y2, c);
				drawline(x1, y1, x3, y3, c);
				drawline(x2, y2, x3, y3, c);
			}
		}
	}
}
