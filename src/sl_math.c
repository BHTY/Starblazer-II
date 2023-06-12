/*
File Name: sl_math.c
Description: SLipstream Math functions for 3D graphics
*/

#include "../headers/sl_math.h"
#include "../headers/tables.h"

uint32 int_abs(uint32 x){
	uint32 y = x >> 31;
	return (x ^ y) - y;
}

FIXED muldiv(FIXED a, FIXED b, FIXED c){
	return ((int64)a * b) / c;
}

FIXED fixed_mul(FIXED a, FIXED b) {
	// TODO: inline assembly
	return ((int64)a * b) >> 16;
}

FIXED fixed_div(FIXED a, FIXED b) {
	// TODO: inline assembly
	return ((int64)a << 16) / b;
}

ANGLE angle_atan2(FIXED y, FIXED x) {
	// TODO!
	return 0;
}
void vec3_add(VEC3 *a, VEC3 *b) {
	b->x += a->x;
	b->y += a->y;
	b->z += a->z;
}
void vec3_subtract(VEC3 *a, VEC3 *b) {
	b->x -= a->x;
	b->y -= a->y;
	b->z -= a->z;
}
void mat3_mul(MAT3 *a, VEC3 *b, VEC3 *dest) {
	dest->x = fixed_mul(a->r[0].x, b->x) + fixed_mul(a->r[0].y, b->y) + fixed_mul(a->r[0].z, b->z);
	dest->y = fixed_mul(a->r[1].x, b->x) + fixed_mul(a->r[1].y, b->y) + fixed_mul(a->r[1].z, b->z);
	dest->z = fixed_mul(a->r[2].x, b->x) + fixed_mul(a->r[2].y, b->y) + fixed_mul(a->r[2].z, b->z);
}
void mat3_inv(MAT3 *x) {
	// TODO!
	// requires a bunch of stuff with cofactors and whatever
}
void quat_pitch(SANGLE pitch, QUAT *a) {
	FIXED c = sangle_hcos(pitch);
	FIXED s = sangle_hsin(pitch);
	FIXED w = a->w;
	FIXED x = a->x;
	FIXED y = a->y;
	FIXED z = a->z;
	// [c; s 0 0]
	// [w; x y z]
	// [cw - sx, cx + sw, cy - sz, cz + sy]
	a->w = fixed_mul(c, w) - fixed_mul(s, x);
	a->x = fixed_mul(c, x) + fixed_mul(s, w);
	a->y = fixed_mul(c, y) + fixed_mul(s, z);
	a->z = fixed_mul(c, z) - fixed_mul(s, y);
}
void quat_yaw(SANGLE yaw, QUAT *a) {
	FIXED c = sangle_hcos(yaw);
	FIXED s = sangle_hsin(yaw);
	FIXED w = a->w;
	FIXED x = a->x;
	FIXED y = a->y;
	FIXED z = a->z;
	// [c; 0 s 0]
	// [w; x y z]
	// [cw - sy, xc + sz, cy + sw, cz - sx]
	a->w = fixed_mul(c, w) - fixed_mul(s, y);
	a->x = fixed_mul(c, x) - fixed_mul(s, z);
	a->y = fixed_mul(c, y) + fixed_mul(s, w);
	a->z = fixed_mul(c, z) + fixed_mul(s, x);
}
void quat_roll(SANGLE roll, QUAT *a) {
	FIXED c = sangle_hcos(roll);
	FIXED s = sangle_hsin(roll);
	FIXED w = a->w;
	FIXED x = a->x;
	FIXED y = a->y;
	FIXED z = a->z;
	// [c; 0 0 s]
	// [w; x y z]
	// [cw - sz, cx - sy, cy + sx, cz + sw]
	a->w = fixed_mul(c, w) - fixed_mul(s, z);
	a->x = fixed_mul(c, x) + fixed_mul(s, y);
	a->y = fixed_mul(c, y) - fixed_mul(s, x);
	a->z = fixed_mul(c, z) + fixed_mul(s, w);
}
void quat_tomat(QUAT *from, MAT3 *to) {
	FIXED a = from->w;
	FIXED b = from->x;
	FIXED c = from->y;
	FIXED d = from->z;
	FIXED s = fixed_div(int_fixed(2), fixed_mul(a, a) + fixed_mul(b, b) + fixed_mul(c, c) + fixed_mul(d, d));
	FIXED bs = fixed_mul(b, s);
	FIXED cs = fixed_mul(c, s);
	FIXED ds = fixed_mul(d, s);
	FIXED ab = fixed_mul(a, bs);
	FIXED ac = fixed_mul(a, cs);
	FIXED ad = fixed_mul(a, ds);
	FIXED bb = fixed_mul(b, bs);
	FIXED bc = fixed_mul(b, cs);
	FIXED bd = fixed_mul(b, ds);
	FIXED cc = fixed_mul(c, cs);
	FIXED cd = fixed_mul(c, ds);
	FIXED dd = fixed_mul(d, ds);
	to->r[0].x = int_fixed(1) - cc - dd;
	to->r[0].y = bc - ad;
	to->r[0].z = bd + ac;
	to->r[1].x = bc + ad;
	to->r[1].y = int_fixed(1) - bb - dd;
	to->r[1].z = cd - ab;
	to->r[2].x = bd - ac;
	to->r[2].y = cd + ab;
	to->r[2].z = int_fixed(1) - bb - cc;
}
void quat_create(ANGLE pitch, ANGLE yaw, ANGLE roll, QUAT *a) {
	// CCC-SSS
	// SCC+CSS
	// CSC-SCS
	// CCS+SSC
	FIXED cp = angle_cos(pitch / 2);
	FIXED sp = angle_sin(pitch / 2);
	FIXED cy = angle_cos(yaw / 2);
	FIXED sy = angle_sin(yaw / 2);
	FIXED cr = angle_cos(roll / 2);
	FIXED sr = angle_sin(roll / 2);
	FIXED cc = fixed_mul(cp, cy);
	FIXED cs = fixed_mul(cp, sy);
	FIXED sc = fixed_mul(sp, cy);
	FIXED ss = fixed_mul(sp, sy);
	a->w = fixed_mul(cc, cr) - fixed_mul(ss, sr);
	a->x = fixed_mul(sc, cr) + fixed_mul(cs, sr);
	a->y = fixed_mul(cs, cr) - fixed_mul(sc, sr);
	a->z = fixed_mul(cc, sr) + fixed_mul(ss, cr);
}
void quat_slerp(QUAT *start, QUAT *end, FIXED t, QUAT *result) {
	// TODO!
}