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
_TEXT	SEGMENT
; File src\blazer2.c
_pos$ = 8
_i$ = -4
_id$ = -8
_explode_at PROC NEAR
; Line 54
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 58
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L306
$L307:
	inc	DWORD PTR _i$[ebp]
$L306:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L308
; Line 59
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
; Line 60
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
; Line 61
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
; Line 62
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
; Line 63
	jmp	$L307
$L308:
; Line 64
$L303:
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
; Line 66
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 67
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
; Line 68
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 69
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 70
	lea	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_explode_at
	add	esp, 4
; Line 71
$L311:
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
$SG318	DB	'(%d, %d, %d)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR
; Line 73
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 74
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET FLAT:$SG318
	call	_printf
	add	esp, 16					; 00000010H
; Line 75
$L316:
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
; Line 77
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 78
	push	OFFSET FLAT:_rot_mat
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 79
	push	OFFSET FLAT:_pos_delta
	mov	eax, DWORD PTR _vel$[ebp]
	push	eax
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 80
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 4
	push	eax
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 81
$L322:
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
; Line 83
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 85
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L325
$L326:
	inc	DWORD PTR _i$[ebp]
$L325:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L327
; Line 86
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
; Line 87
	jmp	$L326
$L327:
; Line 88
$L323:
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
; Line 90
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 91
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
; Line 92
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+32], 280			; 00000118H
; Line 93
	mov	eax, DWORD PTR _player_weapon+8
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+92], eax
; Line 94
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
; Line 95
	mov	BYTE PTR _firing, 1
; Line 96
$L329:
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
; Line 98
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 99
	push	OFFSET FLAT:_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 100
$L333:
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
; Line 102
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 103
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 104
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 105
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 106
$L335:
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
; Line 108
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 111
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp], eax
; Line 112
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+4], eax
; Line 113
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+8], eax
; Line 115
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
; Line 117
$L337:
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
; Line 119
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 125
$L342:
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
; Line 127
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 129
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 130
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR [eax+32]
; Line 133
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
	je	$L347
; Line 134
	mov	eax, DWORD PTR _StarblazerEntities
	sub	DWORD PTR [eax+96], 5
; Line 135
	mov	DWORD PTR _shake_frames, 7
; Line 136
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+84]
	mov	DWORD PTR _impact_id, eax
; Line 137
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 138
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 139
	jmp	$L345
; Line 161
$L347:
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+32], 0
	jne	$L348
; Line 162
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 163
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 165
$L348:
$L345:
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
; Line 167
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 170
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 171
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR [eax+32]
; Line 173
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L353
$L354:
	inc	DWORD PTR _i$[ebp]
$L353:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L355
; Line 174
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L356
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR _StarblazerEntities[eax*4], ecx
	je	$L356
; Line 175
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	test	BYTE PTR [eax+32], 1
	je	$L357
; Line 176
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
	je	$L358
; Line 178
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 179
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+104], 7
; Line 180
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax+96]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	sub	eax, DWORD PTR [ecx+92]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+96], eax
; Line 183
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 184
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 185
	jmp	$L351
; Line 187
$L358:
; Line 188
$L357:
; Line 189
$L356:
	jmp	$L354
$L355:
; Line 191
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+32], 0
	jne	$L359
; Line 192
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 193
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 195
$L359:
$L351:
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
; Line 197
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 198
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
	je	$L363
; Line 199
	mov	eax, DWORD PTR _StarblazerEntities
	sub	DWORD PTR [eax+96], 5
; Line 200
	mov	DWORD PTR _shake_frames, 7
; Line 201
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 202
	jmp	$L362
; Line 205
$L363:
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+96], 0
	jg	$L364
; Line 206
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 208
$L364:
$L362:
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
; Line 210
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 211
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+36]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+4], eax
; Line 212
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+40]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+8], eax
; Line 213
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+44]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+12], eax
; Line 214
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
; Line 215
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
; Line 216
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
; Line 218
	call	_rand
	mov	ecx, 45					; 0000002dH
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L368
; Line 220
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 221
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 223
$L368:
$L367:
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
$SG371	DB	'assets/boltem.obj', 00H
	ORG $+2
