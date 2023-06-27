	TITLE	src\blazer2.c
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
PUBLIC	_multiplayer
PUBLIC	_firing
PUBLIC	_frames_respawning
PUBLIC	_barcolors
PUBLIC	_boost_overheating
PUBLIC	_barcycle
PUBLIC	_shake_frames
PUBLIC	_firing_cooldown
PUBLIC	_shading
_DATA	SEGMENT
COMM	_title_stars:BYTE:01770H
COMM	_dying:BYTE
COMM	_impact_id:DWORD
COMM	_AX5:DWORD
COMM	_LASER_PLAYER:DWORD
COMM	_LASER_ENEMY:DWORD
COMM	_EXPLOSION_SHARD:DWORD
COMM	_ASTEROID:DWORD
COMM	_TURRET_PLATFORM:DWORD
COMM	_TURRET:DWORD
COMM	_SND_EXPLODE:DWORD
COMM	_SND_HIT:DWORD
COMM	_SND_LASER:DWORD
COMM	_SND_LASER_ENEMY:DWORD
COMM	_ENEMY_LASER:BYTE:010H
COMM	_frames:DWORD
COMM	_velocity:BYTE:0cH
COMM	_cam_template:BYTE:028H
COMM	_camera:DWORD
COMM	_player_fighter:BYTE:01cH
COMM	_player_weapon:BYTE:010H
COMM	_player_boost:DWORD
COMM	_player_battery:DWORD
COMM	_rot_mat:BYTE:024H
COMM	_pos_delta:BYTE:0cH
COMM	_laser_velocity:BYTE:0cH
COMM	_tst:BYTE:0cH
COMM	_tst2:BYTE:0cH
_barcolors DB	0e8H, 0e8H, 0c8H, 0ccH, 0ccH, 0caH, 0e8H, 0e8H, 0e8H, 0e8H
	DB	0e8H, 0e8H, 0e8H, 0e8H, 0f8H, 0f8H, 0b8H, 0b8H, 0bcH, 0bfH, 0bfH
	DB	0bfH
	ORG $+2
_frames_respawning DD 00H
_multiplayer DB	00H
	ORG $+3
_boost_overheating DB 00H
	ORG $+3
_firing	DB	00H
	ORG $+3
_barcycle DD	00H
_shake_frames DD 00H
_firing_cooldown DD 00H
_shading DB	01H
_DATA	ENDS
PUBLIC	_explode_at
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_rand:NEAR
EXTRN	_play_soundfx:NEAR
_TEXT	SEGMENT
; File src\blazer2.c
_pos$ = 8
_i$ = -4
_id$ = -8
_explode_at PROC NEAR
; Line 57
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 61
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L319
$L320:
	inc	DWORD PTR _i$[ebp]
$L319:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L321
; Line 62
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	push	eax
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	push	eax
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	push	eax
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	sub	eax, 128				; 00000080H
	mov	ecx, DWORD PTR _pos$[ebp]
	add	eax, DWORD PTR [ecx+8]
	push	eax
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	sub	eax, 128				; 00000080H
	mov	ecx, DWORD PTR _pos$[ebp]
	add	eax, DWORD PTR [ecx+4]
	push	eax
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	sub	eax, 128				; 00000080H
	mov	ecx, DWORD PTR _pos$[ebp]
	add	eax, DWORD PTR [ecx]
	push	eax
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 63
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	lea	eax, DWORD PTR [eax+eax*2-384]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+36], eax
; Line 64
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	lea	eax, DWORD PTR [eax+eax*2-384]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+40], eax
; Line 65
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	lea	eax, DWORD PTR [eax+eax*2-384]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+44], eax
; Line 66
	jmp	$L320
$L321:
; Line 68
	mov	eax, DWORD PTR _SND_EXPLODE
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 69
$L316:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_explode_at ENDP
_TEXT	ENDS
PUBLIC	_explode_entity
EXTRN	_free:NEAR
_TEXT	SEGMENT
_ptr$ = 8
_pos$ = -12
_explode_entity PROC NEAR
; Line 71
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 72
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 4
	lea	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 73
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 74
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 75
	lea	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_explode_at
	add	esp, 4
; Line 76
$L325:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_explode_entity ENDP
_TEXT	ENDS
PUBLIC	_print_vec
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG332	DB	'(%d, %d, %d)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR
; Line 78
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 79
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET FLAT:$SG332
	call	_printf
	add	esp, 16					; 00000010H
