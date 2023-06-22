#include "..\headers\int.h"

typedef struct{
	uint32 x, y, z;
} VEC3;

typedef struct{
	uint32 x, y, z, w;
} QUAT;

typedef struct{
	uint32 index;
	//address
} CONNECTED_PLAYER;

typedef struct{
	char player_name[16];
	char player_pin[16];
	uint32 K, D;
} RECORD;

typedef struct{
	uint32 number_records;
	RECORD records[250];
} LEADERBOARD;

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
#define DIED(packet) (packet.flags & 2)
#define SHOOTING(packet) (packet.flags & 1)