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
_DATA	ENDS
_BSS	SEGMENT
_multiplayer DB	01H DUP (?)
	ALIGN	4

_firing	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_dying:BYTE
COMM	_impact_id:DWORD
_DATA	ENDS
_BSS	SEGMENT
	ALIGN	4

_frames_respawning DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
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
_DATA	ENDS
_BSS	SEGMENT
_boost_overheating DB 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_velocity:BYTE:0cH
_DATA	ENDS
_BSS	SEGMENT
	ALIGN	4

_barcycle DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_cam_template:BYTE:028H
COMM	_camera:DWORD
COMM	_player_fighter:BYTE:01cH
COMM	_player_weapon:BYTE:010H
COMM	_player_boost:DWORD
COMM	_player_battery:DWORD
_DATA	ENDS
_BSS	SEGMENT
_shake_frames DD 01H DUP (?)
_firing_cooldown DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_rot_mat:BYTE:024H
COMM	_pos_delta:BYTE:0cH
COMM	_laser_velocity:BYTE:0cH
COMM	_tst:BYTE:0cH
COMM	_tst2:BYTE:0cH
_barcolors DB	0e8H, 0e8H, 0c8H, 0ccH, 0ccH, 0caH, 0e8H, 0e8H, 0e8H, 0e8H
	DB	0e8H, 0e8H, 0e8H, 0e8H, 0f8H, 0f8H, 0b8H, 0b8H, 0bcH, 0bfH, 0bfH
	DB	0bfH
_shading DB	01H
_DATA	ENDS
PUBLIC	_explode_at
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_rand:NEAR
EXTRN	_play_soundfx:NEAR
_TEXT	SEGMENT
_pos$ = 8
_i$ = -4
_id$ = -8
_explode_at PROC NEAR
; File src\blazer2.c
; Line 57
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 61
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L319
$L320:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L319:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L321
; Line 62
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L594
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L594:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L595
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L595:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L596
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L596:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L597
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L597:
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	lea	eax, DWORD PTR [edx+eax-128]
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L598
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L598:
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	lea	eax, DWORD PTR [edx+eax-128]
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L599
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L599:
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax-128]
	push	eax
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
	push	ecx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 63
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L600
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L600:
	sub	eax, 128				; 00000080H
	imul	eax, 3
	mov	edx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [ecx+36], eax
; Line 64
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L601
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L601:
	sub	eax, 128				; 00000080H
	imul	eax, 3
	mov	edx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [ecx+40], eax
; Line 65
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L602
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L602:
	sub	eax, 128				; 00000080H
	imul	eax, 3
	mov	edx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [ecx+44], eax
; Line 66
	jmp	$L320
$L321:
; Line 68
	mov	edx, DWORD PTR _SND_EXPLODE
	push	edx
	call	_play_soundfx
	add	esp, 4
; Line 69
	mov	esp, ebp
	pop	ebp
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
; Line 72
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 4
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pos$[ebp], edx
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _pos$[ebp+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR _pos$[ebp+8], ecx
; Line 73
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_free
	add	esp, 4
; Line 74
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 75
	lea	edx, DWORD PTR _pos$[ebp]
	push	edx
	call	_explode_at
	add	esp, 4
; Line 76
	mov	esp, ebp
	pop	ebp
	ret	0
_explode_entity ENDP
_TEXT	ENDS
PUBLIC	_print_vec
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+1
$SG332	DB	'(%d, %d, %d)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR
; Line 78
	push	ebp
	mov	ebp, esp
; Line 79
	mov	eax, DWORD PTR _vec$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _vec$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG332
	call	_printf
	add	esp, 16					; 00000010H
; Line 80
	pop	ebp
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
; Line 83
	push	OFFSET FLAT:_rot_mat
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 84
	push	OFFSET FLAT:_pos_delta
	mov	ecx, DWORD PTR _vel$[ebp]
	push	ecx
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 85
	mov	edx, DWORD PTR _ent$[ebp]
	add	edx, 4
	push	edx
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 86
	pop	ebp
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
	push	ecx
; Line 90
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L339
$L340:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L339:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	SHORT $L341
; Line 91
	push	255					; 000000ffH
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	add	ecx, OFFSET FLAT:_title_stars
	sub	esp, 12					; 0000000cH
	mov	edx, esp
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], ecx
	call	_plotpoint_3d
	add	esp, 16					; 00000010H
; Line 92
	jmp	SHORT $L340
$L341:
; Line 93
	mov	esp, ebp
	pop	ebp
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
	push	ecx
; Line 96
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	edx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _player_weapon+12
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 97
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [edx+32], 280			; 00000118H
; Line 98
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR _player_weapon+8
	mov	DWORD PTR [ecx+92], edx
; Line 99
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	add	edx, 16					; 00000010H
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR [edx], ecx
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR [edx+4], ecx
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR [edx+8], ecx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [edx+12], eax
; Line 100
	mov	BYTE PTR _firing, 1
; Line 101
	mov	ecx, DWORD PTR _SND_LASER
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 102
	mov	esp, ebp
	pop	ebp
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
; Line 105
	push	OFFSET FLAT:_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 106
	pop	ebp
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
; Line 109
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _star$[ebp]
	mov	DWORD PTR [eax], edx
