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
COMM	_out_socket:BYTE:014H
COMM	_server_connection:BYTE:014H
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
$T19424	DQ	04074000000000000r		; 320
$T19425	DQ	04069000000000000r		; 200
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
	fld	QWORD PTR $T19424
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -20+[ebp], eax
	fidiv	DWORD PTR -20+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 81
	fld	QWORD PTR $T19425
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
	ja	$L19421
	je	$L19246
	cmp	DWORD PTR -16+[ebp], 2
	je	$L19241
	jmp	$L19252
$L19421:
	cmp	DWORD PTR -16+[ebp], 256		; 00000100H
	ja	$L19422
	je	$L19244
	cmp	DWORD PTR -16+[ebp], 15			; 0000000fH
	je	$L19247
	cmp	DWORD PTR -16+[ebp], 16			; 00000010H
	je	$L19242
	cmp	DWORD PTR -16+[ebp], 18			; 00000012H
	je	$L19243
	jmp	$L19252
$L19422:
	cmp	DWORD PTR -16+[ebp], 513		; 00000201H
	ja	$L19423
	je	$L19248
	cmp	DWORD PTR -16+[ebp], 257		; 00000101H
	je	$L19245
	jmp	$L19252
$L19423:
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
EXTRN	__imp__timeBeginPeriod@4:NEAR
_DATA	SEGMENT
$SG19271 DB	'WSAStartup failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_winsock_version$ = -4
_winsock_data$ = -404
$T19427 = 8
_init_networking PROC NEAR
; Line 143
	push	ebp
	mov	ebp, esp
	sub	esp, 404				; 00000194H
	push	ebx
	push	esi
	push	edi
; Line 144
	mov	WORD PTR _winsock_version$[ebp], 514	; 00000202H
; Line 147
	lea	eax, DWORD PTR _winsock_data$[ebp]
	push	eax
	mov	eax, DWORD PTR _winsock_version$[ebp]
	push	eax
	call	_WSAStartup@8
	test	eax, eax
	je	$L19270
; Line 149
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19271
	call	_printf
	add	esp, 8
; Line 150
	push	0
	call	_exit
	add	esp, 4
; Line 153
$L19270:
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 155
	lea	esi, DWORD PTR _winsock_data$[ebp]
	mov	edi, DWORD PTR $T19427[ebp]
	mov	ecx, 100				; 00000064H
	rep	movsd
	mov	eax, DWORD PTR $T19427[ebp]
	jmp	$L19267
; Line 156
$L19267:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_networking ENDP
_TEXT	ENDS
PUBLIC	_open_transmitting_connection
EXTRN	_ioctlsocket@12:NEAR
EXTRN	_htons@4:NEAR
EXTRN	_socket@12:NEAR
_DATA	SEGMENT
	ORG $+2
$SG19279 DB	'socket failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_port$ = 12
_addr$ = 16
_iMode$ = -24
_con$ = -20
$T19428 = 8
_open_transmitting_connection PROC NEAR
; Line 158
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 159
	mov	DWORD PTR _iMode$[ebp], 1
; Line 161
	push	17					; 00000011H
	push	2
	push	2
	call	_socket@12
	mov	DWORD PTR _con$[ebp], eax
; Line 163
	cmp	DWORD PTR _con$[ebp], -1
	jne	$L19278
; Line 165
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19279
	call	_printf
	add	esp, 8
; Line 166
	push	0
	call	_exit
	add	esp, 4
; Line 169
$L19278:
	mov	WORD PTR _con$[ebp+4], 2
; Line 170
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	call	_htons@4
	mov	WORD PTR _con$[ebp+6], ax
; Line 171
	mov	eax, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _con$[ebp+8], eax
; Line 172
	lea	eax, DWORD PTR _iMode$[ebp]
	push	eax
	push	-2147195266				; 8004667eH
	mov	eax, DWORD PTR _con$[ebp]
	push	eax
	call	_ioctlsocket@12
; Line 174
	lea	esi, DWORD PTR _con$[ebp]
	mov	edi, DWORD PTR $T19428[ebp]
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T19428[ebp]
	jmp	$L19275
; Line 175
$L19275:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_open_transmitting_connection ENDP
_TEXT	ENDS
PUBLIC	_open_listening_connection
EXTRN	_bind@12:NEAR
_DATA	SEGMENT
	ORG $+2
$SG19286 DB	'bind failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_port$ = 12
_addr$ = 16
_con$ = -20
$T19429 = 8
$T19430 = -40
_open_listening_connection PROC NEAR
; Line 177
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 178
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	lea	eax, DWORD PTR $T19430[ebp]
	push	eax
	call	_open_transmitting_connection
	add	esp, 12					; 0000000cH
	lea	edi, DWORD PTR _con$[ebp]
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 180
	push	16					; 00000010H
	lea	eax, DWORD PTR _con$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _con$[ebp]
	push	eax
	call	_bind@12
	cmp	eax, -1
	jne	$L19285
