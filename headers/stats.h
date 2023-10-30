#ifndef __STATS_H_
#define __STATS_H_

#include "ecs.h"

typedef struct {
    uint32 health;
    SANGLE turn_rate; //max turning per tick
    FIXED speed; //your maximum "normal" velocity
    FIXED boost_speed; //your speed when boosted
    uint32 boost_size; //boost meter size
    uint32 energy_tank; //laser battery size
    TEMPLATE* model;
} FIGHTER;

typedef struct {
    uint32 cooldown_ticks;
    uint32 energy_draw;
    uint32 damage;
    TEMPLATE* model;
} LASER;

/*
    Really, all lasers use the same script. They keep moving in a certain direction until 
        1.) They hit something
        2.) They despawn due to range (they have a life countdown)
    What distinguishes different types is mainly in the firing logic (i.e. the sort of thing that accounts for cooldown and energy draw), as well as their model, but there's one other attribute that affects them at runtime - damage. This is set into their entity state when they're spawned.
*/

#endif
