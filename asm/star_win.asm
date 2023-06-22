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
_SG_platform DD	FLAT:$SG19211
_SG_title DD	FLAT:$SG19213
_newFrame DD	00H
_mouseDownLeft DB 00H
	ORG $+3
_mouseDownRight DB 00H
	ORG $+3
_PORT	DD	0270fH
_OTHER_PORT DD	05ba0H
$SG19211 DB	'win32', 00H
	ORG $+2
$SG19213 DB	'Starblazer II for Windows 95/NT', 00H
_DATA	ENDS
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
$T19395	DQ	04074000000000000r		; 320
$T19396	DQ	04069000000000000r		; 200
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
; Line 40
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 45
	mov	eax, DWORD PTR _msg$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L19236
; Line 46
$L19240:
; Line 47
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 48
	jmp	$L19237
; Line 51
$L19241:
; Line 52
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DestroyWindow@4
; Line 53
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 54
	jmp	$L19237
; Line 57
$L19242:
; Line 58
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 59
	jmp	$L19237
; Line 62
$L19243:
; Line 63
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 1
; Line 64
	jmp	$L19237
; Line 67
$L19244:
; Line 68
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 0
; Line 69
	jmp	$L19237
; Line 72
$L19245:
; Line 73
	mov	eax, DWORD PTR _lParam$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _window_width, eax
; Line 74
	mov	eax, DWORD PTR _lParam$[ebp]
	shr	eax, 16					; 00000010H
	mov	DWORD PTR _window_height, eax
; Line 75
	fld	QWORD PTR $T19395
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -20+[ebp], eax
	fidiv	DWORD PTR -20+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 76
	fld	QWORD PTR $T19396
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -24+[ebp], eax
	fidiv	DWORD PTR -24+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 77
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 78
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 79
	jmp	$L19237
; Line 82
$L19246:
; Line 83
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdc$[ebp], eax
; Line 84
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _hdc_bmp$[ebp], eax
; Line 85
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
	mov	DWORD PTR _old_bmp$[ebp], eax
; Line 86
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
; Line 87
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 88
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 89
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteObject@4
; Line 90
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__ReleaseDC@8
; Line 91
	jmp	$L19237
; Line 94
$L19247:
; Line 95
	mov	BYTE PTR _mouseDownLeft, 1
; Line 96
	jmp	$L19237
; Line 99
$L19248:
; Line 100
	mov	BYTE PTR _mouseDownLeft, 0
; Line 101
	jmp	$L19237
; Line 104
$L19249:
; Line 105
	mov	BYTE PTR _mouseDownRight, 1
; Line 106
	jmp	$L19237
; Line 109
$L19250:
; Line 110
	mov	BYTE PTR _mouseDownRight, 0
; Line 111
	jmp	$L19237
; Line 114
$L19251:
; Line 115
	mov	eax, DWORD PTR _lParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _wParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DefWindowProcA@16
	jmp	$L19232
; Line 117
	jmp	$L19237
$L19236:
	cmp	DWORD PTR -16+[ebp], 5
	ja	$L19392
	je	$L19245
	cmp	DWORD PTR -16+[ebp], 2
	je	$L19240
	jmp	$L19251
$L19392:
	cmp	DWORD PTR -16+[ebp], 256		; 00000100H
	ja	$L19393
	je	$L19243
	cmp	DWORD PTR -16+[ebp], 15			; 0000000fH
	je	$L19246
	cmp	DWORD PTR -16+[ebp], 16			; 00000010H
	je	$L19241
	cmp	DWORD PTR -16+[ebp], 18			; 00000012H
	je	$L19242
	jmp	$L19251
$L19393:
	cmp	DWORD PTR -16+[ebp], 513		; 00000201H
	ja	$L19394
	je	$L19247
	cmp	DWORD PTR -16+[ebp], 257		; 00000101H
	je	$L19244
	jmp	$L19251
$L19394:
	cmp	DWORD PTR -16+[ebp], 514		; 00000202H
	je	$L19248
	cmp	DWORD PTR -16+[ebp], 516		; 00000204H
	je	$L19249
	cmp	DWORD PTR -16+[ebp], 517		; 00000205H
	je	$L19250
	jmp	$L19251
$L19237:
; Line 118
$L19232:
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
; Line 120
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 121
	mov	DWORD PTR _newFrame, 1
; Line 122
$L19258:
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
$SG19270 DB	'WSAStartup failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_winsock_version$ = -4
_winsock_data$ = -404
$T19398 = 8
_init_networking PROC NEAR
; Line 138
	push	ebp
	mov	ebp, esp
	sub	esp, 404				; 00000194H
	push	ebx
	push	esi
	push	edi