; Line 110
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _star$[ebp]
	mov	DWORD PTR [eax+4], edx
; Line 111
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _star$[ebp]
	mov	DWORD PTR [eax+8], edx
; Line 112
	pop	ebp
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
; Line 117
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	sub	edx, 250				; 000000faH
	shl	edx, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp], edx
; Line 118
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	sub	edx, 250				; 000000faH
	shl	edx, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+4], edx
; Line 119
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	sub	edx, 250				; 000000faH
	shl	edx, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+8], edx
; Line 121
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L611
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L611:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L612
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L612:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L613
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L613:
	push	eax
	mov	edx, DWORD PTR _pos$[ebp+8]
	push	edx
	mov	eax, DWORD PTR _pos$[ebp+4]
	push	eax
	mov	ecx, DWORD PTR _pos$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ASTEROID
	push	edx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 123
	mov	esp, ebp
	pop	ebp
	ret	0
_spawn_asteroid ENDP
_TEXT	ENDS
PUBLIC	_ax5_script
_TEXT	SEGMENT
_ax5_script PROC NEAR
; Line 125
	push	ebp
	mov	ebp, esp
; Line 131
	pop	ebp
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
	push	ecx
; Line 135
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 136
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+32]
	sub	ecx, 1
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+32], ecx
; Line 139
	mov	ecx, DWORD PTR _StarblazerEntities
	push	ecx
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_test_collisions
	add	esp, 8
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L361
; Line 140
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR [ecx+96]
	sub	edx, 5
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+96], edx
; Line 141
	mov	DWORD PTR _shake_frames, 7
; Line 142
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+84]
	mov	DWORD PTR _impact_id, eax
; Line 143
	mov	ecx, DWORD PTR _SND_HIT
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 144
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_free
	add	esp, 4
; Line 145
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 146
	jmp	SHORT $L362
$L361:
; Line 168
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L362
; Line 169
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_free
	add	esp, 4
; Line 170
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
$L362:
; Line 172
	mov	esp, ebp
	pop	ebp
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
	push	ecx
; Line 177
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 178
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+32]
	sub	ecx, 1
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+32], ecx
; Line 180
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L367
$L368:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L367:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L369
; Line 181
	mov	edx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[edx*4], 0
	je	$L372
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[eax*4]
	cmp	edx, DWORD PTR [ecx]
	je	$L372
; Line 182
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 1
	test	eax, eax
	je	$L372
; Line 183
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_test_collisions
	add	esp, 8
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L372
; Line 185
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 186
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [edx+104], 7
; Line 187
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [ecx+96]
	sub	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [eax+96], ecx
; Line 190
	mov	ecx, DWORD PTR _SND_HIT
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 191
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_free
	add	esp, 4
; Line 192
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 193
	jmp	SHORT $L373
$L372:
; Line 197
	jmp	$L368
$L369:
; Line 199
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L373
; Line 200
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_free
	add	esp, 4
; Line 201
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
$L373:
; Line 203
	mov	esp, ebp
	pop	ebp
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
; Line 206
	mov	eax, DWORD PTR _StarblazerEntities
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_test_collisions
	add	esp, 8
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L377
; Line 207
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR [eax+96]
	sub	ecx, 5
	mov	edx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [edx+96], ecx
; Line 208
	mov	DWORD PTR _shake_frames, 7
; Line 209
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 210
	mov	ecx, DWORD PTR _SND_HIT
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 211
	jmp	SHORT $L378
$L377:
; Line 214
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	cmp	DWORD PTR [eax+96], 0
	jg	SHORT $L378
; Line 215
	mov	ecx, DWORD PTR _ptr$[ebp]
	push	ecx
	call	_explode_entity
	add	esp, 4
$L378:
; Line 217
	pop	ebp
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
; Line 219
	push	ebp
	mov	ebp, esp
; Line 220
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [eax+36]
	shl	edx, 6
	mov	eax, DWORD PTR [ecx+4]
	add	eax, edx
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+4], eax
; Line 221
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [eax+40]
	shl	edx, 6
	mov	eax, DWORD PTR [ecx+8]
	add	eax, edx
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+8], eax
; Line 222
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [eax+44]
	shl	edx, 6
	mov	eax, DWORD PTR [ecx+12]
	add	eax, edx
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+12], eax
; Line 223
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 16					; 00000010H
	push	ecx
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
; Line 224
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
; Line 225
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 16					; 00000010H
	push	edx
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
; Line 227
	call	_rand
	cdq
	mov	ecx, 45					; 0000002dH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L382
; Line 229
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_free
	add	esp, 4
; Line 230
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
$L382:
; Line 232
	pop	ebp
	ret	0
_debris_script ENDP
_TEXT	ENDS
PUBLIC	_set_attributes
EXTRN	_create_hitbox:NEAR
EXTRN	_load_model:NEAR
_DATA	SEGMENT
	ORG $+2
$SG385	DB	'assets/shreder2.obj', 00H
$SG386	DB	'assets/shard.obj', 00H
	ORG $+3
