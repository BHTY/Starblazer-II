/*
File Name: sl_math.c
Description: SLipstream Math functions for 3D graphics
*/

#include "../headers/sl_math.h"
#include "../headers/tables.h"

uint32 int_abs(uint32 x){
	uint32 y = -(x >> 31);
	return (x ^ y) - y;
}

#if defined(__WATCOMC__)
extern FIXED _fixed_mul(FIXED n1, FIXED n2);
extern FIXED _fixed_div(FIXED n1, FIXED n2);

FIXED fixed_mul(FIXED n1, FIXED n2) {
	return _fixed_mul(n1, n2);
}

FIXED fixed_div(FIXED n1, FIXED n2) {
	return _fixed_div(n1, n2);
}

#pragma aux _fixed_mul = \
        "imul ebx" \
        "shr eax, 16" \
        "shl edx, 16" \
        "or eax, edx" \
        parm [eax] [ebx] \
        modify [edx] \
        value [eax];

#pragma aux _fixed_div = \
        "mov edx, eax" \
        "shr edx, 16" \
        "movsx edx, dx" \
        "shl eax, 16" \
        "idiv ebx" \
        parm [eax] [ebx] \
        modify [edx] \
        value [eax];

FIXED muldiv(FIXED a, FIXED b, FIXED c) {
	int32 result;
	//int64 temp = (int64)a * b;

	/*if (c == 0){
		return ((a ^ b) < 0) ? -1 : 2147483647;
	}*/

	result = ((int64)a * b) / c;

	/*if (abs(*(int32*)((int32*)&temp + 1)) >= abs(c)){
		return ((a ^ b) < 0) ? 2147483648 : 2147483647;//return 0;// printf("a=%d b=%d c=%d hh=%d result=%d\n", a, b, c, *(int32*)((uint8*)&temp + 1), result);
	}*/

	return result;
}
#else
FIXED muldiv(FIXED a, FIXED b, FIXED c){
#if defined(_M_IX86) && defined(WIN32)
	__asm{
		//store sign in ecx
		mov ecx, a
		xor ecx, b
		xor ecx, c

		mov eax, a
		cmp eax, 0
		jge no_nega
		neg eax

	no_nega:
		mov ebx, b
		cmp ebx, 0
		jge no_negb
		neg ebx
	no_negb:
		mov esi, c
		cmp esi, 0
		jge no_negc
		neg esi
	no_negc:

		mul ebx
		cmp edx, esi
		jge overflow
		div esi
		cmp ecx, 0
		jge done
		neg eax
		done:
	}

	return;

	__asm{
	overflow:
		mov eax, 2147483647

	}
#else
	int32 result;
	//int64 temp = (int64)a * b;

	/*if (c == 0){
		return ((a ^ b) < 0) ? -1 : 2147483647;
	}*/

	result = ((int64)a * b) / c;

	/*if (abs(*(int32*)((int32*)&temp + 1)) >= abs(c)){
		return ((a ^ b) < 0) ? 2147483648 : 2147483647;//return 0;// printf("a=%d b=%d c=%d hh=%d result=%d\n", a, b, c, *(int32*)((uint8*)&temp + 1), result);
	}*/

	return result;
#endif
}

FIXED fixed_mul(FIXED a, FIXED b) {
#if defined(_M_IX86) && defined(WIN32)
	__asm{
		mov eax, a
		imul b
		shr eax, 16
		shl edx, 16
		or eax, edx
	}
#else
	return ((int64)a * b) >> 16;
#endif
}

FIXED fixed_div(FIXED a, FIXED b) {
#if defined (_M_IX86) && defined(WIN32)
	__asm{
		mov eax, a
		mov edx, eax
		shr edx, 16
		movsx edx, dx
		shl eax, 16
		idiv b
	}
#else
	return ((int64)a << 16) / b;
#endif
}
#endif

ANGLE angle_atan2(FIXED y, FIXED x) {
	// TODO!
	return 0;
}
FIXED fast_sqrt(FIXED n) {
	FIXED x = n / 2;
	int i;
	//printf("Square rooting %f\n", n/65536.0);
	//return sqrt(n / 65536.0);
	// 4 iterations? is that enough? too many? idk
	for (i = 0; i < 8; i++) {
		if (x == 0) return 0;
		x = (x + fixed_div(n, x)) / 2;
	}
	return x;
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
void vec3_cross(VEC3 *a, VEC3 *b, VEC3 *o) {
	o->x = fixed_mul(a->y, b->z) - fixed_mul(a->z, b->y);
	o->y = fixed_mul(a->z, b->x) - fixed_mul(a->x, b->z);
	o->z = fixed_mul(a->x, b->y) - fixed_mul(a->y, b->x);
}

#define cap(a) (a < 0 ? 2147483647 : a)

void vec3_normalize(VEC3 *x) {
	FIXED magnitude = fast_sqrt(cap(fixed_mul(x->x, x->x) + fixed_mul(x->y, x->y) + fixed_mul(x->z, x->z)));
	if (magnitude == 0) return;
	x->x = fixed_div(x->x, magnitude);
	x->y = fixed_div(x->y, magnitude);
	x->z = fixed_div(x->z, magnitude);
}

	
FIXED vec3_dot(VEC3 *a, VEC3 *b) {
	return fixed_mul(a->x, b->x) + fixed_mul(a->y, b->y) + fixed_mul(a->z, b->z);
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

void quat_conjugate(QUAT *q) {
	q->x = -q->x;
	q->y = -q->y;
	q->z = -q->z;
}
