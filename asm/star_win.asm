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
;	COMDAT ??_C@_05PFD@win32?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _WndProc@16
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _initWaveHeader
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _initWave
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _init_networking
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _win_initialize_wave
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _sound_callback@20
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_OpenConnection
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_RecievePacket
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_SendPacket
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_CloseConnection
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_Init
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_ReadMouse
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_ReadStick
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_KeyDown
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_DrawFrame
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_SetPaletteIndex
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_GetTicks
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_WaitBlank
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_Sleep
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_ProcessEvents
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _main
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	??_C@_05PFD@win32?$AA@				; `string'
PUBLIC	_SG_title
PUBLIC	??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@ ; `string'
PUBLIC	_global_hWaveOut
PUBLIC	_mouseDownLeft
PUBLIC	_mouseDownRight
PUBLIC	_SG_platform
_DATA	SEGMENT
COMM	_server_connection:DWORD
COMM	_hwnd:DWORD
COMM	_server_addr:BYTE:010H
COMM	_globalHdc:DWORD
COMM	_size_response:DWORD
COMM	_waveHdrA:BYTE:020H
COMM	_bmi:DWORD
COMM	_backBitmap:DWORD
COMM	_waveHdrB:BYTE:020H
COMM	_hPalette:DWORD
COMM	_global_wave:BYTE:012H
COMM	_rectScreen:BYTE:010H
COMM	_hdc_bmp:DWORD
COMM	_mouseFactorX:DWORD
COMM	_mouseFactorY:DWORD
COMM	_keys:BYTE:0100H
COMM	_frontbuffer:DWORD
COMM	_mplayer_addr:DWORD
_DATA	ENDS
;	COMDAT ??_C@_05PFD@win32?$AA@
_DATA	SEGMENT
??_C@_05PFD@win32?$AA@ DB 'win32', 00H			; `string'
_DATA	ENDS
_DATA	SEGMENT
_SG_platform DD	FLAT:??_C@_05PFD@win32?$AA@
_DATA	ENDS
;	COMDAT ??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@
_DATA	SEGMENT
??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@ DB 'Starblazer II fo'
	DB	'r Windows 95', 00H				; `string'
_DATA	ENDS
_DATA	SEGMENT
_SG_title DD	FLAT:??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@
_mouseDownLeft DB 00H
	ORG $+3
_mouseDownRight DB 00H
	ORG $+3
_global_hWaveOut DD 00H
_DATA	ENDS
PUBLIC	_SG_CloseConnection
PUBLIC	_WndProc@16
EXTRN	__imp__ExitProcess@4:NEAR
EXTRN	__imp__SelectObject@8:NEAR
EXTRN	__imp__DefWindowProcA@16:NEAR
EXTRN	__imp__PostQuitMessage@4:NEAR
EXTRN	__imp__DestroyWindow@4:NEAR
EXTRN	__imp__DeleteObject@4:NEAR
EXTRN	__imp__ClipCursor@4:NEAR
EXTRN	__imp__StretchBlt@44:NEAR
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	__imp__BeginPaint@8:NEAR
EXTRN	__imp__EndPaint@8:NEAR
EXTRN	__fltused:NEAR
EXTRN	__imp__GetWindowRect@8:NEAR
CONST	SEGMENT
$T8559	DQ	04074000000000000r		; 320
$T8560	DQ	04069000000000000r		; 200
CONST	ENDS
;	COMDAT _WndProc@16
_TEXT	SEGMENT
; File src\star_win.c
_hWnd$ = 8
_msg$ = 12
_wParam$ = 16
_lParam$ = 20
_ps$ = -64
_WndProc@16 PROC NEAR					; COMDAT
; Line 54
	sub	esp, 64					; 00000040H
	push	ebx
	push	esi
	mov	esi, DWORD PTR _msg$[esp+68]
	push	edi
; Line 60
	cmp	esi, 5
	ja	SHORT $L8556
	je	$L8378
	cmp	esi, 2
	je	$L8373
	jmp	SHORT $L8384
$L8556:
	cmp	esi, 256				; 00000100H
	ja	SHORT $L8557
	je	$L8376
	cmp	esi, 15					; 0000000fH
	je	$L8379
	cmp	esi, 16					; 00000010H
	je	$L8374
	cmp	esi, 18					; 00000012H
	je	$L8375
	jmp	SHORT $L8384
$L8557:
	cmp	esi, 513				; 00000201H
	ja	SHORT $L8558
	je	$L8380
	cmp	esi, 257				; 00000101H
	je	$L8377
	jmp	SHORT $L8384
