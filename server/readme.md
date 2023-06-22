# Starblazer II Game Server Process
**Initialization**
- Load the profile/score records of all users
- Zero out the connected players list
- Open a listening socket on the listening port to any IP address 

**Main Loop**
- If there's a packet available...
  - If it's a connection request packet, authenticate it
    - If the name is something we haven't seen before, create a new profile for them with 0K/0D and whatever pin they give us
    - If it's an existing profile, check if the PIN matches with what we have on file. If so, connect them (open a transmitting socket, send them their stuff, put em in the table). If not, fuck em
  - If it's a normal packet, refer it to all of the other players
    - If the death flag is set, increase the D number of the player that sent it and the K number of the player that they say killed them
- Sync leaderboard
  - Sort the leaderboard by KD ratio and then create an HTML and CSV file out of it with a four-column table (place, player name, K, and D)
- Loop through all of the connected players. If the time between now and their last packet is greater than or equal to the timeout constant, remove them from the connected players list and send a packet indicating their disconnection to the other players

The netcode is deceptively simple. (famous last words)
