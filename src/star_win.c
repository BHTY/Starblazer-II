/*
Filename: star_win.c
Description: Starblazer II for Windows 95/NT
*/

#include <windows.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <mmsystem.h>
#pragma comment(lib, "winmm.lib")

#include "../headers/star_gen.h"
#include "../headers/blazer.h"
#include "../headers/graphics.h"

char* SG_platform = "win32";
char* SG_title = "Starblazer II for Windows 95/NT";
uint8* frontbuffer;

//WEIRDASS WINDOWS STUFF BEGINS HERE
HWND hwnd; //this is the window handle to the... window
BITMAPINFO* bmi;
HBITMAP backBitmap;
HPALETTE hPalette;
RECT rectScreen;
int newFrame = 0;

int window_height;
int window_width;

bool_t keys[256];

LRESULT CALLBACK WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam){
	HDC hdc;
	HDC hdc_bmp;
	HGDIOBJ old_bmp;

	switch (msg){
		case WM_DESTROY:{
			PostQuitMessage(0);
			break;
		}

		case WM_CLOSE:{
			DestroyWindow(hWnd);
			ExitProcess(0);
			break;
		}

		case WM_QUIT:{
			ExitProcess(0);
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
			break;
		}

		case WM_PAINT:{
			hdc = GetDC(hWnd);
			hdc_bmp = CreateCompatibleDC(hdc);
			old_bmp = SelectObject(hdc_bmp, backBitmap);
			StretchBlt(hdc, 0, 0, window_width, window_height, hdc_bmp, 0, 0, 320, 200, SRCCOPY);
			SelectObject(hdc, old_bmp);
			DeleteDC(hdc_bmp);
			DeleteObject(old_bmp);
			ReleaseDC(hWnd, hdc);
			break;
		}

		default:{
			return DefWindowProc(hWnd, msg, wParam, lParam);
		}
	}
}

void __stdcall mmproc(unsigned int uTimerID, unsigned int uMsg, unsigned int* dwUser, unsigned int* dw, unsigned int* dw2){
	newFrame = 1;
}

//WEIRDASS WINDOWS STUFF ENDS HERE (well, not really, but aspirationally - this place just exists to quarantine variables needed for Windows bs)

/*
What SG_Init needs to do
- Create window
- Create bitmap
- Set timer
*/

void SG_Init(int argc, char** argv){
	RECT winRect;
	HDC hdcScreen;
	WNDCLASS wc;

	//do the generic initialization
	SG_GameInit();

	window_width = 640;
	window_height = 480;

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
	wc.hIcon = LoadIcon(GetModuleHandle(NULL), MAKEINTRESOURCE(101));
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

	FBPTR = malloc(64000);
	timeSetEvent(14, 1, (LPTIMECALLBACK)&mmproc, 0, TIME_CALLBACK_FUNCTION | TIME_PERIODIC);
	memset(keys, 0, 256 * sizeof(bool_t));
	//joystick stuff...
}

void SG_ReadMouse(SG_mouse_t* mouse){

}

bool_t SG_KeyDown(uint8 key){
	return keys[key];
}

void SG_DrawFrame(){
	InvalidateRect(hwnd, NULL, 0);
}

void SG_SetPaletteIndex(uint8 index, uint8 r, uint8 g, uint8 b){ //do the windows RealizePalette nonsense
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

uint32 SG_GetTicks(){
	return timeGetTime();
}

void SG_WaitBlank(){
	MSG Msg;

	while (!newFrame){
		if (PeekMessage(&Msg, hwnd, 0, 0, PM_REMOVE)){
			TranslateMessage(&Msg);
			DispatchMessage(&Msg);
		}
	}
	newFrame = 0;
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