; Line 182
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19286
	call	_printf
	add	esp, 8
; Line 183
	push	0
	call	_exit
	add	esp, 4
; Line 186
$L19285:
	lea	esi, DWORD PTR _con$[ebp]
	mov	edi, DWORD PTR $T19429[ebp]
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T19429[ebp]
	jmp	$L19283
; Line 187
$L19283:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_open_listening_connection ENDP
_TEXT	ENDS
PUBLIC	_close_connection
EXTRN	_closesocket@4:NEAR
_TEXT	SEGMENT
_con$ = 8
_close_connection PROC NEAR
; Line 189
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 190
	mov	eax, DWORD PTR _con$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_closesocket@4
; Line 191
$L19289:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_close_connection ENDP
_TEXT	ENDS
PUBLIC	_send_packet
EXTRN	_sendto@24:NEAR
_DATA	SEGMENT
$SG19296 DB	'sendto failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_con$ = 8
_buf$ = 12
_len$ = 16
_send_packet PROC NEAR
; Line 193
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 194
	push	16					; 00000010H
	mov	eax, DWORD PTR _con$[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _con$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_sendto@24
	cmp	eax, -1
	jne	$L19295
; Line 196
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19296
	call	_printf
	add	esp, 8
; Line 197
	push	0
	call	_exit
	add	esp, 4
; Line 199
$L19295:
$L19294:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_send_packet ENDP
_TEXT	ENDS
PUBLIC	_send_packet_good
_DATA	SEGMENT
	ORG $+2
$SG19304 DB	'sendto failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_con$ = 8
_aux$ = 12
_buf$ = 16
_len$ = 20
_send_packet_good PROC NEAR
; Line 201
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 202
	push	16					; 00000010H
	mov	eax, DWORD PTR _aux$[ebp]
	add	eax, 4
	push	eax
	push	0
	mov	eax, DWORD PTR _len$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _con$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_sendto@24
	cmp	eax, -1
	jne	$L19303
; Line 204
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19304
	call	_printf
	add	esp, 8
; Line 205
	push	0
	call	_exit
	add	esp, 4
; Line 207
$L19303:
$L19302:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_send_packet_good ENDP
_TEXT	ENDS
PUBLIC	_recv_packet
EXTRN	_recvfrom@24:NEAR
_DATA	SEGMENT
	ORG $+2
$SG19317 DB	'recvfrom returned SOCKET_ERROR, WSAGetLastError() %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_con$ = 12
_buf$ = 16
_size$ = 20
_error_code$ = -4
_descriptor$ = -16
_from$ = -32
_from_size$ = -36
$T19431 = 8
_recv_packet PROC NEAR
; Line 209
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 211
	mov	BYTE PTR _descriptor$[ebp], 0
	lea	eax, DWORD PTR _descriptor$[ebp+1]
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 0
	mov	WORD PTR [eax+8], 0
	mov	BYTE PTR [eax+10], 0
; Line 212
	mov	WORD PTR _from$[ebp], 0
	lea	eax, DWORD PTR _from$[ebp+2]
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 0
	mov	DWORD PTR [eax+8], 0
	mov	WORD PTR [eax+12], 0
; Line 213
	mov	DWORD PTR _from_size$[ebp], 16		; 00000010H
; Line 214
	lea	eax, DWORD PTR _from_size$[ebp]
	push	eax
	lea	eax, DWORD PTR _from$[ebp]
	push	eax
	push	0
	mov	eax, DWORD PTR _size$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	mov	eax, DWORD PTR _con$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_recvfrom@24
	mov	DWORD PTR _descriptor$[ebp+4], eax
; Line 215
	mov	DWORD PTR _descriptor$[ebp+8], 1
; Line 217
	cmp	DWORD PTR _descriptor$[ebp+4], -1
	jne	$L19314
; Line 219
	call	_WSAGetLastError@0
	mov	DWORD PTR _error_code$[ebp], eax
; Line 221
	cmp	DWORD PTR _error_code$[ebp], 10035	; 00002733H
	jne	$L19315
; Line 222
	mov	DWORD PTR _descriptor$[ebp+8], 0
; Line 225
	jmp	$L19316
$L19315:
; Line 226
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19317
	call	_printf
	add	esp, 8
; Line 227
	push	0
	call	_exit
	add	esp, 4
; Line 228
$L19316:
; Line 231
$L19314:
	mov	eax, DWORD PTR _from$[ebp+4]
	mov	DWORD PTR _descriptor$[ebp], eax
; Line 233
	lea	eax, DWORD PTR _descriptor$[ebp]
	mov	ecx, DWORD PTR $T19431[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR $T19431[ebp]
	jmp	$L19309
; Line 234
$L19309:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_recv_packet ENDP
_TEXT	ENDS
PUBLIC	_SG_OpenConnection
_TEXT	SEGMENT
_addr$ = 8
$T19432 = -20
$T19433 = -40
_SG_OpenConnection PROC NEAR
; Line 240
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 241
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _PORT
	push	eax
	lea	eax, DWORD PTR $T19432[ebp]
	push	eax
	call	_open_transmitting_connection
	add	esp, 12					; 0000000cH
	mov	edi, OFFSET FLAT:_out_socket
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 242
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _OTHER_PORT
	push	eax
	lea	eax, DWORD PTR $T19433[ebp]
	push	eax
	call	_open_listening_connection
	add	esp, 12					; 0000000cH
	mov	edi, OFFSET FLAT:_server_connection
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 249
	mov	al, 1
	jmp	$L19321
; Line 250
$L19321:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_OpenConnection ENDP
_TEXT	ENDS
PUBLIC	_SG_RecievePacket
_TEXT	SEGMENT
_buf$ = 8
_num_bytes$ = 12
_desc$ = -12
$T19434 = -24
_SG_RecievePacket PROC NEAR
; Line 252
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 253
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	push	OFFSET FLAT:_server_connection
	lea	eax, DWORD PTR $T19434[ebp]
	push	eax
	call	_recv_packet
	add	esp, 16					; 00000010H
	lea	ecx, DWORD PTR _desc$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 255
	cmp	DWORD PTR _desc$[ebp+8], 0
	jne	$L19326
	xor	eax, eax
	jmp	$L19324
; Line 256
$L19326:
	mov	eax, DWORD PTR _desc$[ebp+4]
	jmp	$L19324
; Line 257
$L19324:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_RecievePacket ENDP
_TEXT	ENDS
PUBLIC	_SG_SendPacket
_TEXT	SEGMENT
_buf$ = 8
_num_bytes$ = 12
_SG_SendPacket PROC NEAR
; Line 259
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 260
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	push	OFFSET FLAT:_out_socket
	call	_send_packet
	add	esp, 12					; 0000000cH
; Line 262
$L19329:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_SendPacket ENDP
_SG_CloseConnection PROC NEAR
; Line 264
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 265
	push	OFFSET FLAT:_out_socket
	call	_close_connection
	add	esp, 4
; Line 267
$L19330:
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
	ORG $+3
$SG19342 DB	'r', 00H
	ORG $+2
$SG19343 DB	'config.ini', 00H
	ORG $+1
$SG19344 DB	'addr= %s', 0aH, 00H
	ORG $+2
$SG19345 DB	'port= %d', 0aH, 00H
	ORG $+2
$SG19346 DB	'otherport= %d', 0aH, 00H
	ORG $+1
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
_otherport$ = 24
_name$ = 28
_pin$ = 32
_taddr$ = -52
_fp$ = -56
_SG_TempLoadConfig PROC NEAR
; Line 269
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 272
	push	OFFSET FLAT:$SG19342
	push	OFFSET FLAT:$SG19343
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 273
	lea	eax, DWORD PTR _taddr$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19344
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 274
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19345
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 275
	mov	eax, DWORD PTR _otherport$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19346
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 276
	mov	eax, DWORD PTR _name$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19347
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 277
	mov	eax, DWORD PTR _pin$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19348
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 278
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19349
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 279
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	push	OFFSET FLAT:$SG19350
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 280
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 282
	lea	eax, DWORD PTR _taddr$[ebp]
	push	eax
	call	_inet_addr@4
	mov	ecx, DWORD PTR _addr$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 283
$L19339:
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
_TEXT	SEGMENT
_winRect$ = -56
_hdcScreen$ = -60
_wc$ = -40
$T19435 = -460
_SG_Init PROC NEAR
; Line 292
	push	ebp
	mov	ebp, esp
	sub	esp, 468				; 000001d4H
	push	ebx
	push	esi
	push	edi
; Line 298
	call	_SG_GameInit
; Line 300
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
; Line 302
	lea	eax, DWORD PTR $T19435[ebp]
	push	eax
	call	_init_networking
	add	esp, 4
; Line 307
	mov	DWORD PTR _winRect$[ebp], 0
; Line 308
	mov	DWORD PTR _winRect$[ebp+4], 0
; Line 309
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR _winRect$[ebp+12], eax
; Line 310
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR _winRect$[ebp+8], eax
; Line 312
	push	0
	push	13565952				; 00cf0000H
	lea	eax, DWORD PTR _winRect$[ebp]
	push	eax
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 314
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 316
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 317
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+4], 320			; 00000140H
; Line 318
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 319
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+12], 1
; Line 320
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+14], 8
; Line 321
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 322
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+16], 0
; Line 324
	push	0
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdcScreen$[ebp], eax
; Line 325
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
; Line 326
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	push	0
	call	DWORD PTR __imp__ReleaseDC@8
