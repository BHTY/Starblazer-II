	TITLE	src\star_win.c
	.386P
include listing.inc
if @Version gt 510
.model FLAT
else
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT DWORD USE32 PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT DWORD USE32 PUBLIC 'BSS'
_BSS	ENDS
$$SYMBOLS	SEGMENT BYTE USE32 'DEBSYM'
$$SYMBOLS	ENDS
$$TYPES	SEGMENT BYTE USE32 'DEBTYP'
$$TYPES	ENDS
_TLS	SEGMENT DWORD USE32 PUBLIC 'TLS'
_TLS	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_SG_platform
PUBLIC	_SG_title
PUBLIC	_newFrame
PUBLIC	_mouseDownLeft
PUBLIC	_mouseDownRight
PUBLIC	_PORT
PUBLIC	_OTHER_PORT
_DATA	SEGMENT
COMM	_frontbuffer:DWORD
COMM	_mplayer_addr:DWORD
COMM	_hwnd:DWORD
COMM	_bmi:DWORD
COMM	_backBitmap:DWORD
COMM	_hPalette:DWORD
COMM	_rectScreen:BYTE:010H
COMM	_window_height:DWORD
COMM	_window_width:DWORD
COMM	_mouseFactorX:DWORD
COMM	_mouseFactorY:DWORD
COMM	_keys:BYTE:0100H
COMM	_server_connection:DWORD
COMM	_server_addr:BYTE:010H
COMM	_size_response:DWORD
_SG_platform DD	FLAT:$SG19212
_SG_title DD	FLAT:$SG19214
_newFrame DD	00H
_mouseDownLeft DB 00H
	ORG $+3
_mouseDownRight DB 00H
	ORG $+3
_PORT	DD	0270fH
_OTHER_PORT DD	05ba0H
$SG19212 DB	'win32', 00H
	ORG $+2
$SG19214 DB	'Starblazer II for Windows 95/NT', 00H
_DATA	ENDS
PUBLIC	_SG_CloseConnection
PUBLIC	_WndProc@16
EXTRN	__imp__GetDC@4:NEAR
EXTRN	__imp__ReleaseDC@8:NEAR
EXTRN	__imp__GetWindowRect@8:NEAR
EXTRN	__imp__CreateCompatibleDC@4:NEAR
EXTRN	__imp__DeleteDC@4:NEAR
EXTRN	__imp__DeleteObject@4:NEAR
EXTRN	__imp__DefWindowProcA@16:NEAR
EXTRN	__imp__PostQuitMessage@4:NEAR
EXTRN	__imp__ClipCursor@4:NEAR
EXTRN	__imp__DestroyWindow@4:NEAR
EXTRN	__imp__SelectObject@8:NEAR
EXTRN	__imp__StretchBlt@44:NEAR
EXTRN	__fltused:NEAR
EXTRN	__imp__ExitProcess@4:NEAR
CONST	SEGMENT
$T19377	DQ	04074000000000000r		; 320
$T19378	DQ	04069000000000000r		; 200
CONST	ENDS
_TEXT	SEGMENT
; File src\star_win.c
_hWnd$ = 8
_msg$ = 12
_wParam$ = 16
_lParam$ = 20
_hdc$ = -8
_hdc_bmp$ = -4
_old_bmp$ = -12
_WndProc@16 PROC NEAR
; Line 42
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 47
	mov	eax, DWORD PTR _msg$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L19237
; Line 48
$L19241:
; Line 49
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 50
	call	_SG_CloseConnection
; Line 51
	jmp	$L19238
; Line 54
$L19242:
; Line 55
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DestroyWindow@4
; Line 56
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 57
	call	_SG_CloseConnection
; Line 58
	jmp	$L19238
; Line 61
$L19243:
; Line 62
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 63
	call	_SG_CloseConnection
; Line 64
	jmp	$L19238
; Line 67
$L19244:
; Line 68
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 1
; Line 69
	jmp	$L19238
; Line 72
$L19245:
; Line 73
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 0
; Line 74
	jmp	$L19238
; Line 77
$L19246:
; Line 78
	mov	eax, DWORD PTR _lParam$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _window_width, eax
; Line 79
	mov	eax, DWORD PTR _lParam$[ebp]
	shr	eax, 16					; 00000010H
	mov	DWORD PTR _window_height, eax
; Line 80
	fld	QWORD PTR $T19377
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -20+[ebp], eax
	fidiv	DWORD PTR -20+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 81
	fld	QWORD PTR $T19378
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -24+[ebp], eax
	fidiv	DWORD PTR -24+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 82
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 83
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 84
	jmp	$L19238
