/*
Filename: star_win.c
Description: Starblazer II for Windows 95/NT
*/

#define WIN32_LEAN_AND_MEAN

#include <windows.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <winsock.h>

#include <mmsystem.h>
#pragma comment(lib, "winmm.lib")

#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/graphics.h"
#include "../headers/sndmixer.h"

char* SG_platform = "win32";
extern bool_t laser_type;

#ifdef _WIN64
	char *SG_title = "Starblazer II for Win64";
#elif _M_IX86 //win32 for x86
	char *SG_title = "Starblazer II for Windows 95";
#else //win32 for risc
	char *SG_title = "Starblazer II for Windows NT";
#endif

uint8* frontbuffer;

//WEIRDASS WINDOWS STUFF BEGINS HERE
HWND hwnd; //this is the window handle to the... window
HDC globalHdc;
BITMAPINFO* bmi;
HBITMAP backBitmap;
HPALETTE hPalette;
RECT rectScreen;
int newFrame = 0;

HDC hdc_bmp;

uint32 mplayer_addr;

int window_height;
int window_width;

float mouseFactorX, mouseFactorY;
bool_t mouseDownLeft = 0;
bool_t mouseDownRight = 0;

bool_t keys[256];

LRESULT CALLBACK WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam){
	HDC hdc;
	//HDC hdc_bmp;
	HGDIOBJ old_bmp;

	switch (msg){
		case WM_DESTROY:{
							PostQuitMessage(0);
							SG_CloseConnection();
			break;
		}

		case WM_CLOSE:{
			DestroyWindow(hWnd);
			ExitProcess(0);
			SG_CloseConnection();
			break;
		}

		case WM_QUIT:{
			ExitProcess(0);
			SG_CloseConnection();
			break;
		}

		case WM_KEYDOWN:{
			keys[(uint8)wParam] = 1;
			break;
		}

		case WM_KEYUP:{
			keys[(uint8)wParam] = 0;
			break;
		}

		case WM_SIZE:{
			window_width = lParam & 0xffff;
			window_height = (lParam & 0xffff0000) >> 16;
			mouseFactorX = 320.0 / window_width;
			mouseFactorY = 200.0 / window_height;
			GetWindowRect(hwnd, &rectScreen);
			ClipCursor(&rectScreen);
			break;
		}

		case WM_PAINT:{
			old_bmp = SelectObject(hdc_bmp, backBitmap);
			StretchBlt(globalHdc, 0, 0, window_width, window_height, hdc_bmp, 0, 0, 320, 200, SRCCOPY);
			DeleteObject(old_bmp);
			return DefWindowProc(hWnd, msg, wParam, lParam);
		}

		case WM_LBUTTONDOWN:{
			mouseDownLeft = 1;
			break;
		}

		case WM_LBUTTONUP:{
			mouseDownLeft = 0;
			break;
		}

		case WM_RBUTTONDOWN:{
			mouseDownRight = 1;
			break;
		}

		case WM_RBUTTONUP:{
			mouseDownRight = 0;
			break;
		}

		default:{
			return DefWindowProc(hWnd, msg, wParam, lParam);
		}
	}
}

void __stdcall mmproc(unsigned int uTimerID, unsigned int uMsg, unsigned int* dwUser, unsigned int* dw, unsigned int* dw2){
	newFrame = 1;
	tick_counter++;
}

void __stdcall mmproc_2(unsigned int uTimerID, unsigned int uMsg, unsigned int* dwUser, unsigned int* dw, unsigned int* dw2){
	ready_frame = 1;
}

VOID initWaveHeader(WAVEHDR* wvHdr, char* lpData, DWORD dwBufferLength, DWORD dwBytesRecorded, DWORD dwUser, DWORD dwFlags, DWORD dwLoops){
    wvHdr->lpData = lpData;
    wvHdr->dwBufferLength = dwBufferLength;
    wvHdr->dwBytesRecorded = dwBytesRecorded;
    wvHdr->dwUser = dwUser;
    wvHdr->dwFlags = dwFlags;
    wvHdr->dwLoops = dwLoops;
}

void initWave(WAVEFORMATEX *wave, WORD wFormatTag, WORD nChannels, DWORD nSamplesPerSec, DWORD nAvgBytesPerSec, WORD nBlockAlign, WORD wBitsPerSample, WORD cbSize){
    wave->wFormatTag = wFormatTag;
    wave->nChannels = nChannels;
    wave->nSamplesPerSec = nSamplesPerSec;
    wave->nAvgBytesPerSec = nAvgBytesPerSec;
    wave->nBlockAlign = nBlockAlign;
    wave->wBitsPerSample = wBitsPerSample;
    wave->cbSize = cbSize;
}

WSADATA init_networking(){
	WORD winsock_version = 0x202;
	WSADATA winsock_data;

	if (WSAStartup(winsock_version, &winsock_data))
	{
		printf("WSAStartup failed: %d", WSAGetLastError());
		exit(0);
	}

	return winsock_data;
}


int PORT = 9999;
int OTHER_PORT = 23456;
SOCKET server_connection;
SOCKADDR_IN server_addr;
int size_response;

