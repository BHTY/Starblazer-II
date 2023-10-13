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
;	COMDAT ??_C@_0L@OENN@STARBLAZER?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BJ@CGNO@NET?3?5Connection?5failed?4?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BI@JKII@NET?3?5Server?5timed?5out?4?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BN@OHPO@NET?3?5Authentication?5failed?4?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BN@FEMK@NET?3?5Successful?5connection?4?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _spawn_enemy_laser
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _net_connect
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _net_syncstate
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _net_disconnect
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_timeout
_DATA	SEGMENT
COMM	_player_id:DWORD
COMM	_players:BYTE:0200H
_timeout DD	0afH
_DATA	ENDS
PUBLIC	_spawn_enemy_laser
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_play_soundfx:NEAR
EXTRN	_SND_LASER_ENEMY:DWORD
;	COMDAT _spawn_enemy_laser
_TEXT	SEGMENT
; File src\net.c
_index$ = 8
_pos$ = -28
_ori$ = -16
_spawn_enemy_laser PROC NEAR				; COMDAT
; Line 17
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	mov	esi, DWORD PTR _index$[esp+32]
	push	edi
	mov	edi, esi
	lea	edx, DWORD PTR _pos$[esp+40]
	shl	edi, 5
	mov	eax, DWORD PTR _players[edi+4]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
; Line 18
	lea	ebx, DWORD PTR [ecx+4]
	add	ecx, 16					; 00000010H
	mov	eax, DWORD PTR [ebx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ebx+4]
	mov	ebx, DWORD PTR [ebx+8]
	mov	DWORD PTR [edx+4], eax
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx+8], ebx
; Line 19
	lea	edx, DWORD PTR _ori$[esp+40]
	mov	ebx, DWORD PTR [ecx+4]
	push	0
	push	0
	push	0
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+4], ebx
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+8], eax
	mov	eax, DWORD PTR _pos$[esp+56]
	mov	DWORD PTR [edx+12], ecx
; Line 20
	mov	edx, DWORD PTR _pos$[esp+60]
	mov	ecx, DWORD PTR _pos$[esp+52]
	push	edx
	push	eax
	push	ecx
	mov	edx, DWORD PTR _players[edi+12]
	mov	eax, DWORD PTR [edx+12]
	push	eax
	call	_spawn_entity
	lea	ebx, DWORD PTR _ori$[esp+68]
	add	esp, 28					; 0000001cH
	lea	ecx, DWORD PTR _StarblazerEntities[eax*4]
; Line 22
	mov	eax, DWORD PTR [ebx]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+16], eax
	add	edx, 16					; 00000010H
	mov	eax, DWORD PTR [ebx+4]
	mov	DWORD PTR [edx+4], eax
	mov	eax, DWORD PTR [ebx+8]
	mov	ebx, DWORD PTR [ebx+12]
	mov	DWORD PTR [edx+8], eax
	mov	DWORD PTR [edx+12], ebx
; Line 23
	mov	edx, DWORD PTR _players[edi+12]
	mov	ebx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [ebx+92], eax
; Line 24
	mov	ebx, DWORD PTR [ecx]
	mov	DWORD PTR [ebx+32], 280			; 00000118H
; Line 25
	mov	ebx, DWORD PTR [ecx]
	mov	DWORD PTR [ebx+84], esi
; Line 26
	mov	eax, DWORD PTR _SND_LASER_ENEMY
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 27
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 28					; 0000001cH
	ret	0
