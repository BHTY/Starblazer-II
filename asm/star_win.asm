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
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@BGHG@config?4ini?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09HALA@name?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0O@GFPA@framecap?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _WndProc@16
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mmproc@20
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mmproc_2@20
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
;	COMDAT _SG_TempLoadConfig
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_Init
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_ReadMouse
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
PUBLIC	_newFrame
PUBLIC	_mouseDownLeft
PUBLIC	_mouseDownRight
PUBLIC	_SG_platform
PUBLIC	_PORT
PUBLIC	_OTHER_PORT
PUBLIC	_global_hWaveOut
_DATA	SEGMENT
COMM	_hwnd:DWORD
COMM	_globalHdc:DWORD
COMM	_bmi:DWORD
COMM	_backBitmap:DWORD
COMM	_hPalette:DWORD
COMM	_rectScreen:BYTE:010H
COMM	_hdc_bmp:DWORD
COMM	_window_height:DWORD
COMM	_window_width:DWORD
COMM	_mouseFactorX:DWORD
COMM	_mouseFactorY:DWORD
COMM	_keys:BYTE:0100H
COMM	_frontbuffer:DWORD
COMM	_mplayer_addr:DWORD
COMM	_server_connection:DWORD
COMM	_server_addr:BYTE:010H
COMM	_size_response:DWORD
COMM	_waveHdrA:BYTE:020H
COMM	_waveHdrB:BYTE:020H
COMM	_global_wave:BYTE:012H
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
_newFrame DD	00H
_mouseDownLeft DB 00H
	ORG $+3
_mouseDownRight DB 00H
	ORG $+3
_PORT	DD	0270fH
_OTHER_PORT DD	05ba0H
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
EXTRN	__imp__GetWindowRect@8:NEAR
EXTRN	__fltused:NEAR
CONST	SEGMENT
$T8627	DQ	04074000000000000r		; 320
$T8628	DQ	04069000000000000r		; 200
CONST	ENDS
;	COMDAT _WndProc@16
_TEXT	SEGMENT
; File src\star_win.c
_hWnd$ = 8
_msg$ = 12
_wParam$ = 16
_lParam$ = 20
_WndProc@16 PROC NEAR					; COMDAT
; Line 57
	sub	esp, 4
	push	esi
	push	edi
; Line 62
	mov	esi, DWORD PTR _msg$[esp+8]
	cmp	esi, 5
	ja	SHORT $L8624
	je	$L8383
	cmp	esi, 2
	je	$L8378
	jmp	SHORT $L8389
$L8624:
	cmp	esi, 256				; 00000100H
	ja	SHORT $L8625
	je	$L8381
	cmp	esi, 15					; 0000000fH
	je	$L8384
	cmp	esi, 16					; 00000010H
	je	$L8379
	cmp	esi, 18					; 00000012H
	je	$L8380
	jmp	SHORT $L8389
$L8625:
	cmp	esi, 513				; 00000201H
	ja	SHORT $L8626
	je	$L8385
	cmp	esi, 257				; 00000101H
	je	$L8382
	jmp	SHORT $L8389
$L8626:
	cmp	esi, 514				; 00000202H
	je	$L8386
	cmp	esi, 516				; 00000204H
	je	$L8387
	cmp	esi, 517				; 00000205H
	je	$L8388
; Line 129
$L8389:
; Line 130
	mov	ecx, DWORD PTR _lParam$[esp+8]
	mov	eax, DWORD PTR _wParam$[esp+8]
	mov	edx, DWORD PTR _hWnd$[esp+8]
	push	ecx
	push	eax
	push	esi
	push	edx
	call	DWORD PTR __imp__DefWindowProcA@16
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 63
$L8378:
; Line 64
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 65
	call	_SG_CloseConnection
; Line 66
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 92
$L8383:
; Line 93
	fld	QWORD PTR $T8627
	mov	ecx, DWORD PTR _lParam$[esp+8]
	mov	eax, ecx
	shr	ecx, 16					; 00000010H
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _window_width, eax
	mov	DWORD PTR _window_height, ecx
; Line 95
	fidiv	DWORD PTR _window_width
	push	OFFSET FLAT:_rectScreen
	mov	edx, DWORD PTR _hwnd
	push	edx
	fstp	DWORD PTR _mouseFactorX
; Line 96
	fld	QWORD PTR $T8628
	fidiv	DWORD PTR _window_height
	fstp	DWORD PTR _mouseFactorY
; Line 97
	call	DWORD PTR __imp__GetWindowRect@8