; Line 87
$L19247:
; Line 88
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdc$[ebp], eax
; Line 89
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _hdc_bmp$[ebp], eax
; Line 90
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
	mov	DWORD PTR _old_bmp$[ebp], eax
; Line 91
	push	13369376				; 00cc0020H
	push	200					; 000000c8H
	push	320					; 00000140H
	push	0
	push	0
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	mov	eax, DWORD PTR _window_height
	push	eax
	mov	eax, DWORD PTR _window_width
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__StretchBlt@44
; Line 92
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 93
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 94
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteObject@4
; Line 95
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__ReleaseDC@8
; Line 96
	jmp	$L19238
; Line 99
$L19248:
; Line 100
	mov	BYTE PTR _mouseDownLeft, 1
; Line 101
	jmp	$L19238
; Line 104
$L19249:
; Line 105
	mov	BYTE PTR _mouseDownLeft, 0
; Line 106
	jmp	$L19238
; Line 109
$L19250:
; Line 110
	mov	BYTE PTR _mouseDownRight, 1
; Line 111
	jmp	$L19238
; Line 114
$L19251:
; Line 115
	mov	BYTE PTR _mouseDownRight, 0
; Line 116
	jmp	$L19238
; Line 119
$L19252:
; Line 120
	mov	eax, DWORD PTR _lParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _wParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DefWindowProcA@16
	jmp	$L19233
; Line 122
	jmp	$L19238
$L19237:
	cmp	DWORD PTR -16+[ebp], 5
	ja	$L19374
	je	$L19246
	cmp	DWORD PTR -16+[ebp], 2
	je	$L19241
	jmp	$L19252
$L19374:
	cmp	DWORD PTR -16+[ebp], 256		; 00000100H
	ja	$L19375
	je	$L19244
	cmp	DWORD PTR -16+[ebp], 15			; 0000000fH
	je	$L19247
	cmp	DWORD PTR -16+[ebp], 16			; 00000010H
	je	$L19242
	cmp	DWORD PTR -16+[ebp], 18			; 00000012H
	je	$L19243
	jmp	$L19252
$L19375:
	cmp	DWORD PTR -16+[ebp], 513		; 00000201H
	ja	$L19376
	je	$L19248
	cmp	DWORD PTR -16+[ebp], 257		; 00000101H
	je	$L19245
	jmp	$L19252
$L19376:
	cmp	DWORD PTR -16+[ebp], 514		; 00000202H
	je	$L19249
	cmp	DWORD PTR -16+[ebp], 516		; 00000204H
	je	$L19250
	cmp	DWORD PTR -16+[ebp], 517		; 00000205H
	je	$L19251
	jmp	$L19252
$L19238:
; Line 123
$L19233:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	16					; 00000010H
_WndProc@16 ENDP
_TEXT	ENDS
PUBLIC	_mmproc@20
_TEXT	SEGMENT
_mmproc@20 PROC NEAR
; Line 125
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 126
	mov	DWORD PTR _newFrame, 1
; Line 127
$L19259:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	20					; 00000014H
_mmproc@20 ENDP
_TEXT	ENDS
PUBLIC	_init_networking
EXTRN	_exit:NEAR
EXTRN	_WSAStartup@8:NEAR
EXTRN	_WSAGetLastError@0:NEAR
EXTRN	_printf:NEAR
_DATA	SEGMENT
$SG19265 DB	'WSAStartup failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_winsock_version$ = -4
_winsock_data$ = -404
$T19380 = 8
_init_networking PROC NEAR
; Line 129
	push	ebp
	mov	ebp, esp
	sub	esp, 404				; 00000194H
	push	ebx
	push	esi
	push	edi
; Line 130
	mov	WORD PTR _winsock_version$[ebp], 514	; 00000202H
; Line 133
	lea	eax, DWORD PTR _winsock_data$[ebp]
	push	eax
	mov	eax, DWORD PTR _winsock_version$[ebp]
	push	eax
	call	_WSAStartup@8
	test	eax, eax
	je	$L19264
; Line 135
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19265
	call	_printf
	add	esp, 8
; Line 136
	push	0
	call	_exit
	add	esp, 4
; Line 139
$L19264:
	lea	esi, DWORD PTR _winsock_data$[ebp]
	mov	edi, DWORD PTR $T19380[ebp]
	mov	ecx, 100				; 00000064H
	rep	movsd
	mov	eax, DWORD PTR $T19380[ebp]
	jmp	$L19261