; Line 328
	mov	DWORD PTR _wc$[ebp], 0
; Line 329
	mov	DWORD PTR _wc$[ebp+4], OFFSET FLAT:_WndProc@16
; Line 330
	mov	DWORD PTR _wc$[ebp+8], 0
; Line 331
	mov	DWORD PTR _wc$[ebp+12], 0
; Line 332
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[ebp+16], eax
; Line 333
	push	101					; 00000065H
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[ebp+20], eax
; Line 334
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadCursorA@8
	mov	DWORD PTR _wc$[ebp+24], eax
; Line 335
	mov	DWORD PTR _wc$[ebp+28], 6
; Line 336
	mov	DWORD PTR _wc$[ebp+32], 0
; Line 337
	mov	eax, DWORD PTR _SG_title
	mov	DWORD PTR _wc$[ebp+36], eax
; Line 338
	lea	eax, DWORD PTR _wc$[ebp]
	push	eax
	call	DWORD PTR __imp__RegisterClassA@4
; Line 340
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
; Line 341
	push	5
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 342
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4
; Line 344
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 346
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 348
	fld	QWORD PTR $T19424
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -464+[ebp], eax
	fidiv	DWORD PTR -464+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 349
	fld	QWORD PTR $T19425
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -468+[ebp], eax
	fidiv	DWORD PTR -468+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 351
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 353
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 354
	push	1
	push	0
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	DWORD PTR __imp__timeSetEvent@20
; Line 355
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_keys
	call	_memset
	add	esp, 12					; 0000000cH
