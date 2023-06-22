	TITLE	src\net.c
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
_DATA	SEGMENT
COMM	_player_id:DWORD
COMM	_timeout:DWORD
COMM	_players:BYTE:0100H
_DATA	ENDS
PUBLIC	_net_connect
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_SG_GetTicks:NEAR
EXTRN	_SG_OpenConnection:NEAR
EXTRN	_SG_RecievePacket:NEAR
EXTRN	_SG_SendPacket:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_printf:NEAR
_DATA	SEGMENT
$SG271	DB	'STARBLAZER', 00H
	ORG $+1
$SG274	DB	'NET: Connection failed.', 0aH, 00H
	ORG $+3
$SG279	DB	'NET: Server timed out.', 0aH, 00H
$SG281	DB	'NET: Authentication failed.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
; File src\net.c
_addr$ = 8
_auth_token$ = -48
_ret_token$ = -52
_time_started$ = -56
_net_connect PROC NEAR
; Line 29
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 32
	call	_SG_GetTicks
	mov	DWORD PTR _time_started$[ebp], eax
; Line 34
	push	OFFSET FLAT:$SG271
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 35
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 14					; 0000000eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+13]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 36
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 30					; 0000001eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+29]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 40
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_SG_OpenConnection
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	jne	$L272
; Line 41
	push	OFFSET FLAT:$SG274
	call	_printf
	add	esp, 4
; Line 42
	mov	al, 1
	jmp	$L266
; Line 45
$L272:
	push	45					; 0000002dH
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 47
$L276:
	push	3
	lea	eax, DWORD PTR _ret_token$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	$L277
; Line 48
	call	_SG_GetTicks
	sub	eax, DWORD PTR _time_started$[ebp]
	cmp	eax, 3000				; 00000bb8H
	jbe	$L278
; Line 49
	push	OFFSET FLAT:$SG279
	call	_printf
	add	esp, 4
; Line 50
	mov	al, 1
	jmp	$L266
; Line 52
$L278:
	jmp	$L276
$L277:
; Line 54
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp]
	test	eax, eax
	jne	$L280
; Line 55
	push	OFFSET FLAT:$SG281
	call	_printf
	add	esp, 4
; Line 56
	mov	al, 2
	jmp	$L266
; Line 59
$L280:
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+2]
	mov	DWORD PTR _timeout, eax
; Line 60
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+1]
	mov	DWORD PTR _player_id, eax
; Line 61
$L266:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_connect ENDP
_TEXT	ENDS
PUBLIC	_net_syncstate
EXTRN	_StarblazerEntities:BYTE
_TEXT	SEGMENT
_packet$ = -32
_net_syncstate PROC NEAR
; Line 63
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 67
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	lea	ecx, DWORD PTR _packet$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 68
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	lea	ecx, DWORD PTR _packet$[ebp+12]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 69
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 114
$L282:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_syncstate ENDP
_TEXT	ENDS
PUBLIC	_net_disconnect
_TEXT	SEGMENT
_net_disconnect PROC NEAR
; Line 116
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 118
$L284:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_disconnect ENDP
_TEXT	ENDS
END
