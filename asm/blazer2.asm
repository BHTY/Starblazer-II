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
COMM	_ENEMY_LASER:BYTE:010H
COMM	_SND_EXPLODE:DWORD
COMM	_SND_HIT:DWORD
COMM	_SND_LASER:DWORD
COMM	_SND_LASER_ENEMY:DWORD
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
; Line 56
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 60
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L310
$L311:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L310:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L312
; Line 61
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L585
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L585:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L586
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L586:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L587
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L587:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L588
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L588:
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	lea	eax, DWORD PTR [edx+eax-128]
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L589
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L589:
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	lea	eax, DWORD PTR [edx+eax-128]
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L590
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L590:
	mov	ecx, DWORD PTR _pos$[ebp]
	mov	edx, DWORD PTR [ecx]
	lea	eax, DWORD PTR [edx+eax-128]
	push	eax
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
	push	ecx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 62
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L591
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L591:
	sub	eax, 128				; 00000080H
	imul	eax, 3
	mov	edx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [ecx+36], eax
; Line 63
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L592
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L592:
	sub	eax, 128				; 00000080H
	imul	eax, 3
	mov	edx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [ecx+40], eax
; Line 64
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L593
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L593:
	sub	eax, 128				; 00000080H
	imul	eax, 3
	mov	edx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [ecx+44], eax
; Line 65
	jmp	$L311
$L312:
; Line 67
	mov	edx, DWORD PTR _SND_EXPLODE
	push	edx
	call	_play_soundfx
	add	esp, 4
; Line 68
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
; Line 70
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 71
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 4
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _pos$[ebp], edx
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _pos$[ebp+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR _pos$[ebp+8], ecx
; Line 72
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_free
	add	esp, 4
; Line 73
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
; Line 74
	lea	edx, DWORD PTR _pos$[ebp]
	push	edx
	call	_explode_at
	add	esp, 4
; Line 75
	mov	esp, ebp
	pop	ebp
	ret	0
_explode_entity ENDP
_TEXT	ENDS
PUBLIC	_print_vec
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+1
$SG323	DB	'(%d, %d, %d)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR
; Line 77
	push	ebp
	mov	ebp, esp
; Line 78
	mov	eax, DWORD PTR _vec$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _vec$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	push	OFFSET FLAT:$SG323
	call	_printf
	add	esp, 16					; 00000010H
; Line 79
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
; Line 81
	push	ebp
	mov	ebp, esp
; Line 82
	push	OFFSET FLAT:_rot_mat
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 83
	push	OFFSET FLAT:_pos_delta
	mov	ecx, DWORD PTR _vel$[ebp]
	push	ecx
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 84
	mov	edx, DWORD PTR _ent$[ebp]
	add	edx, 4
	push	edx
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 85
	pop	ebp
	ret	0
_step_entity ENDP
_TEXT	ENDS
PUBLIC	_draw_stars
EXTRN	_plotpoint_3d:NEAR
_TEXT	SEGMENT
_i$ = -4
_draw_stars PROC NEAR
; Line 87
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 89
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L330
$L331:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L330:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	SHORT $L332
; Line 90
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
; Line 91
	jmp	SHORT $L331
$L332:
; Line 92
	mov	esp, ebp
	pop	ebp
	ret	0
_draw_stars ENDP
_TEXT	ENDS
PUBLIC	_fire_laser
_TEXT	SEGMENT
_id$ = -4
_fire_laser PROC NEAR
; Line 94
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 95
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
; Line 96
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [edx+32], 280			; 00000118H
; Line 97
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR _player_weapon+8
	mov	DWORD PTR [ecx+92], edx
; Line 98
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
; Line 99
	mov	BYTE PTR _firing, 1
; Line 100
	mov	ecx, DWORD PTR _SND_LASER
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 101
	mov	esp, ebp
	pop	ebp
	ret	0
_fire_laser ENDP
_TEXT	ENDS
PUBLIC	_cam_script
_TEXT	SEGMENT
_ptr$ = 8
_cam_script PROC NEAR
; Line 103
	push	ebp
	mov	ebp, esp
; Line 104
	push	OFFSET FLAT:_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 105
	pop	ebp
	ret	0
_cam_script ENDP
_TEXT	ENDS
PUBLIC	_init_star
_TEXT	SEGMENT
_star$ = 8
_init_star PROC NEAR
; Line 107
	push	ebp
	mov	ebp, esp
; Line 108
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _star$[ebp]
	mov	DWORD PTR [eax], edx
; Line 109
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _star$[ebp]
	mov	DWORD PTR [eax+4], edx
; Line 110
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _star$[ebp]
	mov	DWORD PTR [eax+8], edx
; Line 111
	pop	ebp
	ret	0
_init_star ENDP
_TEXT	ENDS
PUBLIC	_spawn_asteroid
_TEXT	SEGMENT
_pos$ = -16
_id$ = -4
_spawn_asteroid PROC NEAR
; Line 113
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 116
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	sub	edx, 250				; 000000faH
	shl	edx, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp], edx
