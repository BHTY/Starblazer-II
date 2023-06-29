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
EXTRN	_SND_LASER_ENEMY:DWORD
EXTRN	_play_soundfx:NEAR
;	COMDAT _spawn_enemy_laser
_TEXT	SEGMENT
_index$ = 8
_ori$ = -16
_spawn_enemy_laser PROC NEAR				; COMDAT
; File src\net.c
; Line 17
	sub	esp, 16					; 00000010H
	push	ebx
	push	ebp
	push	esi
	push	edi
; Line 18
	mov	edi, DWORD PTR _index$[esp+28]
; Line 20
	push	0
	mov	esi, edi
	push	0
	shl	esi, 5
	push	0
	mov	eax, DWORD PTR _players[esi+4]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	lea	ecx, DWORD PTR [eax+4]
	add	eax, 16					; 00000010H
	mov	ebx, ecx
	mov	ebp, DWORD PTR [eax]
	mov	ecx, DWORD PTR [ebx]
	mov	DWORD PTR _ori$[esp+44], ebp
	mov	ebp, DWORD PTR [eax+4]
	mov	edx, DWORD PTR [ebx+4]
	mov	DWORD PTR _ori$[esp+48], ebp
	mov	ebp, DWORD PTR [eax+8]
	mov	ebx, DWORD PTR [ebx+8]
	mov	eax, DWORD PTR [eax+12]
	push	ebx
	push	edx
	push	ecx
	mov	ecx, DWORD PTR _players[esi+12]
	mov	DWORD PTR _ori$[esp+68], eax
	mov	edx, DWORD PTR [ecx+12]
	push	edx
	call	_spawn_entity
; Line 22
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR _ori$[esp+60]
	add	ecx, 16					; 00000010H
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR _ori$[esp+64]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR _ori$[esp+72]
	mov	DWORD PTR [ecx+8], ebp
	mov	DWORD PTR [ecx+12], edx
; Line 23
	mov	ecx, DWORD PTR _players[esi+12]
	mov	edx, DWORD PTR _StarblazerEntities[eax*4]
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+92], ecx
; Line 24
	mov	edx, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [edx+32], 280			; 00000118H
; Line 25
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+84], edi
; Line 26
	mov	ecx, DWORD PTR _SND_LASER_ENEMY
	push	ecx
	call	_play_soundfx
	add	esp, 32					; 00000020H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 27
	add	esp, 16					; 00000010H
	ret	0
