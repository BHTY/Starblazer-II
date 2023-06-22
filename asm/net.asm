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
PUBLIC	_spawn_enemy_laser
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
_TEXT	SEGMENT
; File src\net.c
_index$ = 8
_pos$ = -32
_ori$ = -16
_id$ = -20
_spawn_enemy_laser PROC NEAR
; Line 16
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 17
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _players[eax+4]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	add	eax, 4
	lea	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 18
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _players[eax+4]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	add	eax, 16					; 00000010H
	lea	ecx, DWORD PTR _ori$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 19
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _pos$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _players[eax+12]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 21
	lea	eax, DWORD PTR _ori$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
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
; Line 22
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _players[eax+12]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+92], eax
; Line 23
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+32], 280			; 00000118H
; Line 24
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+84], eax
; Line 25
$L277:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_spawn_enemy_laser ENDP
_TEXT	ENDS
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
$SG287	DB	'STARBLAZER', 00H
	ORG $+1
$SG290	DB	'NET: Connection failed.', 0aH, 00H
	ORG $+3
$SG295	DB	'NET: Server timed out.', 0aH, 00H
$SG297	DB	'NET: Authentication failed.', 0aH, 00H
	ORG $+3
$SG298	DB	'NET: Successful connection.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_addr$ = 8
_auth_token$ = -48
_ret_token$ = -52
_time_started$ = -56
_net_connect PROC NEAR
; Line 40
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 43
	call	_SG_GetTicks
	mov	DWORD PTR _time_started$[ebp], eax
; Line 45
	push	OFFSET FLAT:$SG287
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 46
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 14					; 0000000eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+13]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 47
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 30					; 0000001eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+29]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 51
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_SG_OpenConnection
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	jne	$L288
; Line 52
	push	OFFSET FLAT:$SG290
	call	_printf
	add	esp, 4
; Line 53
	mov	al, 1
	jmp	$L282
; Line 56
$L288:
	push	45					; 0000002dH
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 58
$L292:
	push	3
	lea	eax, DWORD PTR _ret_token$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	$L293
; Line 59
	call	_SG_GetTicks
	sub	eax, DWORD PTR _time_started$[ebp]
	cmp	eax, 3000				; 00000bb8H
	jbe	$L294
; Line 60
	push	OFFSET FLAT:$SG295
	call	_printf
	add	esp, 4
; Line 61
	call	_SG_CloseConnection
; Line 62
	mov	al, 1
	jmp	$L282
; Line 64
$L294:
	jmp	$L292
$L293:
; Line 66
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp]
	test	eax, eax
	jne	$L296
; Line 67
	push	OFFSET FLAT:$SG297
	call	_printf
	add	esp, 4
; Line 68
	call	_SG_CloseConnection
; Line 69
	mov	al, 2
	jmp	$L282
; Line 72
$L296:
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+2]
	mov	DWORD PTR _timeout, eax
; Line 73
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+1]
	mov	DWORD PTR _player_id, eax
; Line 74
	push	OFFSET FLAT:$SG298
	call	_printf
	add	esp, 4
; Line 75
	xor	al, al
	jmp	$L282
; Line 76
$L282:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_connect ENDP
_TEXT	ENDS
PUBLIC	_net_syncstate
EXTRN	_firing:BYTE
EXTRN	_AX5:DWORD
EXTRN	_ENEMY_LASER:BYTE
EXTRN	_explode_entity:NEAR
_TEXT	SEGMENT
_packet$ = -32
_net_syncstate PROC NEAR
; Line 78
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 82
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	lea	ecx, DWORD PTR _packet$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 83
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
; Line 84
	xor	eax, eax
	mov	al, BYTE PTR _firing
	mov	ecx, DWORD PTR _player_id
	shl	ecx, 4
	or	eax, ecx
	mov	WORD PTR _packet$[ebp+28], ax
; Line 85
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 90
$L302:
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	je	$L303
; Line 93
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	shr	ecx, 8
	and	ecx, -16				; fffffff0H
	cmp	eax, ecx
	jne	$L304
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L304
; Line 94
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
; Line 95
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 0
; Line 97
	jmp	$L305
$L304:
	test	BYTE PTR _packet$[ebp+28], 4
	je	$L306
; Line 100
	jmp	$L307
$L306:
; Line 102
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	je	$L308
; Line 104
	mov	eax, DWORD PTR _AX5
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 240				; 000000f0H
	mov	edx, ecx
	add	ecx, ecx
	sub	ecx, edx
	mov	DWORD PTR _players[ecx+8], eax
; Line 105
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	DWORD PTR _players[eax+12], OFFSET FLAT:_ENEMY_LASER
; Line 106
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
; Line 107
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 1
; Line 111
$L308:
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
; Line 112
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
; Line 114
	test	BYTE PTR _packet$[ebp+28], 1
	je	$L309
; Line 115
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	shr	eax, 4
	push	eax
	call	_spawn_enemy_laser
	add	esp, 4
; Line 117
$L309:
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L310
; Line 118
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
; Line 119
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 2
; Line 121
$L310:
$L307:
$L305:
; Line 122
	jmp	$L302
$L303:
; Line 145
$L299:
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
; Line 147
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 149
$L311:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_disconnect ENDP
_TEXT	ENDS
END