WAVEHDR waveHdrA;
WAVEHDR waveHdrB;
WAVEFORMATEX global_wave;
HWAVEOUT global_hWaveOut = 0;

void win_initialize_wave(WAVEHDR* wvHdr, uint8* buf){
	initWaveHeader(wvHdr, buf, BUFFER_SIZE, 0, 0, 0, 0);
	waveOutPrepareHeader(global_hWaveOut, wvHdr, sizeof(WAVEHDR));
	waveOutWrite(global_hWaveOut, wvHdr, sizeof(WAVEHDR));
	waveOutUnprepareHeader(global_hWaveOut, wvHdr, sizeof(WAVEHDR));
}

void __stdcall sound_callback(HWAVEOUT hwo, UINT msg, DWORD* dwInstance, DWORD dwParam1, DWORD dwParam2){
	if(msg == WOM_OPEN){
		return;
	}
	
	if(current_buffer == 0){ //A just finished, resubmit & remix A
		win_initialize_wave(&waveHdrA, buffer1);
	}else{ //B just finished, resubmit & remix B
		win_initialize_wave(&waveHdrB, buffer2);
	}
	
	mix();
	current_buffer = !current_buffer;
	//printf("Refilling buffer.\n");
}

//WEIRDASS WINDOWS STUFF ENDS HERE (well, not really, but aspirationally - this place just exists to quarantine variables needed for Windows bs)

bool_t SG_OpenConnection(uint32 addr){
	ULONG iMode = 1;

	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(PORT);
	server_addr.sin_addr.s_addr = mplayer_addr;
		
	server_connection = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (server_connection == INVALID_SOCKET){
		return 0;
	}

	ioctlsocket(server_connection, FIONBIO, &iMode);

	return 1;
}

int SG_RecievePacket(void* buf, int num_bytes){
	int return_value = recvfrom(server_connection, buf, num_bytes, 0, 0, 0);

	if (return_value == -1){
		return 0;
	}
	else{
		return return_value;
	}
}

void SG_SendPacket(void* buf, int num_bytes){
	sendto(server_connection, buf, num_bytes, 0, &server_addr, sizeof(server_addr));
}

void SG_CloseConnection(){
	closesocket(server_connection);
}

void SG_TempLoadConfig(uint32* addr, int* x, int* y, int* port, int* otherport, char* name, char* pin){
	char taddr[50];

	FILE* fp = fopen("config.ini", "r");
	fscanf(fp, "addr= %s\n", taddr);
	fscanf(fp, "port= %d\n", port);
	fscanf(fp, "name= %s\n", name);
	fscanf(fp, "pin= %s\n", pin);
	fscanf(fp, "x= %d\n", x);
	fscanf(fp, "y= %d\n", y);
	fscanf(fp, "laser= %d\n", &laser_type);
	fscanf(fp, "frameskip= %d\n", &(GAME_SETTINGS.vid_settings.frameskip));
	fscanf(fp, "block= %d\n", &BUFFER_SIZE);
	fscanf(fp, "sfx= %d\n", &SFX_ENABLE);
	fscanf(fp, "music= %d\n", &MUSIC_ENABLE);
	fscanf(fp, "sound= %d\n", &SOUND_ENABLE);
	fscanf(fp, "sleep= %d\n", &SLEEP_TIME);
	fscanf(fp, "framecap= %d\n", &FRAME_CAP);
	fclose(fp);

	*addr = inet_addr(taddr);
}

/*
What SG_Init needs to do
- Create window
- Create bitmap
- Set timer
*/

