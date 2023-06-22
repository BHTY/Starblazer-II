#ifndef __NET_H_
#define __NET_H_

#include "sl_math.h"
#include "stats.h"
#include "ecs.h"

//Notes
//- The DOS version should keep track of score between the two opposing computers (each machine keeps track of its own death count)

extern int player_id;
extern int timeout;

typedef struct{
	bool_t status; //0=disconnected, 1=connected, 2=respawning
	uint32 entity_id; //id of attached entity
	TEMPLATE* fighter;
	LASER* laser;
} CONNECTED_PLAYER;

extern CONNECTED_PLAYER players[16];

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

typedef struct{
	char str[13];
	char player_name[16];
	char player_pin[16];
} AUTH_TOKEN;

typedef struct{
	bool_t connected;
	uint8 player_num;
	uint8 wait_die;
} RETURNING_TOKEN;

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