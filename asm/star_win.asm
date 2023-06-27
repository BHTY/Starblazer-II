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
COMM	_window_height:DWORD
COMM	_window_width:DWORD
COMM	_mouseFactorX:DWORD
COMM	_mouseFactorY:DWORD
COMM	_keys:BYTE:0100H
COMM	_server_connection:DWORD
COMM	_server_addr:BYTE:010H
COMM	_size_response:DWORD
COMM	_waveHdrA:BYTE:020H
COMM	_waveHdrB:BYTE:020H
COMM	_global_wave:BYTE:012H
_SG_platform DD	FLAT:$SG19221
_SG_title DD	FLAT:$SG19223
_newFrame DD	00H
_mouseDownLeft DB 00H
	ORG $+3
_mouseDownRight DB 00H
	ORG $+3
_PORT	DD	0270fH
_OTHER_PORT DD	05ba0H
_global_hWaveOut DD 00H
$SG19221 DB	'win32', 00H
	ORG $+2
$SG19223 DB	'Starblazer II for Windows 95/NT', 00H
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
$T19435	DQ	04074000000000000r		; 320
$T19436	DQ	04069000000000000r		; 200
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
; Line 43
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 48
	mov	eax, DWORD PTR _msg$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L19246
; Line 49
$L19250:
; Line 50
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 51
	call	_SG_CloseConnection
; Line 52
	jmp	$L19247
; Line 55
$L19251:
; Line 56
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DestroyWindow@4
; Line 57
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 58
	call	_SG_CloseConnection
; Line 59
	jmp	$L19247
; Line 62
$L19252:
; Line 63
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 64
	call	_SG_CloseConnection
; Line 65
	jmp	$L19247
; Line 68
$L19253:
; Line 69
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 1
; Line 70
	jmp	$L19247
; Line 73
$L19254:
; Line 74
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 0
; Line 75
	jmp	$L19247
; Line 78
$L19255:
; Line 79
	mov	eax, DWORD PTR _lParam$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _window_width, eax
; Line 80
	mov	eax, DWORD PTR _lParam$[ebp]
	shr	eax, 16					; 00000010H
	mov	DWORD PTR _window_height, eax
; Line 81
	fld	QWORD PTR $T19435
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -20+[ebp], eax
	fidiv	DWORD PTR -20+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 82
	fld	QWORD PTR $T19436
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -24+[ebp], eax
	fidiv	DWORD PTR -24+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 83
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 84
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 85
	jmp	$L19247
; Line 88
$L19256:
; Line 89
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdc$[ebp], eax
; Line 90
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _hdc_bmp$[ebp], eax
; Line 91
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
	mov	DWORD PTR _old_bmp$[ebp], eax
; Line 92
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
; Line 93
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 94
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 95
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteObject@4
; Line 96
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__ReleaseDC@8
; Line 97
	jmp	$L19247
; Line 100
$L19257:
; Line 101
	mov	BYTE PTR _mouseDownLeft, 1
; Line 102
	jmp	$L19247
; Line 105
$L19258:
; Line 106
	mov	BYTE PTR _mouseDownLeft, 0
; Line 107
	jmp	$L19247
; Line 110
$L19259:
; Line 111
	mov	BYTE PTR _mouseDownRight, 1
; Line 112
	jmp	$L19247
; Line 115
$L19260:
; Line 116
	mov	BYTE PTR _mouseDownRight, 0
; Line 117
	jmp	$L19247
; Line 120
$L19261:
; Line 121
	mov	eax, DWORD PTR _lParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _wParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DefWindowProcA@16
	jmp	$L19242
; Line 123
	jmp	$L19247
$L19246:
	cmp	DWORD PTR -16+[ebp], 5
	ja	$L19432
	je	$L19255
	cmp	DWORD PTR -16+[ebp], 2
	je	$L19250
	jmp	$L19261
