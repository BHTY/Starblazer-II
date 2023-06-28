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
PUBLIC	_global_hWaveOut
_DATA	SEGMENT
COMM	_frontbuffer:DWORD
COMM	_mplayer_addr:DWORD
COMM	_hwnd:DWORD
COMM	_bmi:DWORD
COMM	_backBitmap:DWORD
COMM	_hPalette:DWORD
COMM	_rectScreen:BYTE:010H
_DATA	ENDS
_BSS	SEGMENT
_newFrame DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_window_height:DWORD
COMM	_window_width:DWORD
COMM	_mouseFactorX:DWORD
COMM	_mouseFactorY:DWORD
_DATA	ENDS
_BSS	SEGMENT
_mouseDownLeft DB 01H DUP (?)
	ALIGN	4

_mouseDownRight DB 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_keys:BYTE:0100H
COMM	_server_connection:DWORD
COMM	_server_addr:BYTE:010H
COMM	_size_response:DWORD
COMM	_waveHdrA:BYTE:020H
COMM	_waveHdrB:BYTE:020H
COMM	_global_wave:BYTE:012H
_DATA	ENDS
_BSS	SEGMENT
	ALIGN	4

_global_hWaveOut DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
_SG_platform DD	FLAT:$SG21993
_SG_title DD	FLAT:$SG21995
_PORT	DD	0270fH
_OTHER_PORT DD	05ba0H
$SG21993 DB	'win32', 00H
	ORG $+2
