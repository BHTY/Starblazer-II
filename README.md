# Starblazer-II
To-do List
- make the game
- tweak compiler settings
- optimizations (particularly on DOS but also for slower Windows machines) -- hotspots below
  - Math functions (particularly mul/div)
  - Triangle filling
  - Lighting calculation
  - Plot pixel & draw line
  - Sound code (which just needs some improvements, period)


Multiplayer enhancements & game balance
- Add laser and frameskip to config.ini
- Player names above ships (and you get told who killed you)
- Different laser types (magenta for turrets)
  - Dragonbreath: Peashooter -- low damage, power draw, high firing rate (primary color: green | secondary color: red) -- overheat?
  - Shredder: Essentially the weapon we have right now, but tweak the power draw and delay between shots slightly to lower em a bit


In detail (fix hitboxes)
- Finish UI subsystem
  - Add other UI controls
  - Fix text spacing
- Correctly load/save/use the options file
- Add the options screens & multiplayer selection screen
- Joystick support
- Laser turrets (single player)
- Make the DOS & Linux ports less barebones
  - Sound support on DOS & Linux
  - Mouse support on DOS
  - Serial support on DOS & networking support on Linux
- Optimization