void SG_Init(int argc, char** argv){
	int num_devs;
	RECT winRect;
	HDC hdcScreen;
	WNDCLASS wc;
	DWORD version = GetVersion();

	printf("Running on Windows version %d.%02d\n", version & 0xFF, (version >> 8) & 0xFF);

	//do the generic initialization
	SG_GameInit();

	SG_TempLoadConfig(&mplayer_addr, &window_width, &window_height, &PORT, &OTHER_PORT, GAME_SETTINGS.com_settings.player_name, GAME_SETTINGS.com_settings.player_pin);

	init_networking();

	/*window_width = 640;
	window_height = 480;*/

	winRect.left = 0;
	winRect.top = 0;
	winRect.bottom = window_height;
	winRect.right = window_width;

	AdjustWindowRect(&winRect, WS_OVERLAPPEDWINDOW, FALSE);

	bmi = malloc(sizeof(BITMAPINFO)+256 * sizeof(RGBQUAD));

	bmi->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmi->bmiHeader.biWidth = 320;
	bmi->bmiHeader.biHeight = -200;
	bmi->bmiHeader.biPlanes = 1;
	bmi->bmiHeader.biBitCount = 8;
	bmi->bmiHeader.biClrUsed = 256;
	bmi->bmiHeader.biCompression = BI_RGB;

	hdcScreen = GetDC(NULL);
	backBitmap = CreateDIBSection(hdcScreen, bmi, DIB_RGB_COLORS, (void**)(&frontbuffer), NULL, NULL);
	ReleaseDC(NULL, hdcScreen);

	wc.style = 0;
	wc.lpfnWndProc = WndProc;
	wc.cbClsExtra = 0;
	wc.cbWndExtra = 0;
	wc.hInstance = GetModuleHandle(NULL);
	wc.hIcon = LoadIcon(GetModuleHandle(NULL), MAKEINTRESOURCE(1)); //101
	wc.hCursor = LoadCursor(NULL, IDC_ARROW);
	wc.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);
	wc.lpszMenuName = NULL;
	wc.lpszClassName = SG_title;
	RegisterClass(&wc);

	hwnd = CreateWindow(SG_title, SG_title, WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, winRect.right - winRect.left, winRect.bottom - winRect.top, NULL, NULL, GetModuleHandle(NULL), NULL);
	ShowWindow(hwnd, SW_SHOW);
	UpdateWindow(hwnd);

	GetWindowRect(hwnd, &rectScreen);

	timeBeginPeriod(1);

	mouseFactorX = 320.0 / window_width;
	mouseFactorY = 200.0 / window_height;

	ClipCursor(&rectScreen);

	FBPTR = malloc(64000);
	timeSetEvent(14, 1, (LPTIMECALLBACK)&mmproc, 0, TIME_CALLBACK_FUNCTION | TIME_PERIODIC);
	memset(keys, 0, 256 * sizeof(bool_t));

	if(FRAME_CAP){
		timeSetEvent(FRAME_CAP, 1, (LPTIMECALLBACK)&mmproc_2, 0, TIME_CALLBACK_FUNCTION | TIME_PERIODIC);
	}

	//joystick stuff...

	//setup sound code
	init_sound();

	if (SOUND_ENABLE){
		num_devs = waveOutGetNumDevs();
		initWave(&global_wave, WAVE_FORMAT_PCM, 1, 22050, 22050, 1, 8, 0);

		if (num_devs){
			while (waveOutOpen(&global_hWaveOut, WAVE_MAPPER, &global_wave, &sound_callback, 0, CALLBACK_FUNCTION) != MMSYSERR_NOERROR);
		}

		win_initialize_wave(&waveHdrA, buffer1);
		win_initialize_wave(&waveHdrB, buffer2);
	}

	globalHdc = GetDC(hwnd);
	hdc_bmp = CreateCompatibleDC(globalHdc);
}

void SG_ReadMouse(SG_mouse_t* mouse){
	POINT p;
	GetCursorPos(&p);
	ScreenToClient(hwnd, &p);
	mouse->x = p.x * mouseFactorX;
	mouse->y = p.y * mouseFactorY;
	mouse->buttons[0] = mouseDownLeft;
	mouse->buttons[1] = mouseDownRight;
}

bool_t SG_KeyDown(uint8 key){
	return keys[key];
}

void SG_DrawFrame(){
	InvalidateRect(hwnd, NULL, 0);
}

void SG_SetPaletteIndex(uint8 index, uint8 r, uint8 g, uint8 b){ 
	RGBQUAD col;
	RGBQUAD *willPalette = &(bmi->bmiColors[0]);

	HDC tempHDC = CreateCompatibleDC(NULL);
	SelectObject(tempHDC, backBitmap);
	col.rgbRed = r;
	col.rgbGreen = g;
	col.rgbBlue = b;
	willPalette[index] = col;
	SetDIBColorTable(tempHDC, index, 1, willPalette + index);
	DeleteDC(tempHDC);
}

/* The way to handle this on 256 color Windows
    HPALETTE hPal;
	LOGPALETTE* lpPalette = malloc(sizeof(LOGPALETTE) + sizeof(PALETTEENTRY) * 255);
		fill in the palette entries
	lpPalette->palVersion = 0x300;
	lpPalette->palNumEntries = 256;
	hPal = CreatePalette(lpPalette);
	SelectPalette(tempHDC, hPal, FALSE);
	RealizePalette(tempHDC);
*/

uint32 SG_GetTicks(){
	return timeGetTime();
}

void SG_WaitBlank(){
	MSG Msg;

	//Sleep(10);

	/*while (PeekMessage(&Msg, hwnd, 0, 0, PM_REMOVE)) {
		TranslateMessage(&Msg);
		DispatchMessage(&Msg);
	}*/

	while (!newFrame) {
		if (PeekMessage(&Msg, hwnd, 0, 0, PM_REMOVE)){
			TranslateMessage(&Msg);
			DispatchMessage(&Msg);
		}
		//newFrame = 1;
	}
	newFrame = 0;
}

void SG_Sleep(int ms){
	Sleep(ms);
}

void SG_ProcessEvents(){
	MSG Msg;

	while(PeekMessage(&Msg, hwnd, 0, 0, PM_REMOVE)){
			TranslateMessage(&Msg);
			DispatchMessage(&Msg);
	}
}

int main(int argc, char** argv){
	SG_WelcomeMessage();
	SG_Init(argc, argv);
	SG_InitPalette();
	title_init();

	while (1){
		SG_Tick();
	}
}