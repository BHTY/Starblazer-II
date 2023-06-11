#ifndef __SL_MATH_H_
#define __SL_MATH_H_

#include "int.h"

typedef int32 FIXED; //16.16
typedef uint8 ANGLE; //0-2pi radian angle
typedef uint8 SANGLE; //covers 1/16 of the unit circle (1/32 of either side)

extern FIXED SIN_LUT[256];
extern FIXED COS_LUT[256];
extern FIXED SIN_LUT_SMALL[256];
extern FIXED COS_LUT_SMALL[256];

#define angle_sin(theta) SIN_LUT[theta]
#define angle_cos(theta) COS_LUT[theta]
#define sangle_hsin(theta) SIN_LUT_SMALL[theta]
#define sangle_hcos(theta) COS_LUT_SMALL[theta]

typedef struct{
	FIXED x, y, z;
} VEC3;

typedef struct{
	VEC3 r[3];
} MAT3;

typedef struct{
	FIXED x, y, z, w;
} QUAT;

#define fixed_float(n) (n / 65536.0)
#define fixed_int(n) (n >> 16)
#define float_fixed(n) (n * 65536)
#define int_fixed(n) (n << 16)

#define sgn(x) ((x<0)?-1:((x>0)?1:0)) /* macro to return the sign of a
number */

uint32 int_abs(uint32 num);
FIXED muldiv(FIXED a, FIXED b, FIXED c); //a*b/c
FIXED fixed_mul(FIXED a, FIXED b);
FIXED fixed_div(FIXED a, FIXED b);
ANGLE angle_atan2(FIXED y, FIXED x);
FIXED fast_sqrt(FIXED n);
void vec3_add(VEC3 *a, VEC3 *b); //b += a
void vec3_subtract(VEC3 *a, VEC3 *b); //b -= a
void mat3_mul(MAT3* mat, VEC3* vec, VEC3* dest);
void mat3_inv(MAT3* mat);
void quat_pitch(SANGLE theta, QUAT* quat);
void quat_yaw(SANGLE theta, QUAT* quat);
void quat_roll(SANGLE theta, QUAT* quat);
void quat_renorm(QUAT* q); //renormalize (magnitude 1)
void quat_tomat(QUAT *q, MAT3 *dest); //convert a quat to a rotation matrix
void quat_create(ANGLE pitch, ANGLE yaw, ANGLE roll, QUAT* dest); //create a quaternion from euler angles
void quat_rotate(QUAT *rot, VEC3* vec, VEC3 *output);
void quat_mul(QUAT *q, QUAT *output); //output *= q
void quat_slerp(QUAT *start, QUAT *end, FIXED t, QUAT *result);

#endif