; Line 117
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	sub	edx, 250				; 000000faH
	shl	edx, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+4], edx
; Line 118
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	sub	edx, 250				; 000000faH
	shl	edx, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+8], edx
; Line 120
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L602
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L602:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L603
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L603:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L604
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L604:
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
; Line 122
	mov	esp, ebp
	pop	ebp
	ret	0
_spawn_asteroid ENDP
_TEXT	ENDS
PUBLIC	_ax5_script
_TEXT	SEGMENT
_ax5_script PROC NEAR
; Line 124
	push	ebp
	mov	ebp, esp
; Line 130
	pop	ebp
	ret	0
_ax5_script ENDP
_TEXT	ENDS
PUBLIC	_enemy_laser_script
EXTRN	_test_collisions:NEAR
_TEXT	SEGMENT
_ptr$ = 8
_enemy_laser_script PROC NEAR
; Line 132
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 134
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 135
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+32]
	sub	ecx, 1
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+32], ecx
; Line 138
	mov	ecx, DWORD PTR _StarblazerEntities
	push	ecx
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_test_collisions
	add	esp, 8
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L352
; Line 139
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR [ecx+96]
	sub	edx, 5
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+96], edx
; Line 140
	mov	DWORD PTR _shake_frames, 7
; Line 141
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+84]
	mov	DWORD PTR _impact_id, eax
; Line 142
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_free
	add	esp, 4
; Line 143
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 144
	jmp	SHORT $L353
$L352:
; Line 166
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+32], 0
	jne	SHORT $L353
; Line 167
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_free
	add	esp, 4
; Line 168
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [edx], 0
$L353:
; Line 170
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
; Line 172
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 175
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 176
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax+32]
	sub	ecx, 1
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [eax+32], ecx
; Line 178
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L358
$L359:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L358:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L360
; Line 179
	mov	edx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[edx*4], 0
	je	$L363
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[eax*4]
	cmp	edx, DWORD PTR [ecx]
	je	$L363
; Line 180
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 1
	test	eax, eax
	je	SHORT $L363
; Line 181
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
	je	SHORT $L363
; Line 183
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 184
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [edx+104], 7
; Line 185
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [ecx+96]
	sub	ecx, DWORD PTR [eax+92]
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [eax+96], ecx
; Line 188
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_free
	add	esp, 4
; Line 189
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 190
	jmp	SHORT $L364
$L363:
; Line 194
	jmp	$L359
$L360:
; Line 196
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+32], 0
	jne	SHORT $L364
; Line 197
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_free
	add	esp, 4
; Line 198
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [edx], 0
$L364:
; Line 200
	mov	esp, ebp
	pop	ebp
	ret	0
_laser_script ENDP
_TEXT	ENDS
PUBLIC	_asteroid_script
_TEXT	SEGMENT
_ptr$ = 8
_asteroid_script PROC NEAR
; Line 202
	push	ebp
	mov	ebp, esp
; Line 203
	mov	eax, DWORD PTR _StarblazerEntities
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_test_collisions
	add	esp, 8
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L368
; Line 204
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR [eax+96]
	sub	ecx, 5
	mov	edx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [edx+96], ecx
; Line 205
	mov	DWORD PTR _shake_frames, 7
; Line 206
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 207
	jmp	SHORT $L369
$L368:
; Line 210
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	cmp	DWORD PTR [edx+96], 0
	jg	SHORT $L369
; Line 211
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
$L369:
; Line 213
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
; Line 215
	push	ebp
	mov	ebp, esp
; Line 216
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
; Line 217
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
; Line 218
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
; Line 219
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 16					; 00000010H
	push	ecx
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
; Line 220
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
; Line 221
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, 16					; 00000010H
	push	edx
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
; Line 223
	call	_rand
	cdq
	mov	ecx, 45					; 0000002dH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L373
; Line 225
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_free
	add	esp, 4
; Line 226
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [ecx], 0
$L373:
; Line 228
	pop	ebp
	ret	0
_debris_script ENDP
_TEXT	ENDS
PUBLIC	_set_attributes
EXTRN	_create_hitbox:NEAR
EXTRN	_load_model:NEAR
_DATA	SEGMENT
	ORG $+2
$SG376	DB	'assets/boltem.obj', 00H
	ORG $+2
$SG377	DB	'assets/shard.obj', 00H
	ORG $+3
$SG378	DB	'assets/asterold.obj', 00H
$SG379	DB	'assets/hyper.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_set_attributes PROC NEAR
; Line 230
	push	ebp
	mov	ebp, esp