; Line 80
$L330:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_print_vec ENDP
_TEXT	ENDS
PUBLIC	_step_entity
EXTRN	_vec3_add:NEAR
EXTRN	_mat3_mul:NEAR
EXTRN	_quat_tomat:NEAR
_TEXT	SEGMENT
_ent$ = 8
_vel$ = 12
_step_entity PROC NEAR
; Line 82
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 83
	push	OFFSET FLAT:_rot_mat
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 84
	push	OFFSET FLAT:_pos_delta
	mov	eax, DWORD PTR _vel$[ebp]
	push	eax
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 85
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 4
	push	eax
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 86
$L336:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_step_entity ENDP
_TEXT	ENDS
PUBLIC	_draw_stars
EXTRN	_plotpoint_3d:NEAR
_TEXT	SEGMENT
_i$ = -4
_draw_stars PROC NEAR
; Line 88
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 90
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L339
$L340:
	inc	DWORD PTR _i$[ebp]
$L339:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L341
; Line 91
	push	255					; 000000ffH
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_plotpoint_3d
	add	esp, 16					; 00000010H
; Line 92
	jmp	$L340
$L341:
; Line 93
$L337:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_stars ENDP
_TEXT	ENDS
PUBLIC	_fire_laser
_TEXT	SEGMENT
_id$ = -4
_fire_laser PROC NEAR
; Line 95
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 96
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _player_weapon+12
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 97
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+32], 280			; 00000118H
; Line 98
	mov	eax, DWORD PTR _player_weapon+8
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+92], eax
; Line 99
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
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
; Line 100
	mov	BYTE PTR _firing, 1
; Line 101
	mov	eax, DWORD PTR _SND_LASER
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 102
$L343:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fire_laser ENDP
_TEXT	ENDS
PUBLIC	_cam_script
_TEXT	SEGMENT
_ptr$ = 8
_cam_script PROC NEAR
; Line 104
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 105
	push	OFFSET FLAT:_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 106
$L347:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_cam_script ENDP
_TEXT	ENDS
PUBLIC	_init_star
_TEXT	SEGMENT
_star$ = 8
_init_star PROC NEAR
; Line 108
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 109
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 110
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 111
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 112
$L349:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_star ENDP
_TEXT	ENDS
PUBLIC	_spawn_asteroid
_TEXT	SEGMENT
_pos$ = -16
_id$ = -4
_spawn_asteroid PROC NEAR
; Line 114
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 117
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp], eax
; Line 118
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+4], eax
; Line 119
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+8], eax
; Line 121
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	push	eax
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	push	eax
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	push	eax
	mov	eax, DWORD PTR _pos$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _pos$[ebp]
	push	eax
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 123
$L351:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_spawn_asteroid ENDP
_TEXT	ENDS
PUBLIC	_ax5_script
_TEXT	SEGMENT
_ax5_script PROC NEAR
; Line 125
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 131
$L356:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ax5_script ENDP
_TEXT	ENDS
PUBLIC	_enemy_laser_script
EXTRN	_test_collisions:NEAR
_TEXT	SEGMENT
_ptr$ = 8
_enemy_laser_script PROC NEAR
; Line 133
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 135
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 136
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR [eax+32]
; Line 139
	mov	eax, DWORD PTR _StarblazerEntities
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_test_collisions
	add	esp, 8
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L361
; Line 140
	mov	eax, DWORD PTR _StarblazerEntities
	sub	DWORD PTR [eax+96], 5
; Line 141
	mov	DWORD PTR _shake_frames, 7
; Line 142
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+84]
	mov	DWORD PTR _impact_id, eax
; Line 143
	mov	eax, DWORD PTR _SND_HIT
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 144
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 145
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 146
	jmp	$L359
; Line 168
$L361:
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+32], 0
	jne	$L362
; Line 169
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 170
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 172
$L362:
$L359:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_enemy_laser_script ENDP
_TEXT	ENDS
PUBLIC	_laser_script
_TEXT	SEGMENT
_ptr$ = 8
_i$ = -4
_laser_script PROC NEAR
; Line 174
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 177
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 178
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR [eax+32]
; Line 180
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L367
$L368:
	inc	DWORD PTR _i$[ebp]
$L367:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L369
; Line 181
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L370
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR _StarblazerEntities[eax*4], ecx
	je	$L370
; Line 182
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	test	BYTE PTR [eax+32], 1
	je	$L371
; Line 183
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_test_collisions
	add	esp, 8
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L372
; Line 185
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 186
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+104], 7
; Line 187
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax+96]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	sub	eax, DWORD PTR [ecx+92]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+96], eax
; Line 190
	mov	eax, DWORD PTR _SND_HIT
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 191
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 192
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 193
	jmp	$L365
; Line 195
$L372:
; Line 196
$L371:
; Line 197
$L370:
	jmp	$L368
$L369:
; Line 199
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+32], 0
	jne	$L373
