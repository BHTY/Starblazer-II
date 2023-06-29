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
;	COMDAT ??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _WndProc@16
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mmproc@20
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
;	COMDAT _main
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_SG_platform
PUBLIC	??_C@_05PFD@win32?$AA@				; `string'
PUBLIC	_SG_title
PUBLIC	??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@ ; `string'
PUBLIC	_newFrame
PUBLIC	_mouseDownLeft
PUBLIC	_mouseDownRight
PUBLIC	_PORT
PUBLIC	_OTHER_PORT
PUBLIC	_global_hWaveOut
_DATA	SEGMENT
COMM	_frontbuffer:DWORD
COMM	_mplayer_addr:DWORD
COMM	_hwnd:DWORD
COMM	_globalHdc:DWORD
COMM	_bmi:DWORD
COMM	_backBitmap:DWORD
COMM	_hPalette:DWORD
COMM	_rectScreen:BYTE:010H
_DATA	ENDS
_BSS	SEGMENT
_newFrame DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_hdc_bmp:DWORD
COMM	_window_height:DWORD
COMM	_window_width:DWORD
COMM	_mouseFactorX:DWORD
COMM	_mouseFactorY:DWORD
_DATA	ENDS
_BSS	SEGMENT
_mouseDownLeft DD 01H DUP (?)
_mouseDownRight DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_keys:DWORD:0100H
COMM	_server_connection:DWORD
COMM	_server_addr:BYTE:010H
COMM	_size_response:DWORD
COMM	_waveHdrA:BYTE:020H
COMM	_waveHdrB:BYTE:020H
COMM	_global_wave:BYTE:012H
_DATA	ENDS
_BSS	SEGMENT
_global_hWaveOut DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
_SG_platform DD	FLAT:??_C@_05PFD@win32?$AA@
_SG_title DD	FLAT:??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@
_PORT	DD	0270fH
_OTHER_PORT DD	05ba0H
_DATA	ENDS
;	COMDAT ??_C@_05PFD@win32?$AA@
_DATA	SEGMENT
??_C@_05PFD@win32?$AA@ DB 'win32', 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@
_DATA	SEGMENT
??_C@_0BN@NNBE@Starblazer?5II?5for?5Windows?595?$AA@ DB 'Starblazer II fo'
	DB	'r Windows 95', 00H				; `string'
_DATA	ENDS
PUBLIC	_SG_CloseConnection
PUBLIC	_WndProc@16
PUBLIC	__real@8@4007a000000000000000
PUBLIC	__real@8@4006c800000000000000
EXTRN	__imp__ExitProcess@4:NEAR
EXTRN	__imp__GetWindowRect@8:NEAR
EXTRN	__imp__DeleteObject@4:NEAR
EXTRN	__imp__DefWindowProcA@16:NEAR
EXTRN	__imp__PostQuitMessage@4:NEAR
EXTRN	__imp__ClipCursor@4:NEAR
EXTRN	__imp__DestroyWindow@4:NEAR
EXTRN	__imp__SelectObject@8:NEAR
EXTRN	__imp__StretchBlt@44:NEAR
EXTRN	__fltused:NEAR
;	COMDAT __real@8@4007a000000000000000
; File src\star_win.c
CONST	SEGMENT
__real@8@4007a000000000000000 DQ 04074000000000000r ; 320
CONST	ENDS
;	COMDAT __real@8@4006c800000000000000
CONST	SEGMENT
__real@8@4006c800000000000000 DQ 04069000000000000r ; 200
CONST	ENDS
;	COMDAT _WndProc@16
_TEXT	SEGMENT
_hWnd$ = 8
_msg$ = 12
_wParam$ = 16
_lParam$ = 20
_WndProc@16 PROC NEAR					; COMDAT
; File src\star_win.c
; Line 55
	push	esi
; Line 60
	mov	esi, DWORD PTR _msg$[esp]
	cmp	esi, 256				; 00000100H
	ja	$L22301
	je	$L22073
	lea	eax, DWORD PTR [esi-2]
	cmp	eax, 16					; 00000010H
	ja	$L22081
	xor	ecx, ecx
	mov	cl, BYTE PTR $L22307[eax]
	jmp	DWORD PTR $L22308[ecx*4]
$L22070:
; Line 62
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 63
	call	_SG_CloseConnection
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22071:
; Line 68
	mov	edx, DWORD PTR _hWnd$[esp]
	push	edx
	call	DWORD PTR __imp__DestroyWindow@4
$L22072:
; Line 69
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 70
	call	_SG_CloseConnection
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22075:
; Line 91
	mov	eax, DWORD PTR _lParam$[esp]
; Line 95
	mov	edx, DWORD PTR _hwnd
	mov	ecx, eax
	push	OFFSET FLAT:_rectScreen
	and	ecx, 65535				; 0000ffffH
	push	edx
	mov	DWORD PTR _window_width, ecx
	fild	DWORD PTR _window_width
	shr	eax, 16					; 00000010H
	mov	DWORD PTR _window_height, eax
	fdivr	QWORD PTR __real@8@4007a000000000000000
	fstp	DWORD PTR _mouseFactorX
	fild	DWORD PTR _window_height
	fdivr	QWORD PTR __real@8@4006c800000000000000
	fstp	DWORD PTR _mouseFactorY
	call	DWORD PTR __imp__GetWindowRect@8
; Line 96
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22076:
; Line 101
	mov	eax, DWORD PTR _backBitmap
	mov	ecx, DWORD PTR _hdc_bmp
	push	edi
	push	eax
	push	ecx
	call	DWORD PTR __imp__SelectObject@8
; Line 102
	mov	edx, DWORD PTR _hdc_bmp
	mov	ecx, DWORD PTR _window_width
	push	13369376				; 00cc0020H
	push	200					; 000000c8H
	push	320					; 00000140H
	mov	edi, eax
	mov	eax, DWORD PTR _window_height
	push	0
	push	0
	push	edx
	mov	edx, DWORD PTR _globalHdc
	push	eax
	push	ecx
	push	0
	push	0
	push	edx
	call	DWORD PTR __imp__StretchBlt@44
; Line 103
	push	edi
	call	DWORD PTR __imp__DeleteObject@4
; Line 104
	mov	eax, DWORD PTR _lParam$[esp+4]
	mov	ecx, DWORD PTR _wParam$[esp+4]
	mov	edx, DWORD PTR _hWnd$[esp+4]
	push	eax
	push	ecx
	push	esi
	push	edx
	call	DWORD PTR __imp__DefWindowProcA@16
	pop	edi
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22073:
; Line 81
	mov	eax, DWORD PTR _wParam$[esp]
	pop	esi
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _keys[eax*4], 1
; Line 131
	ret	16					; 00000010H
$L22301:
; Line 60
	cmp	esi, 514				; 00000202H
	ja	SHORT $L22302
	je	SHORT $L22078
	cmp	esi, 257				; 00000101H
	je	SHORT $L22074
	cmp	esi, 513				; 00000201H
	jne	SHORT $L22081
; Line 108
	mov	DWORD PTR _mouseDownLeft, 1
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22074:
; Line 86
	mov	ecx, DWORD PTR _wParam$[esp]
	pop	esi
	and	ecx, 255				; 000000ffH
	mov	DWORD PTR _keys[ecx*4], 0
; Line 131
	ret	16					; 00000010H
$L22078:
; Line 113
	mov	DWORD PTR _mouseDownLeft, 0
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22302:
; Line 60
	mov	eax, esi
	sub	eax, 516				; 00000204H
	je	SHORT $L22079
	dec	eax
	je	SHORT $L22080
$L22081:
; Line 128
	mov	edx, DWORD PTR _lParam$[esp]
	mov	eax, DWORD PTR _wParam$[esp]
	mov	ecx, DWORD PTR _hWnd$[esp]
	push	edx
	push	eax
	push	esi
	push	ecx
	call	DWORD PTR __imp__DefWindowProcA@16
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22080:
; Line 123
	mov	DWORD PTR _mouseDownRight, 0
	pop	esi
; Line 131
	ret	16					; 00000010H
$L22079:
; Line 118
	mov	DWORD PTR _mouseDownRight, 1
	pop	esi
; Line 131
	ret	16					; 00000010H
	npad	1
$L22308:
	DD	$L22070
	DD	$L22075
	DD	$L22076
	DD	$L22071
	DD	$L22072
	DD	$L22081
$L22307:
	DB	0
	DB	5
	DB	5
	DB	1
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	5
	DB	2
	DB	3
	DB	5
	DB	4
_WndProc@16 ENDP
_TEXT	ENDS
PUBLIC	_mmproc@20
;	COMDAT _mmproc@20
_TEXT	SEGMENT
_mmproc@20 PROC NEAR					; COMDAT
; Line 134
	mov	DWORD PTR _newFrame, 1
; Line 135
	ret	20					; 00000014H
_mmproc@20 ENDP
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
; Line 138
	mov	eax, DWORD PTR _wvHdr$[esp-4]
	mov	ecx, DWORD PTR _lpData$[esp-4]
; Line 139
	mov	edx, DWORD PTR _dwBufferLength$[esp-4]
	mov	DWORD PTR [eax], ecx
; Line 140
	mov	ecx, DWORD PTR _dwBytesRecorded$[esp-4]
	mov	DWORD PTR [eax+4], edx
; Line 141
	mov	edx, DWORD PTR _dwUser$[esp-4]
	mov	DWORD PTR [eax+8], ecx
; Line 142
	mov	ecx, DWORD PTR _dwFlags$[esp-4]
	mov	DWORD PTR [eax+12], edx
; Line 143
	mov	edx, DWORD PTR _dwLoops$[esp-4]
	mov	DWORD PTR [eax+16], ecx
	mov	DWORD PTR [eax+20], edx
; Line 144
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
; Line 147
	mov	eax, DWORD PTR _wave$[esp-4]
	mov	cx, WORD PTR _wFormatTag$[esp-4]
; Line 148
	mov	dx, WORD PTR _nChannels$[esp-4]
	mov	WORD PTR [eax], cx
; Line 149
	mov	ecx, DWORD PTR _nSamplesPerSec$[esp-4]
	mov	WORD PTR [eax+2], dx
; Line 150
	mov	edx, DWORD PTR _nAvgBytesPerSec$[esp-4]
	mov	DWORD PTR [eax+4], ecx
; Line 151
	mov	cx, WORD PTR _nBlockAlign$[esp-4]
	mov	DWORD PTR [eax+8], edx
; Line 152
	mov	dx, WORD PTR _wBitsPerSample$[esp-4]
	mov	WORD PTR [eax+12], cx
; Line 153
	mov	cx, WORD PTR _cbSize$[esp-4]
	mov	WORD PTR [eax+14], dx
	mov	WORD PTR [eax+16], cx
; Line 154
	ret	0
_initWave ENDP
_TEXT	ENDS
PUBLIC	_init_networking
PUBLIC	??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@	; `string'
EXTRN	_printf:NEAR
EXTRN	_exit:NEAR
EXTRN	_WSAStartup@8:NEAR
EXTRN	_WSAGetLastError@0:NEAR
;	COMDAT ??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@
; File src\star_win.c
_DATA	SEGMENT
??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@ DB 'WSAStartup failed: %d', 00H ; `string'
_DATA	ENDS
;	COMDAT _init_networking
_TEXT	SEGMENT
_winsock_data$ = -400
$T22322 = 8
_init_networking PROC NEAR				; COMDAT
; File src\star_win.c
; Line 156
	sub	esp, 400				; 00000190H
; Line 160
	lea	eax, DWORD PTR _winsock_data$[esp+400]
	push	eax
	push	514					; 00000202H
	call	_WSAStartup@8
	test	eax, eax
	je	SHORT $L22112
; Line 162
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:??_C@_0BG@FB@WSAStartup?5failed?3?5?$CFd?$AA@ ; `string'
	call	_printf
