/*
	Starblazer II Game Server
	for Windows 32-bit platforms

	admittedly, a big chunk of this code is probably portable to other platforms
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include <winsock.h>
#include <windows.h>
#include "svrtypes.h"

LEADERBOARD leaderboard;
CONNECTED_PLAYER players[16];

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

int main(){
	SetConsoleTitle("Starblazer II Game Server");
}