$SG387	DB	'assets/asterold.obj', 00H
$SG388	DB	'assets/hyper.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_set_attributes PROC NEAR
; Line 234
	push	ebp
	mov	ebp, esp
; Line 235
	push	OFFSET FLAT:$SG385
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ENEMY_LASER+12, eax
; Line 236
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+12], OFFSET FLAT:_enemy_laser_script
; Line 237
	mov	ecx, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [ecx+36], 239			; 000000efH
; Line 238
	mov	edx, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [edx+37], 0
; Line 239
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+32], 2
; Line 240
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	ecx, DWORD PTR _ENEMY_LASER+12
	push	ecx
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 241
	mov	DWORD PTR _ENEMY_LASER+8, 8
; Line 243
	mov	edx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [edx+12], OFFSET FLAT:_laser_script
; Line 244
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+32], 2
; Line 245
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [ecx+36], 191			; 000000bfH
; Line 246
	mov	edx, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [edx+37], 0
; Line 247
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 249
	mov	DWORD PTR _player_fighter, 40		; 00000028H
; Line 250
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 251
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 252
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 253
	mov	DWORD PTR _player_fighter+16, 40	; 00000028H
; Line 254
	mov	DWORD PTR _player_fighter+20, 40	; 00000028H
; Line 264
	mov	DWORD PTR _player_weapon, 3
; Line 265
	mov	DWORD PTR _player_weapon+4, 2
; Line 266
	mov	DWORD PTR _player_weapon+8, 2
; Line 267
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _player_weapon+12, ecx
; Line 269
	mov	DWORD PTR _laser_velocity, 0
; Line 270
	mov	DWORD PTR _laser_velocity+4, 0
; Line 271
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 273
	push	OFFSET FLAT:$SG386
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 274
	mov	edx, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [edx+12], OFFSET FLAT:_debris_script
; Line 275
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+32], 2
; Line 276
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [ecx+36], 127			; 0000007fH
; Line 277
	mov	edx, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [edx+37], 0
; Line 278
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 280
	push	OFFSET FLAT:$SG387
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 281
	mov	ecx, DWORD PTR _ASTEROID
	mov	DWORD PTR [ecx+12], OFFSET FLAT:_asteroid_script
; Line 282
	mov	edx, DWORD PTR _ASTEROID
	mov	DWORD PTR [edx+32], 3
; Line 283
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 284
	mov	ecx, DWORD PTR _ASTEROID
	mov	BYTE PTR [ecx+36], 250			; 000000faH
; Line 285
	mov	edx, DWORD PTR _ASTEROID
	mov	BYTE PTR [edx+37], 0
; Line 286
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 288
	push	OFFSET FLAT:$SG388
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _AX5, eax
; Line 289
	mov	ecx, DWORD PTR _AX5
	mov	DWORD PTR [ecx+12], OFFSET FLAT:_ax5_script
; Line 290
	mov	edx, DWORD PTR _AX5
	mov	DWORD PTR [edx+32], 3
; Line 291
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+28], 0
; Line 292
	mov	ecx, DWORD PTR _AX5
	mov	BYTE PTR [ecx+37], 1
; Line 293
	push	458752					; 00070000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	edx, DWORD PTR _AX5
	push	edx
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 294
	pop	ebp
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
$SG400	DB	'assets/shreder1.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_blazer2_init PROC NEAR
; Line 303
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 306
	mov	DWORD PTR _frames, 0
; Line 309
	call	_stop_music
; Line 310
	push	OFFSET FLAT:$SG394
	call	_play_music
	add	esp, 4
; Line 311
	mov	BYTE PTR _sfx_enable, 1
; Line 312
	push	0
	push	1
	push	OFFSET FLAT:$SG396
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_EXPLODE, eax
; Line 313
	push	0
	push	2
	push	OFFSET FLAT:$SG397
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER, eax
; Line 314
	push	0
	push	3
	push	OFFSET FLAT:$SG398
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER_ENEMY, eax
; Line 315
	push	0
	push	1
	push	OFFSET FLAT:$SG399
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_HIT, eax
; Line 318
	push	OFFSET FLAT:$SG400
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 319
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 320
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 322
	call	_set_attributes
; Line 324
	mov	DWORD PTR _cam_template, 0
; Line 325
	mov	DWORD PTR _cam_template+4, 0
; Line 326
	mov	WORD PTR _cam_template+8, 0
; Line 327
	mov	WORD PTR _cam_template+10, 0
; Line 328
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 329
	mov	eax, DWORD PTR _player_fighter
	mov	DWORD PTR _cam_template+28, eax
; Line 330
	mov	DWORD PTR _cam_template+32, 2
; Line 332
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 335
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L401
$L402:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L401:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jae	SHORT $L403
; Line 336
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	add	edx, OFFSET FLAT:_title_stars
	push	edx
	call	_init_star
	add	esp, 4
; Line 337
	jmp	SHORT $L402
$L403:
; Line 340
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L404
$L405:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L404:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	SHORT $L406
; Line 341
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	push	edx
	call	_free
	add	esp, 4
; Line 342
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 343
	jmp	SHORT $L405