; Line 163
	push	0
	call	_exit
	add	esp, 12					; 0000000cH
$L22112:
; Line 166
	mov	eax, DWORD PTR $T22322[esp+396]
	push	esi
	push	edi
	mov	ecx, 100				; 00000064H
	lea	esi, DWORD PTR _winsock_data$[esp+408]
	mov	edi, eax
	rep movsd
	pop	edi
	pop	esi
; Line 167
	add	esp, 400				; 00000190H
	ret	0
_init_networking ENDP
_TEXT	ENDS
PUBLIC	_win_initialize_wave
EXTRN	_BUFFER_SIZE:DWORD
EXTRN	__imp__waveOutPrepareHeader@12:NEAR
EXTRN	__imp__waveOutUnprepareHeader@12:NEAR
EXTRN	__imp__waveOutWrite@12:NEAR
;	COMDAT _win_initialize_wave
_TEXT	SEGMENT
_wvHdr$ = 8
_buf$ = 12
_win_initialize_wave PROC NEAR				; COMDAT
; Line 182
	mov	eax, DWORD PTR _BUFFER_SIZE
	mov	ecx, DWORD PTR _buf$[esp-4]
	push	esi
	mov	esi, DWORD PTR _wvHdr$[esp]
	push	0
	push	0
	push	0
	push	0
	push	eax
	push	ecx
	push	esi
	call	_initWaveHeader