; Line 231
	push	OFFSET FLAT:$SG376
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ENEMY_LASER+12, eax
; Line 232
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+12], OFFSET FLAT:_enemy_laser_script
; Line 233
	mov	ecx, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [ecx+36], 239			; 000000efH
; Line 234
	mov	edx, DWORD PTR _ENEMY_LASER+12
	mov	BYTE PTR [edx+37], 0
; Line 235
	mov	eax, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [eax+32], 2
; Line 236
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	ecx, DWORD PTR _ENEMY_LASER+12
	push	ecx
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 237
	mov	DWORD PTR _ENEMY_LASER+8, 8
; Line 239
	mov	edx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [edx+12], OFFSET FLAT:_laser_script
; Line 240
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+32], 2
; Line 241
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [ecx+36], 191			; 000000bfH
; Line 242
	mov	edx, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [edx+37], 0
; Line 243
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 245
	mov	DWORD PTR _player_fighter, 40		; 00000028H
; Line 246
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 247
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 248
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 249
	mov	DWORD PTR _player_fighter+16, 40	; 00000028H
; Line 250
	mov	DWORD PTR _player_fighter+20, 40	; 00000028H
; Line 252
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 253
	mov	DWORD PTR _player_weapon+4, 9
; Line 254
	mov	DWORD PTR _player_weapon+8, 8
; Line 255
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _player_weapon+12, ecx
; Line 257
	mov	DWORD PTR _laser_velocity, 0
; Line 258
	mov	DWORD PTR _laser_velocity+4, 0
; Line 259
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 261
	push	OFFSET FLAT:$SG377
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 262
	mov	edx, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [edx+12], OFFSET FLAT:_debris_script
; Line 263
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+32], 2
; Line 264
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [ecx+36], 127			; 0000007fH
; Line 265
	mov	edx, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [edx+37], 0
; Line 266
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 268
	push	OFFSET FLAT:$SG378
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 269
	mov	ecx, DWORD PTR _ASTEROID
	mov	DWORD PTR [ecx+12], OFFSET FLAT:_asteroid_script
; Line 270
	mov	edx, DWORD PTR _ASTEROID
	mov	DWORD PTR [edx+32], 3
; Line 271
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 272
	mov	ecx, DWORD PTR _ASTEROID
	mov	BYTE PTR [ecx+36], 207			; 000000cfH
; Line 273
	mov	edx, DWORD PTR _ASTEROID
	mov	BYTE PTR [edx+37], 0
; Line 274
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 276
	push	OFFSET FLAT:$SG379
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _AX5, eax
; Line 277
	mov	ecx, DWORD PTR _AX5
	mov	DWORD PTR [ecx+12], OFFSET FLAT:_ax5_script
; Line 278
	mov	edx, DWORD PTR _AX5
	mov	DWORD PTR [edx+32], 3
; Line 279
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+28], 0
; Line 280
	mov	ecx, DWORD PTR _AX5
	mov	BYTE PTR [ecx+37], 1
; Line 281
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	mov	edx, DWORD PTR _AX5
	push	edx
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 282
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
EXTRN	_stop_music:NEAR
EXTRN	_play_music:NEAR
EXTRN	_load_soundfx:NEAR
_DATA	SEGMENT
	ORG $+3
$SG385	DB	'sfx/net.wav', 00H
$SG387	DB	'sfx/explode.wav', 00H
$SG388	DB	'sfx/laser.wav', 00H
	ORG $+2
$SG389	DB	'sfx/laser.wav', 00H
	ORG $+2
$SG390	DB	'sfx/hit.wav', 00H
$SG391	DB	'assets/bolt.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_blazer2_init PROC NEAR
; Line 291
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 294
	mov	DWORD PTR _frames, 0
; Line 297
	call	_stop_music
; Line 298
	push	OFFSET FLAT:$SG385
	call	_play_music
	add	esp, 4
; Line 299
	push	0
	push	1
	push	OFFSET FLAT:$SG387
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_EXPLODE, eax
; Line 300
	push	0
	push	2
	push	OFFSET FLAT:$SG388
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER, eax
; Line 301
	push	0
	push	3
	push	OFFSET FLAT:$SG389
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER_ENEMY, eax
; Line 302
	push	0
	push	1
	push	OFFSET FLAT:$SG390
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_HIT, eax
; Line 305
	push	OFFSET FLAT:$SG391
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 306
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 307
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 309
	call	_set_attributes
; Line 311
	mov	DWORD PTR _cam_template, 0
; Line 312
	mov	DWORD PTR _cam_template+4, 0
; Line 313
	mov	WORD PTR _cam_template+8, 0
; Line 314
	mov	WORD PTR _cam_template+10, 0
; Line 315
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 316
	mov	eax, DWORD PTR _player_fighter
	mov	DWORD PTR _cam_template+28, eax
; Line 317
	mov	DWORD PTR _cam_template+32, 2