$SG372	DB	'assets/shard.obj', 00H
	ORG $+3
$SG373	DB	'assets/asterold.obj', 00H
$SG374	DB	'assets/hyper.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_set_attributes PROC NEAR
; Line 225
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 226
	push	OFFSET FLAT:$SG371
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ENEMY_LASER+12, eax
; Line 227
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+12], OFFSET FLAT:_enemy_laser_script
; Line 228
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [eax+36], 239			; 000000efH
; Line 229
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [eax+37], 0
; Line 230
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+32], 2
; Line 231
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _ENEMY_LASER+12
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 232
	mov	DWORD PTR _ENEMY_LASER+8, 8
; Line 234
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
; Line 235
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+32], 2
; Line 236
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+36], 191			; 000000bfH
; Line 237
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+37], 0
; Line 238
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 240
	mov	DWORD PTR _player_fighter, 40		; 00000028H
; Line 241
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 242
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 243
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 244
	mov	DWORD PTR _player_fighter+16, 40	; 00000028H
; Line 245
	mov	DWORD PTR _player_fighter+20, 40	; 00000028H
; Line 247
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 248
	mov	DWORD PTR _player_weapon+4, 9
; Line 249
	mov	DWORD PTR _player_weapon+8, 8
; Line 250
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _player_weapon+12, eax
; Line 252
	mov	DWORD PTR _laser_velocity, 0
; Line 253
	mov	DWORD PTR _laser_velocity+4, 0
; Line 254
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 256
	push	OFFSET FLAT:$SG372
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 257
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 258
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+32], 2
; Line 259
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+36], 127			; 0000007fH
; Line 260
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+37], 0
; Line 261
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 263
	push	OFFSET FLAT:$SG373
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 264
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 265
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+32], 3
; Line 266
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 267
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+36], 207			; 000000cfH
; Line 268
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+37], 0
; Line 269
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 271
	push	OFFSET FLAT:$SG374
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _AX5, eax
; Line 272
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+12], OFFSET FLAT:_ax5_script
; Line 273
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+32], 3
; Line 274
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+28], 0
; Line 275
	mov	eax, DWORD PTR _AX5
	mov	BYTE PTR [eax+37], 1
; Line 276
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _AX5
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 277
$L370:
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
_DATA	SEGMENT
	ORG $+3
$SG378	DB	'assets/bolt.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_blazer2_init PROC NEAR
; Line 286
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 289
	mov	DWORD PTR _frames, 0
; Line 292
	push	OFFSET FLAT:$SG378
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 293
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 294
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 296
	call	_set_attributes
; Line 298
	mov	DWORD PTR _cam_template, 0
; Line 299
	mov	DWORD PTR _cam_template+4, 0
; Line 300
	mov	WORD PTR _cam_template+8, 0
; Line 301
	mov	WORD PTR _cam_template+10, 0
; Line 302
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 303
	mov	eax, DWORD PTR _player_fighter
	mov	DWORD PTR _cam_template+28, eax
; Line 304
	mov	DWORD PTR _cam_template+32, 2
; Line 306
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 309
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L379
$L380:
	inc	DWORD PTR _i$[ebp]
$L379:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jae	$L381
; Line 310
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
; Line 311
	jmp	$L380
$L381:
; Line 314
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L382
$L383:
	inc	DWORD PTR _i$[ebp]
$L382:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	$L384
; Line 315
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	call	_free
	add	esp, 4
; Line 316
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 317
	jmp	$L383
$L384:
; Line 320
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
; Line 323
	mov	eax, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_boost, eax
; Line 324
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 329
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	jne	$L385
; Line 330
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L386
$L387:
	inc	DWORD PTR _i$[ebp]
$L386:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jae	$L388
; Line 331
	call	_spawn_asteroid
; Line 332
	jmp	$L387
$L388:
; Line 336
$L385:
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 337
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 339
	mov	DWORD PTR _velocity, 0
; Line 340
	mov	DWORD PTR _velocity+4, 0
; Line 341
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 343
	call	_init_hypercraft
