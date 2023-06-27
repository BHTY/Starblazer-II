#include "../headers/net.h"
#include "../headers/blazer.h"
#include "../headers/ecs.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"
#include "../headers/sndmixer.h"

#define TIMEOUT 3000

//we need a different laser model & script

int player_id;
int timeout = 175;

CONNECTED_PLAYER players[16];

void spawn_enemy_laser(uint32 index){ //index= index into connected players table
	VEC3 pos = StarblazerEntities[players[index].entity_id]->pos;
	QUAT ori = StarblazerEntities[players[index].entity_id]->orientation;
	uint32 id = spawn_entity(players[index].laser->model, pos.x, pos.y, pos.z, 0, 0, 0);

	StarblazerEntities[id]->orientation = ori;
	StarblazerEntities[id]->state[15] = players[index].laser->damage;
	StarblazerEntities[id]->state[0] = 280;
	StarblazerEntities[id]->state[13] = index;
	play_soundfx(SND_LASER_ENEMY);
}

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
	char data[1000];
	AUTH_TOKEN auth_token;
	RETURNING_TOKEN ret_token;
	uint32 time_started = SG_GetTicks();

	strcpy(auth_token.str, "STARBLAZER");
	strcpy(auth_token.player_name, GAME_SETTINGS.com_settings.player_name);
	strcpy(auth_token.player_pin, GAME_SETTINGS.com_settings.player_pin);

	//zero out connected players table

	if (!SG_OpenConnection(addr)){
		printf("NET: Connection failed.\n");
		return 1;
	}

	SG_SendPacket(&auth_token, sizeof(AUTH_TOKEN));

	while (!SG_RecievePacket(&ret_token, sizeof(RETURNING_TOKEN))){
		if ((SG_GetTicks() - time_started) > TIMEOUT){
			printf("NET: Server timed out.\n");
			SG_CloseConnection();
			return 1;
		}
	}

	if (!(ret_token.connected)){
		printf("NET: Authentication failed.\n");
		SG_CloseConnection();
		return 2;
	}

	timeout = ret_token.wait_die * 70;
	player_id = ret_token.player_num;
	printf("NET: Successful connection.\n");
	return 0;
}

void net_syncstate(){
	PACKET packet;

	//send my own status
	packet.pos = StarblazerEntities[0]->pos;
	packet.rot = StarblazerEntities[0]->orientation;
	packet.flags = (player_id << 4) | firing;

	if (dying){
		packet.flags |= 2;
		packet.flags |= (impact_id << 12);
		dying = 0;
	}if (frames_respawning){
		packet.flags |= 4;
	}

	SG_SendPacket(&packet, sizeof(PACKET));

	//we need to handle fire control, triggering my own respawning & timer, telling the server who killed me (their laser entity was marked)

	//recieve status
	while (SG_RecievePacket(&packet, sizeof(PACKET))){ //respond to each
		//if (SENDER_ID(packet) == player_id) continue; //except my own echoed back to me

		if (DISCONNECTED(packet)){ //they just disconnected, explode em
			if (players[SENDER_ID(packet)].status == 1){
				explode_entity(&(StarblazerEntities[players[SENDER_ID(packet)].entity_id]));
			}
			players[SENDER_ID(packet)].status = 0;
		}
		else if (RESPAWNING(packet)){
			if (players[SENDER_ID(packet)].status == 1){ //explode em if they just died
				explode_entity(&(StarblazerEntities[players[SENDER_ID(packet)].entity_id]));
			}
			players[SENDER_ID(packet)].status = 2;
		}
		else{ //connected normally, no fnny business

			if (players[SENDER_ID(packet)].status != 1){ //they either just respawned or just connected
				//printf("Spawning in an entity for player %d\n", SENDER_ID(packet));
				players[SENDER_ID(packet)].fighter = AX5;
				players[SENDER_ID(packet)].laser = &ENEMY_LASER;
				players[SENDER_ID(packet)].entity_id = spawn_entity(players[SENDER_ID(packet)].fighter, 0, 0, 0, 0, 0, 0);
				players[SENDER_ID(packet)].status = 1;
			}

			if (DIED(packet)){ //explode em if they died, set their status to respawning
				explode_entity(&(StarblazerEntities[players[SENDER_ID(packet)].entity_id]));
				players[SENDER_ID(packet)].status = 2;
			}
			else{
				//otherwise, they've been here for a bit and there's no funny business, so set the appropriate state
				StarblazerEntities[players[SENDER_ID(packet)].entity_id]->pos = packet.pos;
				StarblazerEntities[players[SENDER_ID(packet)].entity_id]->orientation = packet.rot;

				if (SHOOTING(packet)){ //fire a laser from their position if they did
					spawn_enemy_laser(SENDER_ID(packet));
				}
			}
			
		}
	}

	//recieve status
	/*while (SG_RecievePacket(&packet, sizeof(PACKET))){ //respond to each packet
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
	}*/
}

void net_disconnect(){

}