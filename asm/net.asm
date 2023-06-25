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
PUBLIC	_timeout
_DATA	SEGMENT
COMM	_player_id:DWORD
COMM	_players:BYTE:0100H
_timeout DD	0afH
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
$L280:
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
$SG291	DB	'STARBLAZER', 00H
	ORG $+1
$SG294	DB	'NET: Connection failed.', 0aH, 00H
	ORG $+3
$SG299	DB	'NET: Server timed out.', 0aH, 00H
$SG301	DB	'NET: Authentication failed.', 0aH, 00H
	ORG $+3
$SG302	DB	'NET: Successful connection.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_addr$ = 8
_auth_token$ = -48
_ret_token$ = -1052
_time_started$ = -1056
_net_connect PROC NEAR
; Line 40
	push	ebp
	mov	ebp, esp
	sub	esp, 1056				; 00000420H
	push	ebx
	push	esi
	push	edi
; Line 44
	call	_SG_GetTicks
	mov	DWORD PTR _time_started$[ebp], eax
; Line 46
	push	OFFSET FLAT:$SG291
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 47
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 14					; 0000000eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+13]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 48
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 30					; 0000001eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+29]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 52
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_SG_OpenConnection
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	jne	$L292
; Line 53
	push	OFFSET FLAT:$SG294
	call	_printf
	add	esp, 4
; Line 54
	mov	al, 1
	jmp	$L285
; Line 57
$L292:
	push	45					; 0000002dH
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 59
$L296:
	push	3
	lea	eax, DWORD PTR _ret_token$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	$L297
; Line 60
	call	_SG_GetTicks
	sub	eax, DWORD PTR _time_started$[ebp]
	cmp	eax, 3000				; 00000bb8H
	jbe	$L298
; Line 61
	push	OFFSET FLAT:$SG299
	call	_printf
	add	esp, 4
; Line 62
	call	_SG_CloseConnection
; Line 63
	mov	al, 1
	jmp	$L285
; Line 65
$L298:
	jmp	$L296
$L297:
; Line 67
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp]
	test	eax, eax
	jne	$L300
; Line 68
	push	OFFSET FLAT:$SG301
	call	_printf
	add	esp, 4
; Line 69
	call	_SG_CloseConnection
; Line 70
	mov	al, 2
	jmp	$L285
; Line 73
$L300:
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+2]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, eax
	mov	DWORD PTR _timeout, eax
; Line 74
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+1]
	mov	DWORD PTR _player_id, eax
; Line 75
	push	OFFSET FLAT:$SG302
	call	_printf
	add	esp, 4
; Line 76
	xor	al, al
	jmp	$L285
; Line 77
$L285:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_connect ENDP
_TEXT	ENDS
PUBLIC	_net_syncstate
EXTRN	_firing:BYTE
EXTRN	_dying:BYTE
EXTRN	_impact_id:DWORD
EXTRN	_frames_respawning:DWORD
EXTRN	_AX5:DWORD
EXTRN	_ENEMY_LASER:BYTE
EXTRN	_explode_entity:NEAR
_TEXT	SEGMENT
_packet$ = -32
_net_syncstate PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 83
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	lea	ecx, DWORD PTR _packet$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 84
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
; Line 85
	xor	eax, eax
	mov	al, BYTE PTR _firing
	mov	ecx, DWORD PTR _player_id
	shl	ecx, 4
	or	eax, ecx
	mov	WORD PTR _packet$[ebp+28], ax
; Line 87
	xor	eax, eax
	mov	al, BYTE PTR _dying
	test	eax, eax
	je	$L305
; Line 88
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	or	eax, 2
	mov	WORD PTR _packet$[ebp+28], ax
; Line 89
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _impact_id
	shl	ecx, 12					; 0000000cH
	or	eax, ecx
	mov	WORD PTR _packet$[ebp+28], ax
; Line 90
	mov	BYTE PTR _dying, 0
; Line 91
$L305:
	cmp	DWORD PTR _frames_respawning, 0
	je	$L306
; Line 92
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	or	eax, 4
	mov	WORD PTR _packet$[ebp+28], ax
; Line 95
$L306:
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 100
$L308:
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	je	$L309
; Line 103
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	shr	ecx, 8
	and	ecx, -16				; fffffff0H
	cmp	eax, ecx
	jne	$L310
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L310
; Line 104
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	jne	$L311
; Line 105
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
; Line 107
$L311:
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 0
; Line 109
	jmp	$L312
$L310:
	test	BYTE PTR _packet$[ebp+28], 4
	je	$L313
; Line 110
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	jne	$L314
; Line 111
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
; Line 113
$L314:
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 2
; Line 115
	jmp	$L315
$L313:
; Line 117
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	je	$L316
; Line 119
	mov	eax, DWORD PTR _AX5
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 240				; 000000f0H
	mov	edx, ecx
	add	ecx, ecx
	sub	ecx, edx
	mov	DWORD PTR _players[ecx+8], eax
; Line 120
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	DWORD PTR _players[eax+12], OFFSET FLAT:_ENEMY_LASER
; Line 121
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
; Line 122
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 1
; Line 125
$L316:
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L317
; Line 126
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
; Line 127
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 2
; Line 129
	jmp	$L318
$L317:
; Line 131
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
; Line 132
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
; Line 134
	test	BYTE PTR _packet$[ebp+28], 1
	je	$L319
; Line 135
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	shr	eax, 4
	push	eax
	call	_spawn_enemy_laser
	add	esp, 4
; Line 137
$L319:
$L318:
; Line 139
$L315:
$L312:
; Line 140
	jmp	$L308
$L309:
; Line 163
$L303:
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
; Line 165
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 167
$L320:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_disconnect ENDP
_TEXT	ENDS
END