; Line 140
$L19261:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_networking ENDP
_TEXT	ENDS
PUBLIC	_SG_OpenConnection
EXTRN	_ioctlsocket@12:NEAR
EXTRN	_htons@4:NEAR
EXTRN	_socket@12:NEAR
_TEXT	SEGMENT
_iMode$ = -4
_SG_OpenConnection PROC NEAR
; Line 151
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 152
	mov	DWORD PTR _iMode$[ebp], 1
; Line 154
	mov	WORD PTR _server_addr, 2
; Line 155
	mov	eax, DWORD PTR _PORT
	push	eax
	call	_htons@4
	mov	WORD PTR _server_addr+2, ax
; Line 156
	mov	eax, DWORD PTR _mplayer_addr
	mov	DWORD PTR _server_addr+4, eax
; Line 158
	push	17					; 00000011H
	push	2
	push	2
	call	_socket@12
	mov	DWORD PTR _server_connection, eax
; Line 160
	cmp	DWORD PTR _server_connection, -1
	jne	$L19274
; Line 161
	xor	al, al
	jmp	$L19272
; Line 164
$L19274:
	lea	eax, DWORD PTR _iMode$[ebp]
	push	eax
	push	-2147195266				; 8004667eH
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_ioctlsocket@12
; Line 166
	mov	al, 1
	jmp	$L19272
; Line 167
$L19272:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_OpenConnection ENDP
_TEXT	ENDS
PUBLIC	_SG_RecievePacket
EXTRN	_recvfrom@24:NEAR
_TEXT	SEGMENT
_buf$ = 8
_num_bytes$ = 12
_return_value$ = -4
_SG_RecievePacket PROC NEAR
; Line 169
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 170
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_recvfrom@24
	mov	DWORD PTR _return_value$[ebp], eax
; Line 172
	cmp	DWORD PTR _return_value$[ebp], -1
	jne	$L19279
; Line 173
	xor	eax, eax
	jmp	$L19277
; Line 175
	jmp	$L19280
$L19279:
; Line 176
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L19277
; Line 177
$L19280:
; Line 178
$L19277:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_RecievePacket ENDP
_TEXT	ENDS
PUBLIC	_SG_SendPacket
EXTRN	_sendto@24:NEAR
_TEXT	SEGMENT
_buf$ = 8
_num_bytes$ = 12
_SG_SendPacket PROC NEAR
; Line 180
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 181
	push	16					; 00000010H
	push	OFFSET FLAT:_server_addr
	push	0
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_sendto@24
; Line 182
$L19283:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_SendPacket ENDP
_TEXT	ENDS
EXTRN	_closesocket@4:NEAR
_TEXT	SEGMENT
_SG_CloseConnection PROC NEAR
; Line 184
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 185
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_closesocket@4
; Line 186
$L19284:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_CloseConnection ENDP
_TEXT	ENDS
PUBLIC	_SG_TempLoadConfig
EXTRN	_inet_addr@4:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
_DATA	SEGMENT
	ORG $+2
$SG19296 DB	'r', 00H
	ORG $+2
$SG19297 DB	'config.ini', 00H
	ORG $+1
$SG19298 DB	'addr= %s', 0aH, 00H
	ORG $+2
$SG19299 DB	'port= %d', 0aH, 00H
	ORG $+2
$SG19300 DB	'name= %s', 0aH, 00H
	ORG $+2
$SG19301 DB	'pin= %s', 0aH, 00H
	ORG $+3
$SG19302 DB	'x= %d', 0aH, 00H
	ORG $+1
$SG19303 DB	'y= %d', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_addr$ = 8
_x$ = 12
_y$ = 16
_port$ = 20
_name$ = 28
_pin$ = 32
_taddr$ = -52
_fp$ = -56
_SG_TempLoadConfig PROC NEAR
; Line 188
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 191
	push	OFFSET FLAT:$SG19296
	push	OFFSET FLAT:$SG19297
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 192
	lea	eax, DWORD PTR _taddr$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19298
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 193
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19299
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 194
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19300
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 195
	mov	eax, DWORD PTR _pin$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19301
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 196
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19302
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 197
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19303
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 198
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 200
	lea	eax, DWORD PTR _taddr$[ebp]
	push	eax
	call	_inet_addr@4
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 201
$L19293:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_TempLoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_Init
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	_malloc:NEAR
EXTRN	__imp__AdjustWindowRect@12:NEAR
EXTRN	__imp__RegisterClassA@4:NEAR
EXTRN	__imp__CreateWindowExA@48:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	_memset:NEAR
EXTRN	__imp__CreateDIBSection@24:NEAR
EXTRN	__imp__LoadCursorA@8:NEAR
EXTRN	__imp__LoadIconA@8:NEAR
EXTRN	_SG_GameInit:NEAR
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_FBPTR:DWORD
EXTRN	__imp__GetModuleHandleA@4:NEAR
EXTRN	__imp__timeSetEvent@20:NEAR
EXTRN	__imp__timeBeginPeriod@4:NEAR
_TEXT	SEGMENT
_winRect$ = -56
_hdcScreen$ = -60
_wc$ = -40
$T19381 = -460
_SG_Init PROC NEAR
; Line 210
	push	ebp
	mov	ebp, esp
	sub	esp, 468				; 000001d4H
	push	ebx
	push	esi
	push	edi