$SG21995 DB	'Starblazer II for Windows 95', 00H
_DATA	ENDS
PUBLIC	_SG_CloseConnection
PUBLIC	_WndProc@16
PUBLIC	__real@8@4007a000000000000000
PUBLIC	__real@8@4006c800000000000000
EXTRN	__imp__ExitProcess@4:NEAR
EXTRN	__imp__GetDC@4:NEAR
EXTRN	__imp__ReleaseDC@8:NEAR
EXTRN	__imp__CreateCompatibleDC@4:NEAR
EXTRN	__imp__GetWindowRect@8:NEAR
EXTRN	__imp__DeleteDC@4:NEAR
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
_TEXT	SEGMENT
_hWnd$ = 8
_msg$ = 12
_wParam$ = 16
_lParam$ = 20
_hdc$ = -8
_hdc_bmp$ = -4
_old_bmp$ = -12
_WndProc@16 PROC NEAR
; File src\star_win.c
; Line 51
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 56
	mov	eax, DWORD PTR _msg$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	cmp	DWORD PTR -16+[ebp], 256		; 00000100H
	ja	SHORT $L22205
	cmp	DWORD PTR -16+[ebp], 256		; 00000100H
	je	$L22025
	mov	ecx, DWORD PTR -16+[ebp]
	sub	ecx, 2
	mov	DWORD PTR -16+[ebp], ecx
	cmp	DWORD PTR -16+[ebp], 16			; 00000010H
	ja	$L22033
	mov	eax, DWORD PTR -16+[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR $L22211[eax]
	jmp	DWORD PTR $L22212[edx*4]
$L22205:
	cmp	DWORD PTR -16+[ebp], 514		; 00000202H
	ja	SHORT $L22206
	cmp	DWORD PTR -16+[ebp], 514		; 00000202H
	je	$L22030
	cmp	DWORD PTR -16+[ebp], 257		; 00000101H
	je	$L22026
	cmp	DWORD PTR -16+[ebp], 513		; 00000201H
	je	$L22029
	jmp	$L22033
$L22206:
	cmp	DWORD PTR -16+[ebp], 516		; 00000204H
	je	$L22031
	cmp	DWORD PTR -16+[ebp], 517		; 00000205H
	je	$L22032
	jmp	$L22033
$L22022:
; Line 58
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 59
	call	_SG_CloseConnection
; Line 60
	jmp	$L22019
$L22023:
; Line 64
	mov	ecx, DWORD PTR _hWnd$[ebp]
	push	ecx
	call	DWORD PTR __imp__DestroyWindow@4
; Line 65
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 66
	call	_SG_CloseConnection
; Line 67
	jmp	$L22019
$L22024:
; Line 71
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 72
	call	_SG_CloseConnection
; Line 73
	jmp	$L22019
$L22025:
; Line 77
	mov	edx, DWORD PTR _wParam$[ebp]
	and	edx, 255				; 000000ffH
	mov	BYTE PTR _keys[edx], 1
; Line 78
	jmp	$L22019
$L22026:
; Line 82
	mov	eax, DWORD PTR _wParam$[ebp]
	and	eax, 255				; 000000ffH
	mov	BYTE PTR _keys[eax], 0
; Line 83
	jmp	$L22019
$L22027:
; Line 87
	mov	ecx, DWORD PTR _lParam$[ebp]
	and	ecx, 65535				; 0000ffffH
	mov	DWORD PTR _window_width, ecx
; Line 88
	mov	edx, DWORD PTR _lParam$[ebp]
	and	edx, -65536				; ffff0000H
	shr	edx, 16					; 00000010H
	mov	DWORD PTR _window_height, edx
; Line 89
	fild	DWORD PTR _window_width
	fdivr	QWORD PTR __real@8@4007a000000000000000
	fstp	DWORD PTR _mouseFactorX
; Line 90
	fild	DWORD PTR _window_height
	fdivr	QWORD PTR __real@8@4006c800000000000000
	fstp	DWORD PTR _mouseFactorY
; Line 91
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 92
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 93
	jmp	$L22019
$L22028:
; Line 97
	mov	ecx, DWORD PTR _hWnd$[ebp]
	push	ecx
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdc$[ebp], eax
; Line 98
	mov	edx, DWORD PTR _hdc$[ebp]
	push	edx
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _hdc_bmp$[ebp], eax
; Line 99
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	ecx, DWORD PTR _hdc_bmp$[ebp]
	push	ecx
	call	DWORD PTR __imp__SelectObject@8
	mov	DWORD PTR _old_bmp$[ebp], eax
; Line 100
	push	13369376				; 00cc0020H
	push	200					; 000000c8H
	push	320					; 00000140H
	push	0
	push	0
	mov	edx, DWORD PTR _hdc_bmp$[ebp]
	push	edx
	mov	eax, DWORD PTR _window_height
	push	eax
	mov	ecx, DWORD PTR _window_width
	push	ecx
	push	0
	push	0
	mov	edx, DWORD PTR _hdc$[ebp]
	push	edx
	call	DWORD PTR __imp__StretchBlt@44
; Line 101
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hdc$[ebp]
	push	ecx
	call	DWORD PTR __imp__SelectObject@8
; Line 102
	mov	edx, DWORD PTR _hdc_bmp$[ebp]
	push	edx
	call	DWORD PTR __imp__DeleteDC@4
; Line 103
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteObject@4
; Line 104
	mov	ecx, DWORD PTR _hdc$[ebp]
	push	ecx
	mov	edx, DWORD PTR _hWnd$[ebp]
	push	edx
	call	DWORD PTR __imp__ReleaseDC@8
; Line 105
	jmp	SHORT $L22019
$L22029:
; Line 109
	mov	BYTE PTR _mouseDownLeft, 1
; Line 110
	jmp	SHORT $L22019
$L22030:
; Line 114
	mov	BYTE PTR _mouseDownLeft, 0
; Line 115
	jmp	SHORT $L22019
$L22031:
; Line 119
	mov	BYTE PTR _mouseDownRight, 1
; Line 120
	jmp	SHORT $L22019
$L22032:
; Line 124
	mov	BYTE PTR _mouseDownRight, 0
; Line 125
	jmp	SHORT $L22019
$L22033:
; Line 129
	mov	eax, DWORD PTR _lParam$[ebp]
	push	eax
	mov	ecx, DWORD PTR _wParam$[ebp]
	push	ecx
	mov	edx, DWORD PTR _msg$[ebp]
	push	edx
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DefWindowProcA@16
$L22019:
; Line 132
	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
$L22212:
	DD	$L22022
	DD	$L22027
	DD	$L22028
	DD	$L22023
	DD	$L22024
	DD	$L22033
$L22211:
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
_TEXT	SEGMENT
_mmproc@20 PROC NEAR
; Line 134
	push	ebp
	mov	ebp, esp
; Line 135
	mov	DWORD PTR _newFrame, 1
; Line 136
	pop	ebp
	ret	20					; 00000014H
_mmproc@20 ENDP
_TEXT	ENDS
PUBLIC	_initWaveHeader
_TEXT	SEGMENT
_wvHdr$ = 8
_lpData$ = 12
_dwBufferLength$ = 16
_dwBytesRecorded$ = 20
_dwUser$ = 24
_dwFlags$ = 28
_dwLoops$ = 32
_initWaveHeader PROC NEAR
; Line 138
	push	ebp
	mov	ebp, esp
; Line 139
	mov	eax, DWORD PTR _wvHdr$[ebp]
	mov	ecx, DWORD PTR _lpData$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 140
	mov	edx, DWORD PTR _wvHdr$[ebp]
	mov	eax, DWORD PTR _dwBufferLength$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 141
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	edx, DWORD PTR _dwBytesRecorded$[ebp]
	mov	DWORD PTR [ecx+8], edx
; Line 142
	mov	eax, DWORD PTR _wvHdr$[ebp]
	mov	ecx, DWORD PTR _dwUser$[ebp]
	mov	DWORD PTR [eax+12], ecx
; Line 143
	mov	edx, DWORD PTR _wvHdr$[ebp]
	mov	eax, DWORD PTR _dwFlags$[ebp]
	mov	DWORD PTR [edx+16], eax
; Line 144
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	edx, DWORD PTR _dwLoops$[ebp]
	mov	DWORD PTR [ecx+20], edx
; Line 145
	pop	ebp
	ret	0
_initWaveHeader ENDP
_TEXT	ENDS
PUBLIC	_initWave
_TEXT	SEGMENT
_wave$ = 8
_wFormatTag$ = 12
_nChannels$ = 16
_nSamplesPerSec$ = 20
_nAvgBytesPerSec$ = 24
_nBlockAlign$ = 28
_wBitsPerSample$ = 32
_cbSize$ = 36
_initWave PROC NEAR
; Line 147
	push	ebp
	mov	ebp, esp
; Line 148
	mov	eax, DWORD PTR _wave$[ebp]
	mov	cx, WORD PTR _wFormatTag$[ebp]
	mov	WORD PTR [eax], cx
; Line 149
	mov	edx, DWORD PTR _wave$[ebp]
	mov	ax, WORD PTR _nChannels$[ebp]
	mov	WORD PTR [edx+2], ax
; Line 150
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	edx, DWORD PTR _nSamplesPerSec$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 151
	mov	eax, DWORD PTR _wave$[ebp]
	mov	ecx, DWORD PTR _nAvgBytesPerSec$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 152
	mov	edx, DWORD PTR _wave$[ebp]
	mov	ax, WORD PTR _nBlockAlign$[ebp]
	mov	WORD PTR [edx+12], ax
; Line 153
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	dx, WORD PTR _wBitsPerSample$[ebp]
	mov	WORD PTR [ecx+14], dx
; Line 154
	mov	eax, DWORD PTR _wave$[ebp]
	mov	cx, WORD PTR _cbSize$[ebp]
	mov	WORD PTR [eax+16], cx
; Line 155
	pop	ebp
	ret	0
_initWave ENDP
_TEXT	ENDS
PUBLIC	_init_networking
EXTRN	_printf:NEAR
EXTRN	_exit:NEAR
EXTRN	_WSAStartup@8:NEAR
EXTRN	_WSAGetLastError@0:NEAR
_DATA	SEGMENT
	ORG $+3
$SG22065 DB	'WSAStartup failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_winsock_version$ = -4
_winsock_data$ = -404
$T22218 = 8
_init_networking PROC NEAR
; Line 157
	push	ebp
	mov	ebp, esp
	sub	esp, 404				; 00000194H
	push	esi
	push	edi
; Line 158
	mov	WORD PTR _winsock_version$[ebp], 514	; 00000202H
; Line 161
	lea	eax, DWORD PTR _winsock_data$[ebp]
	push	eax
	mov	cx, WORD PTR _winsock_version$[ebp]
	push	ecx
	call	_WSAStartup@8
	test	eax, eax
	je	SHORT $L22064
; Line 163
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG22065
	call	_printf
	add	esp, 8
; Line 164
	push	0
	call	_exit
	add	esp, 4
$L22064:
; Line 167
	mov	ecx, 100				; 00000064H
	lea	esi, DWORD PTR _winsock_data$[ebp]
	mov	edi, DWORD PTR $T22218[ebp]
	rep movsd
	mov	eax, DWORD PTR $T22218[ebp]
; Line 168
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_init_networking ENDP
_TEXT	ENDS
PUBLIC	_win_initialize_wave
EXTRN	__imp__waveOutPrepareHeader@12:NEAR
EXTRN	__imp__waveOutUnprepareHeader@12:NEAR
EXTRN	__imp__waveOutWrite@12:NEAR
_TEXT	SEGMENT
_wvHdr$ = 8
_buf$ = 12
_win_initialize_wave PROC NEAR
; Line 182
	push	ebp
	mov	ebp, esp
; Line 183
	push	0
	push	0
	push	0
	push	0
	push	1024					; 00000400H
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	push	ecx
	call	_initWaveHeader
	add	esp, 28					; 0000001cH
; Line 184
	push	32					; 00000020H
	mov	edx, DWORD PTR _wvHdr$[ebp]
	push	edx
	mov	eax, DWORD PTR _global_hWaveOut
	push	eax
	call	DWORD PTR __imp__waveOutPrepareHeader@12
; Line 185
	push	32					; 00000020H
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _global_hWaveOut
	push	edx
	call	DWORD PTR __imp__waveOutWrite@12
; Line 186
	push	32					; 00000020H
	mov	eax, DWORD PTR _wvHdr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _global_hWaveOut
	push	ecx
	call	DWORD PTR __imp__waveOutUnprepareHeader@12
; Line 187
	pop	ebp
	ret	0
_win_initialize_wave ENDP
_TEXT	ENDS
PUBLIC	_sound_callback@20
EXTRN	_buffer1:DWORD
EXTRN	_buffer2:DWORD
EXTRN	_current_buffer:DWORD
EXTRN	_mix:NEAR
_TEXT	SEGMENT
_msg$ = 12
_sound_callback@20 PROC NEAR
; Line 189
	push	ebp
	mov	ebp, esp
; Line 190
	cmp	DWORD PTR _msg$[ebp], 955		; 000003bbH
	jne	SHORT $L22086
; Line 191
	jmp	SHORT $L22085
$L22086:
; Line 194
	cmp	DWORD PTR _current_buffer, 0
	jne	SHORT $L22087
; Line 195
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
	call	_win_initialize_wave
	add	esp, 8
; Line 196
	jmp	SHORT $L22088
$L22087:
; Line 197
	mov	ecx, DWORD PTR _buffer2
	push	ecx
	push	OFFSET FLAT:_waveHdrB
	call	_win_initialize_wave
	add	esp, 8
$L22088:
; Line 200
	call	_mix
; Line 201
	xor	edx, edx
	cmp	DWORD PTR _current_buffer, 0
	sete	dl
	mov	DWORD PTR _current_buffer, edx
$L22085:
; Line 203
	pop	ebp
	ret	20					; 00000014H
_sound_callback@20 ENDP
_TEXT	ENDS
PUBLIC	_SG_OpenConnection
EXTRN	_ioctlsocket@12:NEAR
EXTRN	_htons@4:NEAR
EXTRN	_socket@12:NEAR
_TEXT	SEGMENT
_iMode$ = -4
_SG_OpenConnection PROC NEAR
; Line 207
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 208
	mov	DWORD PTR _iMode$[ebp], 1
; Line 210
	mov	WORD PTR _server_addr, 2
; Line 211
	mov	ax, WORD PTR _PORT
	push	eax
	call	_htons@4
	mov	WORD PTR _server_addr+2, ax
; Line 212
	mov	ecx, DWORD PTR _mplayer_addr
	mov	DWORD PTR _server_addr+4, ecx
; Line 214
	push	17					; 00000011H
	push	2
	push	2
	call	_socket@12
	mov	DWORD PTR _server_connection, eax
; Line 216
	cmp	DWORD PTR _server_connection, -1
	jne	SHORT $L22093
; Line 217
	xor	al, al
	jmp	SHORT $L22091
$L22093:
; Line 220
	lea	edx, DWORD PTR _iMode$[ebp]
	push	edx
	push	-2147195266				; 8004667eH
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_ioctlsocket@12
; Line 222
	mov	al, 1
$L22091:
; Line 223
	mov	esp, ebp
	pop	ebp
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
; Line 225
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 226
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _server_connection
	push	edx
	call	_recvfrom@24
	mov	DWORD PTR _return_value$[ebp], eax
; Line 228
	cmp	DWORD PTR _return_value$[ebp], -1
	jne	SHORT $L22098
; Line 229
	xor	eax, eax
	jmp	SHORT $L22099
$L22098:
; Line 232
	mov	eax, DWORD PTR _return_value$[ebp]
$L22099:
; Line 234
	mov	esp, ebp
	pop	ebp
	ret	0
_SG_RecievePacket ENDP
_TEXT	ENDS
PUBLIC	_SG_SendPacket
EXTRN	_sendto@24:NEAR
_TEXT	SEGMENT
_buf$ = 8
_num_bytes$ = 12
_SG_SendPacket PROC NEAR
; Line 236
	push	ebp
	mov	ebp, esp
; Line 237
	push	16					; 00000010H
	push	OFFSET FLAT:_server_addr
	push	0
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	ecx, DWORD PTR _buf$[ebp]
	push	ecx
	mov	edx, DWORD PTR _server_connection
	push	edx
	call	_sendto@24
; Line 238
	pop	ebp
	ret	0
_SG_SendPacket ENDP
_TEXT	ENDS
EXTRN	_closesocket@4:NEAR
_TEXT	SEGMENT
_SG_CloseConnection PROC NEAR
; Line 240
	push	ebp
	mov	ebp, esp
; Line 241
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_closesocket@4
; Line 242
	pop	ebp
	ret	0
_SG_CloseConnection ENDP
_TEXT	ENDS
PUBLIC	_SG_TempLoadConfig
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	_inet_addr@4:NEAR
_DATA	SEGMENT
	ORG $+2
$SG22115 DB	'r', 00H
	ORG $+2
$SG22116 DB	'config.ini', 00H
	ORG $+1
$SG22117 DB	'addr= %s', 0aH, 00H
	ORG $+2
$SG22118 DB	'port= %d', 0aH, 00H
	ORG $+2
$SG22119 DB	'name= %s', 0aH, 00H
	ORG $+2
$SG22120 DB	'pin= %s', 0aH, 00H
	ORG $+3
$SG22121 DB	'x= %d', 0aH, 00H
	ORG $+1
$SG22122 DB	'y= %d', 0aH, 00H
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
; Line 244
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
; Line 247
	push	OFFSET FLAT:$SG22115
	push	OFFSET FLAT:$SG22116
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 248
	lea	eax, DWORD PTR _taddr$[ebp]
	push	eax
	push	OFFSET FLAT:$SG22117
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 249
	mov	edx, DWORD PTR _port$[ebp]
	push	edx
	push	OFFSET FLAT:$SG22118
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 250
	mov	ecx, DWORD PTR _name$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG22119
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 251
	mov	eax, DWORD PTR _pin$[ebp]
	push	eax
	push	OFFSET FLAT:$SG22120
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 252
	mov	edx, DWORD PTR _x$[ebp]
	push	edx
	push	OFFSET FLAT:$SG22121
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 253
	mov	ecx, DWORD PTR _y$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG22122
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 254
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 256
	lea	ecx, DWORD PTR _taddr$[ebp]
	push	ecx
	call	_inet_addr@4
	mov	edx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR [edx], eax
; Line 257
	mov	esp, ebp
	pop	ebp
	ret	0
_SG_TempLoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_Init
EXTRN	__imp__timeSetEvent@20:NEAR
EXTRN	__imp__timeBeginPeriod@4:NEAR
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	_SG_GameInit:NEAR
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	__imp__AdjustWindowRect@12:NEAR
EXTRN	_FBPTR:DWORD
EXTRN	__imp__RegisterClassA@4:NEAR
EXTRN	_memset:NEAR
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
_TEXT	SEGMENT
_num_devs$ = -64
_winRect$ = -56
_hdcScreen$ = -60
_wc$ = -40
$T22227 = -464
_SG_Init PROC NEAR
; Line 266
	push	ebp
	mov	ebp, esp
	sub	esp, 464				; 000001d0H
; Line 273
	call	_SG_GameInit
; Line 275
	push	OFFSET FLAT:_GAME_SETTINGS+30
	push	OFFSET FLAT:_GAME_SETTINGS+14
	push	OFFSET FLAT:_OTHER_PORT
	push	OFFSET FLAT:_PORT
	push	OFFSET FLAT:_window_height
	push	OFFSET FLAT:_window_width
	push	OFFSET FLAT:_mplayer_addr
	call	_SG_TempLoadConfig
	add	esp, 28					; 0000001cH
; Line 277
	lea	eax, DWORD PTR $T22227[ebp]
	push	eax
	call	_init_networking
	add	esp, 4
; Line 282
	mov	DWORD PTR _winRect$[ebp], 0
; Line 283
	mov	DWORD PTR _winRect$[ebp+4], 0
; Line 284
	mov	ecx, DWORD PTR _window_height
	mov	DWORD PTR _winRect$[ebp+12], ecx
; Line 285
	mov	edx, DWORD PTR _window_width
	mov	DWORD PTR _winRect$[ebp+8], edx
; Line 287
	push	0
	push	13565952				; 00cf0000H
	lea	eax, DWORD PTR _winRect$[ebp]
	push	eax
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 289
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 291
	mov	ecx, DWORD PTR _bmi
	mov	DWORD PTR [ecx], 40			; 00000028H
; Line 292
	mov	edx, DWORD PTR _bmi
	mov	DWORD PTR [edx+4], 320			; 00000140H
; Line 293
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 294
	mov	ecx, DWORD PTR _bmi
	mov	WORD PTR [ecx+12], 1
; Line 295
	mov	edx, DWORD PTR _bmi
	mov	WORD PTR [edx+14], 8
; Line 296
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 297
	mov	ecx, DWORD PTR _bmi
	mov	DWORD PTR [ecx+16], 0
; Line 299
	push	0
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdcScreen$[ebp], eax
; Line 300
	push	0
	push	0
	push	OFFSET FLAT:_frontbuffer
	push	0
	mov	edx, DWORD PTR _bmi
	push	edx
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateDIBSection@24
	mov	DWORD PTR _backBitmap, eax
; Line 301
	mov	ecx, DWORD PTR _hdcScreen$[ebp]
	push	ecx
	push	0
	call	DWORD PTR __imp__ReleaseDC@8
; Line 303
	mov	DWORD PTR _wc$[ebp], 0
; Line 304
	mov	DWORD PTR _wc$[ebp+4], OFFSET FLAT:_WndProc@16
; Line 305
	mov	DWORD PTR _wc$[ebp+8], 0
; Line 306
	mov	DWORD PTR _wc$[ebp+12], 0
; Line 307
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[ebp+16], eax
; Line 308
	push	101					; 00000065H
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[ebp+20], eax
; Line 309
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadCursorA@8
	mov	DWORD PTR _wc$[ebp+24], eax
; Line 310
	mov	DWORD PTR _wc$[ebp+28], 6
; Line 311
	mov	DWORD PTR _wc$[ebp+32], 0
; Line 312
	mov	edx, DWORD PTR _SG_title
	mov	DWORD PTR _wc$[ebp+36], edx
; Line 313
	lea	eax, DWORD PTR _wc$[ebp]
	push	eax
	call	DWORD PTR __imp__RegisterClassA@4
; Line 315
	push	0
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	push	0
	push	0
	mov	ecx, DWORD PTR _winRect$[ebp+12]
	sub	ecx, DWORD PTR _winRect$[ebp+4]
	push	ecx
	mov	edx, DWORD PTR _winRect$[ebp+8]
	sub	edx, DWORD PTR _winRect$[ebp]
	push	edx
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	13565952				; 00cf0000H
	mov	eax, DWORD PTR _SG_title
	push	eax
	mov	ecx, DWORD PTR _SG_title
	push	ecx
	push	0
	call	DWORD PTR __imp__CreateWindowExA@48
	mov	DWORD PTR _hwnd, eax
; Line 316
	push	5
	mov	edx, DWORD PTR _hwnd
	push	edx
	call	DWORD PTR __imp__ShowWindow@8
; Line 317
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4
; Line 319
	push	OFFSET FLAT:_rectScreen
	mov	ecx, DWORD PTR _hwnd
	push	ecx
	call	DWORD PTR __imp__GetWindowRect@8
; Line 321
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 323
	fild	DWORD PTR _window_width
	fdivr	QWORD PTR __real@8@4007a000000000000000
	fstp	DWORD PTR _mouseFactorX
; Line 324
	fild	DWORD PTR _window_height
	fdivr	QWORD PTR __real@8@4006c800000000000000
	fstp	DWORD PTR _mouseFactorY
; Line 326
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 328
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 329
	push	1
	push	0
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	DWORD PTR __imp__timeSetEvent@20
; Line 330
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_keys
	call	_memset
	add	esp, 12					; 0000000cH
; Line 334
	call	_init_sound
; Line 335
	call	DWORD PTR __imp__waveOutGetNumDevs@0
	mov	DWORD PTR _num_devs$[ebp], eax
; Line 336
	push	0
	push	8
	push	1
	push	22050					; 00005622H
	push	22050					; 00005622H
	push	1
	push	1
	push	OFFSET FLAT:_global_wave
	call	_initWave
	add	esp, 32					; 00000020H
; Line 338
	cmp	DWORD PTR _num_devs$[ebp], 0
	je	SHORT $L22134
$L22133:
; Line 339
	push	196608					; 00030000H
	push	0
	push	OFFSET FLAT:_sound_callback@20
	push	OFFSET FLAT:_global_wave
	push	-1
	push	OFFSET FLAT:_global_hWaveOut
	call	DWORD PTR __imp__waveOutOpen@24
	test	eax, eax
	je	SHORT $L22134
	jmp	SHORT $L22133
$L22134:
; Line 342
	mov	edx, DWORD PTR _buffer1
	push	edx
	push	OFFSET FLAT:_waveHdrA
	call	_win_initialize_wave
	add	esp, 8
; Line 343
	mov	eax, DWORD PTR _buffer2
	push	eax
	push	OFFSET FLAT:_waveHdrB
	call	_win_initialize_wave
	add	esp, 8
; Line 344
	mov	esp, ebp
	pop	ebp
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
; Line 346
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 348
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 349
	lea	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _hwnd
	push	edx
	call	DWORD PTR __imp__ScreenToClient@8
; Line 350
	fild	DWORD PTR _p$[ebp]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx], ax