_spawn_enemy_laser ENDP
_TEXT	ENDS
PUBLIC	_net_connect
PUBLIC	??_C@_0L@OENN@STARBLAZER?$AA@			; `string'
PUBLIC	??_C@_0BJ@CGNO@NET?3?5Connection?5failed?4?6?$AA@ ; `string'
PUBLIC	??_C@_0BI@JKII@NET?3?5Server?5timed?5out?4?6?$AA@ ; `string'
PUBLIC	??_C@_0BN@OHPO@NET?3?5Authentication?5failed?4?6?$AA@ ; `string'
PUBLIC	??_C@_0BN@FEMK@NET?3?5Successful?5connection?4?6?$AA@ ; `string'
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_SG_GetTicks:NEAR
EXTRN	_SG_OpenConnection:NEAR
EXTRN	_SG_RecievePacket:NEAR
EXTRN	_SG_SendPacket:NEAR
EXTRN	_SG_CloseConnection:NEAR
EXTRN	_printf:NEAR
;	COMDAT ??_C@_0L@OENN@STARBLAZER?$AA@
; File src\net.c
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
_ret_token$ = -56
_net_connect PROC NEAR					; COMDAT
; File src\net.c
; Line 42
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 46
	call	_SG_GetTicks
; Line 48
	mov	ecx, DWORD PTR ??_C@_0L@OENN@STARBLAZER?$AA@+4
	mov	ebx, eax
	mov	eax, DWORD PTR ??_C@_0L@OENN@STARBLAZER?$AA@
	mov	DWORD PTR _auth_token$[esp+72], ecx
	mov	DWORD PTR _auth_token$[esp+68], eax
	mov	al, BYTE PTR ??_C@_0L@OENN@STARBLAZER?$AA@+10
	mov	BYTE PTR _auth_token$[esp+78], al
; Line 49
	mov	edi, OFFSET FLAT:_GAME_SETTINGS+14
	or	ecx, -1
	xor	eax, eax
	repne scasb
	mov	dx, WORD PTR ??_C@_0L@OENN@STARBLAZER?$AA@+8
	not	ecx
	sub	edi, ecx
	mov	WORD PTR _auth_token$[esp+76], dx
	lea	edx, DWORD PTR _auth_token$[esp+81]
	mov	eax, ecx
	mov	esi, edi
	mov	edi, edx
	shr	ecx, 2
	rep movsd
	mov	ecx, eax
; Line 50
	xor	eax, eax
	and	ecx, 3
	lea	edx, DWORD PTR _auth_token$[esp+97]
	rep movsb
	mov	edi, OFFSET FLAT:_GAME_SETTINGS+30
	or	ecx, -1
	repne scasb
	not	ecx
	sub	edi, ecx
	mov	eax, ecx
	mov	esi, edi
	mov	edi, edx
	shr	ecx, 2
	rep movsd
	mov	ecx, eax
	and	ecx, 3
	rep movsb
; Line 54
	mov	ecx, DWORD PTR _addr$[esp+64]
	push	ecx
	call	_SG_OpenConnection
	add	esp, 4
	test	al, al
	jne	SHORT $L368
; Line 55
	push	OFFSET FLAT:??_C@_0BJ@CGNO@NET?3?5Connection?5failed?4?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 56
	mov	al, 1
	pop	edi
	pop	esi
	pop	ebx
; Line 79
	add	esp, 56					; 00000038H
	ret	0
$L368:
; Line 59
	lea	edx, DWORD PTR _auth_token$[esp+68]
	push	45					; 0000002dH
	push	edx
	call	_SG_SendPacket
; Line 61
	lea	eax, DWORD PTR _ret_token$[esp+76]
	push	3
	push	eax
	call	_SG_RecievePacket
	add	esp, 16					; 00000010H
	test	eax, eax
	jne	SHORT $L373
$L372:
; Line 62
	call	_SG_GetTicks
	sub	eax, ebx
	cmp	eax, 3000				; 00000bb8H
	ja	SHORT $L415
	lea	ecx, DWORD PTR _ret_token$[esp+68]
	push	3
	push	ecx
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	je	SHORT $L372
$L373:
; Line 69
	mov	al, BYTE PTR _ret_token$[esp+68]
	test	al, al
	jne	SHORT $L376
; Line 70
	push	OFFSET FLAT:??_C@_0BN@OHPO@NET?3?5Authentication?5failed?4?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 71
	call	_SG_CloseConnection
	pop	edi
	pop	esi
; Line 72
	mov	al, 2
	pop	ebx
; Line 79
	add	esp, 56					; 00000038H
	ret	0
$L415:
; Line 63
	push	OFFSET FLAT:??_C@_0BI@JKII@NET?3?5Server?5timed?5out?4?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 64
	call	_SG_CloseConnection
	pop	edi
	pop	esi
; Line 65
	mov	al, 1
	pop	ebx
; Line 79
	add	esp, 56					; 00000038H
	ret	0
$L376:
; Line 75
	mov	eax, DWORD PTR _ret_token$[esp+70]
; Line 77
	push	OFFSET FLAT:??_C@_0BN@FEMK@NET?3?5Successful?5connection?4?6?$AA@ ; `string'
	and	eax, 255				; 000000ffH
	lea	ecx, DWORD PTR [eax*8]
	sub	ecx, eax
	mov	eax, DWORD PTR _ret_token$[esp+73]
	and	eax, 255				; 000000ffH
	lea	edx, DWORD PTR [ecx+ecx*4]
	mov	DWORD PTR _player_id, eax
	shl	edx, 1
	mov	DWORD PTR _timeout, edx
	call	_printf
	add	esp, 4