$L406:
; Line 346
	push	0
	push	0
	push	0
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	push	edx
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	push	edx
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	push	edx
	push	OFFSET FLAT:_cam_template
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _i$[ebp], eax
; Line 349
	mov	edx, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_boost, edx
; Line 350
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 355
	xor	ecx, ecx
	mov	cl, BYTE PTR _multiplayer
	test	ecx, ecx
	jne	SHORT $L410
; Line 356
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L408
$L409:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L408:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jae	SHORT $L410
; Line 357
	call	_spawn_asteroid
; Line 358
	jmp	SHORT $L409
$L410:
; Line 362
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 363
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 365
	mov	DWORD PTR _velocity, 0
; Line 366
	mov	DWORD PTR _velocity+4, 0
; Line 367
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 369
	call	_init_hypercraft
; Line 370
	mov	esp, ebp
	pop	ebp
	ret	0
_blazer2_init ENDP
_TEXT	ENDS
PUBLIC	_angle_multiply
_TEXT	SEGMENT
_angle$ = 8
_joy_amount$ = 12
_angle_multiply PROC NEAR
; Line 372
	push	ebp
	mov	ebp, esp
; Line 373
	mov	eax, DWORD PTR _angle$[ebp]
	and	eax, 255				; 000000ffH
	movsx	ecx, BYTE PTR _joy_amount$[ebp]
	imul	eax, ecx
	sar	eax, 8
; Line 374
	pop	ebp
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
; Line 376
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 380
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 382
	push	74					; 0000004aH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 383
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+7], 0
; Line 384
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+6], al
; Line 385
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+5], al
; Line 388
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L417
; Line 389
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 127			; 0000007fH
; Line 391
	jmp	SHORT $L420
$L417:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L419
; Line 392
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx], -127			; ffffff81H
; Line 394
	jmp	SHORT $L420
$L419:
; Line 395
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx], 0
$L420:
; Line 399
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L421
; Line 400
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 127			; 0000007fH
; Line 402
	jmp	SHORT $L424
$L421:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L423
; Line 403
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+1], -127			; ffffff81H
; Line 405
	jmp	SHORT $L424
$L423:
; Line 406
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+1], 0
$L424:
; Line 410
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L425
; Line 411
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], -127			; ffffff81H
; Line 413
	jmp	SHORT $L428
$L425:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L427
; Line 414
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+2], 127			; 0000007fH
; Line 416
	jmp	SHORT $L428
$L427:
; Line 417
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+2], 0
$L428:
; Line 427
	mov	esp, ebp
	pop	ebp
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR
; Line 445
	push	ebp
	mov	ebp, esp
; Line 446
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	mov	DWORD PTR [eax+96], ecx
; Line 447
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+4], edx
; Line 448
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+8], edx
; Line 449
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+12], edx
; Line 450
	pop	ebp
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
; Line 452
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 455
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 457
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L436
; Line 458
	mov	BYTE PTR _BG_COLOR, 0
$L436:
; Line 461
	mov	ecx, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [ecx+96], 0
	jg	SHORT $L438
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L438
; Line 462
	mov	edx, DWORD PTR _SND_EXPLODE
	push	edx
	call	_play_soundfx
	add	esp, 4
; Line 463
	mov	BYTE PTR _dying, 1
; Line 464
	mov	eax, DWORD PTR _timeout
	mov	DWORD PTR _frames_respawning, eax
; Line 465
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
; Line 467
	cmp	DWORD PTR _timeout, 0
	jne	SHORT $L438
; Line 468
	call	_respawn_player
$L438:
; Line 472
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L441
; Line 473
	push	8
	push	0
	lea	ecx, DWORD PTR _joy$[ebp]
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
; Line 474
	mov	edx, DWORD PTR _frames_respawning
	sub	edx, 1
	mov	DWORD PTR _frames_respawning, edx
; Line 476
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L441
; Line 477
	call	_respawn_player
$L441:
; Line 481
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L442
; Line 482
	mov	eax, DWORD PTR _shake_frames
	sub	eax, 1
	mov	DWORD PTR _shake_frames, eax
$L442:
; Line 486
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 16					; 00000010H
	push	ecx
	mov	dl, BYTE PTR _joy$[ebp]
	push	edx
	mov	al, BYTE PTR _player_fighter+4
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
	add	esp, 8
; Line 487
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 16					; 00000010H
	push	ecx
	mov	dl, BYTE PTR _joy$[ebp+1]
	push	edx
	mov	al, BYTE PTR _player_fighter+4
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
	add	esp, 8
; Line 488
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 16					; 00000010H
	push	ecx
	mov	dl, BYTE PTR _joy$[ebp+2]
	push	edx
	mov	al, BYTE PTR _player_fighter+4
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
	add	esp, 8
; Line 490
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L443
; Line 491
	xor	ecx, ecx
	mov	cl, BYTE PTR _shading
	neg	ecx
	sbb	ecx, ecx
	inc	ecx
	mov	BYTE PTR _shading, cl
$L443:
; Line 495
	mov	edx, DWORD PTR _joy$[ebp+3]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L444
	mov	eax, DWORD PTR _player_battery
	cmp	eax, DWORD PTR _player_weapon+4
	jb	SHORT $L444
	cmp	DWORD PTR _firing_cooldown, 0
	jne	SHORT $L444
