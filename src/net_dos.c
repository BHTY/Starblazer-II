#include "../headers/int.h"
#include "../headers/net.h"
#include "../headers/blazer.h"
#include "../headers/serial.h"
#include "../headers/ecs.h"
#include "../headers/blazer2.h"
#include "../headers/star_gen.h"
#include "../headers/sl_math.h"

int timeout = 140;
uint32 mplayer_addr = 0;

CONNECTED_PLAYER players[16];

uint32 __stdcall inet_addr(char* str) {

}

int serial_plr;

void spawn_enemy_laser(){
	VEC3 pos = StarblazerEntities[players[0].entity_id]->pos;
	QUAT ori = StarblazerEntities[players[0].entity_id]->orientation;
	uint32 id = spawn_entity(players[0].laser->model, pos.x, pos.y, pos.z, 0, 0, 0);

	StarblazerEntities[id]->orientation = ori;
	StarblazerEntities[id]->state[15] = players[0].laser->damage;
	StarblazerEntities[id]->state[0] = 280;
	StarblazerEntities[id]->state[13] = 0;
	rotate_object(StarblazerEntities[id]);
	play_soundfx(SND_LASER_ENEMY);
}

bool_t net_connect(uint32 addr){
	char recv_token[13];
	char c;
	PACKET dummy;
	//setmode(0x03);
	printf("SERIAL: Attempting connection.\n");
	if (isRecvReady()) {
		serial_plr = 2;
	} else {
		serial_plr = 1;
	}
	/*printf("Enter player number:\n");
	serial_plr = 0;
	while (!serial_plr) {
		if (SG_KeyDown('1')) serial_plr = 1;
		if (SG_KeyDown('2')) serial_plr = 2;
	}*/
	if (serial_plr == 1) {
		putsSerial("STARBLAZER1", 11);
		getsSerial(recv_token, 11);
		recv_token[11] = 0;
		if (strcmp(recv_token, "STARBLAZER2")) {
			printf("SERIAL: Connection failed.\n");
			return 1;
		}
	} else {
		putsSerial("STARBLAZER2", 11);
		getsSerial(recv_token, 11);
		recv_token[11] = 0;
		if (strcmp(recv_token, "STARBLAZER1")) {
			printf("SERIAL: Connection failed.\n");
			return 1;
		}
	}
	
	dummy.pos.x = 0;
	dummy.pos.y = 0;
	dummy.pos.z = 0;
	dummy.pitchDelta = 0;
	dummy.yawDelta = 0;
	dummy.rollDelta = 0;
	//quat_create(0, 0, 0, &dummy.rot);
	putsSerial((char*)&dummy, sizeof(PACKET));
	
	printf("SERIAL: Connection established.\n");
	
	// do other player's spawn here
	
	return 0;
	
}

void setup_duel() {
	players[0].fighter = AX5;
	//players[SENDER_ID(packet)].laser = &ENEMY_LASER;
	players[0].entity_id = spawn_entity(players[0].fighter, 0, 0, 0, 0, 0, 0);
	players[0].status = 1;
	
	StarblazerEntities[0]->pos.y = 0;
	StarblazerEntities[0]->pos.x = 0;
	StarblazerEntities[0]->pos.z = serial_plr == 1 ? 80*65536 : -80*65536;
	if (serial_plr == 1) { 
		quat_create(0, 0x80, 0, &StarblazerEntities[0]->orientation);
		quat_create(0, 0, 0, &StarblazerEntities[players[0].entity_id]->orientation);
	} else {
		quat_create(0, 0, 0, &StarblazerEntities[0]->orientation);
		quat_create(0, 0x80, 0, &StarblazerEntities[players[0].entity_id]->orientation);
	}
}

extern unsigned char accumPitch, accumYaw, accumRoll;

void send_death() {
	PACKET packet;
	
	packet.flags |= 2;
	
	clearBuffer();
	
	putsSerial((unsigned char*)&packet, sizeof(PACKET));
}

void net_syncstate(){
	PACKET packet;
	
	// TODO: others
	if (!isRecvReady())
		return;
	
	getsSerial((unsigned char*)&packet, sizeof(PACKET));
	//clearBuffer();
	
	
	if (packet.flags & 2) {
		explode_entity(&(StarblazerEntities[players[0].entity_id]));
		return;
	}
	
	StarblazerEntities[players[0].entity_id]->pos = packet.pos;
	quat_pitch(packet.pitchDelta, &(StarblazerEntities[players[0].entity_id]->orientation));
	quat_yaw(packet.yawDelta, &(StarblazerEntities[players[0].entity_id]->orientation));
	quat_roll(packet.rollDelta, &(StarblazerEntities[players[0].entity_id]->orientation));
	//StarblazerEntities[players[0].entity_id]->orientation = packet.rot;
	rotate_object(StarblazerEntities[players[0].entity_id]);
	if (packet.flags & 1) {
		players[0].laser = &ENEMY_LASER_SHREDDER;
		spawn_enemy_laser();
	}	
	
	packet.pos = StarblazerEntities[0]->pos;
	packet.pitchDelta = accumPitch;
	packet.yawDelta = accumYaw;
	packet.rollDelta = accumRoll;
	accumPitch = 0;
	accumYaw = 0;
	accumRoll = 0;
	//packet.rot = StarblazerEntities[0]->orientation;
	packet.flags = firing;
	
	//if (!isTransmitEmpty())
	//	return;
	
	putsSerial((unsigned char*)&packet, sizeof(PACKET));
	
	//SG_SendPacket(&packet, sizeof(PACKET));
	//SG_RecievePacket(&packet, sizeof(PACKET));

	
	//StarblazerEntities[1]->pos = packet.pos;
	//StarblazerEntities[players[0].entity_id]->pos.x += 100;
}
void net_disconnect(){

}