; Line 351
	fild	DWORD PTR _p$[ebp+4]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	edx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [edx+2], ax
; Line 352
	mov	eax, DWORD PTR _mouse$[ebp]
	mov	cl, BYTE PTR _mouseDownLeft
	mov	BYTE PTR [eax+4], cl
; Line 353
	mov	edx, DWORD PTR _mouse$[ebp]
	mov	al, BYTE PTR _mouseDownRight
	mov	BYTE PTR [edx+5], al
; Line 354
	mov	esp, ebp
	pop	ebp
	ret	0
_SG_ReadMouse ENDP
_TEXT	ENDS
PUBLIC	_SG_KeyDown
_TEXT	SEGMENT
_key$ = 8
_SG_KeyDown PROC NEAR
; Line 356
	push	ebp
	mov	ebp, esp
; Line 357
	mov	eax, DWORD PTR _key$[ebp]
	and	eax, 255				; 000000ffH
	mov	al, BYTE PTR _keys[eax]
; Line 358
	pop	ebp
	ret	0
_SG_KeyDown ENDP
_TEXT	ENDS
PUBLIC	_SG_DrawFrame
EXTRN	__imp__InvalidateRect@12:NEAR
_TEXT	SEGMENT
_SG_DrawFrame PROC NEAR
; Line 360
	push	ebp
	mov	ebp, esp