; Line 200
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 201
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 203
$L373:
$L365:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_laser_script ENDP
_TEXT	ENDS
PUBLIC	_asteroid_script
_TEXT	SEGMENT
_ptr$ = 8
_asteroid_script PROC NEAR
; Line 205
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 206
	mov	eax, DWORD PTR _StarblazerEntities
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_test_collisions
	add	esp, 8
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L377
; Line 207
	mov	eax, DWORD PTR _StarblazerEntities
	sub	DWORD PTR [eax+96], 5
; Line 208
	mov	DWORD PTR _shake_frames, 7
; Line 209
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 210
	jmp	$L376
; Line 213
$L377:
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+96], 0
	jg	$L378
; Line 214
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 216
$L378:
$L376:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_asteroid_script ENDP
_TEXT	ENDS
PUBLIC	_debris_script
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
_TEXT	SEGMENT
_ptr$ = 8
_debris_script PROC NEAR
; Line 218
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 219
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+36]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+4], eax
; Line 220
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+40]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+8], eax
; Line 221
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+44]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+12], eax
; Line 222
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
; Line 223
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
; Line 224
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
; Line 226
	call	_rand
	mov	ecx, 45					; 0000002dH
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L382
; Line 228
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 229
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 231
$L382:
$L381:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_debris_script ENDP
_TEXT	ENDS
PUBLIC	_set_attributes
EXTRN	_create_hitbox:NEAR
EXTRN	_load_model:NEAR
_DATA	SEGMENT
	ORG $+2
$SG385	DB	'assets/boltem.obj', 00H
	ORG $+2
$SG386	DB	'assets/shard.obj', 00H
	ORG $+3
$SG387	DB	'assets/asterold.obj', 00H
$SG388	DB	'assets/hyper.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_set_attributes PROC NEAR
; Line 233
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 234
	push	OFFSET FLAT:$SG385
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ENEMY_LASER+12, eax
; Line 235
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+12], OFFSET FLAT:_enemy_laser_script
; Line 236
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [eax+36], 239			; 000000efH
; Line 237
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [eax+37], 0
; Line 238
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+32], 2
; Line 239
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _ENEMY_LASER+12
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 240
	mov	DWORD PTR _ENEMY_LASER+8, 8
; Line 242
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
; Line 243
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+32], 2
; Line 244
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+36], 191			; 000000bfH
; Line 245
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+37], 0
; Line 246
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 248
	mov	DWORD PTR _player_fighter, 40		; 00000028H
; Line 249
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 250
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 251
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 252
	mov	DWORD PTR _player_fighter+16, 40	; 00000028H
; Line 253
	mov	DWORD PTR _player_fighter+20, 40	; 00000028H
; Line 255
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 256
	mov	DWORD PTR _player_weapon+4, 9
; Line 257
	mov	DWORD PTR _player_weapon+8, 8
; Line 258
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _player_weapon+12, eax
; Line 260
	mov	DWORD PTR _laser_velocity, 0
; Line 261
	mov	DWORD PTR _laser_velocity+4, 0
; Line 262
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 264
	push	OFFSET FLAT:$SG386
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 265
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 266
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+32], 2
; Line 267
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+36], 127			; 0000007fH
; Line 268
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+37], 0
; Line 269
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 271
	push	OFFSET FLAT:$SG387
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 272
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 273
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+32], 3
; Line 274
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 275
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+36], 207			; 000000cfH
; Line 276
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+37], 0
; Line 277
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 279
	push	OFFSET FLAT:$SG388
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _AX5, eax
; Line 280
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+12], OFFSET FLAT:_ax5_script
; Line 281
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+32], 3
; Line 282
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+28], 0
; Line 283
	mov	eax, DWORD PTR _AX5
	mov	BYTE PTR [eax+37], 1
; Line 284
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _AX5
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 285
$L384:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_attributes ENDP
_TEXT	ENDS
PUBLIC	_blazer2_module
PUBLIC	_blazer2_draw
PUBLIC	_blazer2_init
EXTRN	_SL_CENTER_X:WORD
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_SG_Draw:DWORD
EXTRN	_SG_Module:DWORD
EXTRN	_init_hypercraft:NEAR
EXTRN	_sfx_enable:BYTE
EXTRN	_stop_music:NEAR
EXTRN	_play_music:NEAR
EXTRN	_load_soundfx:NEAR
_DATA	SEGMENT
	ORG $+3
$SG394	DB	'sfx/net.wav', 00H
$SG396	DB	'sfx/explode.wav', 00H
$SG397	DB	'sfx/laser.wav', 00H
	ORG $+2
$SG398	DB	'sfx/laser.wav', 00H
	ORG $+2