; Line 344
$L376:
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
; Line 346
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 347
	movsx	eax, BYTE PTR _joy_amount$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _angle$[ebp]
	imul	eax, ecx
	mov	al, ah
	jmp	$L391
; Line 348
$L391:
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
; Line 350
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 354
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 356
	push	74					; 0000004aH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 357
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+7], 0
; Line 358
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+6], al
; Line 359
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 362
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L395
; Line 363
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 127			; 0000007fH
; Line 365
	jmp	$L396
$L395:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L397
; Line 366
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], -127			; ffffff81H
; Line 368
	jmp	$L398
$L397:
; Line 369
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 0
; Line 370
$L398:
$L396:
; Line 373
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L399
; Line 374
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 127			; 0000007fH
; Line 376
	jmp	$L400
$L399:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L401
; Line 377
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], -127			; ffffff81H
; Line 379
	jmp	$L402
$L401:
; Line 380
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 0
; Line 381
$L402:
$L400:
; Line 384
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L403
; Line 385
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 127			; 0000007fH
; Line 387
	jmp	$L404
$L403:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L405
; Line 388
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], -127			; ffffff81H
; Line 390
	jmp	$L406
$L405:
; Line 391
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 0
; Line 392
$L406:
$L404:
; Line 401
$L393:
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
; Line 419
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 420
	mov	eax, DWORD PTR _player_fighter
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+96], eax
; Line 421
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+4], eax
; Line 422
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+8], eax
; Line 423
	call	_rand
	mov	ecx, 100				; 00000064H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-50]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+12], eax
; Line 424
$L410:
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
; Line 426
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 429
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 431
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L414
; Line 432
	mov	BYTE PTR _BG_COLOR, 0
; Line 435
$L414:
	mov	eax, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [eax+96], 0
	jg	$L415
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L415
; Line 436
	mov	BYTE PTR _dying, 1
; Line 437
	mov	eax, DWORD PTR _timeout
	mov	DWORD PTR _frames_respawning, eax
; Line 438
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
; Line 440
	cmp	DWORD PTR _timeout, 0
	jne	$L416
; Line 441
	call	_respawn_player
; Line 443
$L416:
; Line 445
$L415:
	cmp	DWORD PTR _frames_respawning, 0
	je	$L417
; Line 446
	push	8
	push	0
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 447
	dec	DWORD PTR _frames_respawning
; Line 449
	jne	$L419
; Line 450
	call	_respawn_player
; Line 452
$L419:
; Line 454
$L417:
	cmp	DWORD PTR _shake_frames, 0
	je	$L420
; Line 455
	dec	DWORD PTR _shake_frames
; Line 459
$L420:
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
; Line 460
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
; Line 461
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
; Line 463
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L421
; Line 464
	xor	eax, eax
	mov	al, BYTE PTR _shading
	test	eax, eax
	jne	$L571
	mov	BYTE PTR _shading, 1
	jmp	$L572
$L571:
	mov	BYTE PTR _shading, 0
$L572:
; Line 468
$L421:
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+3]
	test	eax, eax
	je	$L422
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_weapon+4, eax
	ja	$L422
	cmp	DWORD PTR _firing_cooldown, 0
	jne	$L422
; Line 469
	xor	eax, eax
	sub	eax, DWORD PTR _player_weapon+4
	neg	eax
	sub	DWORD PTR _player_battery, eax
; Line 470
	mov	eax, DWORD PTR _player_weapon
	mov	DWORD PTR _firing_cooldown, eax
; Line 471
	call	_fire_laser
; Line 473
	jmp	$L423
$L422:
; Line 474
	mov	BYTE PTR _firing, 0
; Line 475
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_fighter+20, eax
	jbe	$L424
; Line 476
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L425
	inc	DWORD PTR _player_battery
; Line 477
$L425:
; Line 478
$L424:
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	$L426
; Line 479
	dec	DWORD PTR _firing_cooldown
; Line 481
$L426:
$L423:
; Line 484
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+5]
	test	eax, eax
	je	$L427
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L427
; Line 485
	mov	eax, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, eax
; Line 486
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L428
	dec	DWORD PTR _player_boost
; Line 487
$L428:
; Line 488
	jmp	$L429