; Line 183
	mov	edx, DWORD PTR _global_hWaveOut
	add	esp, 28					; 0000001cH
	push	32					; 00000020H
	push	esi
	push	edx
	call	DWORD PTR __imp__waveOutPrepareHeader@12
; Line 184
	mov	eax, DWORD PTR _global_hWaveOut
	push	32					; 00000020H
	push	esi
	push	eax
	call	DWORD PTR __imp__waveOutWrite@12
; Line 185
	mov	ecx, DWORD PTR _global_hWaveOut
	push	32					; 00000020H
	push	esi
	push	ecx
	call	DWORD PTR __imp__waveOutUnprepareHeader@12
	pop	esi
; Line 186
	ret	0
_win_initialize_wave ENDP
_TEXT	ENDS
PUBLIC	_sound_callback@20
EXTRN	_buffer1:DWORD
EXTRN	_buffer2:DWORD
EXTRN	_current_buffer:DWORD
EXTRN	_mix:NEAR
;	COMDAT _sound_callback@20
_TEXT	SEGMENT
_msg$ = 12
_sound_callback@20 PROC NEAR				; COMDAT
; Line 189
	cmp	DWORD PTR _msg$[esp-4], 955		; 000003bbH
	je	SHORT $L22133
; Line 193
	mov	eax, DWORD PTR _current_buffer
	test	eax, eax
	jne	SHORT $L22135