; Line 216
	call	_SG_GameInit
; Line 218
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 30					; 0000001eH
	push	eax
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 14					; 0000000eH
	push	eax
	push	OFFSET FLAT:_OTHER_PORT
	push	OFFSET FLAT:_PORT
	push	OFFSET FLAT:_window_height
	push	OFFSET FLAT:_window_width
	push	OFFSET FLAT:_mplayer_addr
	call	_SG_TempLoadConfig
	add	esp, 28					; 0000001cH
; Line 220
	lea	eax, DWORD PTR $T19381[ebp]
	push	eax
	call	_init_networking
	add	esp, 4
; Line 225
	mov	DWORD PTR _winRect$[ebp], 0
; Line 226
	mov	DWORD PTR _winRect$[ebp+4], 0
; Line 227
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR _winRect$[ebp+12], eax
; Line 228
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR _winRect$[ebp+8], eax
; Line 230
	push	0
	push	13565952				; 00cf0000H
	lea	eax, DWORD PTR _winRect$[ebp]
	push	eax
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 232
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 234
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 235
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+4], 320			; 00000140H
; Line 236
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 237
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+12], 1
; Line 238
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+14], 8
; Line 239
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 240
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+16], 0
; Line 242
	push	0
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdcScreen$[ebp], eax
; Line 243
	push	0
	push	0
	push	OFFSET FLAT:_frontbuffer
	push	0
	mov	eax, DWORD PTR _bmi
	push	eax
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateDIBSection@24
	mov	DWORD PTR _backBitmap, eax
; Line 244
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	push	0
	call	DWORD PTR __imp__ReleaseDC@8
; Line 246
	mov	DWORD PTR _wc$[ebp], 0
; Line 247
	mov	DWORD PTR _wc$[ebp+4], OFFSET FLAT:_WndProc@16
; Line 248
	mov	DWORD PTR _wc$[ebp+8], 0
; Line 249
	mov	DWORD PTR _wc$[ebp+12], 0
; Line 250
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[ebp+16], eax
; Line 251
	push	101					; 00000065H
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[ebp+20], eax
; Line 252
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadCursorA@8
	mov	DWORD PTR _wc$[ebp+24], eax
; Line 253
	mov	DWORD PTR _wc$[ebp+28], 6
; Line 254
	mov	DWORD PTR _wc$[ebp+32], 0
; Line 255
	mov	eax, DWORD PTR _SG_title
	mov	DWORD PTR _wc$[ebp+36], eax
; Line 256
	lea	eax, DWORD PTR _wc$[ebp]
	push	eax
	call	DWORD PTR __imp__RegisterClassA@4
; Line 258
	push	0
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _winRect$[ebp+12]
	sub	eax, DWORD PTR _winRect$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _winRect$[ebp+8]
	sub	eax, DWORD PTR _winRect$[ebp]
	push	eax
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	13565952				; 00cf0000H
	mov	eax, DWORD PTR _SG_title
	push	eax
	mov	eax, DWORD PTR _SG_title
	push	eax
	push	0
	call	DWORD PTR __imp__CreateWindowExA@48
	mov	DWORD PTR _hwnd, eax
; Line 259
	push	5
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 260
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4
; Line 262
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 264
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 266
	fld	QWORD PTR $T19377
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -464+[ebp], eax
	fidiv	DWORD PTR -464+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 267
	fld	QWORD PTR $T19378
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -468+[ebp], eax
	fidiv	DWORD PTR -468+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 269
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 271
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 272
	push	1
	push	0
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	DWORD PTR __imp__timeSetEvent@20
; Line 273
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_keys
	call	_memset
	add	esp, 12					; 0000000cH