; Line 319
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 322
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L392
$L393:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L392:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jae	SHORT $L394
; Line 323
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	add	edx, OFFSET FLAT:_title_stars
	push	edx
	call	_init_star
	add	esp, 4
; Line 324
	jmp	SHORT $L393
$L394:
; Line 327
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L395
$L396:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L395:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	SHORT $L397
; Line 328
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	push	edx
	call	_free
	add	esp, 4
; Line 329
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 330
	jmp	SHORT $L396
$L397:
; Line 333
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
; Line 336
	mov	edx, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_boost, edx
; Line 337
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 342
	xor	ecx, ecx
	mov	cl, BYTE PTR _multiplayer
	test	ecx, ecx
	jne	SHORT $L401
; Line 343
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L399
$L400:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L399:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jae	SHORT $L401
; Line 344
	call	_spawn_asteroid
; Line 345
	jmp	SHORT $L400
$L401:
; Line 349
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 350
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 352
	mov	DWORD PTR _velocity, 0
; Line 353
	mov	DWORD PTR _velocity+4, 0
; Line 354
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 356
	call	_init_hypercraft
; Line 357
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
; Line 359
	push	ebp
	mov	ebp, esp
; Line 360
	mov	eax, DWORD PTR _angle$[ebp]
	and	eax, 255				; 000000ffH
	movsx	ecx, BYTE PTR _joy_amount$[ebp]
	imul	eax, ecx
	sar	eax, 8
; Line 361
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
; Line 363
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 367
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 369
	push	74					; 0000004aH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 370
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+7], 0
; Line 371
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+6], al
; Line 372
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+5], al
; Line 375
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L408
; Line 376
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 127			; 0000007fH
; Line 378
	jmp	SHORT $L411
$L408:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L410
; Line 379
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx], -127			; ffffff81H
; Line 381
	jmp	SHORT $L411
$L410:
; Line 382
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx], 0
$L411:
; Line 386
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L412
; Line 387
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 127			; 0000007fH
; Line 389
	jmp	SHORT $L415
$L412:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L414
; Line 390
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+1], -127			; ffffff81H
; Line 392
	jmp	SHORT $L415
$L414:
; Line 393
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+1], 0
$L415:
; Line 397
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L416
; Line 398
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], -127			; ffffff81H
; Line 400
	jmp	SHORT $L419
$L416:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L418
; Line 401
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+2], 127			; 0000007fH
; Line 403
	jmp	SHORT $L419
$L418:
; Line 404
	mov	edx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [edx+2], 0
$L419:
; Line 414
	mov	esp, ebp
	pop	ebp
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR
; Line 432
	push	ebp
	mov	ebp, esp
; Line 433
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	mov	DWORD PTR [eax+96], ecx
; Line 434
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+4], edx
; Line 435
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+8], edx
; Line 436
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [eax+12], edx
; Line 437
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
; Line 439
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 442
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 444
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L427
; Line 445
	mov	BYTE PTR _BG_COLOR, 0
$L427:
; Line 448
	mov	ecx, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [ecx+96], 0
	jg	SHORT $L429
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L429
; Line 449
	mov	BYTE PTR _dying, 1
; Line 450
	mov	edx, DWORD PTR _timeout
	mov	DWORD PTR _frames_respawning, edx
; Line 451
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
; Line 453
	cmp	DWORD PTR _timeout, 0
	jne	SHORT $L429
; Line 454
	call	_respawn_player
$L429:
; Line 458
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L432
; Line 459
	push	8
	push	0
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 460
	mov	ecx, DWORD PTR _frames_respawning
	sub	ecx, 1
	mov	DWORD PTR _frames_respawning, ecx
; Line 462
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L432
; Line 463
	call	_respawn_player
$L432:
; Line 467
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L433
; Line 468
	mov	edx, DWORD PTR _shake_frames
	sub	edx, 1
	mov	DWORD PTR _shake_frames, edx
$L433:
; Line 472
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	mov	cl, BYTE PTR _joy$[ebp]
	push	ecx
	mov	dl, BYTE PTR _player_fighter+4
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
	add	esp, 8
; Line 473
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	mov	cl, BYTE PTR _joy$[ebp+1]
	push	ecx
	mov	dl, BYTE PTR _player_fighter+4
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
	add	esp, 8
; Line 474
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	mov	cl, BYTE PTR _joy$[ebp+2]
	push	ecx
	mov	dl, BYTE PTR _player_fighter+4
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
	add	esp, 8
; Line 476
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L434
; Line 477
	xor	eax, eax
	mov	al, BYTE PTR _shading
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	BYTE PTR _shading, al
$L434:
; Line 481
	mov	ecx, DWORD PTR _joy$[ebp+3]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L435
	mov	edx, DWORD PTR _player_battery
	cmp	edx, DWORD PTR _player_weapon+4
	jb	SHORT $L435
	cmp	DWORD PTR _firing_cooldown, 0
	jne	SHORT $L435
