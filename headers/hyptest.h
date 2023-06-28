#ifndef __HYPTEST_H_
#define __HYPTEST_H_

#include "sl_math.h"

extern bool_t shading;

void init_hypercraft();
void rot_hypercraft();
void draw_hypercraft(int, int);
void destroy_hypercraft();
void set_hypercraft_orientation(QUAT quat);

#endif