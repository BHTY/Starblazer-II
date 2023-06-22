/*
	Starblazer II Game Server
	for Windows 32-bit platforms

	admittedly, a big chunk of this code is probably portable to other platforms
	but a lot of this comes from pre-rewrite Starblazer II sooooooo
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>
#include <mmsystem.h>
#include "svrtypes.h"

int PORT, OTHER_PORT, RESPAWN_TIME, TIMEOUT; //all of these settings are read from the ini file

LEADERBOARD leaderboard;
CONNECTED_PLAYER players[16];
connection_t in_socket;

void load_cfg(){
	FILE* fp = fopen("config.ini", "r");
	fscanf(fp, "port= %d\n", &PORT);
	fscanf(fp, "otherport= %d\n", &OTHER_PORT);
	fscanf(fp, "respawn= %d\n", &RESPAWN_TIME);
	fscanf(fp, "timeout= %d\n", &TIMEOUT);
	fclose(fp);
}

int find_open_slot(){ //returns 0-15 if a slot is available, -1 if not
	int i;

	for (i = 0; i < 16; i++){
		if (players[i].index == -1){
			return i;
		}
	}

	return -1;
}

/*
- Loads the leaderboard file if it exists
- Creates a new one if it doesn't
*/

void load_leaderboard(){
	FILE* fp = fopen("leader.bin", "rb");

	if (!fp){ //file doesn't exist
		memset(&leaderboard, 0, sizeof(LEADERBOARD));
		printf("Creating blank leaderboard file\n");
	}
	else{ //file does exist, load it in
		fread(&leaderboard, sizeof(LEADERBOARD), 1, fp);
		fclose(fp);
	}
}

/*
- Sorts the leaderboard in descending score order
- Saves it back to the file
- Generates the HTML and CSV versions
*/

void sync_leaderboard(){

}

/*
Scans through the leaderboard to find a player matching the player name.
If a player exists and their PIN matches the pin passed in, return the index. If the PIN doesn't match, return -1.
If no player matches the PIN, create a new player record and return its index.
*/

int authenticate(char* player_name, char* pin){
	int i;

	for (i = 0; i < leaderboard.number_records; i++){
		if (strcmp(player_name, leaderboard.records[i].player_name) == 0){ //name match
			if (strcmp(pin, leaderboard.records[i].player_pin) == 0){ //pin match
				return i;
			}
			else{
				return -1;
			}
		}
	}

	//assuming we're still here, no matches were found, so create a blank one
	leaderboard.records[leaderboard.number_records].K = 0;
	leaderboard.records[leaderboard.number_records].D = 0;
	strcpy(leaderboard.records[leaderboard.number_records].player_name, player_name);
	strcpy(leaderboard.records[leaderboard.number_records].player_pin, pin);
	leaderboard.number_records++;

	return leaderboard.number_records - 1;
}

void __stdcall mmproc(unsigned int uTimerID, unsigned int uMsg, DWORD* dwUser, DWORD* dw, DWORD* dw2){
	printf("Syncing leaderboard\n");
	sync_leaderboard();
}

/*
- Sets console title
- Loads leaderboard
- Zeros out connected players list
- Opens socket
- Sets multimedia timer to sync leaderboard
*/

void init_server(){
	int i;

	printf("Starblazer II Game Server Version 0.5\nBuilt %s %s\n", __DATE__, __TIME__);
	SetConsoleTitle("Starblazer II Game Server (inbound connections: 0)");
	load_leaderboard();
	memset(players, 0, sizeof(players));
	init_networking();
	in_socket = open_listening_connection(PORT, INADDR_ANY);
	timeSetEvent(60000, 100, (LPTIMECALLBACK)&mmproc, 0, TIME_CALLBACK_FUNCTION | TIME_PERIODIC);
	load_cfg();
	printf("Transmitting Port: %d\nListening/Recieving Port: %d\n", OTHER_PORT, PORT);

	for (i = 0; i < 16; i++){
		players[i].index = -1;
	}
}

int main(){
	RETURNING_TOKEN ret_token;
	char raw_data[50];
	PACKET* packet = raw_data;
	AUTH_TOKEN* token = raw_data;
	recv_desc_t desc;
	int index, i, slot;
	connection_t temp_connection;

	init_server();

	while (1){
		desc = recv_packet(&in_socket, raw_data, 50);

		if (desc.data_available){

			if (desc.bytes == sizeof(AUTH_TOKEN)){
				if (strcmp(token->str, "STARBLAZER") == 0){
					index = authenticate(token->player_name, token->player_pin);

					if (index == -1){ //reject em
						temp_connection = open_transmitting_connection(OTHER_PORT, desc.addr.s_addr);
						ret_token.connected = 0;
						send_packet(&temp_connection, &ret_token, sizeof(RETURNING_TOKEN));
						close_connection(&temp_connection);
					}
					else{ //they check out, connect em!
						slot = find_open_slot();

						if (slot != -1){
							printf("Player %d (%s) connected from %d.%d.%d.%d", slot, token->player_name, desc.addr.S_un.S_un_b.s_b1, desc.addr.S_un.S_un_b.s_b2, desc.addr.S_un.S_un_b.s_b3, desc.addr.S_un.S_un_b.s_b4);
							players[slot].socket = open_transmitting_connection(OTHER_PORT, desc.addr.s_addr);
							players[slot].index = index;
							players[slot].timestamp_last_packet = timeGetTime();

							//send them a complementary response packet
							ret_token.connected = 1;
							ret_token.player_num = slot;
							ret_token.wait_die = RESPAWN_TIME;
							send_packet(&(players[slot].socket), &ret_token, sizeof(RETURNING_TOKEN));
						}
						else{ //not enough room
							temp_connection = open_transmitting_connection(OTHER_PORT, desc.addr.s_addr);
							ret_token.connected = 0;
							send_packet(&temp_connection, &ret_token, sizeof(RETURNING_TOKEN));
							close_connection(&temp_connection);
						}			
					}

				}
			}
			else if (desc.bytes == sizeof(PACKET)){
				//relay to all players (except the sender, of course)
				//if the death flag is set, K/D value
			}

			//handle timeout logic
			for (i = 0; i < 16; i++){

			}

		}
	}
}