; Line 482
	mov	eax, DWORD PTR _player_battery
	sub	eax, DWORD PTR _player_weapon+4
	mov	DWORD PTR _player_battery, eax
; Line 483
	mov	ecx, DWORD PTR _player_weapon
	mov	DWORD PTR _firing_cooldown, ecx
; Line 484
	call	_fire_laser
; Line 486
	jmp	SHORT $L439
$L435:
; Line 487
	mov	BYTE PTR _firing, 0
; Line 488
	mov	edx, DWORD PTR _player_battery
	cmp	edx, DWORD PTR _player_fighter+20
	jae	SHORT $L438
; Line 489
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 15					; 0000000fH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L438
	mov	edx, DWORD PTR _player_battery
	add	edx, 1
	mov	DWORD PTR _player_battery, edx
$L438:
; Line 491
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	SHORT $L439
; Line 492
	mov	eax, DWORD PTR _firing_cooldown
	sub	eax, 1
	mov	DWORD PTR _firing_cooldown, eax
$L439:
; Line 497
	mov	ecx, DWORD PTR _joy$[ebp+5]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	SHORT $L440
	xor	edx, edx
	mov	dl, BYTE PTR _boost_overheating
	test	edx, edx
	jne	SHORT $L440
; Line 498
	mov	eax, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, eax
; Line 499
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 5
	idiv	ecx
	test	edx, edx
	jne	SHORT $L441
	mov	edx, DWORD PTR _player_boost
	sub	edx, 1
	mov	DWORD PTR _player_boost, edx
$L441:
; Line 501
	jmp	$L449
$L440:
	mov	eax, DWORD PTR _joy$[ebp+6]
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	SHORT $L443
	xor	ecx, ecx
	mov	cl, BYTE PTR _boost_overheating
	test	ecx, ecx
	jne	SHORT $L443
; Line 502
	mov	DWORD PTR _velocity+8, 0
; Line 503
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 5
	idiv	ecx
	test	edx, edx
	jne	SHORT $L444
	mov	edx, DWORD PTR _player_boost
	sub	edx, 1
	mov	DWORD PTR _player_boost, edx
$L444:
; Line 505
	jmp	SHORT $L449
$L443:
; Line 506
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L446
; Line 507
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 509
	jmp	SHORT $L447
$L446:
; Line 510
	mov	DWORD PTR _velocity+8, 0
$L447:
; Line 512
	mov	ecx, DWORD PTR _player_boost
	cmp	ecx, DWORD PTR _player_fighter+16
	jae	SHORT $L449
; Line 513
	mov	eax, DWORD PTR _frames
	cdq
	mov	ecx, 15					; 0000000fH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L449
	mov	edx, DWORD PTR _player_boost
	add	edx, 1
	mov	DWORD PTR _player_boost, edx
$L449:
; Line 519
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	je	SHORT $L450
; Line 520
	call	_net_syncstate
$L450:
; Line 523
	call	_run_entity_scripts
; Line 526
	cmp	DWORD PTR _player_boost, 0
	jne	SHORT $L451
; Line 527
	mov	BYTE PTR _boost_overheating, 1
$L451:
; Line 529
	mov	ecx, DWORD PTR _player_fighter+16
	shr	ecx, 1
	cmp	DWORD PTR _player_boost, ecx
	jb	SHORT $L452
; Line 530
	mov	BYTE PTR _boost_overheating, 0
$L452:
; Line 534
	mov	edx, DWORD PTR _frames
	add	edx, 1
	mov	DWORD PTR _frames, edx
; Line 535
	mov	esp, ebp
	pop	ebp
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR
; Line 537
	push	ebp
	mov	ebp, esp
; Line 538
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 539
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 540
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 541
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 542
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 543
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 544
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 545
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 546
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 547
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 548
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 549
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 550
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 551
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 552
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 553
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 554
	pop	ebp
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
_TEXT	SEGMENT
_i$ = -8
_c$ = -4
_count_entities PROC NEAR
; Line 557
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 559
	mov	DWORD PTR _c$[ebp], 0
; Line 561
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L460
$L461:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L460:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	SHORT $L462
; Line 562
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[ecx*4], 0
	je	SHORT $L463
	mov	edx, DWORD PTR _c$[ebp]
	add	edx, 1
	mov	DWORD PTR _c$[ebp], edx
$L463:
; Line 563
	jmp	SHORT $L461
$L462:
; Line 565
	mov	eax, DWORD PTR _c$[ebp]
; Line 566
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
$SG468	DB	'ENT', 00H
$SG470	DB	'%d / %d', 00H
$SG471	DB	'TRI', 00H
$SG472	DB	'%d / %d', 00H
$SG473	DB	'FPS', 00H
$SG475	DB	'%d', 00H
	ORG $+1
