#include "../headers/net.h"
#include "../headers/blazer.h"
#include "../headers/ecs.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"

//we need a different laser model & script

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
	//zero out connected players table

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
	packet.rot = StarblazerEntities[0]->orientation;
	SG_SendPacket(&packet, sizeof(PACKET));

	//recieve status
	while (SG_RecievePacket(&packet, sizeof(PACKET))){ //respond to each packet
		if (SENDER_ID(packet) == player_id) continue; //except my own echoed back to me

		if (DISCONNECTED(packet)){
			if (players[SENDER_ID(packet)].status == 1){ //remove their entity with no fanfare
				free(StarblazerEntities[players[SENDER_ID(packet)].entity_id]);
				StarblazerEntities[players[SENDER_ID(packet)].entity_id] = 0;
			}
			players[SENDER_ID(packet)].status = 0;
		}
		else if (RESPAWNING(packet)){
			if (players[SENDER_ID(packet].status == 1){ //they just died, despawn their entity
				free(StarblazerEntities[players[SENDER_ID(packet)].entity_id]);
				StarblazerEntities[players[SENDER_ID(packet)].entity_id] = 0;
			}
			else if (players[SENDER_ID(packet)].status == 0){ //they just connected, but in the middle of respawning
			}
			players[SENDER_ID(packet)].status = 2;
		}
		else{ //connected normally, no funny business
			if (players[SENDER_ID(packet)].status != 1){ //they either just respawned or just connected
				players[SENDER_ID(packet)].fighter = 0;
				players[SENDER_ID(packet)].laser = 0;
				players[SENDER_ID(packet)].entity_id = spawn_entity(players[SENDER_ID(packet)].fighter, 0, 0, 0, 0, 0, 0);
				players[SENDER_ID(packet)].status = 1;
			}
			
			//otherwise, they've been here for a bit and there's no funny business, so set the appropriate state
			StarblazerEntities[players[SENDER_ID(packet)].entity_id]->pos = packet.pos;
			StarblazerEntities[players[SENDER_ID(packet)].entity_id]->orientation = packet.rot;
			
			if (SHOOTING(packet)){ //fire a laser from their position if they did

			}
			if (DIED(packet)){ //explode em if they died, set their status to respawning
				explode_entity(&(StarblazerEntities[players[SENDER_ID(packet)].entity_id]));
				players[SENDER_ID(packet)].status = 2;
			}
		}
	}
}

void net_disconnect(){

}