_spawn_enemy_laser ENDP
_TEXT	ENDS
PUBLIC	??_C@_0BN@FEMK@NET?3?5Successful?5connection?4?6?$AA@ ; `string'
PUBLIC	??_C@_0L@OENN@STARBLAZER?$AA@			; `string'
PUBLIC	??_C@_0BJ@CGNO@NET?3?5Connection?5failed?4?6?$AA@ ; `string'
PUBLIC	_net_connect
PUBLIC	??_C@_0BI@JKII@NET?3?5Server?5timed?5out?4?6?$AA@ ; `string'
PUBLIC	??_C@_0BN@OHPO@NET?3?5Authentication?5failed?4?6?$AA@ ; `string'
EXTRN	_SG_GetTicks:NEAR
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_SG_OpenConnection:NEAR
EXTRN	_SG_RecievePacket:NEAR
EXTRN	_SG_SendPacket:NEAR
EXTRN	_SG_CloseConnection:NEAR
EXTRN	_printf:NEAR
;	COMDAT ??_C@_0L@OENN@STARBLAZER?$AA@
_DATA	SEGMENT
??_C@_0L@OENN@STARBLAZER?$AA@ DB 'STARBLAZER', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BJ@CGNO@NET?3?5Connection?5failed?4?6?$AA@
_DATA	SEGMENT
??_C@_0BJ@CGNO@NET?3?5Connection?5failed?4?6?$AA@ DB 'NET: Connection fai'
	DB	'led.', 0aH, 00H				; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BI@JKII@NET?3?5Server?5timed?5out?4?6?$AA@
_DATA	SEGMENT
??_C@_0BI@JKII@NET?3?5Server?5timed?5out?4?6?$AA@ DB 'NET: Server timed o'
	DB	'ut.', 0aH, 00H				; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BN@OHPO@NET?3?5Authentication?5failed?4?6?$AA@
_DATA	SEGMENT
??_C@_0BN@OHPO@NET?3?5Authentication?5failed?4?6?$AA@ DB 'NET: Authentica'
	DB	'tion failed.', 0aH, 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BN@FEMK@NET?3?5Successful?5connection?4?6?$AA@
_DATA	SEGMENT
??_C@_0BN@FEMK@NET?3?5Successful?5connection?4?6?$AA@ DB 'NET: Successful'
	DB	' connection.', 0aH, 00H			; `string'
_DATA	ENDS
;	COMDAT _net_connect
_TEXT	SEGMENT
_addr$ = 8
_auth_token$ = -48
_ret_token$ = -52
_net_connect PROC NEAR					; COMDAT
; Line 42
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
; Line 46
	call	_SG_GetTicks
	mov	ebx, eax
	mov	ecx, OFFSET FLAT:??_C@_0L@OENN@STARBLAZER?$AA@ ; `string'
; Line 48
	lea	edx, DWORD PTR _auth_token$[esp+64]
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	edi, OFFSET FLAT:_GAME_SETTINGS+14
	mov	DWORD PTR [edx+4], eax
	mov	ax, WORD PTR [ecx+8]
	mov	cl, BYTE PTR [ecx+10]
	mov	WORD PTR [edx+8], ax
	sub	eax, eax
	mov	BYTE PTR [edx+10], cl
; Line 49
	mov	ecx, -1
	repnz	scasb
	not	ecx
	sub	edi, ecx
	mov	edx, ecx
	shr	ecx, 2
	mov	esi, edi
	lea	edi, DWORD PTR _auth_token$[esp+77]
	rep	movsd
	mov	ecx, edx
	and	ecx, 3
	rep	movsb
; Line 50
	mov	edi, OFFSET FLAT:_GAME_SETTINGS+30
	mov	ecx, -1
	sub	eax, eax
	repnz	scasb
	not	ecx
	sub	edi, ecx
	mov	eax, ecx
	shr	ecx, 2
	mov	esi, edi
	lea	edi, DWORD PTR _auth_token$[esp+93]
	rep	movsd
	mov	ecx, eax
	and	ecx, 3
	rep	movsb
; Line 54
	mov	ecx, DWORD PTR _addr$[esp+60]
	push	ecx
	call	_SG_OpenConnection
	add	esp, 4
	test	al, al
	jne	SHORT $L438
; Line 55
	push	OFFSET FLAT:??_C@_0BJ@CGNO@NET?3?5Connection?5failed?4?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
	mov	al, 1
; Line 56
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 52					; 00000034H
	ret	0
; Line 59
$L438:
	lea	eax, DWORD PTR _auth_token$[esp+64]
	push	45					; 0000002dH
	push	eax
	call	_SG_SendPacket
	add	esp, 8
; Line 61
$L442:
	lea	eax, DWORD PTR _ret_token$[esp+64]
	push	3
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	SHORT $L443
; Line 62
	call	_SG_GetTicks
	sub	eax, ebx
	cmp	eax, 3000				; 00000bb8H
	jbe	SHORT $L442
; Line 63
	push	OFFSET FLAT:??_C@_0BI@JKII@NET?3?5Server?5timed?5out?4?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 64
	call	_SG_CloseConnection
; Line 65
	mov	al, 1
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 52					; 00000034H
	ret	0
; Line 67
$L443:
; Line 69
	cmp	BYTE PTR _ret_token$[esp+64], 0
	jne	SHORT $L446
; Line 70
	push	OFFSET FLAT:??_C@_0BN@OHPO@NET?3?5Authentication?5failed?4?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 71
	call	_SG_CloseConnection
; Line 72
	mov	al, 2
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 52					; 00000034H
	ret	0
; Line 75
$L446:
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[esp+66]
	mov	ecx, eax
	shl	eax, 3
	sub	eax, ecx
	push	OFFSET FLAT:??_C@_0BN@FEMK@NET?3?5Successful?5connection?4?6?$AA@ ; `string'
	lea	eax, DWORD PTR [eax+eax*4]
	add	eax, eax
	mov	DWORD PTR _timeout, eax