$SG476	DB	'%d %d %d', 00H
	ORG $+3
$SG477	DB	'VERT %d / %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_num$ = -100
_draw_debug PROC NEAR
; Line 569
	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
; Line 573
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG468
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 574
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:$SG470
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 575
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
; Line 577
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:$SG471
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 578
	push	1500					; 000005dcH
	xor	edx, edx
	mov	dx, WORD PTR _SL_TRIANGLE_INDEX
	push	edx
	push	OFFSET FLAT:$SG472
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 579
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
; Line 581
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:$SG473
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 582
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	SHORT $L474
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:$SG475
	lea	edx, DWORD PTR _num$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
$L474:
; Line 583
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
; Line 586
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
	push	OFFSET FLAT:$SG476
	lea	ecx, DWORD PTR _num$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 587
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
; Line 589
	push	2500					; 000009c4H
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	push	eax
	push	OFFSET FLAT:$SG477
	lea	ecx, DWORD PTR _num$[ebp]
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 590
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
; Line 591
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
; Line 593
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
; Line 598
	mov	eax, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+96]
	imul	eax, 21					; 00000015H
	cdq
	mov	ecx, 5
	idiv	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 599
	mov	edx, DWORD PTR _barcycle
	sar	edx, 3
	add	edx, 8
	mov	DWORD PTR _i$[ebp], edx
; Line 600
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L488
$L489:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L488:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L490
; Line 601
	mov	ecx, DWORD PTR _j$[ebp]
	movsx	edx, BYTE PTR _barcolors[ecx]
	mov	DWORD PTR _c$[ebp], edx
; Line 602
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _k$[ebp]
	jle	SHORT $L491
	jmp	$L490
$L491:
; Line 603
	mov	DWORD PTR _pos1$[ebp], 24		; 00000018H
; Line 604
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], ecx
; Line 605
	mov	DWORD PTR _pos3$[ebp], 8
; Line 606
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 8
	mov	DWORD PTR _pos4$[ebp], edx
; Line 607
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	SHORT $L492
; Line 609
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 8
	sub	ecx, DWORD PTR _k$[ebp]
	mov	edx, DWORD PTR _pos3$[ebp]
	lea	eax, DWORD PTR [edx+ecx*2]
	mov	DWORD PTR _pos3$[ebp], eax
; Line 610
	mov	ecx, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], ecx
$L492:
; Line 612
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L493
; Line 613
	mov	edx, 16					; 00000010H
	sub	edx, DWORD PTR _i$[ebp]
	shl	edx, 1
	mov	eax, DWORD PTR _pos1$[ebp]
	sub	eax, edx
	mov	DWORD PTR _pos1$[ebp], eax
; Line 614
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
$L493:
; Line 616
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
; Line 617
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 618
	jmp	$L489
$L490:
; Line 619
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 620
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 621
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 622
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 623
	push	255					; 000000ffH
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	push	24					; 00000018H
	mov	edx, DWORD PTR _k$[ebp]
	push	edx
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 624
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
; Line 626
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 628
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L498
$L499:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L498:
	cmp	DWORD PTR _i$[ebp], 7
	jge	$L500
; Line 631
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 150				; 00000096H
	push	ecx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 632
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	edx, 170				; 000000aaH
	sub	edx, DWORD PTR _i$[ebp]
	push	edx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 633
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 634
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	ecx, 170				; 000000aaH
	sub	ecx, DWORD PTR _i$[ebp]
	push	ecx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 635
	push	175					; 000000afH
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 90					; 0000005aH
	push	edx
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 636
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 637
	push	175					; 000000afH
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 90					; 0000005aH
	push	ecx
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 638
	push	175					; 000000afH
	mov	edx, 110				; 0000006eH
	sub	edx, DWORD PTR _i$[ebp]
	push	edx
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 639
	jmp	$L499
$L500:
; Line 641
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 642
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
; Line 645
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
; Line 650
	mov	eax, DWORD PTR _player_boost
	imul	eax, 21					; 00000015H
	xor	edx, edx
	mov	ecx, 5
	div	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 651
	mov	edx, DWORD PTR _barcycle
	sar	edx, 3
	add	edx, 8
	mov	DWORD PTR _i$[ebp], edx
; Line 652
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L512
$L513:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L512:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L514
; Line 653
	xor	ecx, ecx
	mov	cl, BYTE PTR _boost_overheating
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 64					; 00000040H
	add	ecx, 159				; 0000009fH
	mov	DWORD PTR _c$[ebp], ecx
; Line 654
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _k$[ebp]
	jle	SHORT $L515
	jmp	$L514
$L515:
; Line 655
	mov	DWORD PTR _pos1$[ebp], 312		; 00000138H
; Line 656
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 657
	mov	DWORD PTR _pos3$[ebp], 296		; 00000128H
; Line 658
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 8
	mov	DWORD PTR _pos4$[ebp], ecx
