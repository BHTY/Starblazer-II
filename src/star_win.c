/*
Filename: star_win.c
Description: Starblazer II for Windows 95/NT
*/

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

uint32 mplayer_addr;

int window_height;
int window_width;

float mouseFactorX, mouseFactorY;
bool_t mouseDownLeft = 0;
bool_t mouseDownRight = 0;

bool_t keys[256];

LRESULT CALLBACK WndProc(HWND hWnd, UINT msg, WPARAM wParam, LPARAM lParam){
	HDC hdc;
	HDC hdc_bmp;
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
}

int PORT = 9999;
int OTHER_PORT = 23456;

typedef struct{
	SOCKET sock;
	SOCKADDR_IN addr;
} connection_t;

typedef struct{
	IN_ADDR addr;
	int bytes;
	int data_available;
} recv_desc_t;

WSADATA init_networking(){
	WORD winsock_version = 0x202;
	WSADATA winsock_data;

	if (WSAStartup(winsock_version, &winsock_data))
	{
		printf("WSAStartup failed: %d", WSAGetLastError());
		exit(0);
	}

	timeBeginPeriod(1);

	return winsock_data;
}

connection_t open_transmitting_connection(USHORT port, ULONG addr){
	ULONG iMode = 1;
	connection_t con;
	con.sock = socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP);

	if (con.sock == INVALID_SOCKET)
	{
		printf("socket failed: %d", WSAGetLastError());
		exit(0);
	}

	con.addr.sin_family = AF_INET;
	con.addr.sin_port = htons(port);
	con.addr.sin_addr.s_addr = addr;
	ioctlsocket(con.sock, FIONBIO, &iMode);

	return con;
}

connection_t open_listening_connection(USHORT port, ULONG addr){
	connection_t con = open_transmitting_connection(port, addr);

	if (bind(con.sock, (SOCKADDR*)&(con.addr), sizeof(con.addr)) == SOCKET_ERROR)
	{
		printf("bind failed: %d", WSAGetLastError());
		exit(0);
	}

	return con;
}

void close_connection(connection_t* con){
	closesocket(con->sock);
}

int send_packet(connection_t* con, void* buf, int len){
	if (sendto(con->sock, buf, len, 0, (SOCKADDR*)&(con->addr), sizeof(con->addr)) == SOCKET_ERROR)
	{
		printf("sendto failed: %d", WSAGetLastError());
		exit(0);
	}
}

int send_packet_good(connection_t* con, connection_t* aux, void* buf, int len){
	if (sendto(con->sock, buf, len, 0, (SOCKADDR*)&(aux->addr), sizeof(aux->addr)) == SOCKET_ERROR)
	{
		printf("sendto failed: %d", WSAGetLastError());
		exit(0);
	}
}

recv_desc_t recv_packet(connection_t *con, void *buf, int size){
	int error_code;
	recv_desc_t descriptor = { 0 };
	SOCKADDR_IN from = { 0 };
	int from_size = sizeof(SOCKADDR_IN);
	descriptor.bytes = recvfrom(con->sock, buf, size, 0, (SOCKADDR*)&from, &from_size);
	descriptor.data_available = 1;

	if (descriptor.bytes == SOCKET_ERROR)
	{
		error_code = WSAGetLastError();

		if (error_code == WSAEWOULDBLOCK){
			descriptor.data_available = 0;
		}

		else{
			printf("recvfrom returned SOCKET_ERROR, WSAGetLastError() %d", WSAGetLastError());
			exit(0);
		}
	}

	descriptor.addr = from.sin_addr;

	return descriptor;
}
connection_t out_socket;
connection_t server_connection;

//WEIRDASS WINDOWS STUFF ENDS HERE (well, not really, but aspirationally - this place just exists to quarantine variables needed for Windows bs)

bool_t SG_OpenConnection(uint32 addr){
	out_socket = open_transmitting_connection(PORT, addr);
	server_connection = open_listening_connection(OTHER_PORT, addr);
	
	/*server_connection = open_listening_connection(PORT, addr);
	out_socket.addr.sin_family = AF_INET;
	out_socket.addr.sin_port = htons(PORT);
	out_socket.addr.sin_addr.s_addr = addr;*/

	return 1;
}

int SG_RecievePacket(void* buf, int num_bytes){
	recv_desc_t desc = recv_packet(&server_connection, buf, num_bytes);

	if (!desc.data_available) return 0;
	return desc.bytes;
}

void SG_SendPacket(void* buf, int num_bytes){
	send_packet(&out_socket, buf, num_bytes);
	//send_packet_good(&server_connection, &out_socket, buf, num_bytes);
}

void SG_CloseConnection(){
	close_connection(&out_socket);
	//close_connection(&server_connection);
}

void SG_TempLoadConfig(uint32* addr, int* x, int* y, int* port, int* otherport, char* name, char* pin){
	char taddr[50];

	FILE* fp = fopen("config.ini", "r");
	fscanf(fp, "addr= %s\n", taddr);
	fscanf(fp, "port= %d\n", port);
	fscanf(fp, "otherport= %d\n", otherport);
	fscanf(fp, "name= %s\n", name);
	fscanf(fp, "pin= %s\n", pin);
	fscanf(fp, "x= %d\n", x);
	fscanf(fp, "y= %d\n", y);
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
	RECT winRect;
	HDC hdcScreen;
	WNDCLASS wc;

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

	mouseFactorX = 320.0 / window_width;
	mouseFactorY = 200.0 / window_height;

	ClipCursor(&rectScreen);

	FBPTR = malloc(64000);
	timeSetEvent(14, 1, (LPTIMECALLBACK)&mmproc, 0, TIME_CALLBACK_FUNCTION | TIME_PERIODIC);
	memset(keys, 0, 256 * sizeof(bool_t));
	//joystick stuff...
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