$SG399	DB	'sfx/hit.wav', 00H
$SG400	DB	'assets/bolt.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_blazer2_init PROC NEAR
; Line 294
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 297
	mov	DWORD PTR _frames, 0
; Line 300
	call	_stop_music
; Line 301
	push	OFFSET FLAT:$SG394
	call	_play_music
	add	esp, 4
; Line 302
	mov	BYTE PTR _sfx_enable, 1
; Line 303
	push	0
	push	1
	push	OFFSET FLAT:$SG396
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_EXPLODE, eax
; Line 304
	push	0
	push	2
	push	OFFSET FLAT:$SG397
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER, eax
; Line 305
	push	0
	push	3
	push	OFFSET FLAT:$SG398
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER_ENEMY, eax
; Line 306
	push	0
	push	1
	push	OFFSET FLAT:$SG399
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_HIT, eax
; Line 309
	push	OFFSET FLAT:$SG400
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 310
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 311
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 313
	call	_set_attributes
; Line 315
	mov	DWORD PTR _cam_template, 0
; Line 316
	mov	DWORD PTR _cam_template+4, 0
; Line 317
	mov	WORD PTR _cam_template+8, 0
; Line 318
	mov	WORD PTR _cam_template+10, 0
; Line 319
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 320
	mov	eax, DWORD PTR _player_fighter
	mov	DWORD PTR _cam_template+28, eax
; Line 321
	mov	DWORD PTR _cam_template+32, 2
; Line 323
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 326
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L401
$L402:
	inc	DWORD PTR _i$[ebp]
$L401:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jae	$L403
; Line 327
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
; Line 328
	jmp	$L402
$L403:
; Line 331
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L404
$L405:
	inc	DWORD PTR _i$[ebp]
$L404:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	$L406
; Line 332
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	call	_free
	add	esp, 4
; Line 333
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 334
	jmp	$L405
$L406:
; Line 337
	push	0
	push	0
	push	0
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	push	eax
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	push	eax
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	push	eax
	push	OFFSET FLAT:_cam_template
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _i$[ebp], eax
; Line 340
	mov	eax, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_boost, eax
; Line 341
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 346
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	jne	$L407
; Line 347
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L408
$L409:
	inc	DWORD PTR _i$[ebp]
$L408:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jae	$L410
; Line 348
	call	_spawn_asteroid
; Line 349
	jmp	$L409
$L410:
; Line 353
$L407:
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 354
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 356
	mov	DWORD PTR _velocity, 0
; Line 357
	mov	DWORD PTR _velocity+4, 0
; Line 358
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 360
	call	_init_hypercraft
; Line 361
$L390:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_blazer2_init ENDP
_TEXT	ENDS
PUBLIC	_angle_multiply
_TEXT	SEGMENT
_angle$ = 8
_joy_amount$ = 12
_angle_multiply PROC NEAR
; Line 363
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 364
	movsx	eax, BYTE PTR _joy_amount$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _angle$[ebp]
	imul	eax, ecx
	mov	al, ah
	jmp	$L413
; Line 365
$L413:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_angle_multiply ENDP
_TEXT	ENDS
PUBLIC	_vjoy_read
EXTRN	_SG_ReadMouse:NEAR
EXTRN	_SG_KeyDown:NEAR
_TEXT	SEGMENT
_joy$ = 8
_mouse$ = -8
_vjoy_read PROC NEAR
; Line 367
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 371
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 373
	push	74					; 0000004aH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 374
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+7], 0
; Line 375
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+6], al
; Line 376
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 379
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L417
; Line 380
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 127			; 0000007fH
; Line 382
	jmp	$L418
$L417:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L419
; Line 383
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], -127			; ffffff81H
; Line 385
	jmp	$L420
$L419:
; Line 386
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 0
; Line 387
$L420:
$L418:
; Line 390
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L421
; Line 391
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 127			; 0000007fH
; Line 393
	jmp	$L422
$L421:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L423
; Line 394
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], -127			; ffffff81H
; Line 396
	jmp	$L424
$L423:
; Line 397
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 0
; Line 398
$L424:
$L422:
; Line 401
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L425
; Line 402
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], -127			; ffffff81H
; Line 404
	jmp	$L426
$L425:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L427
; Line 405
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 127			; 0000007fH
; Line 407
	jmp	$L428
$L427:
; Line 408
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 0
; Line 409
$L428:
$L426:
; Line 418
$L415:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR
; Line 436
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 437
	mov	eax, DWORD PTR _player_fighter
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+96], eax
; Line 438
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+4], eax
; Line 439
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+8], eax
; Line 440
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+12], eax
; Line 441
$L432:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_respawn_player ENDP
_TEXT	ENDS
EXTRN	_run_entity_scripts:NEAR
EXTRN	_BG_COLOR:BYTE
EXTRN	_timeout:DWORD
EXTRN	_net_syncstate:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_joy$ = -8
_blazer2_module PROC NEAR
; Line 443
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 446
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 448
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L436
; Line 449
	mov	BYTE PTR _BG_COLOR, 0