; Line 496
	mov	ecx, DWORD PTR _player_battery
	sub	ecx, DWORD PTR _player_weapon+4
	mov	DWORD PTR _player_battery, ecx
; Line 497
	mov	edx, DWORD PTR _player_weapon
	mov	DWORD PTR _firing_cooldown, edx
; Line 498
	call	_fire_laser
; Line 500
	jmp	SHORT $L448
$L444:
; Line 501
	mov	BYTE PTR _firing, 0
; Line 502
	mov	eax, DWORD PTR _player_battery
	cmp	eax, DWORD PTR _player_fighter+20
	jae	SHORT $L447
; Line 503
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 15					; 0000000fH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L447
	mov	edx, DWORD PTR _player_battery
	add	edx, 1
	mov	DWORD PTR _player_battery, edx
$L447:
; Line 505
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	SHORT $L448
; Line 506
	mov	eax, DWORD PTR _firing_cooldown
	sub	eax, 1
	mov	DWORD PTR _firing_cooldown, eax
$L448:
; Line 511
	mov	ecx, DWORD PTR _joy$[ebp+5]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L449
	xor	edx, edx
	mov	dl, BYTE PTR _boost_overheating
	test	edx, edx
	jne	SHORT $L449
; Line 512
	mov	eax, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, eax
; Line 513
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 5
	idiv	ecx
	test	edx, edx
	jne	SHORT $L450
	mov	edx, DWORD PTR _player_boost
	sub	edx, 1
	mov	DWORD PTR _player_boost, edx
$L450:
; Line 515
	jmp	$L458
$L449:
	mov	eax, DWORD PTR _joy$[ebp+6]
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L452
	xor	ecx, ecx
	mov	cl, BYTE PTR _boost_overheating
	test	ecx, ecx
	jne	SHORT $L452
; Line 516
	mov	DWORD PTR _velocity+8, 0
; Line 517
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 5
	idiv	ecx
	test	edx, edx
	jne	SHORT $L453
	mov	edx, DWORD PTR _player_boost
	sub	edx, 1
	mov	DWORD PTR _player_boost, edx
$L453:
; Line 519
	jmp	SHORT $L458
$L452:
; Line 520
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L455
; Line 521
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 523
	jmp	SHORT $L456
$L455:
; Line 524
	mov	DWORD PTR _velocity+8, 0
$L456:
; Line 526
	mov	ecx, DWORD PTR _player_boost
	cmp	ecx, DWORD PTR _player_fighter+16
	jae	SHORT $L458
; Line 527
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 15					; 0000000fH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L458
	mov	edx, DWORD PTR _player_boost
	add	edx, 1
	mov	DWORD PTR _player_boost, edx
$L458:
; Line 533
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	je	SHORT $L459
; Line 534
	call	_net_syncstate
$L459:
; Line 537
	call	_run_entity_scripts
; Line 540
	cmp	DWORD PTR _player_boost, 0
	jne	SHORT $L460
; Line 541
	mov	BYTE PTR _boost_overheating, 1
$L460:
; Line 543
	mov	ecx, DWORD PTR _player_fighter+16
	shr	ecx, 1
	cmp	DWORD PTR _player_boost, ecx
	jb	SHORT $L461
; Line 544
	mov	BYTE PTR _boost_overheating, 0
$L461:
; Line 548
	mov	edx, DWORD PTR _frames
	add	edx, 1
	mov	DWORD PTR _frames, edx
; Line 549
	mov	esp, ebp
	pop	ebp
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR
; Line 551
	push	ebp
	mov	ebp, esp
; Line 552
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 553
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 554
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 555
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 556
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 557
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 558
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 559
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 560
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 561
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 562
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 563
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 564
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 565
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 566
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 567
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 568
	pop	ebp
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
_TEXT	SEGMENT
_i$ = -8
_c$ = -4
_count_entities PROC NEAR
; Line 571
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 573
	mov	DWORD PTR _c$[ebp], 0
; Line 575
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L469
$L470:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L469:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	SHORT $L471
; Line 576
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[ecx*4], 0
	je	SHORT $L472
	mov	edx, DWORD PTR _c$[ebp]
	add	edx, 1
	mov	DWORD PTR _c$[ebp], edx
$L472:
; Line 577
	jmp	SHORT $L470
$L471:
; Line 579
	mov	eax, DWORD PTR _c$[ebp]
; Line 580
	mov	esp, ebp
	pop	ebp
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
; Line 583
	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
; Line 587
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG477
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 588
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:$SG479
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 589
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _num$[ebp]
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 591
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:$SG480
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 592
	push	2500					; 000009c4H
	xor	edx, edx
	mov	dx, WORD PTR _SL_TRIANGLE_INDEX
	push	edx
	push	OFFSET FLAT:$SG481
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 593
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	15					; 0000000fH
	lea	ecx, DWORD PTR _num$[ebp]
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 595
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:$SG482
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 596
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	SHORT $L483
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:$SG484
	lea	edx, DWORD PTR _num$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