; Line 76
	xor	eax, eax
	mov	al, BYTE PTR _ret_token$[esp+69]
	mov	DWORD PTR _player_id, eax
; Line 77
	call	_printf
	add	esp, 4
	xor	al, al
; Line 79
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 52					; 00000034H
	ret	0
_net_connect ENDP
_TEXT	ENDS
PUBLIC	_net_syncstate
EXTRN	_firing:BYTE
EXTRN	_dying:BYTE
EXTRN	_impact_id:DWORD
EXTRN	_frames_respawning:DWORD
EXTRN	_AX5:DWORD
EXTRN	_ENEMY_LASER_SHREDDER:BYTE
EXTRN	_ENEMY_LASER_DRAGONBREATH:BYTE
EXTRN	_laser_type:BYTE
EXTRN	_explode_entity:NEAR
;	COMDAT _net_syncstate
_TEXT	SEGMENT
_packet$ = -32
_net_syncstate PROC NEAR				; COMDAT
; Line 81
	sub	esp, 32					; 00000020H
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 4
	push	ebx
	lea	edx, DWORD PTR _packet$[esp+36]
	push	esi
	push	edi
	mov	eax, DWORD PTR [ecx]
; Line 85
	mov	DWORD PTR [edx], eax
	mov	ebx, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], ebx
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], ecx
; Line 86
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [ecx+16]
	add	ecx, 16					; 00000010H
	lea	edx, DWORD PTR _packet$[esp+56]
	mov	DWORD PTR [edx], eax
	mov	ebx, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], ebx
	mov	esi, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], esi
	mov	eax, DWORD PTR [ecx+12]
	mov	cl, BYTE PTR _laser_type
	and	ecx, -65281				; ffff00ffH
	mov	DWORD PTR [edx+12], eax
; Line 87
	mov	eax, DWORD PTR _player_id
	add	ax, ax
	or	cx, ax
	mov	al, BYTE PTR _firing
	shl	cx, 3
	and	eax, -65281				; ffff00ffH
	or	cx, ax
	cmp	BYTE PTR _dying, 0
	mov	WORD PTR _packet$[esp+72], cx
; Line 89
	je	SHORT $L451
; Line 91
	mov	BYTE PTR _dying, 0
	mov	eax, DWORD PTR _impact_id
	or	BYTE PTR _packet$[esp+72], 2
	shl	ax, 12					; 0000000cH
	or	WORD PTR _packet$[esp+72], ax
; Line 93
$L451:
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L452
; Line 94
	or	BYTE PTR _packet$[esp+72], 4
; Line 97
$L452:
	lea	eax, DWORD PTR _packet$[esp+44]
	push	32					; 00000020H
	push	eax
	call	_SG_SendPacket
	lea	eax, DWORD PTR _packet$[esp+52]
	add	esp, 8
; Line 102
	push	32					; 00000020H
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	je	$L449
	mov	ebx, 1
	mov	esi, 4
$L454:
	mov	cx, WORD PTR _packet$[esp+72]
	mov	ax, WORD PTR _packet$[esp+72]
	and	ecx, 240				; 000000f0H
; Line 105
	shr	ax, 8
	and	eax, 65535				; 0000ffffH
	and	eax, -16				; fffffff0H
	cmp	eax, ecx
	jne	SHORT $L456
	test	BYTE PTR _packet$[esp+72], 2
	je	SHORT $L456
	cmp	BYTE PTR _players[ecx*2], bl
	lea	eax, DWORD PTR [ecx*2]
; Line 106
	jne	SHORT $L457
; Line 107
	mov	eax, DWORD PTR _players[eax+4]
	lea	ecx, DWORD PTR _StarblazerEntities[eax*4]
	push	ecx
	call	_explode_entity
	add	esp, 4
; Line 109
$L457:
	mov	ax, WORD PTR _packet$[esp+72]
	and	eax, 240				; 000000f0H
	mov	BYTE PTR _players[eax*2], 0