; Line 78
	xor	al, al
	pop	edi
	pop	esi
	pop	ebx
; Line 79
	add	esp, 56					; 00000038H
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
; Line 85
	mov	eax, DWORD PTR _StarblazerEntities
	lea	ecx, DWORD PTR [eax+4]
; Line 86
	add	eax, 16					; 00000010H
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _packet$[esp+32], edx
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _packet$[esp+36], edx
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR _packet$[esp+40], ecx
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR _packet$[esp+44], edx
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _packet$[esp+48], ecx
; Line 87
	mov	ecx, DWORD PTR _player_id
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR _packet$[esp+52], edx
	mov	eax, DWORD PTR [eax+12]
	movzx	dx, BYTE PTR _laser_type
	mov	DWORD PTR _packet$[esp+56], eax
	lea	eax, DWORD PTR [ecx+ecx]
	movzx	cx, BYTE PTR _firing
	or	eax, edx
	shl	eax, 3
	or	eax, ecx
; Line 89
	mov	cl, BYTE PTR _dying
	test	cl, cl
	mov	WORD PTR _packet$[esp+60], ax
	je	SHORT $L381
; Line 91
	mov	edx, DWORD PTR _impact_id
; Line 92
	mov	BYTE PTR _dying, 0
	shl	edx, 12					; 0000000cH
	or	edx, 2
	or	ax, dx
	mov	WORD PTR _packet$[esp+60], ax
$L381:
; Line 93
	mov	ecx, DWORD PTR _frames_respawning
	test	ecx, ecx
	je	SHORT $L382
; Line 94
	or	al, 4
	mov	WORD PTR _packet$[esp+60], ax
$L382:
; Line 97
	lea	eax, DWORD PTR _packet$[esp+32]
	push	32					; 00000020H
	push	eax
	call	_SG_SendPacket
; Line 102
	lea	ecx, DWORD PTR _packet$[esp+40]
	push	32					; 00000020H
	push	ecx
	call	_SG_RecievePacket
	add	esp, 16					; 00000010H
	test	eax, eax
	je	$L385
	push	ebx
	push	esi
	mov	bl, 1
$L384:
; Line 105
	mov	ecx, DWORD PTR _packet$[esp+68]
	mov	eax, ecx
	and	eax, 65535				; 0000ffffH
	mov	edx, eax
	mov	esi, eax
	shr	edx, 8
	and	edx, -16				; fffffff0H
	and	esi, 240				; 000000f0H
	xor	edx, esi
	mov	dl, BYTE PTR _packet$[esp+68]
	jne	SHORT $L386
	test	dl, 2
	je	SHORT $L386
; Line 106
	shr	eax, 4
	and	eax, 15					; 0000000fH
	shl	eax, 5
	cmp	BYTE PTR _players[eax], bl
	jne	SHORT $L387
; Line 107
	mov	eax, DWORD PTR _players[eax+4]
	lea	ecx, DWORD PTR _StarblazerEntities[eax*4]
	push	ecx
	call	_explode_entity
	mov	ecx, DWORD PTR _packet$[esp+72]
	add	esp, 4
$L387:
; Line 109
	shr	ecx, 4
	and	ecx, 15					; 0000000fH
	shl	ecx, 5
	mov	BYTE PTR _players[ecx], 0
; Line 111
	jmp	$L395
$L386:
	test	dl, 4
	je	SHORT $L389
; Line 112
	shr	eax, 4
	and	eax, 15					; 0000000fH
	shl	eax, 5
	cmp	BYTE PTR _players[eax], bl
	jne	SHORT $L390
; Line 113
	mov	edx, DWORD PTR _players[eax+4]
	lea	eax, DWORD PTR _StarblazerEntities[edx*4]
	push	eax
	call	_explode_entity
	mov	ecx, DWORD PTR _packet$[esp+72]
	add	esp, 4
