# Starblazer-II
By Will Klees & Josh Piety

To-do List
- make the game

**Win32 Version**  
Supported Operating Systems: Windows 95 or higher, Windows NT 3.50 or higher (x86, MIPS, PowerPC, Alpha, AXP64, IA-64), ReactOS, Wine  
Supported Compilers: Visual C++ 2.0 or higher, MinGW  
Build Instructions: Run make.bat 
![image info](pics/win32.jpg) 

**MS-DOS (VGA) Version**  
Supported Compilers: Open Watcom  
Build Instructions: Run src/dosmake.bat
![image info](pics/dos.jpg)

**Linux (SDL2) Version**  
Supported Compilers: GCC  
Build Instructions: make -f Makefile.sdl
![image info](pics/sdl.png)  

**UNIX (X Windows) Version**  
Supported Operating Systems: Any POSIX-compliant UNIX with an X Server  
Supported Compilers: GCC  
Build Instructions: make -f Makefile.nix
![image info](pics/x.png)

**StarblazerGeneric Info**  
To make a barebones port of Starblazer II to a new platform, only a few platform-specific functions are needed to be implemented. Take one of the existing build scripts and replace the platform file (e.g. ``star_win.c``) with your own.
- ``void SG_Init(int argc, char** argv)``:
- ``bool_t SG_KeyDown(char key)``: 
- ``void SG_ReadMouse(SG_mouse_t* mouse)``: 
- ``void SG_DrawFrame()``: 
- ``void SG_ProcessEvents()``: 
- ``void SG_Sleep(int ms)``: 

Here's an example ``main`` function:
```c
int main(){
  SG_WelcomeMessage(); //display the welcome message
  SG_Init(0, 0); //initialize the game
  SG_InitPalette(); //initialize the palette
  title_init(); //prepare to go to the title screen

  while(1){SG_Tick();} //tick the game
}
```

Networking, sound, and joystick support are optional features.