; Line 452
$L436:
	mov	eax, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [eax+96], 0
	jg	$L437
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L437
; Line 453
	mov	eax, DWORD PTR _SND_EXPLODE
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 454
	mov	BYTE PTR _dying, 1
; Line 455
	mov	eax, DWORD PTR _timeout
	mov	DWORD PTR _frames_respawning, eax
; Line 456
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
; Line 458
	cmp	DWORD PTR _timeout, 0
	jne	$L438
; Line 459
	call	_respawn_player
; Line 461
$L438:
; Line 463
$L437:
	cmp	DWORD PTR _frames_respawning, 0
	je	$L439
; Line 464
	push	8
	push	0
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 465
	dec	DWORD PTR _frames_respawning
; Line 467
	jne	$L441
; Line 468
	call	_respawn_player
; Line 470
$L441:
; Line 472
$L439:
	cmp	DWORD PTR _shake_frames, 0
	je	$L442
; Line 473
	dec	DWORD PTR _shake_frames
; Line 477
$L442:
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _joy$[ebp]
	push	eax
	mov	al, BYTE PTR _player_fighter+4
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
	add	esp, 8
; Line 478
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _joy$[ebp+1]
	push	eax
	mov	al, BYTE PTR _player_fighter+4
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
	add	esp, 8
; Line 479
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _joy$[ebp+2]
	push	eax
	mov	al, BYTE PTR _player_fighter+4
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
	add	esp, 8
; Line 481
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L443
; Line 482
	xor	eax, eax
	mov	al, BYTE PTR _shading
	test	eax, eax
	jne	$L593
	mov	BYTE PTR _shading, 1
	jmp	$L594
$L593:
	mov	BYTE PTR _shading, 0
$L594:
; Line 486
$L443:
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+3]
	test	eax, eax
	je	$L444
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_weapon+4, eax
	ja	$L444
	cmp	DWORD PTR _firing_cooldown, 0
	jne	$L444
; Line 487
	xor	eax, eax
	sub	eax, DWORD PTR _player_weapon+4
	neg	eax
	sub	DWORD PTR _player_battery, eax
; Line 488
	mov	eax, DWORD PTR _player_weapon
	mov	DWORD PTR _firing_cooldown, eax
; Line 489
	call	_fire_laser
; Line 491
	jmp	$L445
$L444:
; Line 492
	mov	BYTE PTR _firing, 0
; Line 493
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_fighter+20, eax
	jbe	$L446
; Line 494
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L447
	inc	DWORD PTR _player_battery
; Line 495
$L447:
; Line 496
$L446:
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	$L448
; Line 497
	dec	DWORD PTR _firing_cooldown
; Line 499
$L448:
$L445:
; Line 502
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+5]
	test	eax, eax
	je	$L449
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L449
; Line 503
	mov	eax, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, eax
; Line 504
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L450
	dec	DWORD PTR _player_boost
; Line 505
$L450:
; Line 506
	jmp	$L451
$L449:
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+6]
	test	eax, eax
	je	$L452
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L452
; Line 507
	mov	DWORD PTR _velocity+8, 0
; Line 508
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L453
	dec	DWORD PTR _player_boost
; Line 509
$L453:
; Line 510
	jmp	$L454
$L452:
; Line 511
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L455
; Line 512
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 514
	jmp	$L456
$L455:
; Line 515
	mov	DWORD PTR _velocity+8, 0
; Line 516
$L456:
; Line 517
	mov	eax, DWORD PTR _player_boost
	cmp	DWORD PTR _player_fighter+16, eax
	jbe	$L457
; Line 518
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L458
	inc	DWORD PTR _player_boost
; Line 519
$L458:
; Line 520
$L457:
$L454:
$L451:
; Line 524
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	je	$L459
; Line 525
	call	_net_syncstate
; Line 528
$L459:
	call	_run_entity_scripts
; Line 531
	cmp	DWORD PTR _player_boost, 0
	jne	$L460
; Line 532
	mov	BYTE PTR _boost_overheating, 1
; Line 534
$L460:
	mov	eax, DWORD PTR _player_fighter+16
	shr	eax, 1
	cmp	eax, DWORD PTR _player_boost
	ja	$L461
; Line 535
	mov	BYTE PTR _boost_overheating, 0
; Line 539
$L461:
	inc	DWORD PTR _frames