; Line 659
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 8
	cmp	edx, DWORD PTR _k$[ebp]
	jle	SHORT $L516
; Line 661
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	mov	ecx, DWORD PTR _pos3$[ebp]
	lea	edx, DWORD PTR [ecx+eax*2]
	mov	DWORD PTR _pos3$[ebp], edx
; Line 662
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
$L516:
; Line 664
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L517
; Line 665
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 1
	mov	edx, DWORD PTR _pos1$[ebp]
	sub	edx, ecx
	mov	DWORD PTR _pos1$[ebp], edx
; Line 666
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
$L517:
; Line 668
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
; Line 669
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 8
	mov	DWORD PTR _i$[ebp], edx
; Line 670
	jmp	$L513
$L514:
; Line 671
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 672
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 673
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 674
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 675
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	312					; 00000138H
	mov	ecx, DWORD PTR _k$[ebp]
	push	ecx
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 676
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
; Line 678
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
; Line 683
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L528
$L529:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L528:
	cmp	DWORD PTR _i$[ebp], 60			; 0000003cH
	jge	$L530
; Line 684
	mov	DWORD PTR _j$[ebp], 0
	jmp	SHORT $L531
$L532:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L531:
	cmp	DWORD PTR _j$[ebp], 60			; 0000003cH
	jge	SHORT $L533
; Line 685
	mov	DWORD PTR _c$[ebp], 0
; Line 687
	cmp	DWORD PTR _i$[ebp], 0
	je	SHORT $L535
	cmp	DWORD PTR _i$[ebp], 59			; 0000003bH
	je	SHORT $L535
	cmp	DWORD PTR _j$[ebp], 0
	je	SHORT $L535
	cmp	DWORD PTR _j$[ebp], 59			; 0000003bH
	jne	SHORT $L534
$L535:
	mov	DWORD PTR _c$[ebp], 255			; 000000ffH
$L534:
; Line 688
	cmp	DWORD PTR _c$[ebp], 0
	jne	SHORT $L536
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR _j$[ebp]
	and	edx, -2147483647			; 80000001H
	jns	SHORT $L623
	dec	edx
	or	edx, -2					; fffffffeH
	inc	edx
$L623:
	test	edx, edx
	je	SHORT $L536
	jmp	SHORT $L532
$L536:
; Line 689
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
; Line 690
	jmp	SHORT $L532
$L533:
; Line 691
	jmp	$L529
$L530:
; Line 694
	mov	DWORD PTR _j$[ebp], -1
	jmp	SHORT $L538
$L539:
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 1
	mov	DWORD PTR _j$[ebp], eax
$L538:
	cmp	DWORD PTR _j$[ebp], 2
	jge	SHORT $L540
; Line 695
	mov	DWORD PTR _k$[ebp], -1
	jmp	SHORT $L541
$L542:
	mov	ecx, DWORD PTR _k$[ebp]
	add	ecx, 1
	mov	DWORD PTR _k$[ebp], ecx
$L541:
	cmp	DWORD PTR _k$[ebp], 2
	jge	SHORT $L543
; Line 696
	push	239					; 000000efH
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 40					; 00000028H
	push	edx
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 697
	jmp	SHORT $L542
$L543:
; Line 698
	jmp	SHORT $L539
$L540:
; Line 700
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 703
	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L544
$L545:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L544:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L546
; Line 704
	mov	edx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[edx*4], 0
	je	$L562
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [edx+32]
	and	eax, 2
	test	eax, eax
	je	$L562
; Line 705
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	add	edx, 4
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _vector_pos$[ebp], eax
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR _vector_pos$[ebp+4], ecx
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR _vector_pos$[ebp+8], edx
; Line 706
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 4
	push	ecx
	call	_vec3_subtract
	add	esp, 8
; Line 707
	lea	edx, DWORD PTR _screen_coords$[ebp]
	push	edx
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 709
	mov	ecx, DWORD PTR _screen_coords$[ebp]
	sar	ecx, 17					; 00000011H
	mov	DWORD PTR _pos1$[ebp], ecx
; Line 710
	mov	edx, DWORD PTR _screen_coords$[ebp+8]
	sar	edx, 17					; 00000011H
	mov	DWORD PTR _pos2$[ebp], edx
; Line 712
	cmp	DWORD PTR _pos1$[ebp], 30		; 0000001eH
	jle	SHORT $L548
	mov	DWORD PTR _pos1$[ebp], 30		; 0000001eH
$L548:
; Line 713
	cmp	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
	jge	SHORT $L549
	mov	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
$L549:
; Line 714
	cmp	DWORD PTR _pos2$[ebp], 30		; 0000001eH
	jle	SHORT $L550
	mov	DWORD PTR _pos2$[ebp], 30		; 0000001eH