$L19432:
	cmp	DWORD PTR -16+[ebp], 256		; 00000100H
	ja	$L19433
	je	$L19253
	cmp	DWORD PTR -16+[ebp], 15			; 0000000fH
	je	$L19256
	cmp	DWORD PTR -16+[ebp], 16			; 00000010H
	je	$L19251
	cmp	DWORD PTR -16+[ebp], 18			; 00000012H
	je	$L19252
	jmp	$L19261
$L19433:
	cmp	DWORD PTR -16+[ebp], 513		; 00000201H
	ja	$L19434
	je	$L19257
	cmp	DWORD PTR -16+[ebp], 257		; 00000101H
	je	$L19254
	jmp	$L19261
$L19434:
	cmp	DWORD PTR -16+[ebp], 514		; 00000202H
	je	$L19258
	cmp	DWORD PTR -16+[ebp], 516		; 00000204H
	je	$L19259
	cmp	DWORD PTR -16+[ebp], 517		; 00000205H
	je	$L19260
	jmp	$L19261
$L19247:
; Line 124
$L19242:
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
; Line 126
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 127
	mov	DWORD PTR _newFrame, 1
; Line 128
$L19268:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
; Line 130
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 131
	mov	eax, DWORD PTR _lpData$[ebp]
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 132
	mov	eax, DWORD PTR _dwBufferLength$[ebp]
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 133
	mov	eax, DWORD PTR _dwBytesRecorded$[ebp]
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 134
	mov	eax, DWORD PTR _dwUser$[ebp]
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 135
	mov	eax, DWORD PTR _dwFlags$[ebp]
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 136
	mov	eax, DWORD PTR _dwLoops$[ebp]
	mov	ecx, DWORD PTR _wvHdr$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 137
$L19277:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
; Line 139
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 140
	mov	ax, WORD PTR _wFormatTag$[ebp]
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	WORD PTR [ecx], ax
; Line 141
	mov	ax, WORD PTR _nChannels$[ebp]
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	WORD PTR [ecx+2], ax
; Line 142
	mov	eax, DWORD PTR _nSamplesPerSec$[ebp]
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 143
	mov	eax, DWORD PTR _nAvgBytesPerSec$[ebp]
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 144
	mov	ax, WORD PTR _nBlockAlign$[ebp]
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	WORD PTR [ecx+12], ax
; Line 145
	mov	ax, WORD PTR _wBitsPerSample$[ebp]
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	WORD PTR [ecx+14], ax
; Line 146
	mov	ax, WORD PTR _cbSize$[ebp]
	mov	ecx, DWORD PTR _wave$[ebp]
	mov	WORD PTR [ecx+16], ax
; Line 147
$L19287:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_initWave ENDP
_TEXT	ENDS
PUBLIC	_init_networking
EXTRN	_exit:NEAR
EXTRN	_WSAStartup@8:NEAR
EXTRN	_WSAGetLastError@0:NEAR
EXTRN	_printf:NEAR
_DATA	SEGMENT
$SG19293 DB	'WSAStartup failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_winsock_version$ = -4
_winsock_data$ = -404
$T19438 = 8
_init_networking PROC NEAR
; Line 149
	push	ebp
	mov	ebp, esp
	sub	esp, 404				; 00000194H
	push	ebx
	push	esi
	push	edi
; Line 150
	mov	WORD PTR _winsock_version$[ebp], 514	; 00000202H
; Line 153
	lea	eax, DWORD PTR _winsock_data$[ebp]
	push	eax
	mov	eax, DWORD PTR _winsock_version$[ebp]
	push	eax
	call	_WSAStartup@8
	test	eax, eax
	je	$L19292
; Line 155
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19293
	call	_printf
	add	esp, 8
; Line 156
	push	0
	call	_exit
	add	esp, 4
; Line 159
$L19292:
	lea	esi, DWORD PTR _winsock_data$[ebp]
	mov	edi, DWORD PTR $T19438[ebp]
	mov	ecx, 100				; 00000064H
	rep	movsd
	mov	eax, DWORD PTR $T19438[ebp]
	jmp	$L19289
