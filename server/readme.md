# Starblazer II Game Server Process
**Initialization**
- Load the profile/score records of all users
- Zero out the connected players list
- Open a listening socket on the listening port to any IP address 

**Main Loop**
- If there's a packet available...
- - If it's a connection request packet, authenticate it
  - fsdfsf
- - If it's a normal packet, refer it to all of the other players
- - - If the death flag is set, increase the D number of the player that sent it and the K number of the player that they say killed them
- Sync leaderboard (fill in TBD)
- Loop through all of the connected players. If the time between now and their last packet is greater than or equal to the timeout constant, remove them from the connected players list and send a packet indicating their disconnection to the other players