; Line 540
$L433:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR
; Line 542
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 543
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 544
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 545
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 546
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 547
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 548
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 549
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 550
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 551
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 552
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 553
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 554
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 555
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 556
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 557
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 558
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 559
$L463:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
_TEXT	SEGMENT
_i$ = -8
_c$ = -4
_count_entities PROC NEAR
; Line 562
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 564
	mov	DWORD PTR _c$[ebp], 0
; Line 566
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L469
$L470:
	inc	DWORD PTR _i$[ebp]
$L469:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L471
; Line 567
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L472
	inc	DWORD PTR _c$[ebp]
; Line 568
$L472:
	jmp	$L470
$L471:
; Line 570
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L466
; Line 571
$L466:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_count_entities ENDP
_TEXT	ENDS
PUBLIC	_draw_debug
EXTRN	_SL_VERTEX_INDEX:WORD
EXTRN	_SL_TRIANGLE_INDEX:WORD
EXTRN	_LAST_FRAME_TIME:DWORD
EXTRN	_vputs:NEAR
EXTRN	_sprintf:NEAR
_DATA	SEGMENT
$SG477	DB	'ENT', 00H
$SG479	DB	'%d / %d', 00H
$SG480	DB	'TRI', 00H
$SG481	DB	'%d / %d', 00H
$SG482	DB	'FPS', 00H
$SG484	DB	'%d', 00H
	ORG $+1
$SG485	DB	'%d %d %d', 00H
	ORG $+3
$SG486	DB	'VERT %d / %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_num$ = -100
_draw_debug PROC NEAR
; Line 574
	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
	push	ebx
	push	esi
	push	edi
; Line 578
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG477
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 579
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:$SG479
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 580
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	15					; 0000000fH
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 582
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:$SG480
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 583
	push	1500					; 000005dcH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:$SG481
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 584
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	15					; 0000000fH
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 586
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:$SG482
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 587
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	$L483
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:$SG484
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 588
$L483:
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	15					; 0000000fH
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 591
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+12]
	sar	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+8]
	sar	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+4]
	sar	eax, 16					; 00000010H
	push	eax
	push	OFFSET FLAT:$SG485
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 592
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	0
	push	240					; 000000f0H
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 594
	push	2500					; 000009c4H
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	push	eax
	push	OFFSET FLAT:$SG486
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 595
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	7
	push	240					; 000000f0H
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 596
$L474:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_debug ENDP
_TEXT	ENDS
PUBLIC	_draw_HPbar
EXTRN	_drawline:NEAR
_TEXT	SEGMENT
_k$ = -28
_j$ = -24
_i$ = -20
_pos1$ = -32
_pos2$ = -4
_pos3$ = -8
_pos4$ = -12
_c$ = -16
_draw_HPbar PROC NEAR
; Line 598
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 603
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+96]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, 5
	cdq
	idiv	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 604
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 605
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L497
$L498:
	inc	DWORD PTR _j$[ebp]
$L497:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L499
; Line 606
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _barcolors[eax]
	mov	DWORD PTR _c$[ebp], eax
; Line 607
	mov	eax, DWORD PTR _k$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jle	$L500
	jmp	$L499
; Line 608
$L500:
	mov	DWORD PTR _pos1$[ebp], 24		; 00000018H
; Line 609
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 610
	mov	DWORD PTR _pos3$[ebp], 8
; Line 611
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 612
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L501
; Line 614
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 615
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 617
$L501:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L502
; Line 618
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 619
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 621
$L502:
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos4$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos3$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos2$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos1$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 622
	add	DWORD PTR _i$[ebp], 8
; Line 623
	jmp	$L498
$L499:
; Line 624
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 625
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 626
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 627
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 628
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	24					; 00000018H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 629
$L488:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_HPbar ENDP
_TEXT	ENDS
PUBLIC	_draw_crosshair
EXTRN	_bitset_pixel:NEAR
_TEXT	SEGMENT
_i$ = -4
_draw_crosshair PROC NEAR
; Line 631
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 633
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L507
$L508:
	inc	DWORD PTR _i$[ebp]
$L507:
	cmp	DWORD PTR _i$[ebp], 7
	jge	$L509
; Line 636
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 637
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 638
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 639
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 640
	push	175					; 000000afH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 641
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 642
	push	175					; 000000afH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 643
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 644
	jmp	$L508
$L509:
; Line 646
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 647
$L505:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_crosshair ENDP
_TEXT	ENDS
PUBLIC	_draw_boost_bar
_TEXT	SEGMENT
_k$ = -28
_j$ = -24
_i$ = -20
_pos1$ = -32
_pos2$ = -4
_pos3$ = -8
_pos4$ = -12
_c$ = -16
_draw_boost_bar PROC NEAR
; Line 650
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 655
	mov	eax, DWORD PTR _player_boost
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, 5
	sub	edx, edx
	div	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 656
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 657
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L521
$L522:
	inc	DWORD PTR _j$[ebp]