$L8558:
	cmp	esi, 514				; 00000202H
	je	$L8381
	cmp	esi, 516				; 00000204H
	je	$L8382
	cmp	esi, 517				; 00000205H
	je	$L8383
; Line 130
$L8384:
; Line 131
	mov	eax, DWORD PTR _lParam$[esp+72]
	mov	ecx, DWORD PTR _wParam$[esp+72]
	mov	edx, DWORD PTR _hWnd$[esp+72]
	push	eax
	push	ecx
	push	esi
	push	edx
	call	DWORD PTR __imp__DefWindowProcA@16
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 61
$L8373:
; Line 62
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 63
	call	_SG_CloseConnection
; Line 64
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 91
$L8378:
; Line 92
	fld	QWORD PTR $T8559
	mov	eax, DWORD PTR _lParam$[esp+72]
	xor	ecx, ecx
	mov	WORD PTR _GAME_SETTINGS, ax
; Line 93
	shr	eax, 16					; 00000010H
	mov	cx, WORD PTR _GAME_SETTINGS
	mov	edx, eax
	mov	WORD PTR _GAME_SETTINGS+2, ax
	and	edx, 65535				; 0000ffffH
; Line 94
	mov	DWORD PTR -64+[esp+76], ecx
	push	OFFSET FLAT:_rectScreen
	fidiv	DWORD PTR -64+[esp+80]
	mov	eax, DWORD PTR _hwnd
	mov	DWORD PTR -64+[esp+80], edx
	push	eax
	fstp	DWORD PTR _mouseFactorX
; Line 95
	fld	QWORD PTR $T8560
	fidiv	DWORD PTR -64+[esp+84]
	fstp	DWORD PTR _mouseFactorY
; Line 96
	call	DWORD PTR __imp__GetWindowRect@8
; Line 97
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 98
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 101
$L8379:
; Line 102
	lea	eax, DWORD PTR _ps$[esp+76]
	mov	ecx, DWORD PTR _hwnd
	push	eax
	push	ecx
	call	DWORD PTR __imp__BeginPaint@8
	mov	edi, eax
	mov	ecx, DWORD PTR _hdc_bmp
; Line 103
	mov	eax, DWORD PTR _backBitmap
	push	eax
	push	ecx
	call	DWORD PTR __imp__SelectObject@8
	mov	ebx, eax
	push	13369376				; 00cc0020H
; Line 104
	push	200					; 000000c8H
	mov	eax, DWORD PTR _hdc_bmp
	push	320					; 00000140H
	xor	ecx, ecx
	mov	cx, WORD PTR _GAME_SETTINGS+2
	push	0
	push	0
	xor	edx, edx
	mov	dx, WORD PTR _GAME_SETTINGS
	push	eax
	push	ecx
	push	edx
	push	0
	push	0
	push	edi
	call	DWORD PTR __imp__StretchBlt@44
; Line 105
	push	ebx
	call	DWORD PTR __imp__DeleteObject@4
; Line 106
	lea	ecx, DWORD PTR _ps$[esp+76]
	mov	eax, DWORD PTR _hwnd
	push	ecx
	push	eax
	call	DWORD PTR __imp__EndPaint@8
; Line 107
	mov	ecx, DWORD PTR _lParam$[esp+72]
	mov	eax, DWORD PTR _wParam$[esp+72]
	mov	edx, DWORD PTR _hWnd$[esp+72]
	push	ecx
	push	eax
	push	esi
	push	edx
	call	DWORD PTR __imp__DefWindowProcA@16
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 67
$L8374:
; Line 68
	mov	eax, DWORD PTR _hWnd$[esp+72]
	push	eax
	call	DWORD PTR __imp__DestroyWindow@4
; Line 69
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 70
	call	_SG_CloseConnection
; Line 71
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 74
$L8375:
; Line 75
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 76
	call	_SG_CloseConnection
; Line 77
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 80
$L8376:
; Line 81
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[esp+72]
	pop	edi
	pop	esi
	pop	ebx
	mov	BYTE PTR _keys[eax], 1
; Line 83
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 86
$L8377:
; Line 87
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[esp+72]
	pop	edi
	pop	esi
	pop	ebx
	mov	BYTE PTR _keys[eax], 0
; Line 88
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 110
$L8380:
; Line 111
	mov	BYTE PTR _mouseDownLeft, 1
; Line 112
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 115
$L8381:
; Line 116
	mov	BYTE PTR _mouseDownLeft, 0
; Line 117
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 120
$L8382:
; Line 121
	mov	BYTE PTR _mouseDownRight, 1