; Line 111
	jmp	$L486
$L456:
	test	WORD PTR _packet$[esp+72], si
	je	SHORT $L459
	cmp	BYTE PTR _players[ecx*2], bl
	lea	eax, DWORD PTR [ecx*2]
; Line 112
	jne	SHORT $L460
; Line 113
	mov	eax, DWORD PTR _players[eax+4]
	lea	ecx, DWORD PTR _StarblazerEntities[eax*4]
	push	ecx
	call	_explode_entity
	add	esp, 4
; Line 115
$L460:
	mov	ax, WORD PTR _packet$[esp+72]
	and	eax, 240				; 000000f0H
	mov	BYTE PTR _players[eax*2], 2
; Line 117
	jmp	$L486
$L459:
	cmp	BYTE PTR _players[ecx*2], bl
	lea	edi, DWORD PTR [ecx*2]
; Line 119
	je	SHORT $L462
	mov	eax, DWORD PTR _AX5
	push	0
; Line 121
	push	0
	mov	DWORD PTR _players[edi+8], eax
; Line 123
	push	0
	push	0
	push	0
	push	0
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _players[edi+4], eax
; Line 124
	mov	ax, WORD PTR _packet$[esp+72]
	and	eax, 240				; 000000f0H
	mov	BYTE PTR _players[eax*2], bl
; Line 127
$L462:
	test	BYTE PTR _packet$[esp+72], 2
	je	SHORT $L463
; Line 128
	mov	ax, WORD PTR _packet$[esp+72]
	and	eax, 240				; 000000f0H
	mov	ecx, DWORD PTR _players[eax*2+4]
	lea	edx, DWORD PTR _StarblazerEntities[ecx*4]
	push	edx
	call	_explode_entity
	mov	ax, WORD PTR _packet$[esp+76]
	add	esp, 4
; Line 129
	and	eax, 240				; 000000f0H
	mov	BYTE PTR _players[eax*2], 2
; Line 131
	jmp	$L486
$L463:
; Line 133
	mov	ax, WORD PTR _packet$[esp+72]
	lea	ecx, DWORD PTR _packet$[esp+44]
	and	eax, 240				; 000000f0H
	mov	edi, DWORD PTR _players[eax*2+4]
	mov	eax, DWORD PTR [ecx]
	mov	edx, DWORD PTR _StarblazerEntities[edi*4]
	add	edx, esi
	mov	DWORD PTR [edx], eax
	mov	edi, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], edi
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], ecx
; Line 134
	lea	ecx, DWORD PTR _packet$[esp+56]
	mov	ax, WORD PTR _packet$[esp+72]
	and	eax, 240				; 000000f0H
	mov	edi, DWORD PTR _players[eax*2+4]
	mov	eax, DWORD PTR [ecx]
	mov	edx, DWORD PTR _StarblazerEntities[edi*4]
	mov	DWORD PTR [edx+16], eax
	add	edx, 16					; 00000010H
	mov	edi, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], edi
	mov	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], eax
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+12], ecx
; Line 136
	test	WORD PTR _packet$[esp+72], bx
	je	SHORT $L486
; Line 137
	test	BYTE PTR _packet$[esp+72], 8
	mov	cx, WORD PTR _packet$[esp+72]
	jne	SHORT $L466
	and	cx, 240					; 000000f0H
; Line 138
	mov	eax, ecx
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _players[eax*2+12], OFFSET FLAT:_ENEMY_LASER_SHREDDER
; Line 140
	jmp	SHORT $L467
$L466:
	and	cx, 240					; 000000f0H
; Line 141
	mov	eax, ecx
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _players[eax*2+12], OFFSET FLAT:_ENEMY_LASER_DRAGONBREATH
; Line 142
$L467:
; Line 144
	shr	cx, 4
	mov	eax, ecx
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_spawn_enemy_laser
	add	esp, 4
$L486:
; Line 149
	lea	eax, DWORD PTR _packet$[esp+44]
	push	32					; 00000020H
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	$L454
; Line 172
$L449:
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 32					; 00000020H
	ret	0
_net_syncstate ENDP
_TEXT	ENDS
PUBLIC	_net_disconnect
;	COMDAT _net_disconnect
_TEXT	SEGMENT
_net_disconnect PROC NEAR				; COMDAT
; Line 176
	ret	0
_net_disconnect ENDP
_TEXT	ENDS
END