; Line 98
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 99
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 102
$L8384:
; Line 103
	mov	eax, DWORD PTR _backBitmap
	mov	ecx, DWORD PTR _hdc_bmp
	push	eax
	push	ecx
	call	DWORD PTR __imp__SelectObject@8
	mov	edi, eax
	push	13369376				; 00cc0020H
; Line 104
	push	200					; 000000c8H
	mov	eax, DWORD PTR _hdc_bmp
	push	320					; 00000140H
	mov	ecx, DWORD PTR _window_height
	push	0
	mov	edx, DWORD PTR _window_width
	push	0
	push	eax
	push	ecx
	mov	eax, DWORD PTR _globalHdc
	push	edx
	push	0
	push	0
	push	eax
	call	DWORD PTR __imp__StretchBlt@44
; Line 105
	push	edi
	call	DWORD PTR __imp__DeleteObject@4
; Line 106
	mov	ecx, DWORD PTR _lParam$[esp+8]
	mov	eax, DWORD PTR _wParam$[esp+8]
	mov	edx, DWORD PTR _hWnd$[esp+8]
	push	ecx
	push	eax
	push	esi
	push	edx
	call	DWORD PTR __imp__DefWindowProcA@16
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 69
$L8379:
; Line 70
	mov	eax, DWORD PTR _hWnd$[esp+8]
	push	eax
	call	DWORD PTR __imp__DestroyWindow@4
; Line 71
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 72
	call	_SG_CloseConnection
; Line 73
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 76
$L8380:
; Line 77
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 78
	call	_SG_CloseConnection
; Line 79
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 82
$L8381:
; Line 83
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[esp+8]
	pop	edi
	pop	esi
	mov	BYTE PTR _keys[eax], 1
; Line 84
	add	esp, 4
	ret	16					; 00000010H
; Line 87
$L8382:
; Line 88
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[esp+8]
	pop	edi
	pop	esi
	mov	BYTE PTR _keys[eax], 0
; Line 89
	add	esp, 4
	ret	16					; 00000010H
; Line 109
$L8385:
; Line 110
	mov	BYTE PTR _mouseDownLeft, 1
; Line 111
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 114
$L8386:
; Line 115
	mov	BYTE PTR _mouseDownLeft, 0
; Line 116
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 119
$L8387:
; Line 120
	mov	BYTE PTR _mouseDownRight, 1
; Line 121
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
; Line 124
$L8388:
; Line 125
	mov	BYTE PTR _mouseDownRight, 0
; Line 133
	pop	edi
	pop	esi
	add	esp, 4
	ret	16					; 00000010H
_WndProc@16 ENDP
_TEXT	ENDS
PUBLIC	_mmproc@20
EXTRN	_tick_counter:DWORD
;	COMDAT _mmproc@20
_TEXT	SEGMENT
_mmproc@20 PROC NEAR					; COMDAT
; Line 136
	mov	DWORD PTR _newFrame, 1
; Line 137
	inc	DWORD PTR _tick_counter
; Line 138
	ret	20					; 00000014H
_mmproc@20 ENDP
_TEXT	ENDS
PUBLIC	_mmproc_2@20
EXTRN	_ready_frame:DWORD
;	COMDAT _mmproc_2@20
_TEXT	SEGMENT
_mmproc_2@20 PROC NEAR					; COMDAT
; Line 141
	mov	DWORD PTR _ready_frame, 1
; Line 142
	ret	20					; 00000014H
_mmproc_2@20 ENDP
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
; Line 145
	mov	eax, DWORD PTR _lpData$[esp-4]
	mov	ecx, DWORD PTR _wvHdr$[esp-4]
	mov	edx, DWORD PTR _dwBufferLength$[esp-4]
	mov	DWORD PTR [ecx], eax
; Line 146
	mov	eax, DWORD PTR _dwBytesRecorded$[esp-4]
	mov	DWORD PTR [ecx+4], edx
; Line 147
	mov	edx, DWORD PTR _dwUser$[esp-4]
	mov	DWORD PTR [ecx+8], eax
; Line 148
	mov	eax, DWORD PTR _dwFlags$[esp-4]
	mov	DWORD PTR [ecx+12], edx
; Line 149
	mov	edx, DWORD PTR _dwLoops$[esp-4]
	mov	DWORD PTR [ecx+16], eax
; Line 150
	mov	DWORD PTR [ecx+20], edx