; Line 361
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 362
	pop	ebp
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
; Line 364
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 366
	mov	eax, DWORD PTR _bmi
	add	eax, 40					; 00000028H
	mov	DWORD PTR _willPalette$[ebp], eax
; Line 368
	push	0
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _tempHDC$[ebp], eax
; Line 369
	mov	ecx, DWORD PTR _backBitmap
	push	ecx
	mov	edx, DWORD PTR _tempHDC$[ebp]
	push	edx
	call	DWORD PTR __imp__SelectObject@8
; Line 370
	mov	al, BYTE PTR _r$[ebp]
	mov	BYTE PTR _col$[ebp+2], al
; Line 371
	mov	cl, BYTE PTR _g$[ebp]
	mov	BYTE PTR _col$[ebp+1], cl
; Line 372
	mov	dl, BYTE PTR _b$[ebp]
	mov	BYTE PTR _col$[ebp], dl
; Line 373
	mov	eax, DWORD PTR _index$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _willPalette$[ebp]
	mov	edx, DWORD PTR _col$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx
; Line 374
	mov	eax, DWORD PTR _index$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _willPalette$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	push	edx
	push	1
	mov	eax, DWORD PTR _index$[ebp]
	and	eax, 255				; 000000ffH
	push	eax
	mov	ecx, DWORD PTR _tempHDC$[ebp]
	push	ecx
	call	DWORD PTR __imp__SetDIBColorTable@16