$L427:
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+6]
	test	eax, eax
	je	$L430
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L430
; Line 489
	mov	DWORD PTR _velocity+8, 0
; Line 490
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L431
	dec	DWORD PTR _player_boost
; Line 491
$L431:
; Line 492
	jmp	$L432
$L430:
; Line 493
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L433
; Line 494
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 496
	jmp	$L434
$L433:
; Line 497
	mov	DWORD PTR _velocity+8, 0
; Line 498
$L434:
; Line 499
	mov	eax, DWORD PTR _player_boost
	cmp	DWORD PTR _player_fighter+16, eax
	jbe	$L435
; Line 500
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L436
	inc	DWORD PTR _player_boost
; Line 501
$L436:
; Line 502
$L435:
$L432:
$L429:
; Line 506
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	je	$L437
; Line 507
	call	_net_syncstate
; Line 510
$L437:
	call	_run_entity_scripts
; Line 513
	cmp	DWORD PTR _player_boost, 0
	jne	$L438
; Line 514
	mov	BYTE PTR _boost_overheating, 1
; Line 516
$L438:
	mov	eax, DWORD PTR _player_fighter+16
	shr	eax, 1
	cmp	eax, DWORD PTR _player_boost
	ja	$L439
; Line 517
	mov	BYTE PTR _boost_overheating, 0
; Line 521
$L439:
	inc	DWORD PTR _frames
; Line 522
$L411:
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
; Line 524
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 525
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 526
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 527
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 528
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 529
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 530
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 531
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 532
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 533
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 534
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 535
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 536
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 537
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 538
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 539
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 540
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 541
$L441:
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
; Line 544
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 546
	mov	DWORD PTR _c$[ebp], 0
; Line 548
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L447
$L448:
	inc	DWORD PTR _i$[ebp]
$L447:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L449
; Line 549
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L450
	inc	DWORD PTR _c$[ebp]
; Line 550
$L450:
	jmp	$L448
$L449:
; Line 552
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L444
; Line 553
$L444:
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
$SG455	DB	'ENT', 00H
$SG457	DB	'%d / %d', 00H
$SG458	DB	'TRI', 00H
$SG459	DB	'%d / %d', 00H
$SG460	DB	'FPS', 00H
$SG462	DB	'%d', 00H
	ORG $+1
$SG463	DB	'%d %d %d', 00H
	ORG $+3
$SG464	DB	'VERT %d / %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_num$ = -100
_draw_debug PROC NEAR
; Line 556
	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
	push	ebx
	push	esi
	push	edi
; Line 560
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG455
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 561
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:$SG457
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 562
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
; Line 564
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:$SG458
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 565
	push	1500					; 000005dcH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:$SG459
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 566
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
; Line 568
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:$SG460
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 569
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	$L461
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:$SG462
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 570
$L461:
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
; Line 573
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
	push	OFFSET FLAT:$SG463
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 574
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
; Line 576
	push	2500					; 000009c4H
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	push	eax
	push	OFFSET FLAT:$SG464
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 577
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
; Line 578
$L452:
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
; Line 580
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 585
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
; Line 586
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 587
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L475
$L476:
	inc	DWORD PTR _j$[ebp]
$L475:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L477
; Line 588
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _barcolors[eax]
	mov	DWORD PTR _c$[ebp], eax
; Line 589
	mov	eax, DWORD PTR _k$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jle	$L478
	jmp	$L477
; Line 590
$L478:
	mov	DWORD PTR _pos1$[ebp], 24		; 00000018H
; Line 591
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 592
	mov	DWORD PTR _pos3$[ebp], 8
; Line 593
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 594
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L479
; Line 596
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 597
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 599
$L479:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L480
; Line 600
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 601
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 603
$L480:
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
; Line 604
	add	DWORD PTR _i$[ebp], 8
; Line 605
	jmp	$L476
$L477:
; Line 606
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 607
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 608
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 609
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 610
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	24					; 00000018H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 611
$L466:
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
; Line 613
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 615
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L485
$L486:
	inc	DWORD PTR _i$[ebp]