; Line 151
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
; Line 154
	mov	ax, WORD PTR _wFormatTag$[esp-4]
	mov	ecx, DWORD PTR _wave$[esp-4]
	mov	dx, WORD PTR _nChannels$[esp-4]
	mov	WORD PTR [ecx], ax
; Line 155
	mov	eax, DWORD PTR _nSamplesPerSec$[esp-4]
	mov	WORD PTR [ecx+2], dx
	mov	DWORD PTR [ecx+4], eax
; Line 157
	mov	ax, WORD PTR _nBlockAlign$[esp-4]
	mov	edx, DWORD PTR _nAvgBytesPerSec$[esp-4]
	mov	WORD PTR [ecx+12], ax
	mov	DWORD PTR [ecx+8], edx
; Line 159
	mov	dx, WORD PTR _wBitsPerSample$[esp-4]
	mov	ax, WORD PTR _cbSize$[esp-4]
	mov	WORD PTR [ecx+14], dx
; Line 160
	mov	WORD PTR [ecx+16], ax
; Line 161
	ret	0
_initWave ENDP
_TEXT	ENDS
PUBLIC	_init_networking
PUBLIC	??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@	; `string'
EXTRN	_exit:NEAR
EXTRN	_printf:NEAR
EXTRN	_WSAStartup@8:NEAR
EXTRN	_WSAGetLastError@0:NEAR
;	COMDAT ??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@
_DATA	SEGMENT
??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@ DB 'WSAStartup failed: %d', 00H ; `string'
_DATA	ENDS
;	COMDAT _init_networking
_TEXT	SEGMENT
$T8640 = 8
_winsock_data$ = -400
_init_networking PROC NEAR				; COMDAT
; Line 163
	sub	esp, 400				; 00000190H
	lea	eax, DWORD PTR _winsock_data$[esp+400]
	push	esi
	push	edi
; Line 167
	push	eax
	push	514					; 00000202H
	call	_WSAStartup@8
	test	eax, eax
	je	SHORT $L8427
