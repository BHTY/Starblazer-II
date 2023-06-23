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

int compare_records(RECORD* r1, RECORD* r2){
	int delta1 = r1->K - r1->D;
	int delta2 = r2->K - r2->D;

	return delta2 - delta1;
}

void sort_leaderboard(){ //sorts in descending order
	qsort(leaderboard.records, leaderboard.number_records, sizeof(RECORD), compare_records);
}

void save_leaderboard(){
	FILE* fp = fopen("leader.bin", "wb");
	fwrite(&leaderboard, sizeof(LEADERBOARD), 1, fp);
	fclose(fp);
}

void write_leaderboard_csv(){

}

void write_leaderboard_html(){
	int i;
	FILE* fp = fopen("leader.html", "w");

	fprintf(fp, "<title>Leaderboard</title>");
	fprintf(fp, "<body style=\"background-color:black;color:white;\">");
	fprintf(fp, "<style>table, th, td{ border:1px solid white;}</style>");
	fprintf(fp, "<h2>Leaderboard</h2>");

	fprintf(fp, "<table>\n<tr><th>Place</th><th>Name</th><th>Kills</th><th>Deaths</th></tr>\n");

	for (i = 0; i < leaderboard.number_records; i++){
		fprintf(fp, "<tr> <td>%d</td> <td>%s</td> <td>%d</td> <td>%d</td>  </tr>\n", i + 1, leaderboard.records[i].player_name, leaderboard.records[i].K, leaderboard.records[i].D);
	}

	fprintf(fp, "</table></body>");
	fclose(fp);
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
	sort_leaderboard();
	save_leaderboard();
	write_leaderboard_html();
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
	timeSetEvent(60000, 100, (LPTIMECALLBACK)&mmproc, 0, TIME_CALLBACK_FUNCTION | TIME_PERIODIC);
	load_cfg();
	in_socket = open_listening_connection(PORT, INADDR_ANY);
	printf("Transmitting Port: %d\nListening/Recieving Port: %d\n", OTHER_PORT, PORT);

	for (i = 0; i < 16; i++){
		players[i].index = -1;
	}
}

int send_packet_good(connection_t* con, connection_t* aux, void* buf, int len){
	if (sendto(con->sock, buf, len, 0, (SOCKADDR*)&(aux->addr), sizeof(aux->addr)) == SOCKET_ERROR)
	{
		printf("sendto failed: %d", WSAGetLastError());
		exit(0);
	}
}

int main(){
	RETURNING_TOKEN ret_token;
	char raw_data[50];
	PACKET* packet = raw_data;
	AUTH_TOKEN* token = raw_data;
	recv_desc_t desc;
	int index, i, slot, j;
	connection_t temp_connection;
	char text[80];
	int cur_players = 0;

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
							printf("Player %d (%s) connected from %d.%d.%d.%d with %d kills and %d deaths\n", slot, token->player_name, desc.addr.S_un.S_un_b.s_b1, desc.addr.S_un.S_un_b.s_b2, desc.addr.S_un.S_un_b.s_b3, desc.addr.S_un.S_un_b.s_b4, leaderboard.records[index].K, leaderboard.records[index].D);
							players[slot].socket = open_transmitting_connection(OTHER_PORT, desc.addr.s_addr); //OTHER_PORT
							players[slot].index = index;
							players[slot].timestamp_last_packet = timeGetTime();
							
							//send them a complementary response packet
							ret_token.connected = 1;
							ret_token.player_num = slot;
							ret_token.wait_die = RESPAWN_TIME;
							send_packet(&(players[slot].socket), &ret_token, sizeof(RETURNING_TOKEN));
							cur_players++;
							sprintf(text, "Starblazer II Game Server (%d inbound connections)", cur_players);
							SetConsoleTitle(text);
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
				//printf("Player %d is located at (%d, %d, %d)\n", SENDER_ID(*packet), packet->pos.x >> 16, packet->pos.y >> 16, packet->pos.z >> 16);

				players[SENDER_ID(*packet)].timestamp_last_packet = timeGetTime();

				//relay to all players (except the sender, of course)
				for (i = 0; i < 16; i++){
					if (players[i].index != -1 && i != SENDER_ID(*packet)){
						send_packet(&(players[i].socket), packet, sizeof(PACKET));
					}
				}

				//if the death flag is set, K/D value
				if (DIED(*packet)){
					leaderboard.records[players[SENDER_ID(*packet)].index].D++;
					leaderboard.records[players[KILLER_ID(*packet)].index].K++;
					printf("Player %d has killed player %d.\n", KILLER_ID(*packet), SENDER_ID(*packet));
				}
			}
			
			//handle timeout logic

		}

		for (i = 0; i < 16; i++){

			if (players[i].index != -1){ //if they're connected
				if (timeGetTime() - players[i].timestamp_last_packet > TIMEOUT){ //you're out, bitch
					players[i].index = -1;
					close_connection(&(players[i].socket));
					//increase deaths by one

					packet->flags = 2 | (i << 4) | (i << 12); //set it such that they despawn
					cur_players--;

					sprintf(text, "Starblazer II Game Server (%d inbound connections)", cur_players);
					SetConsoleTitle(text);

					printf("Player %d has timed out.\n", i);

					for (j = 0; j < 16; j++){ //give everyone else the news
						if (players[j].index != -1){
							send_packet(&(players[j].socket), packet, sizeof(PACKET));
						}
					}
				}
			}
		}
	}
}