; Line 194
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
; Line 195
	jmp	SHORT $L22329
$L22135:
; Line 196
	mov	ecx, DWORD PTR _buffer2
	push	ecx
	push	OFFSET FLAT:_waveHdrB
$L22329:
	call	_win_initialize_wave
	add	esp, 8
; Line 199
	call	_mix
; Line 200
	mov	eax, DWORD PTR _current_buffer
	xor	edx, edx
	test	eax, eax
	sete	dl
	mov	DWORD PTR _current_buffer, edx
$L22133:
; Line 202
	ret	20					; 00000014H
_sound_callback@20 ENDP
_TEXT	ENDS
PUBLIC	_SG_OpenConnection
EXTRN	_ioctlsocket@12:NEAR
EXTRN	_htons@4:NEAR
EXTRN	_socket@12:NEAR
;	COMDAT _SG_OpenConnection
_TEXT	SEGMENT
_iMode$ = -4
_SG_OpenConnection PROC NEAR				; COMDAT
; Line 206
	push	ecx
; Line 210
	mov	ax, WORD PTR _PORT
	mov	DWORD PTR _iMode$[esp+4], 1
	push	eax
	mov	WORD PTR _server_addr, 2
	call	_htons@4
; Line 211
	mov	ecx, DWORD PTR _mplayer_addr
; Line 213
	push	17					; 00000011H
	push	2
	push	2
	mov	WORD PTR _server_addr+2, ax
	mov	DWORD PTR _server_addr+4, ecx
	call	_socket@12
; Line 215
	cmp	eax, -1
	mov	DWORD PTR _server_connection, eax
	jne	SHORT $L22141
; Line 216
	xor	eax, eax
; Line 222
	pop	ecx
	ret	0
$L22141:
; Line 219
	lea	edx, DWORD PTR _iMode$[esp+4]
	push	edx
	push	-2147195266				; 8004667eH
	push	eax
	call	_ioctlsocket@12
; Line 221
	mov	eax, 1
; Line 222
	pop	ecx
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
; Line 225
	mov	eax, DWORD PTR _num_bytes$[esp-4]
	mov	ecx, DWORD PTR _buf$[esp-4]
	mov	edx, DWORD PTR _server_connection
	push	0
	push	0
	push	0
	push	eax
	push	ecx
	push	edx
	call	_recvfrom@24
	mov	ecx, eax
; Line 227
	inc	eax
	neg	eax
	sbb	eax, eax
	and	eax, ecx
; Line 233
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
; Line 236
	mov	eax, DWORD PTR _num_bytes$[esp-4]
	mov	ecx, DWORD PTR _buf$[esp-4]
	mov	edx, DWORD PTR _server_connection
	push	16					; 00000010H
	push	OFFSET FLAT:_server_addr
	push	0
	push	eax
	push	ecx
	push	edx
	call	_sendto@24
; Line 237
	ret	0
_SG_SendPacket ENDP
_TEXT	ENDS
EXTRN	_closesocket@4:NEAR
;	COMDAT _SG_CloseConnection
_TEXT	SEGMENT
_SG_CloseConnection PROC NEAR				; COMDAT
; Line 240
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_closesocket@4
; Line 241
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
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_MUSIC_ENABLE:DWORD
EXTRN	_SOUND_ENABLE:DWORD
EXTRN	_SFX_ENABLE:DWORD
EXTRN	_laser_type:DWORD
EXTRN	_inet_addr@4:NEAR
;	COMDAT ??_C@_01LHO@r?$AA@
; File src\star_win.c
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
; File src\star_win.c
; Line 243
	sub	esp, 52					; 00000034H
	push	esi