; Line 169
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@ ; `string'
	call	_printf
	add	esp, 8
; Line 170
	push	0
	call	_exit
	add	esp, 4
; Line 173
$L8427:
	lea	esi, DWORD PTR _winsock_data$[esp+408]
	mov	eax, DWORD PTR $T8640[esp+404]
	mov	edi, eax
	mov	ecx, 100				; 00000064H
	rep	movsd
; Line 174
	pop	edi
	pop	esi
	add	esp, 400				; 00000190H
	ret	0
_init_networking ENDP
_TEXT	ENDS
PUBLIC	_win_initialize_wave
EXTRN	_BUFFER_SIZE:DWORD
EXTRN	_waveOutPrepareHeader@12:NEAR
EXTRN	_waveOutUnprepareHeader@12:NEAR
EXTRN	_waveOutWrite@12:NEAR
;	COMDAT _win_initialize_wave
_TEXT	SEGMENT
_wvHdr$ = 8
_buf$ = 12
_win_initialize_wave PROC NEAR				; COMDAT
; Line 188
	push	esi
	mov	eax, DWORD PTR _BUFFER_SIZE
; Line 189
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
; Line 190
	push	32					; 00000020H
	push	esi
	push	ecx
	call	_waveOutPrepareHeader@12
; Line 191
	push	32					; 00000020H
	mov	eax, DWORD PTR _global_hWaveOut
	push	esi
	push	eax
	call	_waveOutWrite@12
; Line 192
	push	32					; 00000020H
	mov	eax, DWORD PTR _global_hWaveOut
	push	esi
	push	eax
	call	_waveOutUnprepareHeader@12
; Line 193
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
; Line 196
	cmp	DWORD PTR _msg$[esp-4], 955		; 000003bbH
	je	SHORT $L8448
; Line 200
	cmp	DWORD PTR _current_buffer, 0
	jne	SHORT $L8450
; Line 201
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
	jmp	SHORT $L8645
; Line 202
$L8450:
; Line 203
	mov	eax, DWORD PTR _buffer2
	push	eax
	push	OFFSET FLAT:_waveHdrB
$L8645:
	call	_win_initialize_wave
	add	esp, 8
; Line 206
	call	_mix
; Line 207
	cmp	DWORD PTR _current_buffer, 1
	sbb	eax, eax
	neg	eax
	mov	DWORD PTR _current_buffer, eax
; Line 209
$L8448:
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
; Line 213
	sub	esp, 4
	mov	eax, DWORD PTR _PORT
; Line 214
	mov	WORD PTR _server_addr, 2
	mov	DWORD PTR _iMode$[esp+4], 1
; Line 217
	push	eax
	call	_htons@4
	mov	WORD PTR _server_addr+2, ax
	push	17					; 00000011H
; Line 218
	mov	eax, DWORD PTR _mplayer_addr
	push	2
	push	2
	mov	DWORD PTR _server_addr+4, eax
; Line 220
	call	_socket@12
	mov	DWORD PTR _server_connection, eax
	cmp	eax, -1
; Line 222
	jne	SHORT $L8456
; Line 223
	xor	al, al
	add	esp, 4
	ret	0
; Line 226
$L8456:
	lea	ecx, DWORD PTR _iMode$[esp+4]
	mov	DWORD PTR _server_connection, eax
	push	ecx
	push	-2147195266				; 8004667eH
	push	eax
	call	_ioctlsocket@12
; Line 228
	mov	al, 1
	add	esp, 4
; Line 229
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
; Line 232
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
; Line 234
	lea	ecx, DWORD PTR [eax+1]
	cmp	ecx, 1
	mov	ecx, 0
	adc	ecx, -1
	and	ecx, eax
	mov	eax, ecx
; Line 240
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
; Line 243
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
; Line 244
	ret	0
_SG_SendPacket ENDP
_TEXT	ENDS
EXTRN	_closesocket@4:NEAR
;	COMDAT _SG_CloseConnection
_TEXT	SEGMENT
_SG_CloseConnection PROC NEAR				; COMDAT
; Line 247
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_closesocket@4
; Line 248
	ret	0
_SG_CloseConnection ENDP
_TEXT	ENDS
PUBLIC	_SG_TempLoadConfig
PUBLIC	??_C@_01LHO@r?$AA@				; `string'
PUBLIC	??_C@_0L@BGHG@config?4ini?$AA@			; `string'
PUBLIC	??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@		; `string'
PUBLIC	??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_09HALA@name?$DN?5?$CFs?6?$AA@		; `string'
PUBLIC	??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@		; `string'
PUBLIC	??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@	; `string'
PUBLIC	??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0O@GFPA@framecap?$DN?5?$CFd?6?$AA@	; `string'
EXTRN	_fclose:NEAR
EXTRN	_MUSIC_ENABLE:DWORD
EXTRN	_SOUND_ENABLE:DWORD
EXTRN	_SFX_ENABLE:DWORD
EXTRN	_fopen:NEAR
EXTRN	_laser_type:BYTE
EXTRN	_fscanf:NEAR
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_SLEEP_TIME:DWORD
EXTRN	_FRAME_CAP:DWORD
EXTRN	_inet_addr@4:NEAR
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT
??_C@_01LHO@r?$AA@ DB 'r', 00H				; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@BGHG@config?4ini?$AA@
_DATA	SEGMENT
??_C@_0L@BGHG@config?4ini?$AA@ DB 'config.ini', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT
??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@ DB 'addr= %s', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@ DB 'port= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_09HALA@name?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT
??_C@_09HALA@name?$DN?5?$CFs?6?$AA@ DB 'name= %s', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT
??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@ DB 'pin= %s', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@ DB 'x= %d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@ DB 'y= %d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@ DB 'laser= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@ DB 'frameskip= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@ DB 'block= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@ DB 'sfx= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@ DB 'music= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@ DB 'sound= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@ DB 'sleep= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0O@GFPA@framecap?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0O@GFPA@framecap?$DN?5?$CFd?6?$AA@ DB 'framecap= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT _SG_TempLoadConfig
_TEXT	SEGMENT
_addr$ = 8
_x$ = 12
_y$ = 16
_port$ = 20
_name$ = 28
_pin$ = 32
_taddr$ = -52
_SG_TempLoadConfig PROC NEAR				; COMDAT
; Line 250
	sub	esp, 52					; 00000034H
	push	esi
