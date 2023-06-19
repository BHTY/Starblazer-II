#include "../headers/net.h"
#include "../headers/blazer.h"
#include "../headers/ecs.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"

int player_id;
int timeout;

CONNECTED_PLAYER players[16];

/*
Steps
- Open physical connection
- Send authentication string ("STARBLAZER") along with player name and PIN
- If the server sends back an appropriate token, then we're connected, return 0. If authentication failed, return 2.
	NOTE: If the server is unavailable, net_connect will time out and return 1.

What does the appropriate token hold?
1.) Whether we're connected (boolean)
2.) Our player number on the server
3.) # of seconds to wait to respawn after you die
*/

bool_t net_connect(uint32 addr){
	if (!SG_OpenConnection(addr)){
		return 1;
	}

#ifdef dos
#else
#endif
}

void net_syncstate(){
	PACKET packet;

	//send my own status
	packet.pos = StarblazerEntities[0]->pos;

	//recieve status
	while (SG_RecievePacket(&packet, sizeof(PACKET))){ //respond to each packet
		if (SENDER_ID(packet) == player_id) continue; //except my own echoed back to me


	}
}

void net_disconnect(){

}