$L550:
; Line 715
	cmp	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
	jge	SHORT $L551
	mov	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
$L551:
; Line 717
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR [ecx]
	xor	eax, eax
	mov	al, BYTE PTR [edx+37]
	test	eax, eax
	je	$L552
; Line 718
	cmp	DWORD PTR _screen_coords$[ebp+4], 0
	jl	SHORT $L553
; Line 719
	mov	DWORD PTR _c$[ebp], 175			; 000000afH
; Line 721
	jmp	SHORT $L554
$L553:
; Line 722
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
$L554:
; Line 725
	mov	DWORD PTR _j$[ebp], -1
	jmp	SHORT $L555
$L556:
	mov	ecx, DWORD PTR _j$[ebp]
	add	ecx, 1
	mov	DWORD PTR _j$[ebp], ecx
$L555:
	cmp	DWORD PTR _j$[ebp], 2
	jge	SHORT $L557
; Line 726
	mov	DWORD PTR _k$[ebp], -1
	jmp	SHORT $L558
$L559:
	mov	edx, DWORD PTR _k$[ebp]
	add	edx, 1
	mov	DWORD PTR _k$[ebp], edx
$L558:
	cmp	DWORD PTR _k$[ebp], 2
	jge	SHORT $L560
; Line 727
	mov	eax, DWORD PTR _k$[ebp]
	mov	ecx, DWORD PTR _pos2$[ebp]
	lea	edx, DWORD PTR [ecx+eax+40]
	test	edx, edx
	jge	SHORT $L561
	jmp	SHORT $L559
$L561:
; Line 728
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
; Line 729
	jmp	SHORT $L559
$L560:
; Line 730
	jmp	SHORT $L556
$L557:
; Line 732
	jmp	SHORT $L562
$L552:
; Line 733
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
$L562:
; Line 736
	jmp	$L545
$L546:
; Line 737
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
; Line 739
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 740
	mov	DWORD PTR _offset$[ebp], 140		; 0000008cH
; Line 742
	mov	eax, DWORD PTR _player_battery
	imul	eax, 6
	shr	eax, 4
	mov	DWORD PTR _intensity$[ebp], eax
; Line 744
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L568
$L569:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L568:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	SHORT $L570
; Line 745
	mov	edx, DWORD PTR _player_battery
	cmp	edx, DWORD PTR _i$[ebp]
	jb	SHORT $L571
; Line 746
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
$L571:
; Line 748
	jmp	SHORT $L569
$L570:
; Line 770
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 771
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 772
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 773
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 774
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
$SG579	DB	'RESPAWNING', 00H
	ORG $+1
$SG580	DB	' IN %d SEC', 00H
_DATA	ENDS
_TEXT	SEGMENT
_text$ = -80
_blazer2_draw PROC NEAR
; Line 777
	push	ebp
	mov	ebp, esp
	sub	esp, 80					; 00000050H
; Line 781
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L574
; Line 782
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	mov	ax, WORD PTR _SL_CENTER_X
	add	ax, dx
	mov	WORD PTR _SL_CENTER_X, ax
; Line 783
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	mov	ax, WORD PTR _SL_CENTER_Y
	add	ax, dx
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 785
	jmp	SHORT $L575
$L574:
; Line 786
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 787
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
$L575:
; Line 791
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 4
	push	ecx
	call	_camera_translate
	add	esp, 4
; Line 792
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	mov	edx, DWORD PTR _StarblazerEntities
	add	edx, 16					; 00000010H
	push	edx
	call	_quat_tomat
	add	esp, 8
; Line 795
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
; Line 798
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L576
	call	_draw_crosshair
$L576:
; Line 801
	call	_draw_boost_bar
; Line 804
	call	_draw_HPbar
; Line 807
	call	_draw_radar
; Line 810
	call	_draw_battery
; Line 814
	mov	eax, DWORD PTR _player_fighter
	shr	eax, 1
	mov	ecx, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [ecx+96], eax
	jae	SHORT $L577
; Line 815
	call	_blazer2_screencrack
$L577:
; Line 818
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L578
; Line 819
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	90					; 0000005aH
	push	110					; 0000006eH
	push	OFFSET FLAT:$SG579
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 820
	mov	eax, DWORD PTR _frames_respawning
	xor	edx, edx
	mov	ecx, 70					; 00000046H
	div	ecx
	push	eax
	push	OFFSET FLAT:$SG580
	lea	edx, DWORD PTR _text$[ebp]
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 821
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
$L578:
; Line 825
	call	_draw_debug
; Line 827
	mov	ecx, DWORD PTR _barcycle
	add	ecx, 2
	mov	DWORD PTR _barcycle, ecx
; Line 828
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	SHORT $L581
	mov	DWORD PTR _barcycle, 0
$L581:
; Line 831
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
; Line 832
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 8
; Line 833
	mov	esp, ebp
	pop	ebp
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