; Line 253
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	OFFSET FLAT:??_C@_0L@BGHG@config?4ini?$AA@ ; `string'
	call	_fopen
	add	esp, 8
	mov	esi, eax
; Line 254
	lea	eax, DWORD PTR _taddr$[esp+56]
	push	eax
	push	OFFSET FLAT:??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	mov	eax, DWORD PTR _port$[esp+64]
	add	esp, 12					; 0000000cH
; Line 255
	push	eax
	push	OFFSET FLAT:??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	mov	eax, DWORD PTR _name$[esp+64]
	add	esp, 12					; 0000000cH
; Line 256
	push	eax
	push	OFFSET FLAT:??_C@_09HALA@name?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	mov	eax, DWORD PTR _pin$[esp+64]
	add	esp, 12					; 0000000cH
; Line 257
	push	eax
	push	OFFSET FLAT:??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	mov	eax, DWORD PTR _x$[esp+64]
	add	esp, 12					; 0000000cH
; Line 258
	push	eax
	push	OFFSET FLAT:??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	mov	eax, DWORD PTR _y$[esp+64]
	add	esp, 12					; 0000000cH
; Line 259
	push	eax
	push	OFFSET FLAT:??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 260
	push	OFFSET FLAT:_laser_type
	push	OFFSET FLAT:??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 261
	push	OFFSET FLAT:_GAME_SETTINGS+4
	push	OFFSET FLAT:??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 262
	push	OFFSET FLAT:_BUFFER_SIZE
	push	OFFSET FLAT:??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 263
	push	OFFSET FLAT:_SFX_ENABLE
	push	OFFSET FLAT:??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 264
	push	OFFSET FLAT:_MUSIC_ENABLE
	push	OFFSET FLAT:??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 265
	push	OFFSET FLAT:_SOUND_ENABLE
	push	OFFSET FLAT:??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 266
	push	OFFSET FLAT:_SLEEP_TIME
	push	OFFSET FLAT:??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 267
	push	OFFSET FLAT:_FRAME_CAP
	push	OFFSET FLAT:??_C@_0O@GFPA@framecap?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 268
	push	esi
	call	_fclose
	lea	eax, DWORD PTR _taddr$[esp+60]
	add	esp, 4
; Line 270
	push	eax
	call	_inet_addr@4
	mov	ecx, DWORD PTR _addr$[esp+52]
	pop	esi
	mov	DWORD PTR [ecx], eax
; Line 271
	add	esp, 52					; 00000034H
	ret	0
_SG_TempLoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_Init
PUBLIC	??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ ; `string'
EXTRN	_waveOutGetNumDevs@0:NEAR
EXTRN	__imp__CreateWindowExA@48:NEAR
EXTRN	_malloc:NEAR
EXTRN	__imp__LoadIconA@8:NEAR
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	__imp__CreateDIBSection@24:NEAR
EXTRN	__imp__GetVersion@0:NEAR
EXTRN	__imp__GetDC@4:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	_SG_GameInit:NEAR
EXTRN	_waveOutOpen@24:NEAR
EXTRN	__imp__ReleaseDC@8:NEAR
EXTRN	__imp__RegisterClassA@4:NEAR
EXTRN	_FBPTR:DWORD
EXTRN	_timeSetEvent@20:NEAR
EXTRN	__imp__GetModuleHandleA@4:NEAR
EXTRN	_timeBeginPeriod@4:NEAR
EXTRN	__imp__AdjustWindowRect@12:NEAR
EXTRN	_init_sound:NEAR
EXTRN	__imp__LoadCursorA@8:NEAR
EXTRN	__imp__CreateCompatibleDC@4:NEAR
;	COMDAT ??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@
_DATA	SEGMENT
??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ DB 'Running o'
	DB	'n Windows version %d.%02d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT _SG_Init
_TEXT	SEGMENT
$T8658 = -400
_winRect$ = -456
_wc$ = -440
_SG_Init PROC NEAR					; COMDAT
; Line 280
	sub	esp, 456				; 000001c8H
	push	ebx
	push	esi
	push	edi
; Line 285
	call	DWORD PTR __imp__GetVersion@0