$L390:
; Line 115
	shr	ecx, 4
	and	ecx, 15					; 0000000fH
	shl	ecx, 5
	mov	BYTE PTR _players[ecx], 2
; Line 117
	jmp	$L395
$L389:
; Line 119
	shr	eax, 4
	and	eax, 15					; 0000000fH
	shl	eax, 5
	mov	esi, eax
	cmp	BYTE PTR _players[esi], bl
	je	SHORT $L392
; Line 121
	mov	edx, DWORD PTR _AX5
	lea	eax, DWORD PTR _players[esi+8]
; Line 123
	push	0
	push	0
	shr	ecx, 4
	push	0
	mov	DWORD PTR [eax], edx
	and	ecx, 15					; 0000000fH
	push	0
	push	0
	mov	eax, edx
	shl	ecx, 5
	push	0
	push	eax
	mov	esi, ecx
	call	_spawn_entity
; Line 124
	mov	dl, BYTE PTR _packet$[esp+96]
	mov	DWORD PTR _players[esi+4], eax
	add	esp, 28					; 0000001cH
	mov	BYTE PTR _players[esi], bl
$L392:
; Line 128
	mov	ecx, DWORD PTR _players[esi+4]
	test	dl, 2
	je	SHORT $L393
	lea	edx, DWORD PTR _StarblazerEntities[ecx*4]
	push	edx
	call	_explode_entity
; Line 129
	mov	eax, DWORD PTR _packet$[esp+72]
	add	esp, 4
	shr	eax, 4
	and	eax, 15					; 0000000fH
	shl	eax, 5
	mov	BYTE PTR _players[eax], 2
; Line 131
	jmp	$L395
$L393:
; Line 133
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	eax, DWORD PTR _packet$[esp+40]
	add	edx, 4
	mov	DWORD PTR [edx], eax
	mov	ecx, DWORD PTR _packet$[esp+44]
	mov	DWORD PTR [edx+4], ecx
	mov	eax, DWORD PTR _packet$[esp+48]
	mov	DWORD PTR [edx+8], eax
; Line 134
	mov	ecx, DWORD PTR _packet$[esp+68]
	shr	ecx, 4
	and	ecx, 15					; 0000000fH
	shl	ecx, 5
	mov	edx, DWORD PTR _players[ecx+4]
	mov	ecx, DWORD PTR _packet$[esp+52]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	add	eax, 16					; 00000010H
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _packet$[esp+56]
	mov	DWORD PTR [eax+4], edx
	mov	ecx, DWORD PTR _packet$[esp+60]
	mov	DWORD PTR [eax+8], ecx
	mov	edx, DWORD PTR _packet$[esp+64]
	mov	DWORD PTR [eax+12], edx
; Line 136
	mov	al, BYTE PTR _packet$[esp+68]
	test	al, bl
	je	SHORT $L395
; Line 137
	test	al, 8
; Line 138
	mov	eax, DWORD PTR _packet$[esp+68]
	jne	SHORT $L396
	shr	eax, 4
	and	eax, 15					; 0000000fH
	mov	ecx, eax
	shl	ecx, 5
	mov	DWORD PTR _players[ecx+12], OFFSET FLAT:_ENEMY_LASER_SHREDDER
; Line 140
	jmp	SHORT $L397
$L396:
; Line 141
	shr	eax, 4
	and	eax, 15					; 0000000fH
	mov	edx, eax
	shl	edx, 5
	mov	DWORD PTR _players[edx+12], OFFSET FLAT:_ENEMY_LASER_DRAGONBREATH
$L397:
; Line 144
	push	eax
	call	_spawn_enemy_laser
	add	esp, 4
$L395:
	lea	eax, DWORD PTR _packet$[esp+40]
	push	32					; 00000020H
	push	eax
	call	_SG_RecievePacket
	add	esp, 8
	test	eax, eax
	jne	$L384
	pop	esi
	pop	ebx
$L385:
; Line 172
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