; Line 275
$L19306:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_Init ENDP
_TEXT	ENDS
PUBLIC	_SG_ReadMouse
EXTRN	__imp__GetCursorPos@4:NEAR
EXTRN	__imp__ScreenToClient@8:NEAR
EXTRN	__ftol:NEAR
_TEXT	SEGMENT
_mouse$ = 8
_p$ = -8
_SG_ReadMouse PROC NEAR
; Line 277
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 279
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 280
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ScreenToClient@8
; Line 281
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	fild	DWORD PTR -12+[ebp]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx], ax
; Line 282
	mov	eax, DWORD PTR _p$[ebp+4]
	mov	DWORD PTR -16+[ebp], eax
	fild	DWORD PTR -16+[ebp]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx+2], ax
; Line 283
	mov	al, BYTE PTR _mouseDownLeft
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 284
	mov	al, BYTE PTR _mouseDownRight
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 285
$L19311:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_ReadMouse ENDP
_TEXT	ENDS
PUBLIC	_SG_KeyDown
_TEXT	SEGMENT
_key$ = 8
_SG_KeyDown PROC NEAR
; Line 287
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 288
	xor	eax, eax
	mov	al, BYTE PTR _key$[ebp]
	mov	al, BYTE PTR _keys[eax]
	jmp	$L19314
; Line 289
$L19314:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_KeyDown ENDP
_TEXT	ENDS
PUBLIC	_SG_DrawFrame
EXTRN	__imp__InvalidateRect@12:NEAR
_TEXT	SEGMENT
_SG_DrawFrame PROC NEAR
; Line 291
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 292
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 293
$L19315:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_DrawFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_SetPaletteIndex
EXTRN	__imp__SetDIBColorTable@16:NEAR
_TEXT	SEGMENT
_index$ = 8
_r$ = 12
_g$ = 16
_b$ = 20
_col$ = -4
_willPalette$ = -8
_tempHDC$ = -12
_SG_SetPaletteIndex PROC NEAR
; Line 295
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 297
	mov	eax, DWORD PTR _bmi
	add	eax, 40					; 00000028H
	mov	DWORD PTR _willPalette$[ebp], eax
; Line 299
	push	0
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _tempHDC$[ebp], eax
; Line 300
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 301
	mov	al, BYTE PTR _r$[ebp]
	mov	BYTE PTR _col$[ebp+2], al
; Line 302
	mov	al, BYTE PTR _g$[ebp]
	mov	BYTE PTR _col$[ebp+1], al
; Line 303
	mov	al, BYTE PTR _b$[ebp]
	mov	BYTE PTR _col$[ebp], al
; Line 304
	mov	eax, DWORD PTR _col$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _index$[ebp]
	mov	edx, DWORD PTR _willPalette$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 305
	xor	eax, eax
	mov	al, BYTE PTR _index$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _willPalette$[ebp]
	push	eax
	push	1
	xor	eax, eax
	mov	al, BYTE PTR _index$[ebp]
	push	eax
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__SetDIBColorTable@16
; Line 306
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 307
$L19320:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_SetPaletteIndex ENDP
_TEXT	ENDS
PUBLIC	_SG_GetTicks
EXTRN	__imp__timeGetTime@0:NEAR
_TEXT	SEGMENT
_SG_GetTicks PROC NEAR
; Line 309
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 310
	call	DWORD PTR __imp__timeGetTime@0
	jmp	$L19324
; Line 311
$L19324:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_GetTicks ENDP
_TEXT	ENDS
PUBLIC	_SG_WaitBlank
EXTRN	__imp__TranslateMessage@4:NEAR
EXTRN	__imp__DispatchMessageA@4:NEAR
EXTRN	__imp__PeekMessageA@20:NEAR
_TEXT	SEGMENT
_Msg$ = -28
_SG_WaitBlank PROC NEAR
; Line 313
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 316
$L19328:
	cmp	DWORD PTR _newFrame, 0
	jne	$L19329
; Line 317
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	$L19330
; Line 318
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__TranslateMessage@4
; Line 319
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__DispatchMessageA@4
; Line 321
$L19330:
	jmp	$L19328
$L19329:
; Line 322
	mov	DWORD PTR _newFrame, 0
; Line 323
$L19325:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_WaitBlank ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_SG_Tick:NEAR
EXTRN	_SG_WelcomeMessage:NEAR
EXTRN	_SG_InitPalette:NEAR
EXTRN	_title_init:NEAR
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_main	PROC NEAR
; Line 325
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 326
	call	_SG_WelcomeMessage
; Line 327
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_SG_Init
	add	esp, 8
; Line 328
	call	_SG_InitPalette
; Line 329
	call	_title_init
; Line 331
$L19338:
; Line 332
	call	_SG_Tick
; Line 333
	jmp	$L19338
$L19339:
; Line 334
$L19334:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