; Line 246
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	OFFSET FLAT:??_C@_0L@BGHG@config?4ini?$AA@ ; `string'
	call	_fopen
	mov	esi, eax
; Line 247
	lea	eax, DWORD PTR _taddr$[esp+64]
	push	eax
	push	OFFSET FLAT:??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 248
	mov	ecx, DWORD PTR _port$[esp+72]
	push	ecx
	push	OFFSET FLAT:??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 249
	mov	edx, DWORD PTR _name$[esp+84]
	push	edx
	push	OFFSET FLAT:??_C@_09HALA@name?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 250
	mov	eax, DWORD PTR _pin$[esp+96]
	push	eax
	push	OFFSET FLAT:??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 251
	mov	ecx, DWORD PTR _x$[esp+108]
	push	ecx
	push	OFFSET FLAT:??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 252
	mov	edx, DWORD PTR _y$[esp+120]
	add	esp, 68					; 00000044H
	push	edx
	push	OFFSET FLAT:??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 253
	push	OFFSET FLAT:_laser_type
	push	OFFSET FLAT:??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 254
	push	OFFSET FLAT:_GAME_SETTINGS+4
	push	OFFSET FLAT:??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 255
	push	OFFSET FLAT:_BUFFER_SIZE
	push	OFFSET FLAT:??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 256
	push	OFFSET FLAT:_SFX_ENABLE
	push	OFFSET FLAT:??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 257
	push	OFFSET FLAT:_MUSIC_ENABLE
	push	OFFSET FLAT:??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 72					; 00000048H
; Line 258
	push	OFFSET FLAT:_SOUND_ENABLE
	push	OFFSET FLAT:??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
; Line 259
	push	esi
	call	_fclose
	add	esp, 16					; 00000010H
; Line 261
	lea	eax, DWORD PTR _taddr$[esp+56]
	push	eax
	call	_inet_addr@4
	mov	ecx, DWORD PTR _addr$[esp+52]
	pop	esi
	mov	DWORD PTR [ecx], eax
; Line 262
	add	esp, 52					; 00000034H
	ret	0
_SG_TempLoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_Init
PUBLIC	??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ ; `string'
EXTRN	__imp__timeSetEvent@20:NEAR
EXTRN	__imp__timeBeginPeriod@4:NEAR
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	__imp__GetDC@4:NEAR
EXTRN	__imp__ReleaseDC@8:NEAR
EXTRN	__imp__CreateCompatibleDC@4:NEAR
EXTRN	_SG_GameInit:NEAR
EXTRN	_FBPTR:DWORD
EXTRN	__imp__AdjustWindowRect@12:NEAR
EXTRN	__imp__RegisterClassA@4:NEAR
EXTRN	__imp__waveOutGetNumDevs@0:NEAR
EXTRN	__imp__CreateWindowExA@48:NEAR
EXTRN	__imp__waveOutOpen@24:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	_malloc:NEAR
EXTRN	_init_sound:NEAR
EXTRN	__imp__CreateDIBSection@24:NEAR
EXTRN	__imp__LoadCursorA@8:NEAR
EXTRN	__imp__LoadIconA@8:NEAR
EXTRN	__imp__GetModuleHandleA@4:NEAR
EXTRN	__imp__GetVersion@0:NEAR
;	COMDAT ??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@
; File src\star_win.c
_DATA	SEGMENT
??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ DB 'Running o'
	DB	'n Windows version %d.%02d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT _SG_Init
_TEXT	SEGMENT
_winRect$ = -456
_wc$ = -440
$T22348 = -400
_SG_Init PROC NEAR					; COMDAT
; File src\star_win.c
; Line 271
	sub	esp, 456				; 000001c8H
	push	ebx
	push	esi
	push	edi
; Line 276
	call	DWORD PTR __imp__GetVersion@0
