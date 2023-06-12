#ifndef __NET_H_
#define __NET_H_

#include "sl_math.h"

//Notes
//- The DOS version should keep track of score between the two opposing computers (each machine keeps track of its own death count)

extern int player_id;

#ifdef dos

typedef struct{
	VEC3 pos;
	uint8 pitchDelta, yawDelta, rollDelta;
	uint8 flags;
} PACKET;

#define SENDER_ID(packet) (!player_id)
#define DISCONNECTED(packet) 0
#define RESPAWNING(packet) 0
#define RADAR_LOCK(packet) (packet.flags & 4)

#else

typedef struct{
	VEC3 pos;
	QUAT rot;
	uint16 flags;
} PACKET;

#define SENDER_ID(packet) ((packet.flags & 240) >> 4)
#define DISCONNECTED(packet) ((packet.flags >> 12) == SENDER_ID(packet))
#define RESPAWNING(packet) (packet.flags & 4)
#define RADAR_LOCK(packet) (player_id == ((packet.flags & 3840) >> 8))

#endif

#define DIED(packet) (packet.flags & 2)
#define SHOOTING(packet) (packet.flags & 1)

bool_t net_connect(uint32);
void net_syncstate();
void net_disconnect();

#endif