; Line 375
	mov	edx, DWORD PTR _tempHDC$[ebp]
	push	edx
	call	DWORD PTR __imp__DeleteDC@4
; Line 376
	mov	esp, ebp
	pop	ebp
	ret	0
_SG_SetPaletteIndex ENDP
_TEXT	ENDS
PUBLIC	_SG_GetTicks
EXTRN	__imp__timeGetTime@0:NEAR
_TEXT	SEGMENT
_SG_GetTicks PROC NEAR
; Line 378
	push	ebp
	mov	ebp, esp
; Line 379
	call	DWORD PTR __imp__timeGetTime@0
; Line 380
	pop	ebp
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
; Line 382
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
$L22153:
; Line 385
	cmp	DWORD PTR _newFrame, 0
	jne	SHORT $L22154
; Line 386
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	lea	ecx, DWORD PTR _Msg$[ebp]
	push	ecx
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	SHORT $L22155
; Line 387
	lea	edx, DWORD PTR _Msg$[ebp]
	push	edx
	call	DWORD PTR __imp__TranslateMessage@4
; Line 388
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__DispatchMessageA@4
$L22155:
; Line 390
	jmp	SHORT $L22153
$L22154:
; Line 391
	mov	DWORD PTR _newFrame, 0
; Line 392
	mov	esp, ebp
	pop	ebp
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
; Line 394
	push	ebp
	mov	ebp, esp
; Line 395
	call	_SG_WelcomeMessage
; Line 396
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	ecx, DWORD PTR _argc$[ebp]
	push	ecx
	call	_SG_Init
	add	esp, 8
; Line 397
	call	_SG_InitPalette
; Line 398
	call	_title_init
$L22163:
; Line 400
	mov	edx, 1
	test	edx, edx
	je	SHORT $L22164
; Line 401
	call	_SG_Tick
; Line 402
	jmp	SHORT $L22163
$L22164:
; Line 403
	pop	ebp
	ret	0
_main	ENDP
_TEXT	ENDS
END