$L521:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L523
; Line 658
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	je	$L595
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
	jmp	$L596
$L595:
	mov	DWORD PTR _c$[ebp], 159			; 0000009fH
$L596:
; Line 659
	mov	eax, DWORD PTR _k$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jle	$L524
	jmp	$L523
; Line 660
$L524:
	mov	DWORD PTR _pos1$[ebp], 312		; 00000138H
; Line 661
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 662
	mov	DWORD PTR _pos3$[ebp], 296		; 00000128H
; Line 663
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 664
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L525
; Line 666
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 667
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 669
$L525:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L526
; Line 670
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 671
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 673
$L526:
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos4$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos3$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos2$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos1$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 674
	add	DWORD PTR _i$[ebp], 8
; Line 675
	jmp	$L522
$L523:
; Line 676
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 677
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 678
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 679
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 680
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	312					; 00000138H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 681
$L512:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_boost_bar ENDP
_TEXT	ENDS
PUBLIC	_draw_radar
EXTRN	_vec3_subtract:NEAR
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_plot_pixel:NEAR
_TEXT	SEGMENT
_i$ = -24
_j$ = -28
_c$ = -8
_k$ = -44
_pos1$ = -48
_pos2$ = -4
_vector_pos$ = -40
_screen_coords$ = -20
_draw_radar PROC NEAR
; Line 683
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 688
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L537
$L538:
	inc	DWORD PTR _i$[ebp]
$L537:
	cmp	DWORD PTR _i$[ebp], 60			; 0000003cH
	jge	$L539
; Line 689
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L540
$L541:
	inc	DWORD PTR _j$[ebp]
$L540:
	cmp	DWORD PTR _j$[ebp], 60			; 0000003cH
	jge	$L542
; Line 690
	mov	DWORD PTR _c$[ebp], 0
; Line 692
	cmp	DWORD PTR _i$[ebp], 0
	je	$L544
	cmp	DWORD PTR _i$[ebp], 59			; 0000003bH
	je	$L544
	cmp	DWORD PTR _j$[ebp], 0
	je	$L544
	cmp	DWORD PTR _j$[ebp], 59			; 0000003bH
	jne	$L543
$L544:
	mov	DWORD PTR _c$[ebp], 255			; 000000ffH
; Line 693
$L543:
	cmp	DWORD PTR _c$[ebp], 0
	jne	$L545
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 1
	xor	eax, edx
	sub	eax, edx
	je	$L545
	jmp	$L541
; Line 694
$L545:
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 10					; 0000000aH
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 130				; 00000082H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 695
	jmp	$L541
$L542:
; Line 696
	jmp	$L538
$L539:
; Line 699
	mov	DWORD PTR _j$[ebp], -1
	jmp	$L547
$L548:
	inc	DWORD PTR _j$[ebp]
$L547:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L549
; Line 700
	mov	DWORD PTR _k$[ebp], -1
	jmp	$L550
$L551:
	inc	DWORD PTR _k$[ebp]
$L550:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L552
; Line 701
	push	239					; 000000efH
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 702
	jmp	$L551
$L552:
; Line 703
	jmp	$L548
$L549:
; Line 705
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 708
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L553
$L554:
	inc	DWORD PTR _i$[ebp]
$L553:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L555
; Line 709
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L556
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	test	BYTE PTR [eax+32], 2
	je	$L556
; Line 710
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	add	eax, 4
	lea	ecx, DWORD PTR _vector_pos$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 711
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 712
	lea	eax, DWORD PTR _screen_coords$[ebp]
	push	eax
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 714
	mov	eax, DWORD PTR _screen_coords$[ebp]
	sar	eax, 17					; 00000011H
	mov	DWORD PTR _pos1$[ebp], eax
; Line 715
	mov	eax, DWORD PTR _screen_coords$[ebp+8]
	sar	eax, 17					; 00000011H
	mov	DWORD PTR _pos2$[ebp], eax
; Line 717
	cmp	DWORD PTR _pos1$[ebp], 30		; 0000001eH
	jle	$L557
	mov	DWORD PTR _pos1$[ebp], 30		; 0000001eH
; Line 718
$L557:
	cmp	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
	jge	$L558
	mov	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
; Line 719
$L558:
	cmp	DWORD PTR _pos2$[ebp], 30		; 0000001eH
	jle	$L559
	mov	DWORD PTR _pos2$[ebp], 30		; 0000001eH
; Line 720
$L559:
	cmp	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
	jge	$L560
	mov	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
; Line 722
$L560:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+37]
	test	ecx, ecx
	je	$L561
