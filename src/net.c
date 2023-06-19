#include "../headers/net.h"
#include "../headers/blazer.h"
#include "../headers/ecs.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"

int player_id;
int timeout;

CONNECTED_PLAYER players[16];

bool_t net_connect(uint32){

}

void net_syncstate(){
	PACKET packet;

	while (SG_RecievePacket(&packet, sizeof(PACKET))){ //respond to each packet
		if (SENDER_ID(packet) == player_id) continue;


	}
}

void net_disconnect(){

}