; Line 160
$L19289:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
; Line 174
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 175
	push	0
	push	0
	push	0
	push	0
	push	1024					; 00000400H
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _wvHdr$[ebp]
	push	eax
	call	_initWaveHeader
	add	esp, 28					; 0000001cH
; Line 176
	push	32					; 00000020H
	mov	eax, DWORD PTR _wvHdr$[ebp]
	push	eax
	mov	eax, DWORD PTR _global_hWaveOut
	push	eax
	call	DWORD PTR __imp__waveOutPrepareHeader@12
; Line 177
	push	32					; 00000020H
	mov	eax, DWORD PTR _wvHdr$[ebp]
	push	eax
	mov	eax, DWORD PTR _global_hWaveOut
	push	eax
	call	DWORD PTR __imp__waveOutWrite@12
; Line 178
	push	32					; 00000020H
	mov	eax, DWORD PTR _wvHdr$[ebp]
	push	eax
	mov	eax, DWORD PTR _global_hWaveOut
	push	eax
	call	DWORD PTR __imp__waveOutUnprepareHeader@12
; Line 179
$L19306:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
; Line 181
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 182
	cmp	DWORD PTR _msg$[ebp], 955		; 000003bbH
	jne	$L19314
; Line 183
	jmp	$L19313
; Line 186
$L19314:
	cmp	DWORD PTR _current_buffer, 0
	jne	$L19315
; Line 187
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
	call	_win_initialize_wave
	add	esp, 8
; Line 188
	jmp	$L19316
$L19315:
; Line 189
	mov	eax, DWORD PTR _buffer2
	push	eax
	push	OFFSET FLAT:_waveHdrB
	call	_win_initialize_wave
	add	esp, 8
; Line 190
$L19316:
; Line 192
	call	_mix
; Line 193
	cmp	DWORD PTR _current_buffer, 0
	jne	$L19439
	mov	DWORD PTR _current_buffer, 1
	jmp	$L19440
$L19439:
	mov	DWORD PTR _current_buffer, 0
$L19440:
; Line 195
$L19313:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
; Line 199
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 200
	mov	DWORD PTR _iMode$[ebp], 1
; Line 202
	mov	WORD PTR _server_addr, 2
; Line 203
	mov	eax, DWORD PTR _PORT
	push	eax
	call	_htons@4
	mov	WORD PTR _server_addr+2, ax
; Line 204
	mov	eax, DWORD PTR _mplayer_addr
	mov	DWORD PTR _server_addr+4, eax
; Line 206
	push	17					; 00000011H
	push	2
	push	2
	call	_socket@12
	mov	DWORD PTR _server_connection, eax
; Line 208
	cmp	DWORD PTR _server_connection, -1
	jne	$L19321
; Line 209
	xor	al, al
	jmp	$L19319
; Line 212
$L19321:
	lea	eax, DWORD PTR _iMode$[ebp]
	push	eax
	push	-2147195266				; 8004667eH
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_ioctlsocket@12
; Line 214
	mov	al, 1
	jmp	$L19319
; Line 215
$L19319:
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
; Line 217
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 218
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
; Line 220
	cmp	DWORD PTR _return_value$[ebp], -1
	jne	$L19326
; Line 221
	xor	eax, eax
	jmp	$L19324
; Line 223
	jmp	$L19327
$L19326:
; Line 224
	mov	eax, DWORD PTR _return_value$[ebp]
	jmp	$L19324
; Line 225
$L19327:
; Line 226
$L19324:
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
; Line 228
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 229
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
; Line 230
$L19330:
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
; Line 232
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 233
	mov	eax, DWORD PTR _server_connection
	push	eax
	call	_closesocket@4
; Line 234
$L19331:
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
$SG19343 DB	'r', 00H
	ORG $+2
$SG19344 DB	'config.ini', 00H
	ORG $+1
$SG19345 DB	'addr= %s', 0aH, 00H
	ORG $+2
$SG19346 DB	'port= %d', 0aH, 00H
	ORG $+2
$SG19347 DB	'name= %s', 0aH, 00H
	ORG $+2