; Line 122
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
; Line 125
$L8383:
; Line 126
	mov	BYTE PTR _mouseDownRight, 0
; Line 134
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 64					; 00000040H
	ret	16					; 00000010H
_WndProc@16 ENDP
_TEXT	ENDS
PUBLIC	_initWaveHeader
;	COMDAT _initWaveHeader
_TEXT	SEGMENT
_wvHdr$ = 8
_lpData$ = 12
_dwBufferLength$ = 16
_dwBytesRecorded$ = 20
_dwUser$ = 24
_dwFlags$ = 28
_dwLoops$ = 32
_initWaveHeader PROC NEAR				; COMDAT
; Line 137
	mov	eax, DWORD PTR _lpData$[esp-4]
	mov	ecx, DWORD PTR _wvHdr$[esp-4]
	mov	edx, DWORD PTR _dwBufferLength$[esp-4]
	mov	DWORD PTR [ecx], eax
; Line 138
	mov	eax, DWORD PTR _dwBytesRecorded$[esp-4]
	mov	DWORD PTR [ecx+4], edx
; Line 139
	mov	edx, DWORD PTR _dwUser$[esp-4]
	mov	DWORD PTR [ecx+8], eax
; Line 140
	mov	eax, DWORD PTR _dwFlags$[esp-4]
	mov	DWORD PTR [ecx+12], edx
; Line 141
	mov	edx, DWORD PTR _dwLoops$[esp-4]
	mov	DWORD PTR [ecx+16], eax
; Line 142
	mov	DWORD PTR [ecx+20], edx
; Line 143
	ret	0
_initWaveHeader ENDP
_TEXT	ENDS
PUBLIC	_initWave
;	COMDAT _initWave
_TEXT	SEGMENT
_wave$ = 8
_wFormatTag$ = 12
_nChannels$ = 16
_nSamplesPerSec$ = 20
_nAvgBytesPerSec$ = 24
_nBlockAlign$ = 28
_wBitsPerSample$ = 32
_cbSize$ = 36
_initWave PROC NEAR					; COMDAT
; Line 146
	mov	ax, WORD PTR _wFormatTag$[esp-4]
	mov	ecx, DWORD PTR _wave$[esp-4]
	mov	dx, WORD PTR _nChannels$[esp-4]
	mov	WORD PTR [ecx], ax
; Line 147
	mov	eax, DWORD PTR _nSamplesPerSec$[esp-4]
	mov	WORD PTR [ecx+2], dx
	mov	DWORD PTR [ecx+4], eax
; Line 149
	mov	ax, WORD PTR _nBlockAlign$[esp-4]
	mov	edx, DWORD PTR _nAvgBytesPerSec$[esp-4]
	mov	WORD PTR [ecx+12], ax
	mov	DWORD PTR [ecx+8], edx
; Line 151
	mov	dx, WORD PTR _wBitsPerSample$[esp-4]
	mov	ax, WORD PTR _cbSize$[esp-4]
	mov	WORD PTR [ecx+14], dx
; Line 152
	mov	WORD PTR [ecx+16], ax
; Line 153
	ret	0
_initWave ENDP
_TEXT	ENDS
PUBLIC	_init_networking
PUBLIC	??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@	; `string'
EXTRN	_printf:NEAR
EXTRN	_WSAStartup@8:NEAR
EXTRN	_WSAGetLastError@0:NEAR
;	COMDAT ??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@
_DATA	SEGMENT
??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@ DB 'WSAStartup failed: %d', 00H ; `string'
_DATA	ENDS
;	COMDAT _init_networking
_TEXT	SEGMENT
_winsock_data$ = -400
$T8568 = 8
_init_networking PROC NEAR				; COMDAT
; Line 155
	sub	esp, 400				; 00000190H
	lea	eax, DWORD PTR _winsock_data$[esp+400]
	push	esi
	push	edi
; Line 159
	push	eax
	push	514					; 00000202H
	call	_WSAStartup@8
	test	eax, eax
	je	SHORT $L8408