$L485:
	cmp	DWORD PTR _i$[ebp], 7
	jge	$L487
; Line 618
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 619
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 620
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 621
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 622
	push	175					; 000000afH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 623
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 624
	push	175					; 000000afH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 625
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 626
	jmp	$L486
$L487:
; Line 628
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 629
$L483:
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
; Line 632
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 637
	mov	eax, DWORD PTR _player_boost
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, 5
	sub	edx, edx
	div	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 638
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 639
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L499
$L500:
	inc	DWORD PTR _j$[ebp]
$L499:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L501
; Line 640
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	je	$L573
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
	jmp	$L574
$L573:
	mov	DWORD PTR _c$[ebp], 159			; 0000009fH
$L574:
; Line 641
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _k$[ebp], eax
	jge	$L502
	jmp	$L501
; Line 642
$L502:
	mov	DWORD PTR _pos1$[ebp], 312		; 00000138H
; Line 643
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 644
	mov	DWORD PTR _pos3$[ebp], 296		; 00000128H
; Line 645
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 646
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L503
; Line 648
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 649
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 651
$L503:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L504
; Line 652
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 653
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 655
$L504:
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
; Line 656
	add	DWORD PTR _i$[ebp], 8
; Line 657
	jmp	$L500
$L501:
; Line 658
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 659
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 660
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 661
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 662
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	312					; 00000138H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 663
$L490:
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
; Line 665
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 670
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L515
$L516:
	inc	DWORD PTR _i$[ebp]
$L515:
	cmp	DWORD PTR _i$[ebp], 60			; 0000003cH
	jge	$L517
; Line 671
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L518
$L519:
	inc	DWORD PTR _j$[ebp]
$L518:
	cmp	DWORD PTR _j$[ebp], 60			; 0000003cH
	jge	$L520
; Line 672
	mov	DWORD PTR _c$[ebp], 0
; Line 674
	cmp	DWORD PTR _i$[ebp], 0
	je	$L522
	cmp	DWORD PTR _i$[ebp], 59			; 0000003bH
	je	$L522
	cmp	DWORD PTR _j$[ebp], 0
	je	$L522
	cmp	DWORD PTR _j$[ebp], 59			; 0000003bH
	jne	$L521
$L522:
	mov	DWORD PTR _c$[ebp], 255			; 000000ffH
; Line 675
$L521:
	cmp	DWORD PTR _c$[ebp], 0
	jne	$L523
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 1
	xor	eax, edx
	sub	eax, edx
	je	$L523
	jmp	$L519
; Line 676
$L523:
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
; Line 677
	jmp	$L519
$L520:
; Line 678
	jmp	$L516
$L517:
; Line 681
	mov	DWORD PTR _j$[ebp], -1
	jmp	$L525
$L526:
	inc	DWORD PTR _j$[ebp]
$L525:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L527
; Line 682
	mov	DWORD PTR _k$[ebp], -1
	jmp	$L528
$L529:
	inc	DWORD PTR _k$[ebp]
$L528:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L530
; Line 683
	push	239					; 000000efH
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 684
	jmp	$L529
$L530:
; Line 685
	jmp	$L526
$L527:
; Line 687
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 690
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L531
$L532:
	inc	DWORD PTR _i$[ebp]
$L531:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L533
; Line 691
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L534
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	test	BYTE PTR [eax+32], 2
	je	$L534
; Line 692
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
; Line 693
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 694
	lea	eax, DWORD PTR _screen_coords$[ebp]
	push	eax
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 696
	mov	eax, DWORD PTR _screen_coords$[ebp]
	sar	eax, 17					; 00000011H
	mov	DWORD PTR _pos1$[ebp], eax
; Line 697
	mov	eax, DWORD PTR _screen_coords$[ebp+8]
	sar	eax, 17					; 00000011H
	mov	DWORD PTR _pos2$[ebp], eax
; Line 699
	cmp	DWORD PTR _pos1$[ebp], 30		; 0000001eH
	jle	$L535
	mov	DWORD PTR _pos1$[ebp], 30		; 0000001eH
; Line 700
$L535:
	cmp	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
	jge	$L536
	mov	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