$SG19348 DB	'pin= %s', 0aH, 00H
	ORG $+3
$SG19349 DB	'x= %d', 0aH, 00H
	ORG $+1
$SG19350 DB	'y= %d', 0aH, 00H
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
; Line 236
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 239
	push	OFFSET FLAT:$SG19343
	push	OFFSET FLAT:$SG19344
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 240
	lea	eax, DWORD PTR _taddr$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19345
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 241
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19346
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 242
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19347
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 243
	mov	eax, DWORD PTR _pin$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19348
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 244
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19349
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 245
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19350
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 246
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 248
	lea	eax, DWORD PTR _taddr$[ebp]
	push	eax
	call	_inet_addr@4
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 249
$L19340:
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
EXTRN	__imp__waveOutGetNumDevs@0:NEAR
EXTRN	__imp__CreateWindowExA@48:NEAR
EXTRN	__imp__waveOutOpen@24:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	_memset:NEAR
EXTRN	__imp__CreateDIBSection@24:NEAR
EXTRN	__imp__LoadCursorA@8:NEAR
EXTRN	__imp__LoadIconA@8:NEAR
EXTRN	_SG_GameInit:NEAR
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_FBPTR:DWORD
EXTRN	__imp__GetModuleHandleA@4:NEAR
EXTRN	_init_sound:NEAR
EXTRN	__imp__timeSetEvent@20:NEAR
EXTRN	__imp__timeBeginPeriod@4:NEAR
_TEXT	SEGMENT
_num_devs$ = -64
_winRect$ = -56
_hdcScreen$ = -60
_wc$ = -40
$T19441 = -464
_SG_Init PROC NEAR
; Line 258
	push	ebp
	mov	ebp, esp
	sub	esp, 472				; 000001d8H
	push	ebx
	push	esi
	push	edi
; Line 265
	call	_SG_GameInit
; Line 267
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
; Line 269
	lea	eax, DWORD PTR $T19441[ebp]
	push	eax
	call	_init_networking
	add	esp, 4
; Line 274
	mov	DWORD PTR _winRect$[ebp], 0
; Line 275
	mov	DWORD PTR _winRect$[ebp+4], 0
; Line 276
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR _winRect$[ebp+12], eax
; Line 277
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR _winRect$[ebp+8], eax
; Line 279
	push	0
	push	13565952				; 00cf0000H
	lea	eax, DWORD PTR _winRect$[ebp]
	push	eax
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 281
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 283
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 284
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+4], 320			; 00000140H
; Line 285
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 286
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+12], 1
; Line 287
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+14], 8
; Line 288
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 289
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+16], 0
; Line 291
	push	0
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdcScreen$[ebp], eax
; Line 292
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
; Line 293
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	push	0
	call	DWORD PTR __imp__ReleaseDC@8
; Line 295
	mov	DWORD PTR _wc$[ebp], 0
; Line 296
	mov	DWORD PTR _wc$[ebp+4], OFFSET FLAT:_WndProc@16
; Line 297
	mov	DWORD PTR _wc$[ebp+8], 0
; Line 298
	mov	DWORD PTR _wc$[ebp+12], 0
; Line 299
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[ebp+16], eax
; Line 300
	push	101					; 00000065H
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[ebp+20], eax
; Line 301
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadCursorA@8
	mov	DWORD PTR _wc$[ebp+24], eax
; Line 302
	mov	DWORD PTR _wc$[ebp+28], 6
; Line 303
	mov	DWORD PTR _wc$[ebp+32], 0
; Line 304
	mov	eax, DWORD PTR _SG_title
	mov	DWORD PTR _wc$[ebp+36], eax
; Line 305
	lea	eax, DWORD PTR _wc$[ebp]
	push	eax
	call	DWORD PTR __imp__RegisterClassA@4
