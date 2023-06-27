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
EXTRN	_SND_LASER_ENEMY:DWORD
EXTRN	_play_soundfx:NEAR
_TEXT	SEGMENT
; File src\net.c
_index$ = 8
_pos$ = -32
_ori$ = -16
_id$ = -20
_spawn_enemy_laser PROC NEAR
; Line 17
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 18
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
; Line 19
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
; Line 20
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
; Line 22
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
; Line 23
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _players[eax+12]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+92], eax
; Line 24
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+32], 280			; 00000118H
; Line 25
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+84], eax
; Line 26
	mov	eax, DWORD PTR _SND_LASER_ENEMY
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 27
$L293:
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
$SG305	DB	'STARBLAZER', 00H
	ORG $+1
$SG308	DB	'NET: Connection failed.', 0aH, 00H
	ORG $+3
$SG313	DB	'NET: Server timed out.', 0aH, 00H
$SG315	DB	'NET: Authentication failed.', 0aH, 00H
	ORG $+3
$SG316	DB	'NET: Successful connection.', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_addr$ = 8
_auth_token$ = -48
_ret_token$ = -1052
_time_started$ = -1056
_net_connect PROC NEAR
; Line 42
	push	ebp
	mov	ebp, esp
	sub	esp, 1056				; 00000420H
	push	ebx
	push	esi
	push	edi
; Line 46
	call	_SG_GetTicks
	mov	DWORD PTR _time_started$[ebp], eax
; Line 48
	push	OFFSET FLAT:$SG305
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 49
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 14					; 0000000eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+13]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 50
	mov	eax, OFFSET FLAT:_GAME_SETTINGS
	add	eax, 30					; 0000001eH
	push	eax
	lea	eax, DWORD PTR _auth_token$[ebp+29]
	push	eax
	call	_strcpy
	add	esp, 8
; Line 54
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_SG_OpenConnection
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	jne	$L306
; Line 55
	push	OFFSET FLAT:$SG308
	call	_printf
	add	esp, 4
; Line 56
	mov	al, 1
	jmp	$L299
; Line 59
$L306:
	push	45					; 0000002dH
	lea	eax, DWORD PTR _auth_token$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 61
$L310:
	push	3
	lea	eax, DWORD PTR _ret_token$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	$L311
; Line 62
	call	_SG_GetTicks
	sub	eax, DWORD PTR _time_started$[ebp]
	cmp	eax, 3000				; 00000bb8H
	jbe	$L312
; Line 63
	push	OFFSET FLAT:$SG313
	call	_printf
	add	esp, 4
; Line 64
	call	_SG_CloseConnection
; Line 65
	mov	al, 1
	jmp	$L299
; Line 67
$L312:
	jmp	$L310
$L311:
; Line 69
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp]
	test	eax, eax
	jne	$L314
; Line 70
	push	OFFSET FLAT:$SG315
	call	_printf
	add	esp, 4
; Line 71
	call	_SG_CloseConnection
; Line 72
	mov	al, 2
	jmp	$L299
; Line 75
$L314:
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+2]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, eax
	mov	DWORD PTR _timeout, eax
; Line 76
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[ebp+1]
	mov	DWORD PTR _player_id, eax
; Line 77
	push	OFFSET FLAT:$SG316
	call	_printf
	add	esp, 4
; Line 78
	xor	al, al
	jmp	$L299
; Line 79
$L299:
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
; Line 81
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 85
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	lea	ecx, DWORD PTR _packet$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 86
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
; Line 87
	xor	eax, eax
	mov	al, BYTE PTR _firing
	mov	ecx, DWORD PTR _player_id
	shl	ecx, 4
	or	eax, ecx
	mov	WORD PTR _packet$[ebp+28], ax
; Line 89
	xor	eax, eax
	mov	al, BYTE PTR _dying
	test	eax, eax
	je	$L319
; Line 90
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	or	eax, 2
	mov	WORD PTR _packet$[ebp+28], ax
; Line 91
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _impact_id
	shl	ecx, 12					; 0000000cH
	or	eax, ecx
	mov	WORD PTR _packet$[ebp+28], ax
; Line 92
	mov	BYTE PTR _dying, 0
; Line 93
$L319:
	cmp	DWORD PTR _frames_respawning, 0
	je	$L320
; Line 94
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	or	eax, 4
	mov	WORD PTR _packet$[ebp+28], ax
; Line 97
$L320:
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 102
$L322:
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	je	$L323
; Line 105
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	shr	ecx, 8
	and	ecx, -16				; fffffff0H
	cmp	eax, ecx
	jne	$L324
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L324
; Line 106
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	jne	$L325
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
; Line 109
$L325:
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 0
; Line 111
	jmp	$L326
$L324:
	test	BYTE PTR _packet$[ebp+28], 4
	je	$L327
; Line 112
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	jne	$L328
; Line 113
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
; Line 115
$L328:
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 2
; Line 117
	jmp	$L329
$L327:
; Line 119
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	xor	ecx, ecx
	mov	cl, BYTE PTR _players[eax]
	cmp	ecx, 1
	je	$L330
; Line 121
	mov	eax, DWORD PTR _AX5
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 240				; 000000f0H
	mov	edx, ecx
	add	ecx, ecx
	sub	ecx, edx
	mov	DWORD PTR _players[ecx+8], eax
; Line 122
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	DWORD PTR _players[eax+12], OFFSET FLAT:_ENEMY_LASER
; Line 123
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
; Line 124
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 1
; Line 127
$L330:
	test	BYTE PTR _packet$[ebp+28], 2
	je	$L331
; Line 128
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
; Line 129
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	mov	ecx, eax
	add	eax, eax
	sub	eax, ecx
	mov	BYTE PTR _players[eax], 2
; Line 131
	jmp	$L332
$L331:
; Line 133
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
; Line 134
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
; Line 136
	test	BYTE PTR _packet$[ebp+28], 1
	je	$L333
; Line 137
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 240				; 000000f0H
	shr	eax, 4
	push	eax
	call	_spawn_enemy_laser
	add	esp, 4
; Line 139
$L333:
$L332:
; Line 141
$L329:
$L326:
; Line 142
	jmp	$L322
$L323:
; Line 165
$L317:
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
; Line 167
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 169
$L334:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_net_disconnect ENDP
_TEXT	ENDS
END