$L483:
; Line 597
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
; Line 600
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR [ecx+12]
	sar	edx, 16					; 00000010H
	push	edx
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR [eax+8]
	sar	ecx, 16					; 00000010H
	push	ecx
	mov	edx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [edx+4]
	sar	eax, 16					; 00000010H
	push	eax
	push	OFFSET FLAT:$SG485
	lea	ecx, DWORD PTR _num$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 601
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	0
	push	240					; 000000f0H
	lea	edx, DWORD PTR _num$[ebp]
	push	edx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 603
	push	2500					; 000009c4H
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	push	eax
	push	OFFSET FLAT:$SG486
	lea	ecx, DWORD PTR _num$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 604
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	7
	push	240					; 000000f0H
	lea	edx, DWORD PTR _num$[ebp]
	push	edx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 605
	mov	esp, ebp
	pop	ebp
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
; Line 607
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
; Line 612
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+96]
	imul	eax, 21					; 00000015H
	cdq
	mov	ecx, 5
	idiv	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 613
	mov	edx, DWORD PTR _barcycle
	sar	edx, 3
	add	edx, 8
	mov	DWORD PTR _i$[ebp], edx
; Line 614
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L497
$L498:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L497:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L499
; Line 615
	mov	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR _barcolors[ecx]
	mov	DWORD PTR _c$[ebp], edx
; Line 616
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jle	SHORT $L500
	jmp	$L499
$L500:
; Line 617
	mov	DWORD PTR _pos1$[ebp], 24		; 00000018H
; Line 618
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], ecx
; Line 619
	mov	DWORD PTR _pos3$[ebp], 8
; Line 620
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 8
	mov	DWORD PTR _pos4$[ebp], edx
; Line 621
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	SHORT $L501
; Line 623
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 8
	sub	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _pos3$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _pos3$[ebp], eax
; Line 624
	mov	ecx, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], ecx
$L501:
; Line 626
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L502
; Line 627
	mov	edx, 16					; 00000010H
	sub	edx, DWORD PTR _i$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _pos1$[ebp]
	sub	eax, edx
	mov	DWORD PTR _pos1$[ebp], eax
; Line 628
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
$L502:
; Line 630
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pos4$[ebp]
	push	edx
	mov	eax, DWORD PTR _pos3$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pos2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pos1$[ebp]
	push	edx
	call	_drawline
	add	esp, 20					; 00000014H
; Line 631
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 632
	jmp	$L498
$L499:
; Line 633
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 634
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 635
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 636
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 637
	push	255					; 000000ffH
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	push	24					; 00000018H
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 638
	mov	esp, ebp
	pop	ebp
	ret	0
_draw_HPbar ENDP
_TEXT	ENDS
PUBLIC	_draw_crosshair
EXTRN	_bitset_pixel:NEAR
_TEXT	SEGMENT
_i$ = -4
_draw_crosshair PROC NEAR
; Line 640
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 642
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L507
$L508:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L507:
	cmp	DWORD PTR _i$[ebp], 7
	jge	$L509
; Line 645
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 150				; 00000096H
	push	ecx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 646
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	edx, 170				; 000000aaH
	sub	edx, DWORD PTR _i$[ebp]
	push	edx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 647
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 648
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	ecx, 170				; 000000aaH
	sub	ecx, DWORD PTR _i$[ebp]
	push	ecx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 649
	push	175					; 000000afH
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 90					; 0000005aH
	push	edx
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 650
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 651
	push	175					; 000000afH
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 90					; 0000005aH
	push	ecx
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 652
	push	175					; 000000afH
	mov	edx, 110				; 0000006eH
	sub	edx, DWORD PTR _i$[ebp]
	push	edx
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 653
	jmp	$L508
$L509:
; Line 655
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 656
	mov	esp, ebp
	pop	ebp
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
; Line 659
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
; Line 664
	mov	eax, DWORD PTR _player_boost
	imul	eax, 21					; 00000015H
	xor	edx, edx
	mov	ecx, 5
	div	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 665
	mov	edx, DWORD PTR _barcycle
	sar	edx, 3
	add	edx, 8
	mov	DWORD PTR _i$[ebp], edx
; Line 666
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L521
$L522:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L521:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L523
; Line 667
	xor	ecx, ecx
	mov	cl, BYTE PTR _boost_overheating
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 64					; 00000040H
	add	ecx, 159				; 0000009fH
	mov	DWORD PTR _c$[ebp], ecx
; Line 668
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$[ebp]
	jle	SHORT $L524
	jmp	$L523
$L524:
; Line 669
	mov	DWORD PTR _pos1$[ebp], 312		; 00000138H
; Line 670
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 671
	mov	DWORD PTR _pos3$[ebp], 296		; 00000128H
; Line 672
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 8
	mov	DWORD PTR _pos4$[ebp], ecx
; Line 673
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 8
	cmp	edx, DWORD PTR _k$[ebp]
	jle	SHORT $L525
; Line 675
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	mov	ecx, DWORD PTR _pos3$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _pos3$[ebp], edx
; Line 676
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
$L525:
; Line 678
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L526
; Line 679
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _pos1$[ebp]
	sub	edx, ecx
	mov	DWORD PTR _pos1$[ebp], edx