; Line 357
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
; Line 359
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 361
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 362
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ScreenToClient@8
; Line 363
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	fild	DWORD PTR -12+[ebp]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx], ax
; Line 364
	mov	eax, DWORD PTR _p$[ebp+4]
	mov	DWORD PTR -16+[ebp], eax
	fild	DWORD PTR -16+[ebp]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx+2], ax
; Line 365
	mov	al, BYTE PTR _mouseDownLeft
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 366
	mov	al, BYTE PTR _mouseDownRight
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 367
$L19358:
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
; Line 369
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 370
	xor	eax, eax
	mov	al, BYTE PTR _key$[ebp]
	mov	al, BYTE PTR _keys[eax]
	jmp	$L19361
; Line 371
$L19361:
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
; Line 373
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 374
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 375
$L19362:
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
; Line 377
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 379
	mov	eax, DWORD PTR _bmi
	add	eax, 40					; 00000028H
	mov	DWORD PTR _willPalette$[ebp], eax
; Line 381
	push	0
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _tempHDC$[ebp], eax
; Line 382
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 383
	mov	al, BYTE PTR _r$[ebp]
	mov	BYTE PTR _col$[ebp+2], al
; Line 384
	mov	al, BYTE PTR _g$[ebp]
	mov	BYTE PTR _col$[ebp+1], al
; Line 385
	mov	al, BYTE PTR _b$[ebp]
	mov	BYTE PTR _col$[ebp], al
; Line 386
	mov	eax, DWORD PTR _col$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _index$[ebp]
	mov	edx, DWORD PTR _willPalette$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 387
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
; Line 388
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 389
$L19367:
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
; Line 391
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 392
	call	DWORD PTR __imp__timeGetTime@0
	jmp	$L19371
; Line 393
$L19371:
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
; Line 395
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 398
$L19375:
	cmp	DWORD PTR _newFrame, 0
	jne	$L19376
; Line 399
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	$L19377
; Line 400
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__TranslateMessage@4
; Line 401
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__DispatchMessageA@4
; Line 403
$L19377:
	jmp	$L19375
$L19376:
; Line 404
	mov	DWORD PTR _newFrame, 0
; Line 405
$L19372:
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
; Line 407
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 408
	call	_SG_WelcomeMessage
; Line 409
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_SG_Init
	add	esp, 8
; Line 410
	call	_SG_InitPalette
; Line 411
	call	_title_init
; Line 413
$L19385:
; Line 414
	call	_SG_Tick
; Line 415
	jmp	$L19385
$L19386:
; Line 416
$L19381:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
