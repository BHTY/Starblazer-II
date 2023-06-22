/*
	Starblazer II Game Server
	for Windows 32-bit platforms

	admittedly, a big chunk of this code is probably portable to other platforms
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <windows.h>
#include <mmsystem.h>
#include "svrtypes.h"

int PORT, OTHER_PORT;

LEADERBOARD leaderboard;
CONNECTED_PLAYER players[16];
connection_t in_socket;

/*
- Loads the leaderboard file if it exists
- Creates a new one if it doesn't
*/

void load_leaderboard(){
	FILE* fp = fopen("leader.bin", "rb");

	if (!fp){ //file doesn't exist
		memset(&leaderboard, 0, sizeof(LEADERBOARD));
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
	printf("Starblazer II Game Server Version 0.5\nBuilt %s %s\n", __DATE__, __TIME__);
	SetConsoleTitle("Starblazer II Game Server");
	load_leaderboard();
	memset(players, 0, sizeof(players));
	init_networking();
	in_socket = open_listening_connection(PORT, INADDR_ANY);
	timeSetEvent(60000, 100, (LPTIMECALLBACK)&mmproc, 0, TIME_CALLBACK_FUNCTION | TIME_PERIODIC);
}

int main(){
	init_server();

	while (1){

	}
}