; Line 680
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
$L526:
; Line 682
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pos4$[ebp]
	push	ecx
	mov	edx, DWORD PTR _pos3$[ebp]
	push	edx
	mov	eax, DWORD PTR _pos2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _pos1$[ebp]
	push	ecx
	call	_drawline
	add	esp, 20					; 00000014H
; Line 683
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 8
	mov	DWORD PTR _i$[ebp], edx
; Line 684
	jmp	$L522
$L523:
; Line 685
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 686
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 687
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 688
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 689
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	312					; 00000138H
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 690
	mov	esp, ebp
	pop	ebp
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
; Line 692
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
; Line 697
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L537
$L538:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L537:
	cmp	DWORD PTR _i$[ebp], 60			; 0000003cH
	jge	$L539
; Line 698
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L540
$L541:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L540:
	cmp	DWORD PTR _j$[ebp], 60			; 0000003cH
	jge	SHORT $L542
; Line 699
	mov	DWORD PTR _c$[ebp], 0
; Line 701
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L544
	cmp	DWORD PTR _i$[ebp], 59			; 0000003bH
	je	SHORT $L544
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L544
	cmp	DWORD PTR _j$[ebp], 59			; 0000003bH
	jne	SHORT $L543
$L544:
	mov	DWORD PTR _c$[ebp], 255			; 000000ffH
$L543:
; Line 702
	cmp	DWORD PTR _c$[ebp], 0
	jne	SHORT $L545
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	and	edx, -2147483647			; 80000001H
	jns	SHORT $L632
	dec	edx
	or	edx, -2					; fffffffeH
	inc	edx
$L632:
	test	edx, edx
	je	SHORT $L545
	jmp	SHORT $L541
$L545:
; Line 703
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 10					; 0000000aH
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 130				; 00000082H
	push	edx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 704
	jmp	SHORT $L541
$L542:
; Line 705
	jmp	$L538
$L539:
; Line 708
	mov	DWORD PTR _j$[ebp], -1
	jmp	SHORT $L547
$L548:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L547:
	cmp	DWORD PTR _j$[ebp], 2
	jge	SHORT $L549
; Line 709
	mov	DWORD PTR _k$[ebp], -1
	jmp	SHORT $L550
$L551:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L550:
	cmp	DWORD PTR _k$[ebp], 2
	jge	SHORT $L552
; Line 710
	push	239					; 000000efH
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 711
	jmp	SHORT $L551
$L552:
; Line 712
	jmp	SHORT $L548
$L549:
; Line 714
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 717
	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L553
$L554:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L553:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L555
; Line 718
	mov	edx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[edx*4], 0
	je	$L571
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 2
	test	eax, eax
	je	$L571
; Line 719
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	add	edx, 4
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _vector_pos$[ebp], eax
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR _vector_pos$[ebp+4], ecx
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR _vector_pos$[ebp+8], edx
; Line 720
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 4
	push	ecx
	call	_vec3_subtract
	add	esp, 8
; Line 721
	lea	edx, DWORD PTR _screen_coords$[ebp]
	push	edx
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 723
	mov	ecx, DWORD PTR _screen_coords$[ebp]
	sar	ecx, 17					; 00000011H
	mov	DWORD PTR _pos1$[ebp], ecx
; Line 724
	mov	edx, DWORD PTR _screen_coords$[ebp+8]
	sar	edx, 17					; 00000011H
	mov	DWORD PTR _pos2$[ebp], edx
; Line 726
	cmp	DWORD PTR _pos1$[ebp], 30		; 0000001eH
	jle	SHORT $L557
	mov	DWORD PTR _pos1$[ebp], 30		; 0000001eH
$L557:
; Line 727
	cmp	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
	jge	SHORT $L558
	mov	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
$L558:
; Line 728
	cmp	DWORD PTR _pos2$[ebp], 30		; 0000001eH
	jle	SHORT $L559
	mov	DWORD PTR _pos2$[ebp], 30		; 0000001eH
$L559:
; Line 729
	cmp	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
	jge	SHORT $L560
	mov	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
$L560:
; Line 731
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR [ecx]
	xor	eax, eax
	mov	al, BYTE PTR [edx+37]
	test	eax, eax
	je	$L561
; Line 732
	cmp	DWORD PTR _screen_coords$[ebp+4], 0
	jl	SHORT $L562
; Line 733
	mov	DWORD PTR _c$[ebp], 175			; 000000afH
; Line 735
	jmp	SHORT $L563
$L562:
; Line 736
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
$L563:
; Line 739
	mov	DWORD PTR _j$[ebp], -1
	jmp	SHORT $L564
$L565:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L564:
	cmp	DWORD PTR _j$[ebp], 2
	jge	SHORT $L566
; Line 740
	mov	DWORD PTR _k$[ebp], -1
	jmp	SHORT $L567
$L568:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L567:
	cmp	DWORD PTR _k$[ebp], 2
	jge	SHORT $L569
; Line 741
	mov	eax, DWORD PTR _k$[ebp]
	mov	ecx, DWORD PTR _pos2$[ebp]
	lea	edx, DWORD PTR [ecx+eax+40]
	test	edx, edx
	jge	SHORT $L570
	jmp	SHORT $L568