; Line 139
	mov	WORD PTR _winsock_version$[ebp], 514	; 00000202H
; Line 142
	lea	eax, DWORD PTR _winsock_data$[ebp]
	push	eax
	mov	eax, DWORD PTR _winsock_version$[ebp]
	push	eax
	call	_WSAStartup@8
	test	eax, eax
	je	$L19269
; Line 144
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19270
	call	_printf
	add	esp, 8
; Line 145
	push	0
	call	_exit
	add	esp, 4
; Line 148
$L19269:
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 150
	lea	esi, DWORD PTR _winsock_data$[ebp]
	mov	edi, DWORD PTR $T19398[ebp]
	mov	ecx, 100				; 00000064H
	rep	movsd
	mov	eax, DWORD PTR $T19398[ebp]
	jmp	$L19266
; Line 151
$L19266:
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
$SG19278 DB	'socket failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_port$ = 12
_addr$ = 16
_iMode$ = -24
_con$ = -20
$T19399 = 8
_open_transmitting_connection PROC NEAR
; Line 153
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 154
	mov	DWORD PTR _iMode$[ebp], 1
; Line 156
	push	17					; 00000011H
	push	2
	push	2
	call	_socket@12
	mov	DWORD PTR _con$[ebp], eax
; Line 158
	cmp	DWORD PTR _con$[ebp], -1
	jne	$L19277
; Line 160
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19278
	call	_printf
	add	esp, 8
; Line 161
	push	0
	call	_exit
	add	esp, 4
; Line 164
$L19277:
	mov	WORD PTR _con$[ebp+4], 2
; Line 165
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	call	_htons@4
	mov	WORD PTR _con$[ebp+6], ax
; Line 166
	mov	eax, DWORD PTR _addr$[ebp]
	mov	DWORD PTR _con$[ebp+8], eax
; Line 167
	lea	eax, DWORD PTR _iMode$[ebp]
	push	eax
	push	-2147195266				; 8004667eH
	mov	eax, DWORD PTR _con$[ebp]
	push	eax
	call	_ioctlsocket@12
; Line 169
	lea	esi, DWORD PTR _con$[ebp]
	mov	edi, DWORD PTR $T19399[ebp]
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T19399[ebp]
	jmp	$L19274
; Line 170
$L19274:
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
$SG19285 DB	'bind failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_port$ = 12
_addr$ = 16
_con$ = -20
$T19400 = 8
$T19401 = -40
_open_listening_connection PROC NEAR
; Line 172
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 173
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _port$[ebp]
	push	eax
	lea	eax, DWORD PTR $T19401[ebp]
	push	eax
	call	_open_transmitting_connection
	add	esp, 12					; 0000000cH
	lea	edi, DWORD PTR _con$[ebp]
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 175
	push	16					; 00000010H
	lea	eax, DWORD PTR _con$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _con$[ebp]
	push	eax
	call	_bind@12
	cmp	eax, -1
	jne	$L19284
; Line 177
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19285
	call	_printf
	add	esp, 8
; Line 178
	push	0
	call	_exit
	add	esp, 4
; Line 181
$L19284:
	lea	esi, DWORD PTR _con$[ebp]
	mov	edi, DWORD PTR $T19400[ebp]
	mov	ecx, 5
	rep	movsd
	mov	eax, DWORD PTR $T19400[ebp]
	jmp	$L19282
; Line 182
$L19282:
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
; Line 184
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 185
	mov	eax, DWORD PTR _con$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_closesocket@4
; Line 186
$L19288:
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
$SG19295 DB	'sendto failed: %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_con$ = 8
_buf$ = 12
_len$ = 16
_send_packet PROC NEAR
; Line 188
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 189
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
	jne	$L19294
; Line 191
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19295
	call	_printf
	add	esp, 8
; Line 192
	push	0
	call	_exit
	add	esp, 4
; Line 194
$L19294:
$L19293:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_send_packet ENDP
_TEXT	ENDS
PUBLIC	_recv_packet
EXTRN	_recvfrom@24:NEAR
_DATA	SEGMENT
	ORG $+2
$SG19308 DB	'recvfrom returned SOCKET_ERROR, WSAGetLastError() %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_con$ = 12
_buf$ = 16
_size$ = 20
_error_code$ = -4
_descriptor$ = -16
_from$ = -32
_from_size$ = -36
$T19402 = 8
_recv_packet PROC NEAR
; Line 196
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 198
	mov	BYTE PTR _descriptor$[ebp], 0
	lea	eax, DWORD PTR _descriptor$[ebp+1]
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 0
	mov	WORD PTR [eax+8], 0
	mov	BYTE PTR [eax+10], 0
