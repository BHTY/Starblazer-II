#include "..\headers\int.h"
#include <winsock.h>

typedef struct{
	SOCKET sock;
	SOCKADDR_IN addr;
} connection_t;

typedef struct{
	IN_ADDR addr;
	int bytes;
	int data_available;
} recv_desc_t;

typedef struct{
	uint32 x, y, z;
} VEC3;

typedef struct{
	uint32 x, y, z, w;
} QUAT;

typedef struct{
	uint32 index; //index into the leaderboard (-1 if not connected)
	connection_t socket;
	uint32 timestamp_last_packet;
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

#define SENDER_ID(packet) (((packet).flags & 240) >> 4)
#define DISCONNECTED(packet) (((packet).flags >> 12) == SENDER_ID(packet))
#define RESPAWNING(packet) ((packet).flags & 4)
#define RADAR_LOCK(packet) (player_id == (((packet).flags & 3840) >> 8))
#define DIED(packet) ((packet).flags & 2)
#define SHOOTING(packet) ((packet).flags & 1)
#define KILLER_ID(packet) ((packet).flags >> 12)

WSADATA init_networking(){
	WORD winsock_version = 0x202;
	WSADATA winsock_data;

	if (WSAStartup(winsock_version, &winsock_data))
	{
		printf("WSAStartup failed: %d", WSAGetLastError());
		exit(0);
	}

	timeBeginPeriod(1);

	return winsock_data;
}

connection_t open_transmitting_connection(USHORT port, ULONG addr){
	ULONG iMode = 1;
	connection_t con;
	con.sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (con.sock == INVALID_SOCKET)
	{
		printf("socket failed: %d", WSAGetLastError());
		exit(0);
	}

	con.addr.sin_family = AF_INET;
	con.addr.sin_port = htons(port);
	con.addr.sin_addr.s_addr = addr;
	ioctlsocket(con.sock, FIONBIO, &iMode);

	return con;
}

connection_t open_fake_connection(USHORT port, ULONG addr){
	connection_t con;

	con.addr.sin_family = AF_INET;
	con.addr.sin_port = htons(port);
	con.addr.sin_addr.s_addr = addr;

	return con;
}

connection_t open_listening_connection(USHORT port, ULONG addr){
	connection_t con = open_transmitting_connection(port, addr);

	if (bind(con.sock, (SOCKADDR*)&(con.addr), sizeof(con.addr)) == SOCKET_ERROR)
	{
		printf("bind failed: %d", WSAGetLastError());
		exit(0);
	}

	return con;
}

void close_connection(connection_t* con){
	closesocket(con->sock);
}

int send_packet(connection_t* con, void* buf, int len){
	if (sendto(con->sock, buf, len, 0, (SOCKADDR*)&(con->addr), sizeof(con->addr)) == SOCKET_ERROR)
	{
		printf("sendto failed: %d", WSAGetLastError());
		exit(0);
	}
}

recv_desc_t recv_packet(connection_t *con, void *buf, int size){
	int error_code;
	recv_desc_t descriptor = { 0 };
	SOCKADDR_IN from = { 0 };
	int from_size = sizeof(SOCKADDR_IN);
	descriptor.bytes = recvfrom(con->sock, buf, size, 0, (SOCKADDR*)&from, &from_size);
	descriptor.data_available = 1;

	if (descriptor.bytes == SOCKET_ERROR)
	{
		error_code = WSAGetLastError();

		if (error_code == WSAEWOULDBLOCK){
			descriptor.data_available = 0;
		}

		else{
			printf("recvfrom returned SOCKET_ERROR, WSAGetLastError() %d", WSAGetLastError());
			exit(0);
		}
	}

	descriptor.addr = from.sin_addr;

	return descriptor;
}