$L570:
; Line 742
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _pos2$[ebp]
	lea	eax, DWORD PTR [edx+ecx+40]
	push	eax
	mov	ecx, DWORD PTR _j$[ebp]
	mov	edx, DWORD PTR _pos1$[ebp]
	lea	eax, DWORD PTR [edx+ecx+160]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 743
	jmp	SHORT $L568
$L569:
; Line 744
	jmp	SHORT $L565
$L566:
; Line 746
	jmp	SHORT $L571
$L561:
; Line 747
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	eax, DWORD PTR [edx]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+36]
	push	ecx
	mov	edx, DWORD PTR _pos2$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _pos1$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L571:
; Line 750
	jmp	$L554
$L555:
; Line 751
	mov	esp, ebp
	pop	ebp
	ret	0
_draw_radar ENDP
_TEXT	ENDS
PUBLIC	_draw_battery
_TEXT	SEGMENT
_offset$ = -4
_i$ = -12
_intensity$ = -8
_draw_battery PROC NEAR
; Line 753
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 754
	mov	DWORD PTR _offset$[ebp], 140		; 0000008cH
; Line 756
	mov	eax, DWORD PTR _player_battery
	imul	eax, 6
	shr	eax, 4
	mov	DWORD PTR _intensity$[ebp], eax
; Line 758
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L577
$L578:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L577:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	SHORT $L579
; Line 759
	mov	edx, DWORD PTR _player_battery
	cmp	edx, DWORD PTR _i$[ebp]
	jb	SHORT $L580
; Line 760
	mov	eax, DWORD PTR _intensity$[ebp]
	or	al, -96					; ffffffa0H
	push	eax
	push	170					; 000000aaH
	mov	ecx, DWORD PTR _offset$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	push	ecx
	push	160					; 000000a0H
	mov	edx, DWORD PTR _offset$[ebp]
	add	edx, DWORD PTR _i$[ebp]
	push	edx
	call	_drawline
	add	esp, 20					; 00000014H
$L580:
; Line 762
	jmp	SHORT $L578
$L579:
; Line 784
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 785
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 786
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 787
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 788
	mov	esp, ebp
	pop	ebp
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
; Line 791
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
; Line 795
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L583
; Line 796
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	mov	ax, WORD PTR _SL_CENTER_X
	add	ax, dx
	mov	WORD PTR _SL_CENTER_X, ax
; Line 797
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	mov	ax, WORD PTR _SL_CENTER_Y
	add	ax, dx
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 799
	jmp	SHORT $L584
$L583:
; Line 800
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 801
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
$L584:
; Line 805
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 4
	push	ecx
	call	_camera_translate
	add	esp, 4
; Line 806
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	mov	edx, DWORD PTR _StarblazerEntities
	add	edx, 16					; 00000010H
	push	edx
	call	_quat_tomat
	add	esp, 8
; Line 809
	push	500					; 000001f4H
	push	OFFSET FLAT:_title_stars
	mov	al, BYTE PTR _shading
	push	eax
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 16					; 00000010H
	sub	esp, 16					; 00000010H
	mov	edx, esp
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], eax
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+12], ecx
	mov	edx, DWORD PTR _StarblazerEntities
	add	edx, 4
	push	edx
	call	_draw_scene
	add	esp, 32					; 00000020H
; Line 812
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L585
	call	_draw_crosshair
$L585:
; Line 815
	call	_draw_boost_bar
; Line 818
	call	_draw_HPbar
; Line 821
	call	_draw_radar
; Line 824
	call	_draw_battery
; Line 828
	mov	eax, DWORD PTR _player_fighter
	shr	eax, 1
	mov	ecx, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [ecx+96], eax
	jae	SHORT $L586
; Line 829
	call	_blazer2_screencrack
$L586:
; Line 832
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L587
; Line 833
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	90					; 0000005aH
	push	110					; 0000006eH
	push	OFFSET FLAT:$SG588
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 834
	mov	eax, DWORD PTR _frames_respawning
	xor	edx, edx
	mov	ecx, 70					; 00000046H
	div	ecx
	push	eax
	push	OFFSET FLAT:$SG589
	lea	edx, DWORD PTR _text$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 835
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
$L587:
; Line 839
	call	_draw_debug
; Line 841
	mov	ecx, DWORD PTR _barcycle
	add	ecx, 2
	mov	DWORD PTR _barcycle, ecx
; Line 842
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	SHORT $L590
	mov	DWORD PTR _barcycle, 0
$L590:
; Line 845
	mov	edx, DWORD PTR _StarblazerEntities
	add	edx, 16					; 00000010H
	sub	esp, 16					; 00000010H
	mov	eax, esp
	mov	ecx, DWORD PTR [edx]
	mov	DWORD PTR [eax], ecx
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR [eax+4], ecx
	mov	ecx, DWORD PTR [edx+8]
	mov	DWORD PTR [eax+8], ecx
	mov	edx, DWORD PTR [edx+12]
	mov	DWORD PTR [eax+12], edx
	call	_set_hypercraft_orientation
	add	esp, 16					; 00000010H
; Line 846
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 8
; Line 847
	mov	esp, ebp
	pop	ebp
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
