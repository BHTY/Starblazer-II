# Starblazer-II
To-do List
- make the game
- tweak compiler settings - compile demo with MSVC2 in /O2 or MinGW with MSVCRT20.DLL
- optimizations (particularly on DOS but also for slower Windows machines) -- hotspots below
  - Math functions
  - Triangle filling
  - Lighting calculation
  - Stop using floating point in the sound code

In detail (finish the naming thing in the netcode)
- Finish UI subsystem
  - Add other UI controls
  - Fix text spacing
- Correctly load/save/use the options file
- Add the options screens & multiplayer selection screen
- Joystick support (ON EVERYTHING!!!)
- ~~Laser turrets (single player)~~
- Make the DOS & Linux ports less barebones
  - Sound support on DOS & Linux
  - Mouse support on DOS
  - Serial support on DOS & networking support on Linux
- Optimization