; Line 278
	xor	ecx, ecx
	mov	cl, ah
	and	eax, 255				; 000000ffH
	push	ecx
	push	eax
	push	OFFSET FLAT:??_C@_0CE@KKHJ@Running?5on?5Windows?5version?5?$CFd?4?$CF0@ ; `string'
	call	_printf
; Line 281
	call	_SG_GameInit
; Line 283
	push	OFFSET FLAT:_GAME_SETTINGS+36
	push	OFFSET FLAT:_GAME_SETTINGS+20
	push	OFFSET FLAT:_OTHER_PORT
	push	OFFSET FLAT:_PORT
	push	OFFSET FLAT:_window_height
	push	OFFSET FLAT:_window_width
	push	OFFSET FLAT:_mplayer_addr
	call	_SG_TempLoadConfig
; Line 285
	lea	edx, DWORD PTR $T22348[esp+508]
	push	edx
	call	_init_networking
; Line 292
	mov	eax, DWORD PTR _window_height
; Line 293
	mov	ecx, DWORD PTR _window_width
	add	esp, 44					; 0000002cH
	xor	esi, esi
; Line 295
	lea	edx, DWORD PTR _winRect$[esp+468]
	mov	DWORD PTR _winRect$[esp+468], esi
	push	esi
	push	13565952				; 00cf0000H
	push	edx
	mov	DWORD PTR _winRect$[esp+484], esi
	mov	DWORD PTR _winRect$[esp+492], eax
	mov	DWORD PTR _winRect$[esp+488], ecx
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 297
	push	1068					; 0000042cH
	call	_malloc
	mov	DWORD PTR _bmi, eax
; Line 299
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 300
	mov	eax, DWORD PTR _bmi
; Line 307
	mov	ebx, DWORD PTR __imp__GetDC@4
	add	esp, 4
	mov	DWORD PTR [eax+4], 320			; 00000140H
	mov	ecx, DWORD PTR _bmi
	push	esi
	mov	DWORD PTR [ecx+8], -200			; ffffff38H
	mov	edx, DWORD PTR _bmi
	mov	WORD PTR [edx+12], 1
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+14], 8
	mov	ecx, DWORD PTR _bmi
	mov	DWORD PTR [ecx+32], 256			; 00000100H
	mov	edx, DWORD PTR _bmi
	mov	DWORD PTR [edx+16], esi
	call	ebx
; Line 308
	push	esi
	mov	edi, eax
	mov	eax, DWORD PTR _bmi
	push	esi
	push	OFFSET FLAT:_frontbuffer
	push	esi
	push	eax
	push	edi
	call	DWORD PTR __imp__CreateDIBSection@24
; Line 309
	push	edi
	push	esi
	mov	DWORD PTR _backBitmap, eax
	call	DWORD PTR __imp__ReleaseDC@8
; Line 315
	mov	edi, DWORD PTR __imp__GetModuleHandleA@4
	push	esi
	mov	DWORD PTR _wc$[esp+472], esi
	mov	DWORD PTR _wc$[esp+476], OFFSET FLAT:_WndProc@16
	mov	DWORD PTR _wc$[esp+480], esi
	mov	DWORD PTR _wc$[esp+484], esi
	call	edi
; Line 316
	push	101					; 00000065H
	push	esi
	mov	DWORD PTR _wc$[esp+492], eax
	call	edi
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
; Line 317
	push	32512					; 00007f00H
	push	esi
	mov	DWORD PTR _wc$[esp+496], eax
	call	DWORD PTR __imp__LoadCursorA@8
; Line 320
	mov	ecx, DWORD PTR _SG_title
; Line 321
	lea	edx, DWORD PTR _wc$[esp+468]
	push	edx
	mov	DWORD PTR _wc$[esp+496], eax
	mov	DWORD PTR _wc$[esp+500], 6
	mov	DWORD PTR _wc$[esp+504], esi
	mov	DWORD PTR _wc$[esp+508], ecx
	call	DWORD PTR __imp__RegisterClassA@4
; Line 323
	push	esi
	push	esi
	call	edi
	mov	edx, DWORD PTR _winRect$[esp+476]
	mov	ecx, DWORD PTR _winRect$[esp+480]
	mov	edi, DWORD PTR _winRect$[esp+472]
	push	eax
	mov	eax, DWORD PTR _winRect$[esp+488]
	push	esi
	sub	eax, edx
	push	esi
	sub	ecx, edi
	push	eax
	mov	eax, DWORD PTR _SG_title
	push	ecx
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	13565952				; 00cf0000H
	push	eax
	push	eax
	push	esi
	call	DWORD PTR __imp__CreateWindowExA@48
; Line 324
	push	5
	push	eax
	mov	DWORD PTR _hwnd, eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 325
	mov	edx, DWORD PTR _hwnd
	push	edx
	call	DWORD PTR __imp__UpdateWindow@4
; Line 327
	mov	eax, DWORD PTR _hwnd
	push	OFFSET FLAT:_rectScreen
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 329
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 331
	fild	DWORD PTR _window_width
; Line 334
	push	OFFSET FLAT:_rectScreen
	fdivr	QWORD PTR __real@8@4007a000000000000000
	fstp	DWORD PTR _mouseFactorX
	fild	DWORD PTR _window_height
	fdivr	QWORD PTR __real@8@4006c800000000000000
	fstp	DWORD PTR _mouseFactorY
	call	DWORD PTR __imp__ClipCursor@4
; Line 336
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 337
	push	1
	push	esi
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	DWORD PTR __imp__timeSetEvent@20
; Line 338
	mov	ecx, 256				; 00000100H
	xor	eax, eax
	mov	edi, OFFSET FLAT:_keys
	rep stosd
; Line 342
	call	_init_sound
; Line 344
	cmp	DWORD PTR _SOUND_ENABLE, esi
	je	$L22187
; Line 345
	call	DWORD PTR __imp__waveOutGetNumDevs@0
; Line 346
	push	esi
	push	8
	push	1
	push	22050					; 00005622H
	push	22050					; 00005622H
	push	1
	push	1
	push	OFFSET FLAT:_global_wave
	mov	edi, eax
	call	_initWave
	add	esp, 32					; 00000020H
; Line 348
	cmp	edi, esi
	je	SHORT $L22191
; Line 349
	mov	edi, DWORD PTR __imp__waveOutOpen@24
	push	196608					; 00030000H
	push	esi
	push	OFFSET FLAT:_sound_callback@20
	push	OFFSET FLAT:_global_wave
	push	-1
	push	OFFSET FLAT:_global_hWaveOut
	call	edi
	test	eax, eax
	je	SHORT $L22191
$L22190:
	push	196608					; 00030000H
	push	esi
	push	OFFSET FLAT:_sound_callback@20
	push	OFFSET FLAT:_global_wave
	push	-1
	push	OFFSET FLAT:_global_hWaveOut
	call	edi
	test	eax, eax
	jne	SHORT $L22190
$L22191:
; Line 352
	mov	ecx, DWORD PTR _buffer1
	push	ecx
	push	OFFSET FLAT:_waveHdrA
	call	_win_initialize_wave
; Line 353
	mov	edx, DWORD PTR _buffer2
	push	edx
	push	OFFSET FLAT:_waveHdrB
	call	_win_initialize_wave
	add	esp, 16					; 00000010H
$L22187:
; Line 356
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	ebx
; Line 357
	push	eax
	mov	DWORD PTR _globalHdc, eax
	call	DWORD PTR __imp__CreateCompatibleDC@4
	pop	edi
	pop	esi
	mov	DWORD PTR _hdc_bmp, eax
	pop	ebx
; Line 358
	add	esp, 456				; 000001c8H
	ret	0
_SG_Init ENDP
_TEXT	ENDS
PUBLIC	_SG_ReadMouse
EXTRN	__imp__GetCursorPos@4:NEAR
EXTRN	__imp__ScreenToClient@8:NEAR
EXTRN	__ftol:NEAR
;	COMDAT _SG_ReadMouse
_TEXT	SEGMENT
_mouse$ = 8
_p$ = -8
_SG_ReadMouse PROC NEAR					; COMDAT
; Line 360
	sub	esp, 8
; Line 362
	lea	eax, DWORD PTR _p$[esp+8]
	push	esi
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 363
	mov	edx, DWORD PTR _hwnd
	lea	ecx, DWORD PTR _p$[esp+12]
	push	ecx
	push	edx
	call	DWORD PTR __imp__ScreenToClient@8
; Line 364
	fild	DWORD PTR _p$[esp+12]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	esi, DWORD PTR _mouse$[esp+8]
; Line 365
	fild	DWORD PTR _p$[esp+16]
	mov	WORD PTR [esi], ax
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	WORD PTR [esi+2], ax
; Line 366
	mov	eax, DWORD PTR _mouseDownLeft
	mov	DWORD PTR [esi+4], eax
; Line 367
	mov	ecx, DWORD PTR _mouseDownRight
	mov	DWORD PTR [esi+8], ecx
	pop	esi
; Line 368
	add	esp, 8
	ret	0
_SG_ReadMouse ENDP
_TEXT	ENDS
PUBLIC	_SG_KeyDown
;	COMDAT _SG_KeyDown
_TEXT	SEGMENT
_key$ = 8
_SG_KeyDown PROC NEAR					; COMDAT
; Line 371
	mov	eax, DWORD PTR _key$[esp-4]
	and	eax, 255				; 000000ffH
	mov	eax, DWORD PTR _keys[eax*4]
; Line 372
	ret	0
_SG_KeyDown ENDP
_TEXT	ENDS
PUBLIC	_SG_DrawFrame
EXTRN	__imp__InvalidateRect@12:NEAR
;	COMDAT _SG_DrawFrame
_TEXT	SEGMENT
_SG_DrawFrame PROC NEAR					; COMDAT
; Line 375
	mov	eax, DWORD PTR _hwnd
	push	0
	push	0
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 376
	ret	0
_SG_DrawFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_SetPaletteIndex
EXTRN	__imp__DeleteDC@4:NEAR
EXTRN	__imp__SetDIBColorTable@16:NEAR
;	COMDAT _SG_SetPaletteIndex
_TEXT	SEGMENT
_index$ = 8
_r$ = 12
_g$ = 16
_b$ = 20
_col$ = 12
_SG_SetPaletteIndex PROC NEAR				; COMDAT
; Line 380
	mov	eax, DWORD PTR _bmi
	push	esi
	push	edi
; Line 382
	push	0
	lea	edi, DWORD PTR [eax+40]
	call	DWORD PTR __imp__CreateCompatibleDC@4
; Line 383
	mov	ecx, DWORD PTR _backBitmap
	mov	esi, eax
	push	ecx
	push	esi
	call	DWORD PTR __imp__SelectObject@8
; Line 385
	mov	al, BYTE PTR _g$[esp+4]
; Line 386
	mov	cl, BYTE PTR _b$[esp+4]
	mov	dl, BYTE PTR _r$[esp+4]
	mov	BYTE PTR _col$[esp+5], al
; Line 387
	mov	eax, DWORD PTR _index$[esp+4]
	mov	BYTE PTR _col$[esp+4], cl
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _col$[esp+6], dl
	mov	edx, DWORD PTR _col$[esp+4]
	lea	ecx, DWORD PTR [edi+eax*4]
; Line 388
	push	ecx
	push	1
	push	eax
	push	esi
	mov	DWORD PTR [ecx], edx
	call	DWORD PTR __imp__SetDIBColorTable@16
; Line 389
	push	esi
	call	DWORD PTR __imp__DeleteDC@4
	pop	edi
	pop	esi
; Line 390
	ret	0
_SG_SetPaletteIndex ENDP
_TEXT	ENDS
PUBLIC	_SG_GetTicks
EXTRN	__imp__timeGetTime@0:NEAR
;	COMDAT _SG_GetTicks
_TEXT	SEGMENT
_SG_GetTicks PROC NEAR					; COMDAT
; Line 404
	jmp	DWORD PTR __imp__timeGetTime@0
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
; Line 417
	mov	eax, DWORD PTR _newFrame
	sub	esp, 28					; 0000001cH
	test	eax, eax
	jne	SHORT $L22371
	push	ebx
	mov	ebx, DWORD PTR __imp__DispatchMessageA@4
	push	esi
	mov	esi, DWORD PTR __imp__PeekMessageA@20
	push	edi
	mov	edi, DWORD PTR __imp__TranslateMessage@4
$L22210:
; Line 418
	mov	eax, DWORD PTR _hwnd
	push	1
	push	0
	push	0
	lea	ecx, DWORD PTR _Msg$[esp+52]
	push	eax
	push	ecx
	call	esi
	test	eax, eax
	je	SHORT $L22212
; Line 419
	lea	edx, DWORD PTR _Msg$[esp+40]
	push	edx
	call	edi
; Line 420
	lea	eax, DWORD PTR _Msg$[esp+40]
	push	eax
	call	ebx
$L22212:
	mov	eax, DWORD PTR _newFrame
	test	eax, eax
	je	SHORT $L22210
	pop	edi
	pop	esi
; Line 424
	mov	DWORD PTR _newFrame, 0
	pop	ebx
; Line 425
	add	esp, 28					; 0000001cH
	ret	0
$L22371:
; Line 424
	mov	DWORD PTR _newFrame, 0
; Line 425
	add	esp, 28					; 0000001cH
	ret	0
_SG_WaitBlank ENDP
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
; Line 428
	call	_SG_WelcomeMessage
; Line 429
	mov	eax, DWORD PTR _argv$[esp-4]
	mov	ecx, DWORD PTR _argc$[esp-4]
	push	eax
	push	ecx
	call	_SG_Init
	add	esp, 8
; Line 430
	call	_SG_InitPalette
; Line 431
	call	_title_init
$L22220:
; Line 434
	call	_SG_Tick
; Line 433
	jmp	SHORT $L22220
_main	ENDP
_TEXT	ENDS
END
