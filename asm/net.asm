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
EXTRN	_SG_CloseConnection:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_printf:NEAR
_DATA	SEGMENT
$SG279	DB	'STARBLAZER', 00H
	ORG $+1
$SG282	DB	'NET: Connection failed.', 0aH, 00H
	ORG $+3
$SG287	DB	'NET: Server timed out.', 0aH, 00H
$SG289	DB	'NET: Authentication failed.', 0aH, 00H
	ORG $+3
$SG290	DB	'NET: Successful connection.', 0aH, 00H
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
	push	OFFSET FLAT:$SG279
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
	jne	$L280
; Line 41
	push	OFFSET FLAT:$SG282
	call	_printf
	add	esp, 4
; Line 42
	mov	al, 1
	jmp	$L274
; Line 45
$L280:
	push	45					; 0000002dH
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 47
$L284:
	push	3
	lea	eax, DWORD PTR _ret_token$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	$L285
; Line 48
	call	_SG_GetTicks
	sub	eax, DWORD PTR _time_started$[ebp]
	cmp	eax, 3000				; 00000bb8H
	jbe	$L286
; Line 49
	push	OFFSET FLAT:$SG287
	call	_printf
	add	esp, 4
; Line 50
	call	_SG_CloseConnection
; Line 51
	mov	al, 1
	jmp	$L274
; Line 53
$L286:
	jmp	$L284
$L285:
; Line 55
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp]
	test	eax, eax
	jne	$L288
; Line 56
	push	OFFSET FLAT:$SG289
	call	_printf
	add	esp, 4
; Line 57
	call	_SG_CloseConnection
; Line 58
	mov	al, 2
	jmp	$L274
; Line 61
$L288:
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+2]
	mov	DWORD PTR _timeout, eax
; Line 62
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+1]
	mov	DWORD PTR _player_id, eax
; Line 63
	push	OFFSET FLAT:$SG290
	call	_printf
	add	esp, 4
; Line 64
	xor	al, al
	jmp	$L274
; Line 65
$L274:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_connect ENDP
_TEXT	ENDS
PUBLIC	_net_syncstate
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_AX5:DWORD
EXTRN	_explode_entity:NEAR
_TEXT	SEGMENT
_packet$ = -32
_net_syncstate PROC NEAR
; Line 67
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 71
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	lea	ecx, DWORD PTR _packet$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 72
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
; Line 73
	mov	eax, DWORD PTR _player_id
	shl	eax, 4
	mov	WORD PTR _packet$[ebp+28], ax
; Line 74
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 79
$L294:
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	je	$L295
; Line 82
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	shr	ecx, 8
	and	ecx, -16				; fffffff0H
	cmp	eax, ecx
	jne	$L296
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L296
; Line 83
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	eax, DWORD PTR _players[eax+4]
	lea	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 84
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 0
; Line 86
	jmp	$L297
$L296:
	test	BYTE PTR _packet$[ebp+28], 4
	je	$L298
; Line 89
	jmp	$L299
$L298:
; Line 91
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	je	$L300
; Line 93
	mov	eax, DWORD PTR _AX5
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 240				; 000000f0H
	mov	edx, ecx
	add	ecx, ecx
	sub	ecx, edx
	mov	DWORD PTR _players[ecx+8], eax
; Line 94
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	DWORD PTR _players[eax+12], 0
; Line 95
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	eax, DWORD PTR _players[eax+8]
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 240				; 000000f0H
	mov	edx, ecx
	add	ecx, ecx
	sub	ecx, edx
	mov	DWORD PTR _players[ecx+4], eax
; Line 96
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 1
; Line 100
$L300:
	lea	eax, DWORD PTR _packet$[ebp]
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 240				; 000000f0H
	mov	edx, ecx
	add	ecx, ecx
	sub	ecx, edx
	mov	ecx, DWORD PTR _players[ecx+4]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	add	ecx, 4
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 101
	lea	eax, DWORD PTR _packet$[ebp+12]
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 240				; 000000f0H
	mov	edx, ecx
	add	ecx, ecx
	sub	ecx, edx
	mov	ecx, DWORD PTR _players[ecx+4]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	add	ecx, 16					; 00000010H
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 103
	test	BYTE PTR _packet$[ebp+28], 1
	je	$L301
; Line 106
$L301:
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L302
; Line 107
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	eax, DWORD PTR _players[eax+4]
	lea	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 108
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 2
; Line 110
$L302:
$L299:
$L297:
; Line 111
	jmp	$L294
$L295:
; Line 134
$L291:
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
; Line 136
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 138
$L303:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_disconnect ENDP
_TEXT	ENDS
END