; Line 701
$L536:
	cmp	DWORD PTR _pos2$[ebp], 30		; 0000001eH
	jle	$L537
	mov	DWORD PTR _pos2$[ebp], 30		; 0000001eH
; Line 702
$L537:
	cmp	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
	jge	$L538
	mov	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
; Line 704
$L538:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+37]
	test	ecx, ecx
	je	$L539
; Line 705
	cmp	DWORD PTR _screen_coords$[ebp+4], 0
	jl	$L540
; Line 706
	mov	DWORD PTR _c$[ebp], 175			; 000000afH
; Line 708
	jmp	$L541
$L540:
; Line 709
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
; Line 710
$L541:
; Line 712
	mov	DWORD PTR _j$[ebp], -1
	jmp	$L542
$L543:
	inc	DWORD PTR _j$[ebp]
$L542:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L544
; Line 713
	mov	DWORD PTR _k$[ebp], -1
	jmp	$L545
$L546:
	inc	DWORD PTR _k$[ebp]
$L545:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L547
; Line 714
	mov	eax, DWORD PTR _pos2$[ebp]
	add	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	jns	$L548
	jmp	$L546
; Line 715
$L548:
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _pos2$[ebp]
	add	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _pos1$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 716
	jmp	$L546
$L547:
; Line 717
	jmp	$L543
$L544:
; Line 719
	jmp	$L549
$L539:
; Line 720
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
; Line 721
$L549:
; Line 723
$L534:
	jmp	$L532
$L533:
; Line 724
$L506:
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
; Line 726
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 727
	mov	DWORD PTR _offset$[ebp], 140		; 0000008cH
; Line 729
	mov	eax, DWORD PTR _player_battery
	lea	eax, DWORD PTR [eax+eax*2]
	add	eax, eax
	shr	eax, 4
	mov	DWORD PTR _intensity$[ebp], eax
; Line 731
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L555
$L556:
	inc	DWORD PTR _i$[ebp]
$L555:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	$L557
; Line 732
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _i$[ebp], eax
	ja	$L558
; Line 733
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
; Line 735
$L558:
	jmp	$L556
$L557:
; Line 757
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 758
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 759
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 760
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 761
$L551:
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
$SG566	DB	'RESPAWNING', 00H
	ORG $+1
$SG567	DB	'IN %d SEC', 00H
_DATA	ENDS
_TEXT	SEGMENT
_text$ = -80
_blazer2_draw PROC NEAR
; Line 764
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
	push	ebx
	push	esi
	push	edi
; Line 768
	cmp	DWORD PTR _shake_frames, 0
	je	$L561
; Line 769
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_X
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_X, ax
; Line 770
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_Y
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 772
	jmp	$L562
$L561:
; Line 773
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 774
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 775
$L562:
; Line 778
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 779
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 782
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
; Line 785
	cmp	DWORD PTR _frames_respawning, 0
	jne	$L563
	call	_draw_crosshair
; Line 788
$L563:
	call	_draw_boost_bar
; Line 791
	call	_draw_HPbar
; Line 794
	call	_draw_radar
; Line 797
	call	_draw_battery
; Line 801
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	shr	ecx, 1
	cmp	DWORD PTR [eax+96], ecx
	jae	$L564
; Line 802
	call	_blazer2_screencrack
; Line 805
$L564:
	cmp	DWORD PTR _frames_respawning, 0
	je	$L565
; Line 806
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	80					; 00000050H
	push	130					; 00000082H
	push	OFFSET FLAT:$SG566
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 807
	mov	ecx, 70					; 00000046H
	mov	eax, DWORD PTR _frames_respawning
	sub	edx, edx
	div	ecx
	push	eax
	push	OFFSET FLAT:$SG567
	lea	eax, DWORD PTR _text$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 808
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	90					; 0000005aH
	push	130					; 00000082H
	lea	eax, DWORD PTR _text$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 812
$L565:
	call	_draw_debug
; Line 814
	add	DWORD PTR _barcycle, 2
; Line 815
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	$L568
	mov	DWORD PTR _barcycle, 0
; Line 818
$L568:
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
; Line 819
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 8
; Line 820
$L559:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