; Line 161
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@ ; `string'
	call	_printf
	add	esp, 8
; Line 164
$L8408:
	lea	esi, DWORD PTR _winsock_data$[esp+408]
	mov	eax, DWORD PTR $T8568[esp+404]
	mov	edi, eax
	mov	ecx, 100				; 00000064H
	rep	movsd
; Line 165
	pop	edi
	pop	esi
	add	esp, 400				; 00000190H
	ret	0
_init_networking ENDP
_TEXT	ENDS
PUBLIC	_win_initialize_wave
EXTRN	_waveOutPrepareHeader@12:NEAR
EXTRN	_waveOutUnprepareHeader@12:NEAR
EXTRN	_waveOutWrite@12:NEAR
;	COMDAT _win_initialize_wave
_TEXT	SEGMENT
_wvHdr$ = 8
_buf$ = 12
_win_initialize_wave PROC NEAR				; COMDAT
; Line 176
	push	esi
	mov	eax, DWORD PTR _GAME_SETTINGS+72
; Line 178
	mov	ecx, DWORD PTR _buf$[esp]
	push	0
	mov	esi, DWORD PTR _wvHdr$[esp+4]
	push	0
	push	0
	push	0
	push	eax
	push	ecx
	push	esi
	call	_initWaveHeader
	add	esp, 28					; 0000001cH
	mov	ecx, DWORD PTR _global_hWaveOut
; Line 179
	push	32					; 00000020H
	push	esi
	push	ecx
	call	_waveOutPrepareHeader@12
; Line 180
	push	32					; 00000020H
	mov	eax, DWORD PTR _global_hWaveOut
	push	esi
	push	eax
	call	_waveOutWrite@12
; Line 181
	push	32					; 00000020H
	mov	eax, DWORD PTR _global_hWaveOut
	push	esi
	push	eax
	call	_waveOutUnprepareHeader@12
; Line 182
	pop	esi
	ret	0
_win_initialize_wave ENDP
_TEXT	ENDS
PUBLIC	_sound_callback@20
EXTRN	_mix:NEAR
EXTRN	_buffer1:DWORD
EXTRN	_buffer2:DWORD
EXTRN	_current_buffer:DWORD
;	COMDAT _sound_callback@20
_TEXT	SEGMENT
_msg$ = 12
_sound_callback@20 PROC NEAR				; COMDAT
; Line 185
	cmp	DWORD PTR _msg$[esp-4], 955		; 000003bbH
	je	SHORT $L8427
; Line 189
	cmp	DWORD PTR _current_buffer, 0
	jne	SHORT $L8429
; Line 190
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
	jmp	SHORT $L8573
; Line 191
$L8429:
; Line 192
	mov	eax, DWORD PTR _buffer2
	push	eax
	push	OFFSET FLAT:_waveHdrB
$L8573:
	call	_win_initialize_wave
	add	esp, 8
; Line 195
	call	_mix
; Line 196
	cmp	DWORD PTR _current_buffer, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _current_buffer, eax
; Line 198
$L8427:
	ret	20					; 00000014H
_sound_callback@20 ENDP
_TEXT	ENDS
PUBLIC	_SG_OpenConnection
EXTRN	_ioctlsocket@12:NEAR
EXTRN	_socket@12:NEAR
EXTRN	_htons@4:NEAR
;	COMDAT _SG_OpenConnection
_TEXT	SEGMENT
_iMode$ = -4
_SG_OpenConnection PROC NEAR				; COMDAT
; Line 202
	mov	ax, WORD PTR _GAME_SETTINGS+8
	sub	esp, 4
; Line 203
	mov	WORD PTR _server_addr, 2
	mov	DWORD PTR _iMode$[esp+4], 1
; Line 206
	push	eax
	call	_htons@4
	mov	WORD PTR _server_addr+2, ax
	push	17					; 00000011H
; Line 207
	mov	eax, DWORD PTR _mplayer_addr
	push	2
	push	2
	mov	DWORD PTR _server_addr+4, eax
; Line 209
	call	_socket@12
	mov	DWORD PTR _server_connection, eax
	cmp	eax, -1
; Line 211
	jne	SHORT $L8434
; Line 212
	xor	al, al
	add	esp, 4
	ret	0
; Line 215
$L8434:
	lea	ecx, DWORD PTR _iMode$[esp+4]
	mov	DWORD PTR _server_connection, eax
	push	ecx
	push	-2147195266				; 8004667eH
	push	eax
	call	_ioctlsocket@12
; Line 217
	mov	al, 1
	add	esp, 4
; Line 218
	ret	0
_SG_OpenConnection ENDP
_TEXT	ENDS
PUBLIC	_SG_RecievePacket
EXTRN	_recvfrom@24:NEAR
;	COMDAT _SG_RecievePacket
_TEXT	SEGMENT
_buf$ = 8
_num_bytes$ = 12
_SG_RecievePacket PROC NEAR				; COMDAT
; Line 221
	mov	eax, DWORD PTR _num_bytes$[esp-4]
	push	0
	mov	ecx, DWORD PTR _buf$[esp]
	push	0
	push	0
	mov	edx, DWORD PTR _server_connection
	push	eax
	push	ecx
	push	edx
	call	_recvfrom@24
; Line 223
	lea	ecx, DWORD PTR [eax+1]
	cmp	ecx, 1
	mov	ecx, 0
	adc	ecx, -1
	and	ecx, eax
	mov	eax, ecx
; Line 229
	ret	0
_SG_RecievePacket ENDP
_TEXT	ENDS
PUBLIC	_SG_SendPacket
EXTRN	_sendto@24:NEAR
;	COMDAT _SG_SendPacket
_TEXT	SEGMENT
_buf$ = 8
_num_bytes$ = 12
_SG_SendPacket PROC NEAR				; COMDAT
; Line 232
	mov	eax, DWORD PTR _num_bytes$[esp-4]
	push	16					; 00000010H
	mov	ecx, DWORD PTR _buf$[esp]
	push	OFFSET FLAT:_server_addr
	push	0
	mov	edx, DWORD PTR _server_connection
	push	eax
	push	ecx
	push	edx
	call	_sendto@24
; Line 233
	ret	0
_SG_SendPacket ENDP
_TEXT	ENDS
EXTRN	_closesocket@4:NEAR
;	COMDAT _SG_CloseConnection
_TEXT	SEGMENT
_SG_CloseConnection PROC NEAR				; COMDAT
; Line 236
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_closesocket@4
; Line 237
	ret	0
_SG_CloseConnection ENDP
_TEXT	ENDS
PUBLIC	??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ ; `string'
PUBLIC	_SG_Init
EXTRN	_waveOutGetNumDevs@0:NEAR
EXTRN	__imp__CreateWindowExA@48:NEAR
EXTRN	_malloc:NEAR
EXTRN	_init_sound:NEAR
EXTRN	__imp__LoadIconA@8:NEAR
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	__imp__CreateDIBSection@24:NEAR
EXTRN	__imp__GetVersion@0:NEAR
EXTRN	__imp__CreateSolidBrush@4:NEAR
EXTRN	__imp__GetDC@4:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	_SG_GameInit:NEAR
EXTRN	_waveOutOpen@24:NEAR
EXTRN	__imp__ReleaseDC@8:NEAR
EXTRN	_FBPTR:DWORD
EXTRN	__imp__RegisterClassA@4:NEAR
EXTRN	__imp__GetModuleHandleA@4:NEAR
EXTRN	_timeBeginPeriod@4:NEAR
EXTRN	__imp__AdjustWindowRect@12:NEAR
EXTRN	__imp__LoadCursorA@8:NEAR
EXTRN	__imp__CreateCompatibleDC@4:NEAR
;	COMDAT ??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@
_DATA	SEGMENT
??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ DB 'Running o'
	DB	'n Windows version %d.%02d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT _SG_Init