; Line 199
	mov	WORD PTR _from$[ebp], 0
	lea	eax, DWORD PTR _from$[ebp+2]
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 0
	mov	DWORD PTR [eax+8], 0
	mov	WORD PTR [eax+12], 0
; Line 200
	mov	DWORD PTR _from_size$[ebp], 16		; 00000010H
; Line 201
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
; Line 202
	mov	DWORD PTR _descriptor$[ebp+8], 1
; Line 204
	cmp	DWORD PTR _descriptor$[ebp+4], -1
	jne	$L19305
; Line 206
	call	_WSAGetLastError@0
	mov	DWORD PTR _error_code$[ebp], eax
; Line 208
	cmp	DWORD PTR _error_code$[ebp], 10035	; 00002733H
	jne	$L19306
; Line 209
	mov	DWORD PTR _descriptor$[ebp+8], 0
; Line 212
	jmp	$L19307
$L19306:
; Line 213
	call	_WSAGetLastError@0
	push	eax
	push	OFFSET FLAT:$SG19308
	call	_printf
	add	esp, 8
; Line 214
	push	0
	call	_exit
	add	esp, 4
; Line 215
$L19307:
; Line 218
$L19305:
	mov	eax, DWORD PTR _from$[ebp+4]
	mov	DWORD PTR _descriptor$[ebp], eax
; Line 220
	lea	eax, DWORD PTR _descriptor$[ebp]
	mov	ecx, DWORD PTR $T19402[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
	mov	eax, DWORD PTR $T19402[ebp]
	jmp	$L19300
; Line 221
$L19300:
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
$T19403 = -20
$T19404 = -40
_SG_OpenConnection PROC NEAR
; Line 227
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 228
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	mov	eax, DWORD PTR _PORT
	push	eax
	lea	eax, DWORD PTR $T19403[ebp]
	push	eax
	call	_open_transmitting_connection
	add	esp, 12					; 0000000cH
	mov	edi, OFFSET FLAT:_out_socket
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 229
	push	0
	mov	eax, DWORD PTR _OTHER_PORT
	push	eax
	lea	eax, DWORD PTR $T19404[ebp]
	push	eax
	call	_open_listening_connection
	add	esp, 12					; 0000000cH
	mov	edi, OFFSET FLAT:_server_connection
	mov	esi, eax
	mov	ecx, 5
	rep	movsd
; Line 231
	mov	al, 1
	jmp	$L19312
; Line 232
$L19312:
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
$T19405 = -24
_SG_RecievePacket PROC NEAR
; Line 234
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 235
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	push	OFFSET FLAT:_server_connection
	lea	eax, DWORD PTR $T19405[ebp]
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
; Line 237
	cmp	DWORD PTR _desc$[ebp+8], 0
	jne	$L19317
	xor	eax, eax
	jmp	$L19315
; Line 238
$L19317:
	mov	eax, DWORD PTR _desc$[ebp+4]
	jmp	$L19315
; Line 239
$L19315:
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
; Line 241
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 242
	mov	eax, DWORD PTR _num_bytes$[ebp]
	push	eax
	mov	eax, DWORD PTR _buf$[ebp]
	push	eax
	push	OFFSET FLAT:_out_socket
	call	_send_packet
	add	esp, 12					; 0000000cH
; Line 243
$L19320:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_SendPacket ENDP
_TEXT	ENDS
PUBLIC	_SG_CloseConnection
_TEXT	SEGMENT
_SG_CloseConnection PROC NEAR
; Line 245
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 247
$L19321:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_CloseConnection ENDP
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
EXTRN	_FBPTR:DWORD
EXTRN	__imp__GetModuleHandleA@4:NEAR
EXTRN	__imp__timeSetEvent@20:NEAR
_TEXT	SEGMENT
_winRect$ = -56
_hdcScreen$ = -60
_wc$ = -40
$T19406 = -460
_SG_Init PROC NEAR
; Line 256
	push	ebp
	mov	ebp, esp
	sub	esp, 468				; 000001d4H
	push	ebx
	push	esi
	push	edi
; Line 262
	call	_SG_GameInit
; Line 264
	lea	eax, DWORD PTR $T19406[ebp]
	push	eax
	call	_init_networking
	add	esp, 4
; Line 266
	mov	DWORD PTR _window_width, 640		; 00000280H
; Line 267
	mov	DWORD PTR _window_height, 480		; 000001e0H
; Line 269
	mov	DWORD PTR _winRect$[ebp], 0
; Line 270
	mov	DWORD PTR _winRect$[ebp+4], 0
; Line 271
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR _winRect$[ebp+12], eax
; Line 272
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR _winRect$[ebp+8], eax
; Line 274
	push	0
	push	13565952				; 00cf0000H
	lea	eax, DWORD PTR _winRect$[ebp]
	push	eax
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 276
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 278
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 279
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+4], 320			; 00000140H
; Line 280
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 281
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+12], 1
; Line 282
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+14], 8
; Line 283
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 284
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+16], 0
; Line 286
	push	0
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdcScreen$[ebp], eax
; Line 287
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
; Line 288
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	push	0
	call	DWORD PTR __imp__ReleaseDC@8