; Line 723
	cmp	DWORD PTR _screen_coords$[ebp+4], 0
	jl	$L562
; Line 724
	mov	DWORD PTR _c$[ebp], 175			; 000000afH
; Line 726
	jmp	$L563
$L562:
; Line 727
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
; Line 728
$L563:
; Line 730
	mov	DWORD PTR _j$[ebp], -1
	jmp	$L564
$L565:
	inc	DWORD PTR _j$[ebp]
$L564:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L566
; Line 731
	mov	DWORD PTR _k$[ebp], -1
	jmp	$L567
$L568:
	inc	DWORD PTR _k$[ebp]
$L567:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L569
; Line 732
	mov	eax, DWORD PTR _pos2$[ebp]
	add	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	jns	$L570
	jmp	$L568
; Line 733
$L570:
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos2$[ebp]
	add	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _pos1$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 734
	jmp	$L568
$L569:
; Line 735
	jmp	$L565
$L566:
; Line 737
	jmp	$L571
$L561:
; Line 738
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+36]
	push	ecx
	mov	eax, DWORD PTR _pos2$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _pos1$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 739
$L571:
; Line 741
$L556:
	jmp	$L554
$L555:
; Line 742
$L528:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_radar ENDP
_TEXT	ENDS
PUBLIC	_draw_battery
_TEXT	SEGMENT
_offset$ = -4
_i$ = -12
_intensity$ = -8
_draw_battery PROC NEAR
; Line 744
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 745
	mov	DWORD PTR _offset$[ebp], 140		; 0000008cH
; Line 747
	mov	eax, DWORD PTR _player_battery
	lea	eax, DWORD PTR [eax+eax*2]
	add	eax, eax
	shr	eax, 4
	mov	DWORD PTR _intensity$[ebp], eax
; Line 749
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L577
$L578:
	inc	DWORD PTR _i$[ebp]
$L577:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	$L579
; Line 750
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _i$[ebp], eax
	ja	$L580
; Line 751
	mov	eax, DWORD PTR _intensity$[ebp]
	or	eax, 160				; 000000a0H
	push	eax
	push	170					; 000000aaH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _offset$[ebp]
	push	eax
	push	160					; 000000a0H
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _offset$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 753
$L580:
	jmp	$L578
$L579:
; Line 775
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 776
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 777
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 778
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 779
$L573:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_battery ENDP
_TEXT	ENDS
EXTRN	_camera_translate:NEAR
EXTRN	_draw_scene:NEAR
EXTRN	_draw_hypercraft:NEAR
EXTRN	_set_hypercraft_orientation:NEAR
_DATA	SEGMENT
	ORG $+3
$SG588	DB	'RESPAWNING', 00H
	ORG $+1
$SG589	DB	' IN %d SEC', 00H
_DATA	ENDS
_TEXT	SEGMENT
_text$ = -80
_blazer2_draw PROC NEAR
; Line 782
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 786
	cmp	DWORD PTR _shake_frames, 0
	je	$L583
; Line 787
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_X
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_X, ax
; Line 788
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_Y
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 790
	jmp	$L584
$L583:
; Line 791
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 792
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 793
$L584:
; Line 796
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 797
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 800
	push	500					; 000001f4H
	push	OFFSET FLAT:_title_stars
	mov	al, BYTE PTR _shading
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_draw_scene
	add	esp, 32					; 00000020H
; Line 803
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L585
	call	_draw_crosshair
; Line 806
$L585:
	call	_draw_boost_bar
; Line 809
	call	_draw_HPbar
; Line 812
	call	_draw_radar
; Line 815
	call	_draw_battery
; Line 819
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	shr	ecx, 1
	cmp	DWORD PTR [eax+96], ecx
	jae	$L586
; Line 820
	call	_blazer2_screencrack
; Line 823
$L586:
	cmp	DWORD PTR _frames_respawning, 0
	je	$L587
; Line 824
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	90					; 0000005aH
	push	110					; 0000006eH
	push	OFFSET FLAT:$SG588
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 825
	mov	ecx, 70					; 00000046H
	mov	eax, DWORD PTR _frames_respawning
	sub	edx, edx
	div	ecx
	push	eax
	push	OFFSET FLAT:$SG589
	lea	eax, DWORD PTR _text$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 826
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	100					; 00000064H
	push	110					; 0000006eH
	lea	eax, DWORD PTR _text$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 830
$L587:
	call	_draw_debug
; Line 832
	add	DWORD PTR _barcycle, 2
; Line 833
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	$L590
	mov	DWORD PTR _barcycle, 0
; Line 836
$L590:
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_set_hypercraft_orientation
	add	esp, 16					; 00000010H
; Line 837
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 8
; Line 838
$L581:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
