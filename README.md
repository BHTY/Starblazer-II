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
- Player names above ships (and you get told who killed you)
- Different laser types
  - Dragonbreath: Peashooter -- low damage, power draw, high firing rate (colors: green/magenta/red) -- overheat?
  - Shredder: Essentially the weapon we have right now, but tweak the power draw and delay between shots slightly to lower em a bit

In detail (fix hitboxes) -- attempt Win32s port?
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