; Line 307
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
; Line 308
	push	5
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 309
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4
; Line 311
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 313
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 315
	fld	QWORD PTR $T19435
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -468+[ebp], eax
	fidiv	DWORD PTR -468+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 316
	fld	QWORD PTR $T19436
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -472+[ebp], eax
	fidiv	DWORD PTR -472+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 318
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 320
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 321
	push	1
	push	0
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	DWORD PTR __imp__timeSetEvent@20
; Line 322
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_keys
	call	_memset
	add	esp, 12					; 0000000cH
; Line 326
	call	_init_sound
; Line 327
	call	DWORD PTR __imp__waveOutGetNumDevs@0
	mov	DWORD PTR _num_devs$[ebp], eax
; Line 328
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
; Line 330
	cmp	DWORD PTR _num_devs$[ebp], 0
	je	$L19359
; Line 331
$L19361:
	push	196608					; 00030000H
	push	0
	push	OFFSET FLAT:_sound_callback@20
	push	OFFSET FLAT:_global_wave
	push	-1
	push	OFFSET FLAT:_global_hWaveOut
	call	DWORD PTR __imp__waveOutOpen@24
	test	eax, eax
	je	$L19362
	jmp	$L19361
$L19362:
; Line 334
$L19359:
	mov	eax, DWORD PTR _buffer1
	push	eax
	push	OFFSET FLAT:_waveHdrA
	call	_win_initialize_wave
	add	esp, 8
; Line 335
	mov	eax, DWORD PTR _buffer2
	push	eax
	push	OFFSET FLAT:_waveHdrB
	call	_win_initialize_wave
	add	esp, 8
; Line 336
$L19353:
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
; Line 338
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 340
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 341
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ScreenToClient@8
; Line 342
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	fild	DWORD PTR -12+[ebp]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx], ax
; Line 343
	mov	eax, DWORD PTR _p$[ebp+4]
	mov	DWORD PTR -16+[ebp], eax
	fild	DWORD PTR -16+[ebp]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx+2], ax
; Line 344
	mov	al, BYTE PTR _mouseDownLeft
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 345
	mov	al, BYTE PTR _mouseDownRight
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 346
$L19364:
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
; Line 348
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 349
	xor	eax, eax
	mov	al, BYTE PTR _key$[ebp]
	mov	al, BYTE PTR _keys[eax]
	jmp	$L19367
; Line 350
$L19367:
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
; Line 352
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 353
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 354
$L19368:
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
; Line 356
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 358
	mov	eax, DWORD PTR _bmi
	add	eax, 40					; 00000028H
	mov	DWORD PTR _willPalette$[ebp], eax
; Line 360
	push	0
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _tempHDC$[ebp], eax
; Line 361
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 362
	mov	al, BYTE PTR _r$[ebp]
	mov	BYTE PTR _col$[ebp+2], al
; Line 363
	mov	al, BYTE PTR _g$[ebp]
	mov	BYTE PTR _col$[ebp+1], al
; Line 364
	mov	al, BYTE PTR _b$[ebp]
	mov	BYTE PTR _col$[ebp], al
; Line 365
	mov	eax, DWORD PTR _col$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _index$[ebp]
	mov	edx, DWORD PTR _willPalette$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 366
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
; Line 367
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 368
$L19373:
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
; Line 370
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 371
	call	DWORD PTR __imp__timeGetTime@0
	jmp	$L19377
; Line 372
$L19377:
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
; Line 374
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 377
$L19381:
	cmp	DWORD PTR _newFrame, 0
	jne	$L19382
; Line 378
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	$L19383
; Line 379
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__TranslateMessage@4
; Line 380
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__DispatchMessageA@4
; Line 382
$L19383:
	jmp	$L19381
$L19382:
; Line 383
	mov	DWORD PTR _newFrame, 0
; Line 384
$L19378:
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
; Line 386
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 387
	call	_SG_WelcomeMessage
; Line 388
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_SG_Init
	add	esp, 8
; Line 389
	call	_SG_InitPalette
; Line 390
	call	_title_init
; Line 392
$L19391:
; Line 393
	call	_SG_Tick
; Line 394
	jmp	$L19391
$L19392:
; Line 395
$L19387:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