_TEXT	SEGMENT
_winRect$ = -456
_wc$ = -440
$T8584 = -400
_SG_Init PROC NEAR					; COMDAT
; Line 247
	sub	esp, 456				; 000001c8H
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 252
	call	DWORD PTR __imp__GetVersion@0
	mov	ebx, eax
	push	255					; 000000ffH
; Line 253
	call	DWORD PTR __imp__CreateSolidBrush@4
	mov	esi, eax
; Line 255
	mov	al, bh
	and	eax, 255				; 000000ffH
	and	ebx, 255				; 000000ffH
	push	eax
	push	ebx
	push	OFFSET FLAT:??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ ; `string'
	call	_printf
	add	esp, 12					; 0000000cH
	xor	ebx, ebx
; Line 258
	call	_SG_GameInit
; Line 260
	lea	eax, DWORD PTR $T8584[esp+472]
	push	eax
	call	_init_networking
	mov	DWORD PTR _winRect$[esp+476], ebx
	mov	DWORD PTR _winRect$[esp+480], ebx
	add	esp, 4
	xor	eax, eax
; Line 264
	mov	ax, WORD PTR _GAME_SETTINGS+2
	xor	ecx, ecx
	mov	cx, WORD PTR _GAME_SETTINGS
	push	ebx
	lea	edx, DWORD PTR _winRect$[esp+476]
	push	13565952				; 00cf0000H
	mov	DWORD PTR _winRect$[esp+492], eax
	push	edx
; Line 265
	mov	DWORD PTR _winRect$[esp+492], ecx
; Line 267
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 269
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 271
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 272
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+4], 320			; 00000140H
; Line 273
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 274
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+12], 1
; Line 275
	mov	eax, DWORD PTR _bmi
	push	ebx
	mov	WORD PTR [eax+14], 8
; Line 276
	mov	eax, DWORD PTR _bmi
	mov	ebp, DWORD PTR __imp__GetDC@4
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 277
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+16], ebx
; Line 279
	call	ebp
	mov	edi, eax
	push	ebx
; Line 280
	push	ebx
	push	OFFSET FLAT:_frontbuffer
	push	ebx
	mov	eax, DWORD PTR _bmi
	push	eax
	push	edi
	call	DWORD PTR __imp__CreateDIBSection@24
	push	edi
	mov	DWORD PTR _backBitmap, eax
; Line 281
	push	ebx
	call	DWORD PTR __imp__ReleaseDC@8
; Line 283
	mov	DWORD PTR _wc$[esp+472], ebx
	push	ebx
; Line 284
	mov	edi, DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[esp+484], ebx
	mov	DWORD PTR _wc$[esp+480], OFFSET FLAT:_WndProc@16
; Line 286
	mov	DWORD PTR _wc$[esp+488], ebx
; Line 287
	call	edi
	mov	DWORD PTR _wc$[esp+488], eax
	push	1
; Line 288
	push	ebx
	call	edi
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[esp+492], eax
	push	32512					; 00007f00H
; Line 289
	push	ebx
	call	DWORD PTR __imp__LoadCursorA@8
	lea	ecx, DWORD PTR _wc$[esp+472]
	mov	DWORD PTR _wc$[esp+496], eax
; Line 290
	mov	eax, DWORD PTR _SG_title
	push	ecx
	mov	DWORD PTR _wc$[esp+508], ebx
	mov	DWORD PTR _wc$[esp+512], eax
	mov	DWORD PTR _wc$[esp+504], 6
; Line 293
	call	DWORD PTR __imp__RegisterClassA@4
; Line 295
	push	ebx
	push	ebx
	call	edi
	push	eax
	push	ebx
	mov	eax, DWORD PTR _winRect$[esp+496]
	push	ebx
	sub	eax, DWORD PTR _winRect$[esp+492]
	push	eax
	mov	ecx, DWORD PTR _SG_title
	mov	eax, DWORD PTR _winRect$[esp+500]
	sub	eax, DWORD PTR _winRect$[esp+492]
	push	eax
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	13565952				; 00cf0000H
	push	ecx
	push	ecx
	push	ebx
	call	DWORD PTR __imp__CreateWindowExA@48
	push	5
	mov	DWORD PTR _hwnd, eax
; Line 296
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 297
	mov	ecx, DWORD PTR _hwnd
	push	ecx
	call	DWORD PTR __imp__UpdateWindow@4
; Line 299
	push	OFFSET FLAT:_rectScreen
	mov	ecx, DWORD PTR _hwnd
	push	ecx
	call	DWORD PTR __imp__GetWindowRect@8
; Line 301
	push	1
	call	_timeBeginPeriod@4
; Line 303
	fld	QWORD PTR $T8559
	xor	ecx, ecx
	xor	eax, eax
	mov	cx, WORD PTR _GAME_SETTINGS
	mov	ax, WORD PTR _GAME_SETTINGS+2
	mov	DWORD PTR -400+[esp+472], ecx
	fidiv	DWORD PTR -400+[esp+472]
	mov	DWORD PTR -400+[esp+472], eax
	push	OFFSET FLAT:_rectScreen
	fstp	DWORD PTR _mouseFactorX
; Line 304
	fld	QWORD PTR $T8560
	fidiv	DWORD PTR -400+[esp+476]
	mov	edi, OFFSET FLAT:_keys
	fstp	DWORD PTR _mouseFactorY
; Line 306
	call	DWORD PTR __imp__ClipCursor@4
; Line 308
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	ecx, 64					; 00000040H
	mov	DWORD PTR _FBPTR, eax
; Line 309
	xor	eax, eax
	rep	stosd
; Line 314
	call	_init_sound
; Line 316
	cmp	DWORD PTR _GAME_SETTINGS+68, ebx
	je	SHORT $L8456
; Line 317
	call	_waveOutGetNumDevs@0
	mov	edi, eax
	push	ebx
; Line 319
	push	8
	push	1
	push	22050					; 00005622H
	push	22050					; 00005622H
	push	1
	push	1
	push	OFFSET FLAT:_global_wave
	call	_initWave
	add	esp, 32					; 00000020H
; Line 321
	test	edi, edi
	je	SHORT $L8457
; Line 323
$L8459:
	push	196608					; 00030000H
	push	0
	push	OFFSET FLAT:_sound_callback@20
	push	OFFSET FLAT:_global_wave
	push	-1
	push	OFFSET FLAT:_global_hWaveOut
	call	_waveOutOpen@24
	test	eax, eax
	jne	SHORT $L8459
; Line 326
$L8457:
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
	call	_win_initialize_wave
	add	esp, 8
	mov	eax, DWORD PTR _buffer2
; Line 327
	push	eax
	push	OFFSET FLAT:_waveHdrB
	call	_win_initialize_wave
	add	esp, 8
; Line 330
$L8456:
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	ebp
	push	esi
	mov	DWORD PTR _globalHdc, eax
; Line 331
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 332
	mov	ecx, DWORD PTR _globalHdc
	push	ecx
	call	DWORD PTR __imp__CreateCompatibleDC@4
	pop	ebp
	mov	DWORD PTR _hdc_bmp, eax
; Line 333
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 456				; 000001c8H
	ret	0
_SG_Init ENDP
_TEXT	ENDS
PUBLIC	_SG_ReadMouse
EXTRN	__ftol:NEAR
EXTRN	__imp__GetCursorPos@4:NEAR
EXTRN	__imp__ScreenToClient@8:NEAR
;	COMDAT _SG_ReadMouse
_TEXT	SEGMENT
_mouse$ = 8
_p$ = -8
_SG_ReadMouse PROC NEAR					; COMDAT
; Line 335
	sub	esp, 12					; 0000000cH
	lea	eax, DWORD PTR _p$[esp+12]
	push	esi
; Line 337
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 338
	lea	ecx, DWORD PTR _p$[esp+16]
	mov	eax, DWORD PTR _hwnd
	push	ecx
	push	eax
	call	DWORD PTR __imp__ScreenToClient@8
; Line 339
	fild	DWORD PTR _p$[esp+16]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	esi, DWORD PTR _mouse$[esp+12]
	mov	WORD PTR [esi], ax
; Line 340
	mov	eax, DWORD PTR _p$[esp+20]
	mov	DWORD PTR -8+[esp+16], eax
	fild	DWORD PTR -8+[esp+16]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	WORD PTR [esi+2], ax
; Line 341
	mov	al, BYTE PTR _mouseDownLeft
	mov	BYTE PTR [esi+4], al
; Line 342
	mov	cl, BYTE PTR _mouseDownRight
	mov	BYTE PTR [esi+5], cl
; Line 343
	pop	esi
	add	esp, 12					; 0000000cH
	ret	0
_SG_ReadMouse ENDP
_TEXT	ENDS
PUBLIC	_SG_ReadStick
;	COMDAT _SG_ReadStick
_TEXT	SEGMENT
_SG_ReadStick PROC NEAR					; COMDAT
; Line 347
	ret	0
_SG_ReadStick ENDP
_TEXT	ENDS
PUBLIC	_SG_KeyDown
;	COMDAT _SG_KeyDown
_TEXT	SEGMENT
_key$ = 8
_SG_KeyDown PROC NEAR					; COMDAT
; Line 350
	xor	eax, eax
	mov	al, BYTE PTR _key$[esp-4]
	mov	al, BYTE PTR _keys[eax]
; Line 351
	ret	0
_SG_KeyDown ENDP
_TEXT	ENDS
PUBLIC	_SG_DrawFrame
EXTRN	__imp__InvalidateRect@12:NEAR
;	COMDAT _SG_DrawFrame
_TEXT	SEGMENT
_SG_DrawFrame PROC NEAR					; COMDAT
; Line 354
	push	0
	mov	eax, DWORD PTR _hwnd
	push	0
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 355
	ret	0
_SG_DrawFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_SetPaletteIndex
EXTRN	__imp__SetDIBColorTable@16:NEAR
EXTRN	__imp__DeleteDC@4:NEAR
;	COMDAT _SG_SetPaletteIndex
_TEXT	SEGMENT
_index$ = 8
_r$ = 12
_g$ = 16
_b$ = 20
_col$ = -4
_SG_SetPaletteIndex PROC NEAR				; COMDAT
; Line 357
	sub	esp, 4
	push	esi
	push	edi
; Line 359
	mov	edi, DWORD PTR _bmi
	push	0
; Line 361
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	esi, eax
; Line 362
	mov	eax, DWORD PTR _backBitmap
	push	eax
	push	esi
	call	DWORD PTR __imp__SelectObject@8
; Line 363
	mov	cl, BYTE PTR _r$[esp+8]
	mov	dl, BYTE PTR _g$[esp+8]
	mov	al, BYTE PTR _b$[esp+8]
	mov	BYTE PTR _col$[esp+14], cl
; Line 364
	mov	BYTE PTR _col$[esp+13], dl
	mov	BYTE PTR _col$[esp+12], al
; Line 365
	xor	edx, edx
	mov	ecx, DWORD PTR _col$[esp+12]
	mov	dl, BYTE PTR _index$[esp+8]
	lea	eax, DWORD PTR [edi+edx*4+40]
; Line 366
	push	eax
	push	1
	push	edx
	mov	DWORD PTR [eax], ecx
; Line 367
	push	esi
	call	DWORD PTR __imp__SetDIBColorTable@16
; Line 368
	push	esi
	call	DWORD PTR __imp__DeleteDC@4
; Line 369
	pop	edi
	pop	esi
	add	esp, 4
	ret	0
_SG_SetPaletteIndex ENDP
_TEXT	ENDS
PUBLIC	_SG_GetTicks
EXTRN	_timeGetTime@0:NEAR
;	COMDAT _SG_GetTicks
_TEXT	SEGMENT
_SG_GetTicks PROC NEAR					; COMDAT
; Line 383
	jmp	_timeGetTime@0
_SG_GetTicks ENDP
_TEXT	ENDS
PUBLIC	_SG_WaitBlank
;	COMDAT _SG_WaitBlank
_TEXT	SEGMENT
_SG_WaitBlank PROC NEAR					; COMDAT
; Line 387
	ret	0
_SG_WaitBlank ENDP
_TEXT	ENDS
PUBLIC	_SG_Sleep
EXTRN	__imp__Sleep@4:NEAR
;	COMDAT _SG_Sleep
_TEXT	SEGMENT
_ms$ = 8
_SG_Sleep PROC NEAR					; COMDAT
; Line 390
	mov	eax, DWORD PTR _ms$[esp-4]
	push	eax
	call	DWORD PTR __imp__Sleep@4
; Line 391
	ret	0
_SG_Sleep ENDP
_TEXT	ENDS
PUBLIC	_SG_ProcessEvents
EXTRN	__imp__TranslateMessage@4:NEAR
EXTRN	__imp__DispatchMessageA@4:NEAR
EXTRN	__imp__PeekMessageA@20:NEAR
;	COMDAT _SG_ProcessEvents
_TEXT	SEGMENT
_Msg$ = -28
_SG_ProcessEvents PROC NEAR				; COMDAT
; Line 393
	sub	esp, 28					; 0000001cH
	mov	eax, DWORD PTR _hwnd
	push	ebx
	push	esi
	lea	ecx, DWORD PTR _Msg$[esp+36]
	push	edi
; Line 396
	push	1
	mov	esi, DWORD PTR __imp__PeekMessageA@20
	push	0
	push	0
	push	eax
	push	ecx
	call	esi
	test	eax, eax
	je	SHORT $L8481
	mov	edi, DWORD PTR __imp__TranslateMessage@4
	mov	ebx, DWORD PTR __imp__DispatchMessageA@4
$L8484:
; Line 397
	lea	eax, DWORD PTR _Msg$[esp+40]
	push	eax
	call	edi
; Line 398
	lea	eax, DWORD PTR _Msg$[esp+40]
	push	eax
	call	ebx
; Line 399
	push	1
	mov	eax, DWORD PTR _hwnd
	lea	ecx, DWORD PTR _Msg$[esp+44]
	push	0
	push	0
	push	eax
	push	ecx
	call	esi
	test	eax, eax
	jne	SHORT $L8484
; Line 400
$L8481:
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 28					; 0000001cH
	ret	0
_SG_ProcessEvents ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_SG_Tick:NEAR
EXTRN	_SG_WelcomeMessage:NEAR
EXTRN	_SG_InitPalette:NEAR
EXTRN	_title_init:NEAR
;	COMDAT _main
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_main	PROC NEAR					; COMDAT
; Line 403
	call	_SG_WelcomeMessage
; Line 404
	mov	eax, DWORD PTR _argv$[esp-4]
	mov	ecx, DWORD PTR _argc$[esp-4]
	push	eax
	push	ecx
	call	_SG_Init
	add	esp, 8
; Line 405
	call	_SG_InitPalette
; Line 406
	call	_title_init
; Line 408
$L8493:
; Line 409
	call	_SG_Tick
; Line 410
	jmp	SHORT $L8493
_main	ENDP
_TEXT	ENDS
END
