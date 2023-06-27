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
_index$ = 8
_pos$ = -32
_ori$ = -16
_id$ = -20
_spawn_enemy_laser PROC NEAR
; File src\net.c
; Line 17
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
; Line 18
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _players[eax+4]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	add	edx, 4
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _pos$[ebp], eax
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR _pos$[ebp+4], ecx
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR _pos$[ebp+8], edx
; Line 19
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _players[eax+4]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	add	edx, 16					; 00000010H
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _ori$[ebp], eax
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR _ori$[ebp+4], ecx
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR _ori$[ebp+8], eax
	mov	ecx, DWORD PTR [edx+12]
	mov	DWORD PTR _ori$[ebp+12], ecx
; Line 20
	push	0
	push	0
	push	0
	mov	edx, DWORD PTR _pos$[ebp+8]
	push	edx
	mov	eax, DWORD PTR _pos$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _pos$[ebp]
	push	ecx
	mov	edx, DWORD PTR _index$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _players[edx+12]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 22
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	add	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _ori$[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _ori$[ebp+4]
	mov	DWORD PTR [eax+4], edx
	mov	ecx, DWORD PTR _ori$[ebp+8]
	mov	DWORD PTR [eax+8], ecx
	mov	edx, DWORD PTR _ori$[ebp+12]
	mov	DWORD PTR [eax+12], edx
; Line 23
	mov	eax, DWORD PTR _index$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _players[eax+12]
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [eax+92], ecx
; Line 24
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [eax+32], 280			; 00000118H
; Line 25
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	eax, DWORD PTR _index$[ebp]
	mov	DWORD PTR [edx+84], eax
; Line 26
	mov	ecx, DWORD PTR _SND_LASER_ENEMY
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 27
	mov	esp, ebp
	pop	ebp
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
	push	OFFSET FLAT:_GAME_SETTINGS+14
	lea	ecx, DWORD PTR _auth_token$[ebp+13]
	push	ecx
	call	_strcpy
	add	esp, 8
; Line 50
	push	OFFSET FLAT:_GAME_SETTINGS+30
	lea	edx, DWORD PTR _auth_token$[ebp+29]
	push	edx
	call	_strcpy
	add	esp, 8
; Line 54
	mov	eax, DWORD PTR _addr$[ebp]
	push	eax
	call	_SG_OpenConnection
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L306
; Line 55
	push	OFFSET FLAT:$SG308
	call	_printf
	add	esp, 4
; Line 56
	mov	al, 1
	jmp	$L299
$L306:
; Line 59
	push	45					; 0000002dH
	lea	ecx, DWORD PTR _auth_token$[ebp]
	push	ecx
	call	_SG_SendPacket
	add	esp, 8
$L310:
; Line 61
	push	3
	lea	edx, DWORD PTR _ret_token$[ebp]
	push	edx
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	SHORT $L311
; Line 62
	call	_SG_GetTicks
	sub	eax, DWORD PTR _time_started$[ebp]
	cmp	eax, 3000				; 00000bb8H
	jbe	SHORT $L312
; Line 63
	push	OFFSET FLAT:$SG313
	call	_printf
	add	esp, 4
; Line 64
	call	_SG_CloseConnection
; Line 65
	mov	al, 1
	jmp	SHORT $L299
$L312:
; Line 67
	jmp	SHORT $L310
$L311:
; Line 69
	mov	eax, DWORD PTR _ret_token$[ebp]
	and	eax, 255				; 000000ffH
	test	eax, eax
	jne	SHORT $L314
; Line 70
	push	OFFSET FLAT:$SG315
	call	_printf
	add	esp, 4
; Line 71
	call	_SG_CloseConnection
; Line 72
	mov	al, 2
	jmp	SHORT $L299
$L314:
; Line 75
	mov	ecx, DWORD PTR _ret_token$[ebp+2]
	and	ecx, 255				; 000000ffH
	imul	ecx, 70					; 00000046H
	mov	DWORD PTR _timeout, ecx
; Line 76
	mov	edx, DWORD PTR _ret_token$[ebp+1]
	and	edx, 255				; 000000ffH
	mov	DWORD PTR _player_id, edx
; Line 77
	push	OFFSET FLAT:$SG316
	call	_printf
	add	esp, 4
; Line 78
	xor	al, al
$L299:
; Line 79
	mov	esp, ebp
	pop	ebp
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
; Line 85
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _packet$[ebp], ecx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _packet$[ebp+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _packet$[ebp+8], eax
; Line 86
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 16					; 00000010H
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _packet$[ebp+12], edx
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _packet$[ebp+16], eax
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _packet$[ebp+20], edx
	mov	eax, DWORD PTR [ecx+12]
	mov	DWORD PTR _packet$[ebp+24], eax
; Line 87
	mov	ecx, DWORD PTR _player_id
	shl	ecx, 4
	xor	edx, edx
	mov	dl, BYTE PTR _firing
	or	ecx, edx
	mov	WORD PTR _packet$[ebp+28], cx
; Line 89
	xor	eax, eax
	mov	al, BYTE PTR _dying
	test	eax, eax
	je	SHORT $L319
; Line 90
	mov	cx, WORD PTR _packet$[ebp+28]
	or	cl, 2
	mov	WORD PTR _packet$[ebp+28], cx
; Line 91
	mov	edx, DWORD PTR _impact_id
	shl	edx, 12					; 0000000cH
	mov	ax, WORD PTR _packet$[ebp+28]
	or	ax, dx
	mov	WORD PTR _packet$[ebp+28], ax
; Line 92
	mov	BYTE PTR _dying, 0
$L319:
; Line 93
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L320
; Line 94
	mov	cx, WORD PTR _packet$[ebp+28]
	or	cl, 4
	mov	WORD PTR _packet$[ebp+28], cx
$L320:
; Line 97
	push	32					; 00000020H
	lea	edx, DWORD PTR _packet$[ebp]
	push	edx
	call	_SG_SendPacket
	add	esp, 8
$L322:
; Line 102
	push	32					; 00000020H
	lea	eax, DWORD PTR _packet$[ebp]
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	je	$L323
; Line 105
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	sar	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _packet$[ebp+28]
	and	edx, 65535				; 0000ffffH
	and	edx, 240				; 000000f0H
	sar	edx, 4
	cmp	ecx, edx
	jne	SHORT $L324
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	and	eax, 2
	test	eax, eax
	je	SHORT $L324
; Line 106
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	xor	edx, edx
	mov	dl, BYTE PTR _players[ecx]
	cmp	edx, 1
	jne	SHORT $L325
; Line 107
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	and	eax, 240				; 000000f0H
	sar	eax, 4
	shl	eax, 4
	mov	ecx, DWORD PTR _players[eax+4]
	lea	edx, DWORD PTR _StarblazerEntities[ecx*4]
	push	edx
	call	_explode_entity
	add	esp, 4
$L325:
; Line 109
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	and	eax, 240				; 000000f0H
	sar	eax, 4
	shl	eax, 4
	mov	BYTE PTR _players[eax], 0
; Line 111
	jmp	$L333
$L324:
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L327
; Line 112
	mov	edx, DWORD PTR _packet$[ebp+28]
	and	edx, 65535				; 0000ffffH
	and	edx, 240				; 000000f0H
	sar	edx, 4
	shl	edx, 4
	xor	eax, eax
	mov	al, BYTE PTR _players[edx]
	cmp	eax, 1
	jne	SHORT $L328
; Line 113
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	mov	edx, DWORD PTR _players[ecx+4]
	lea	eax, DWORD PTR _StarblazerEntities[edx*4]
	push	eax
	call	_explode_entity
	add	esp, 4
$L328:
; Line 115
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	mov	BYTE PTR _players[ecx], 2
; Line 117
	jmp	$L333
$L327:
; Line 119
	mov	edx, DWORD PTR _packet$[ebp+28]
	and	edx, 65535				; 0000ffffH
	and	edx, 240				; 000000f0H
	sar	edx, 4
	shl	edx, 4
	xor	eax, eax
	mov	al, BYTE PTR _players[edx]
	cmp	eax, 1
	je	$L330
; Line 121
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	mov	edx, DWORD PTR _AX5
	mov	DWORD PTR _players[ecx+8], edx
; Line 122
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	and	eax, 240				; 000000f0H
	sar	eax, 4
	shl	eax, 4
	mov	DWORD PTR _players[eax+12], OFFSET FLAT:_ENEMY_LASER
; Line 123
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	mov	edx, DWORD PTR _players[ecx+8]
	push	edx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	mov	DWORD PTR _players[ecx+4], eax
; Line 124
	mov	edx, DWORD PTR _packet$[ebp+28]
	and	edx, 65535				; 0000ffffH
	and	edx, 240				; 000000f0H
	sar	edx, 4
	shl	edx, 4
	mov	BYTE PTR _players[edx], 1
$L330:
; Line 127
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	and	eax, 2
	test	eax, eax
	je	SHORT $L331
; Line 128
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	mov	edx, DWORD PTR _players[ecx+4]
	lea	eax, DWORD PTR _StarblazerEntities[edx*4]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 129
	mov	ecx, DWORD PTR _packet$[ebp+28]
	and	ecx, 65535				; 0000ffffH
	and	ecx, 240				; 000000f0H
	sar	ecx, 4
	shl	ecx, 4
	mov	BYTE PTR _players[ecx], 2
; Line 131
	jmp	$L333
$L331:
; Line 133
	mov	edx, DWORD PTR _packet$[ebp+28]
	and	edx, 65535				; 0000ffffH
	and	edx, 240				; 000000f0H
	sar	edx, 4
	shl	edx, 4
	mov	eax, DWORD PTR _players[edx+4]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	add	ecx, 4
	mov	edx, DWORD PTR _packet$[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _packet$[ebp+4]
	mov	DWORD PTR [ecx+4], eax
	mov	edx, DWORD PTR _packet$[ebp+8]
	mov	DWORD PTR [ecx+8], edx
; Line 134
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	and	eax, 240				; 000000f0H
	sar	eax, 4
	shl	eax, 4
	mov	ecx, DWORD PTR _players[eax+4]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	add	edx, 16					; 00000010H
	mov	eax, DWORD PTR _packet$[ebp+12]
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR _packet$[ebp+16]
	mov	DWORD PTR [edx+4], ecx
	mov	eax, DWORD PTR _packet$[ebp+20]
	mov	DWORD PTR [edx+8], eax
	mov	ecx, DWORD PTR _packet$[ebp+24]
	mov	DWORD PTR [edx+12], ecx
; Line 136
	mov	edx, DWORD PTR _packet$[ebp+28]
	and	edx, 65535				; 0000ffffH
	and	edx, 1
	test	edx, edx
	je	SHORT $L333
; Line 137
	mov	eax, DWORD PTR _packet$[ebp+28]
	and	eax, 65535				; 0000ffffH
	and	eax, 240				; 000000f0H
	sar	eax, 4
	push	eax
	call	_spawn_enemy_laser
	add	esp, 4
$L333:
; Line 142
	jmp	$L322
$L323:
; Line 165
	mov	esp, ebp
	pop	ebp
	ret	0
_net_syncstate ENDP
_TEXT	ENDS
PUBLIC	_net_disconnect
_TEXT	SEGMENT
_net_disconnect PROC NEAR
; Line 167
	push	ebp
	mov	ebp, esp
; Line 169
	pop	ebp
	ret	0
_net_disconnect ENDP
_TEXT	ENDS
END