; Line 287
	mov	cl, ah
	and	eax, 255				; 000000ffH
	and	ecx, 255				; 000000ffH
	push	ecx
	push	eax
	push	OFFSET FLAT:??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ ; `string'
	call	_printf
	add	esp, 12					; 0000000cH
; Line 290
	call	_SG_GameInit
; Line 292
	push	OFFSET FLAT:_GAME_SETTINGS+30
	push	OFFSET FLAT:_GAME_SETTINGS+14
	push	OFFSET FLAT:_OTHER_PORT
	push	OFFSET FLAT:_PORT
	push	OFFSET FLAT:_window_height
	push	OFFSET FLAT:_window_width
	push	OFFSET FLAT:_mplayer_addr
	call	_SG_TempLoadConfig
	lea	ecx, DWORD PTR $T8658[esp+496]
	add	esp, 28					; 0000001cH
; Line 294
	xor	esi, esi
	push	ecx
	call	_init_networking
	mov	DWORD PTR _winRect$[esp+472], esi
	mov	DWORD PTR _winRect$[esp+476], esi
	add	esp, 4
	mov	ecx, DWORD PTR _window_height
; Line 301
	mov	eax, DWORD PTR _window_width
	push	esi
	lea	edx, DWORD PTR _winRect$[esp+472]
	push	13565952				; 00cf0000H
	mov	DWORD PTR _winRect$[esp+488], ecx
	push	edx
; Line 302
	mov	DWORD PTR _winRect$[esp+488], eax
; Line 304
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 306
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 308
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 309
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+4], 320			; 00000140H
; Line 310
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 311
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+12], 1
; Line 312
	mov	eax, DWORD PTR _bmi
	push	esi
	mov	WORD PTR [eax+14], 8
; Line 313
	mov	eax, DWORD PTR _bmi
	mov	ebx, DWORD PTR __imp__GetDC@4
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 314
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+16], esi
; Line 316
	call	ebx
	mov	edi, eax
; Line 317
	push	esi
	push	esi
	mov	eax, DWORD PTR _bmi
	push	OFFSET FLAT:_frontbuffer
	push	esi
	push	eax
	push	edi
	call	DWORD PTR __imp__CreateDIBSection@24
	push	edi
	mov	DWORD PTR _backBitmap, eax
; Line 318
	push	esi
	call	DWORD PTR __imp__ReleaseDC@8
; Line 320
	mov	DWORD PTR _wc$[esp+468], esi
	push	esi
; Line 321
	mov	edi, DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[esp+480], esi
	mov	DWORD PTR _wc$[esp+476], OFFSET FLAT:_WndProc@16
; Line 323
	mov	DWORD PTR _wc$[esp+484], esi
; Line 324
	call	edi
	mov	DWORD PTR _wc$[esp+484], eax
	push	1
; Line 325
	push	esi
	call	edi
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[esp+488], eax
	push	32512					; 00007f00H
; Line 326
	push	esi
	call	DWORD PTR __imp__LoadCursorA@8
	lea	ecx, DWORD PTR _wc$[esp+468]
	mov	DWORD PTR _wc$[esp+492], eax
; Line 327
	mov	eax, DWORD PTR _SG_title
	push	ecx
	mov	DWORD PTR _wc$[esp+504], esi
	mov	DWORD PTR _wc$[esp+508], eax
	mov	DWORD PTR _wc$[esp+500], 6
; Line 330
	call	DWORD PTR __imp__RegisterClassA@4
; Line 332
	push	esi
	push	esi
	call	edi
	push	eax
	push	esi
	mov	eax, DWORD PTR _winRect$[esp+492]
	push	esi
	sub	eax, DWORD PTR _winRect$[esp+488]
	push	eax
	mov	ecx, DWORD PTR _SG_title
	mov	eax, DWORD PTR _winRect$[esp+496]
	sub	eax, DWORD PTR _winRect$[esp+488]
	push	eax
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	13565952				; 00cf0000H
	push	ecx
	push	ecx
	push	esi
	call	DWORD PTR __imp__CreateWindowExA@48
	push	5
	mov	DWORD PTR _hwnd, eax
; Line 333
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 334
	mov	ecx, DWORD PTR _hwnd
	push	ecx
	call	DWORD PTR __imp__UpdateWindow@4
; Line 336
	push	OFFSET FLAT:_rectScreen
	mov	ecx, DWORD PTR _hwnd
	push	ecx
	call	DWORD PTR __imp__GetWindowRect@8
; Line 338
	push	1
	call	_timeBeginPeriod@4
; Line 340
	fld	QWORD PTR $T8627
	fidiv	DWORD PTR _window_width
	push	OFFSET FLAT:_rectScreen
	fstp	DWORD PTR _mouseFactorX
; Line 341
	fld	QWORD PTR $T8628
	fidiv	DWORD PTR _window_height
	fstp	DWORD PTR _mouseFactorY
; Line 343
	call	DWORD PTR __imp__ClipCursor@4
; Line 345
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 346
	mov	edi, OFFSET FLAT:_keys
	push	1
	push	esi
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	_timeSetEvent@20
; Line 347
	xor	eax, eax
	mov	ecx, 64					; 00000040H
	rep	stosd
; Line 349
	cmp	DWORD PTR _FRAME_CAP, esi
	je	SHORT $L8504
; Line 350
	push	1
	mov	eax, DWORD PTR _FRAME_CAP
	push	esi
	push	OFFSET FLAT:_mmproc_2@20
	push	1
	push	eax
	call	_timeSetEvent@20
; Line 356
$L8504:
	call	_init_sound
; Line 358
	cmp	DWORD PTR _SOUND_ENABLE, 0
	je	SHORT $L8506
; Line 359
	call	_waveOutGetNumDevs@0
	mov	esi, eax
	push	0
; Line 361
	push	8
	push	1
	push	22050					; 00005622H
	push	22050					; 00005622H
	push	1
	push	1
	push	OFFSET FLAT:_global_wave
	call	_initWave
	add	esp, 32					; 00000020H
; Line 363
	test	esi, esi
	je	SHORT $L8507
; Line 370
$L8509:
	push	196608					; 00030000H
	push	0
	push	OFFSET FLAT:_sound_callback@20
	push	OFFSET FLAT:_global_wave
	push	-1
	push	OFFSET FLAT:_global_hWaveOut
	call	_waveOutOpen@24
	test	eax, eax
	jne	SHORT $L8509
; Line 373
$L8507:
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
	call	_win_initialize_wave
	add	esp, 8
	mov	eax, DWORD PTR _buffer2
; Line 374
	push	eax
	push	OFFSET FLAT:_waveHdrB
	call	_win_initialize_wave
	add	esp, 8
; Line 377
$L8506:
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	ebx
	push	eax
	mov	DWORD PTR _globalHdc, eax
; Line 378
	call	DWORD PTR __imp__CreateCompatibleDC@4
	pop	edi
	mov	DWORD PTR _hdc_bmp, eax
; Line 379
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
_p$ = -8
_mouse$ = 8
_SG_ReadMouse PROC NEAR					; COMDAT
; Line 381
	sub	esp, 12					; 0000000cH
	lea	eax, DWORD PTR _p$[esp+12]
	push	esi
; Line 383
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 384
	lea	ecx, DWORD PTR _p$[esp+16]
	mov	eax, DWORD PTR _hwnd
	push	ecx
	push	eax
	call	DWORD PTR __imp__ScreenToClient@8
; Line 385
	fild	DWORD PTR _p$[esp+16]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	esi, DWORD PTR _mouse$[esp+12]
	mov	WORD PTR [esi], ax
; Line 386
	mov	eax, DWORD PTR _p$[esp+20]
	mov	DWORD PTR -8+[esp+16], eax
	fild	DWORD PTR -8+[esp+16]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	WORD PTR [esi+2], ax
; Line 387
	mov	al, BYTE PTR _mouseDownLeft
	mov	BYTE PTR [esi+4], al
; Line 388
	mov	cl, BYTE PTR _mouseDownRight
	mov	BYTE PTR [esi+5], cl
; Line 389
	pop	esi
	add	esp, 12					; 0000000cH
	ret	0
_SG_ReadMouse ENDP
_TEXT	ENDS
PUBLIC	_SG_KeyDown
;	COMDAT _SG_KeyDown
_TEXT	SEGMENT
_key$ = 8
_SG_KeyDown PROC NEAR					; COMDAT
; Line 392
	xor	eax, eax
	mov	al, BYTE PTR _key$[esp-4]
	mov	al, BYTE PTR _keys[eax]
; Line 393
	ret	0
_SG_KeyDown ENDP
_TEXT	ENDS
PUBLIC	_SG_DrawFrame
EXTRN	__imp__InvalidateRect@12:NEAR
;	COMDAT _SG_DrawFrame
_TEXT	SEGMENT
_SG_DrawFrame PROC NEAR					; COMDAT
; Line 396
	push	0
	mov	eax, DWORD PTR _hwnd
	push	0
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 397
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
; Line 399
	sub	esp, 4
	push	esi
	push	edi
; Line 401
	mov	edi, DWORD PTR _bmi
	push	0
; Line 403
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	esi, eax
; Line 404
	mov	eax, DWORD PTR _backBitmap
	push	eax
	push	esi
	call	DWORD PTR __imp__SelectObject@8
; Line 405
	mov	cl, BYTE PTR _r$[esp+8]
	mov	dl, BYTE PTR _g$[esp+8]
	mov	al, BYTE PTR _b$[esp+8]
	mov	BYTE PTR _col$[esp+14], cl
; Line 406
	mov	BYTE PTR _col$[esp+13], dl
	mov	BYTE PTR _col$[esp+12], al
; Line 407
	xor	edx, edx
	mov	ecx, DWORD PTR _col$[esp+12]
	mov	dl, BYTE PTR _index$[esp+8]
	lea	eax, DWORD PTR [edi+edx*4+40]
; Line 408
	push	eax
	push	1
	push	edx
	mov	DWORD PTR [eax], ecx
; Line 409
	push	esi
	call	DWORD PTR __imp__SetDIBColorTable@16
; Line 410
	push	esi
	call	DWORD PTR __imp__DeleteDC@4
; Line 411
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
; Line 425
	jmp	_timeGetTime@0
_SG_GetTicks ENDP
_TEXT	ENDS
PUBLIC	_SG_WaitBlank
EXTRN	__imp__TranslateMessage@4:NEAR
EXTRN	__imp__DispatchMessageA@4:NEAR
EXTRN	__imp__PeekMessageA@20:NEAR
;	COMDAT _SG_WaitBlank
_TEXT	SEGMENT
_Msg$ = -28
_SG_WaitBlank PROC NEAR					; COMDAT
; Line 428
	sub	esp, 28					; 0000001cH
	cmp	DWORD PTR _newFrame, 0
	push	ebx
	push	esi
	push	edi
; Line 438
	jne	SHORT $L8530
	mov	esi, DWORD PTR __imp__PeekMessageA@20
	mov	edi, DWORD PTR __imp__TranslateMessage@4
	mov	ebx, DWORD PTR __imp__DispatchMessageA@4
$L8529:
; Line 439
	push	1
	mov	eax, DWORD PTR _hwnd
	lea	ecx, DWORD PTR _Msg$[esp+44]
	push	0
	push	0
	push	eax
	push	ecx
	call	esi
	test	eax, eax
	mov	eax, DWORD PTR _newFrame
	je	SHORT $L8674
; Line 440
	lea	eax, DWORD PTR _Msg$[esp+40]
	push	eax
	call	edi
; Line 441
	lea	eax, DWORD PTR _Msg$[esp+40]
	push	eax
	call	ebx
	mov	eax, DWORD PTR _newFrame
$L8674:
; Line 444
	test	eax, eax
	je	SHORT $L8529
$L8530:
; Line 445
	mov	DWORD PTR _newFrame, 0
; Line 446
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 28					; 0000001cH
	ret	0
_SG_WaitBlank ENDP
_TEXT	ENDS
PUBLIC	_SG_Sleep
EXTRN	__imp__Sleep@4:NEAR
;	COMDAT _SG_Sleep
_TEXT	SEGMENT
_ms$ = 8
_SG_Sleep PROC NEAR					; COMDAT
; Line 449
	mov	eax, DWORD PTR _ms$[esp-4]
	push	eax
	call	DWORD PTR __imp__Sleep@4
; Line 450
	ret	0
_SG_Sleep ENDP
_TEXT	ENDS
PUBLIC	_SG_ProcessEvents
;	COMDAT _SG_ProcessEvents
_TEXT	SEGMENT
_Msg$ = -28
_SG_ProcessEvents PROC NEAR				; COMDAT
; Line 452
	sub	esp, 28					; 0000001cH
	mov	eax, DWORD PTR _hwnd
	push	ebx
	push	esi
	lea	ecx, DWORD PTR _Msg$[esp+36]
	push	edi
; Line 455
	push	1
	mov	esi, DWORD PTR __imp__PeekMessageA@20
	push	0
	push	0
	push	eax
	push	ecx
	call	esi
	test	eax, eax
	je	SHORT $L8534
	mov	edi, DWORD PTR __imp__TranslateMessage@4
	mov	ebx, DWORD PTR __imp__DispatchMessageA@4
$L8537:
; Line 456
	lea	eax, DWORD PTR _Msg$[esp+40]
	push	eax
	call	edi
; Line 457
	lea	eax, DWORD PTR _Msg$[esp+40]
	push	eax
	call	ebx
; Line 458
	push	1
	mov	eax, DWORD PTR _hwnd
	lea	ecx, DWORD PTR _Msg$[esp+44]
	push	0
	push	0
	push	eax
	push	ecx
	call	esi
	test	eax, eax
	jne	SHORT $L8537
; Line 459
$L8534:
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
; Line 462
	call	_SG_WelcomeMessage
; Line 463
	mov	eax, DWORD PTR _argv$[esp-4]
	mov	ecx, DWORD PTR _argc$[esp-4]
	push	eax
	push	ecx
	call	_SG_Init
	add	esp, 8
; Line 464
	call	_SG_InitPalette
; Line 465
	call	_title_init
; Line 467
$L8546:
; Line 468
	call	_SG_Tick
; Line 469
	jmp	SHORT $L8546
_main	ENDP
_TEXT	ENDS
END