; Line 290
	mov	DWORD PTR _wc$[ebp], 0
; Line 291
	mov	DWORD PTR _wc$[ebp+4], OFFSET FLAT:_WndProc@16
; Line 292
	mov	DWORD PTR _wc$[ebp+8], 0
; Line 293
	mov	DWORD PTR _wc$[ebp+12], 0
; Line 294
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[ebp+16], eax
; Line 295
	push	101					; 00000065H
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[ebp+20], eax
; Line 296
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadCursorA@8
	mov	DWORD PTR _wc$[ebp+24], eax
; Line 297
	mov	DWORD PTR _wc$[ebp+28], 6
; Line 298
	mov	DWORD PTR _wc$[ebp+32], 0
; Line 299
	mov	eax, DWORD PTR _SG_title
	mov	DWORD PTR _wc$[ebp+36], eax
; Line 300
	lea	eax, DWORD PTR _wc$[ebp]
	push	eax
	call	DWORD PTR __imp__RegisterClassA@4
; Line 302
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
; Line 303
	push	5
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 304
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4
; Line 306
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 308
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 310
	fld	QWORD PTR $T19395
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -464+[ebp], eax
	fidiv	DWORD PTR -464+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 311
	fld	QWORD PTR $T19396
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -468+[ebp], eax
	fidiv	DWORD PTR -468+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 313
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 315
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 316
	push	1
	push	0
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	DWORD PTR __imp__timeSetEvent@20
; Line 317
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_keys
	call	_memset
	add	esp, 12					; 0000000cH
; Line 319
$L19324:
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
; Line 321
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 323
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 324
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ScreenToClient@8
; Line 325
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	fild	DWORD PTR -12+[ebp]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx], ax
; Line 326
	mov	eax, DWORD PTR _p$[ebp+4]
	mov	DWORD PTR -16+[ebp], eax
	fild	DWORD PTR -16+[ebp]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx+2], ax
; Line 327
	mov	al, BYTE PTR _mouseDownLeft
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 328
	mov	al, BYTE PTR _mouseDownRight
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 329
$L19329:
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
; Line 331
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 332
	xor	eax, eax
	mov	al, BYTE PTR _key$[ebp]
	mov	al, BYTE PTR _keys[eax]
	jmp	$L19332
; Line 333
$L19332:
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
; Line 335
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 336
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 337
$L19333:
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
; Line 339
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 341
	mov	eax, DWORD PTR _bmi
	add	eax, 40					; 00000028H
	mov	DWORD PTR _willPalette$[ebp], eax
; Line 343
	push	0
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _tempHDC$[ebp], eax
; Line 344
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 345
	mov	al, BYTE PTR _r$[ebp]
	mov	BYTE PTR _col$[ebp+2], al
; Line 346
	mov	al, BYTE PTR _g$[ebp]
	mov	BYTE PTR _col$[ebp+1], al
; Line 347
	mov	al, BYTE PTR _b$[ebp]
	mov	BYTE PTR _col$[ebp], al
; Line 348
	mov	eax, DWORD PTR _col$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _index$[ebp]
	mov	edx, DWORD PTR _willPalette$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 349
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
; Line 350
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 351
$L19338:
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
; Line 353
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 354
	call	DWORD PTR __imp__timeGetTime@0
	jmp	$L19342
; Line 355
$L19342:
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
; Line 357
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 360
$L19346:
	cmp	DWORD PTR _newFrame, 0
	jne	$L19347
; Line 361
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	$L19348
; Line 362
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__TranslateMessage@4
; Line 363
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__DispatchMessageA@4
; Line 365
$L19348:
	jmp	$L19346
$L19347:
; Line 366
	mov	DWORD PTR _newFrame, 0
; Line 367
$L19343:
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
; Line 369
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 370
	call	_SG_WelcomeMessage
; Line 371
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_SG_Init
	add	esp, 8
; Line 372
	call	_SG_InitPalette
; Line 373
	call	_title_init
; Line 375
$L19356:
; Line 376
	call	_SG_Tick
; Line 377
	jmp	$L19356
$L19357:
; Line 378
$L19352:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
