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
PUBLIC	_barcolors
PUBLIC	_multiplayer
PUBLIC	_boost_overheating
PUBLIC	_firing
PUBLIC	_barcycle
PUBLIC	_shake_frames
PUBLIC	_firing_cooldown
_DATA	SEGMENT
COMM	_title_stars:BYTE:01770H
COMM	_AX5:DWORD
COMM	_LASER_PLAYER:DWORD
COMM	_LASER_ENEMY:DWORD
COMM	_EXPLOSION_SHARD:DWORD
COMM	_ASTEROID:DWORD
COMM	_TURRET_PLATFORM:DWORD
COMM	_TURRET:DWORD
COMM	_frames:DWORD
COMM	_velocity:BYTE:0cH
COMM	_cam_template:BYTE:024H
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
_barcolors DB	0e0H, 0e0H, 0c0H, 0c4H, 0c4H, 0a0H, 0a8H, 0a8H, 0acH, 08cH
	DB	08cH, 090H, 'tuUYZ:>', 01fH, 01fH, 01fH
	ORG $+2
_multiplayer DB	00H
	ORG $+3
_boost_overheating DB 00H
	ORG $+3
_firing	DB	00H
	ORG $+3
_barcycle DD	00H
_shake_frames DD 00H
_firing_cooldown DD 00H
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
; Line 45
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 49
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L271
$L272:
	inc	DWORD PTR _i$[ebp]
$L271:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L273
; Line 50
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
; Line 51
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
; Line 52
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
; Line 53
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
; Line 54
	jmp	$L272
$L273:
; Line 55
$L268:
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
; Line 57
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 58
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
; Line 59
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 60
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 61
	lea	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_explode_at
	add	esp, 4
; Line 62
$L276:
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
$SG283	DB	'(%d, %d, %d)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR
; Line 64
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 65
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET FLAT:$SG283
	call	_printf
	add	esp, 16					; 00000010H
; Line 66
$L281:
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
; Line 68
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 69
	push	OFFSET FLAT:_rot_mat
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 70
	push	OFFSET FLAT:_pos_delta
	mov	eax, DWORD PTR _vel$[ebp]
	push	eax
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 71
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 4
	push	eax
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 72
$L287:
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
; Line 74
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 76
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L290
$L291:
	inc	DWORD PTR _i$[ebp]
$L290:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L292
; Line 77
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
; Line 78
	jmp	$L291
$L292:
; Line 79
$L288:
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
; Line 81
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 82
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
; Line 83
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+32], 280			; 00000118H
; Line 84
	mov	eax, DWORD PTR _player_weapon+8
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+92], eax
; Line 85
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
; Line 86
	mov	BYTE PTR _firing, 1
; Line 87
$L294:
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
; Line 89
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 90
	push	OFFSET FLAT:_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 91
$L298:
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
; Line 93
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 94
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 95
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 96
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 97
$L300:
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
; Line 99
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 102
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp], eax
; Line 103
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+4], eax
; Line 104
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+8], eax
; Line 106
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
; Line 108
$L302:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_spawn_asteroid ENDP
_TEXT	ENDS
PUBLIC	_laser_script
EXTRN	_test_collisions:NEAR
_TEXT	SEGMENT
_ptr$ = 8
_i$ = -4
_laser_script PROC NEAR
; Line 110
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 113
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 114
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR [eax+32]
; Line 116
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L309
$L310:
	inc	DWORD PTR _i$[ebp]
$L309:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L311
; Line 117
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L312
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR _StarblazerEntities[eax*4], ecx
	je	$L312
; Line 118
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	test	BYTE PTR [eax+32], 1
	je	$L313
; Line 119
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
	je	$L314
; Line 121
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	BYTE PTR [eax+100], 224			; 000000e0H
; Line 122
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+104], 7
; Line 123
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax+96]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	sub	eax, DWORD PTR [ecx+92]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+96], eax
; Line 126
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 127
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 128
	jmp	$L307
; Line 130
$L314:
; Line 131
$L313:
; Line 132
$L312:
	jmp	$L310
$L311:
; Line 134
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+32], 0
	jne	$L315
; Line 135
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 136
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 138
$L315:
$L307:
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
; Line 140
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 141
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
	je	$L319
; Line 142
	mov	eax, DWORD PTR _StarblazerEntities
	sub	DWORD PTR [eax+96], 5
; Line 143
	mov	DWORD PTR _shake_frames, 7
; Line 144
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 145
	jmp	$L318
; Line 148
$L319:
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+96], 0
	jg	$L320
; Line 149
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 151
$L320:
$L318:
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
; Line 153
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 154
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+36]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+4], eax
; Line 155
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+40]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+8], eax
; Line 156
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+44]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+12], eax
; Line 157
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
; Line 158
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
; Line 159
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
; Line 161
	call	_rand
	mov	ecx, 45					; 0000002dH
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L324
; Line 163
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 164
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 166
$L324:
$L323:
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
$SG327	DB	'assets/shard.obj', 00H
	ORG $+3
$SG328	DB	'assets/asteroid.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_set_attributes PROC NEAR
; Line 168
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 169
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
; Line 170
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+32], 2
; Line 171
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 173
	mov	DWORD PTR _player_fighter, 40		; 00000028H
; Line 174
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 175
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 176
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 177
	mov	DWORD PTR _player_fighter+16, 40	; 00000028H
; Line 178
	mov	DWORD PTR _player_fighter+20, 40	; 00000028H
; Line 180
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 181
	mov	DWORD PTR _player_weapon+4, 9
; Line 182
	mov	DWORD PTR _player_weapon+8, 8
; Line 183
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _player_weapon+12, eax
; Line 185
	mov	DWORD PTR _laser_velocity, 0
; Line 186
	mov	DWORD PTR _laser_velocity+4, 0
; Line 187
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 189
	push	OFFSET FLAT:$SG327
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 190
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 191
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+32], 2
; Line 192
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 194
	push	OFFSET FLAT:$SG328
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 195
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 196
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+32], 3
; Line 197
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 198
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 199
$L326:
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
$SG332	DB	'assets/bolt.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_blazer2_init PROC NEAR
; Line 208
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 211
	mov	DWORD PTR _frames, 0
; Line 214
	push	OFFSET FLAT:$SG332
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 215
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 216
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 218
	call	_set_attributes
; Line 220
	mov	DWORD PTR _cam_template, 0
; Line 221
	mov	DWORD PTR _cam_template+4, 0
; Line 222
	mov	WORD PTR _cam_template+8, 0
; Line 223
	mov	WORD PTR _cam_template+10, 0
; Line 224
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 225
	mov	eax, DWORD PTR _player_fighter
	mov	DWORD PTR _cam_template+28, eax
; Line 226
	mov	DWORD PTR _cam_template+32, 2
; Line 228
	push	131072					; 00020000H
	push	131072					; 00020000H
	push	131072					; 00020000H
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 231
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L333
$L334:
	inc	DWORD PTR _i$[ebp]
$L333:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jae	$L335
; Line 232
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
; Line 233
	jmp	$L334
$L335:
; Line 236
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L336
$L337:
	inc	DWORD PTR _i$[ebp]
$L336:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	$L338
; Line 237
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	call	_free
	add	esp, 4
; Line 238
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 239
	jmp	$L337
$L338:
; Line 242
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	OFFSET FLAT:_cam_template
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _i$[ebp], eax
; Line 245
	mov	eax, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_boost, eax
; Line 246
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 251
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L339
$L340:
	inc	DWORD PTR _i$[ebp]
$L339:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jae	$L341
; Line 252
	call	_spawn_asteroid
; Line 253
	jmp	$L340
$L341:
; Line 256
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 257
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 259
	mov	DWORD PTR _velocity, 0
; Line 260
	mov	DWORD PTR _velocity+4, 0
; Line 261
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 263
	call	_init_hypercraft
; Line 264
$L330:
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
; Line 266
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 267
	movsx	eax, BYTE PTR _joy_amount$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _angle$[ebp]
	imul	eax, ecx
	mov	al, ah
	jmp	$L344
; Line 268
$L344:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_angle_multiply ENDP
_TEXT	ENDS
PUBLIC	_vjoy_read
EXTRN	_SG_KeyDown:NEAR
_TEXT	SEGMENT
_joy$ = 8
_vjoy_read PROC NEAR
; Line 270
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 272
	push	74					; 0000004aH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 273
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+7], 0
; Line 274
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+6], al
; Line 275
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 277
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L347
; Line 278
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+5], 1
; Line 282
$L347:
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L348
; Line 283
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 127			; 0000007fH
; Line 285
	jmp	$L349
$L348:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L350
; Line 286
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], -127			; ffffff81H
; Line 288
	jmp	$L351
$L350:
; Line 289
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 0
; Line 290
$L351:
$L349:
; Line 293
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L352
; Line 294
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 127			; 0000007fH
; Line 296
	jmp	$L353
$L352:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L354
; Line 297
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], -127			; ffffff81H
; Line 299
	jmp	$L355
$L354:
; Line 300
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 0
; Line 301
$L355:
$L353:
; Line 304
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L356
; Line 305
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 127			; 0000007fH
; Line 307
	jmp	$L357
$L356:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L358
; Line 308
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], -127			; ffffff81H
; Line 310
	jmp	$L359
$L358:
; Line 311
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 0
; Line 312
$L359:
$L357:
; Line 321
$L346:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
EXTRN	_run_entity_scripts:NEAR
_TEXT	SEGMENT
_joy$ = -8
_blazer2_module PROC NEAR
; Line 339
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 342
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 344
	cmp	DWORD PTR _shake_frames, 0
	je	$L365
; Line 345
	dec	DWORD PTR _shake_frames
; Line 349
$L365:
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
; Line 350
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
; Line 351
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
; Line 354
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+3]
	test	eax, eax
	je	$L366
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_weapon+4, eax
	ja	$L366
	cmp	DWORD PTR _firing_cooldown, 0
	jne	$L366
; Line 355
	xor	eax, eax
	sub	eax, DWORD PTR _player_weapon+4
	neg	eax
	sub	DWORD PTR _player_battery, eax
; Line 356
	mov	eax, DWORD PTR _player_weapon
	mov	DWORD PTR _firing_cooldown, eax
; Line 357
	call	_fire_laser
; Line 359
	jmp	$L367
$L366:
; Line 360
	mov	BYTE PTR _firing, 0
; Line 361
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_fighter+20, eax
	jbe	$L368
; Line 362
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L369
	inc	DWORD PTR _player_battery
; Line 363
$L369:
; Line 364
$L368:
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	$L370
; Line 365
	dec	DWORD PTR _firing_cooldown
; Line 367
$L370:
$L367:
; Line 370
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+5]
	test	eax, eax
	je	$L371
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L371
; Line 371
	mov	eax, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, eax
; Line 372
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L372
	dec	DWORD PTR _player_boost
; Line 373
$L372:
; Line 374
	jmp	$L373
$L371:
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+6]
	test	eax, eax
	je	$L374
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L374
; Line 375
	mov	DWORD PTR _velocity+8, 0
; Line 376
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L375
	dec	DWORD PTR _player_boost
; Line 377
$L375:
; Line 378
	jmp	$L376
$L374:
; Line 379
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 380
	mov	eax, DWORD PTR _player_boost
	cmp	DWORD PTR _player_fighter+16, eax
	jbe	$L377
; Line 381
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L378
	inc	DWORD PTR _player_boost
; Line 382
$L378:
; Line 383
$L377:
$L376:
$L373:
; Line 387
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	je	$L379
; Line 391
$L379:
	call	_run_entity_scripts
; Line 394
	cmp	DWORD PTR _player_boost, 0
	jne	$L380
; Line 395
	mov	BYTE PTR _boost_overheating, 1
; Line 397
$L380:
	mov	eax, DWORD PTR _player_fighter+16
	shr	eax, 1
	cmp	eax, DWORD PTR _player_boost
	ja	$L381
; Line 398
	mov	BYTE PTR _boost_overheating, 0
; Line 402
$L381:
	inc	DWORD PTR _frames
; Line 403
$L362:
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
; Line 405
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 406
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 407
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 408
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 409
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 410
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 411
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 412
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 413
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 414
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 415
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 416
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 417
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 418
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 419
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 420
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 421
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 422
$L383:
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
; Line 425
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 427
	mov	DWORD PTR _c$[ebp], 0
; Line 429
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L389
$L390:
	inc	DWORD PTR _i$[ebp]
$L389:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L391
; Line 430
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L392
	inc	DWORD PTR _c$[ebp]
; Line 431
$L392:
	jmp	$L390
$L391:
; Line 433
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L386
; Line 434
$L386:
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
$SG397	DB	'ENT', 00H
$SG399	DB	'%d / %d', 00H
$SG400	DB	'TRI', 00H
$SG401	DB	'%d / %d', 00H
$SG402	DB	'FPS', 00H
$SG404	DB	'%d', 00H
	ORG $+1
$SG405	DB	'%d %d %d', 00H
	ORG $+3
$SG406	DB	'VERT %d / %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_num$ = -100
_draw_debug PROC NEAR
; Line 437
	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
	push	ebx
	push	esi
	push	edi
; Line 441
	push	1
	push	252					; 000000fcH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG397
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 442
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:$SG399
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 443
	push	1
	push	252					; 000000fcH
	push	1
	push	1
	push	0
	push	15					; 0000000fH
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 445
	push	1
	push	252					; 000000fcH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:$SG400
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 446
	push	1500					; 000005dcH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:$SG401
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 447
	push	1
	push	252					; 000000fcH
	push	1
	push	1
	push	7
	push	15					; 0000000fH
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 449
	push	1
	push	252					; 000000fcH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:$SG402
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 450
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	$L403
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:$SG404
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 451
$L403:
	push	1
	push	252					; 000000fcH
	push	1
	push	1
	push	14					; 0000000eH
	push	15					; 0000000fH
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 454
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
	push	OFFSET FLAT:$SG405
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 455
	push	1
	push	28					; 0000001cH
	push	1
	push	1
	push	0
	push	240					; 000000f0H
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 457
	push	2500					; 000009c4H
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	push	eax
	push	OFFSET FLAT:$SG406
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 458
	push	1
	push	28					; 0000001cH
	push	1
	push	1
	push	7
	push	240					; 000000f0H
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 459
$L394:
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
; Line 461
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 466
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
; Line 467
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 468
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L417
$L418:
	inc	DWORD PTR _j$[ebp]
$L417:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L419
; Line 469
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _barcolors[eax]
	mov	DWORD PTR _c$[ebp], eax
; Line 470
	mov	eax, DWORD PTR _k$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jle	$L420
	jmp	$L419
; Line 471
$L420:
	mov	DWORD PTR _pos1$[ebp], 24		; 00000018H
; Line 472
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 473
	mov	DWORD PTR _pos3$[ebp], 8
; Line 474
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 475
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L421
; Line 477
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 478
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 480
$L421:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L422
; Line 481
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 482
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 484
$L422:
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
; Line 485
	add	DWORD PTR _i$[ebp], 8
; Line 486
	jmp	$L418
$L419:
; Line 487
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 488
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 489
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 490
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 491
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	24					; 00000018H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 492
$L408:
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
; Line 494
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 496
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L427
$L428:
	inc	DWORD PTR _i$[ebp]
$L427:
	cmp	DWORD PTR _i$[ebp], 7
	jge	$L429
; Line 499
	push	28					; 0000001cH
	push	90					; 0000005aH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 500
	push	28					; 0000001cH
	push	90					; 0000005aH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 501
	push	28					; 0000001cH
	push	110					; 0000006eH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 502
	push	28					; 0000001cH
	push	110					; 0000006eH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 503
	push	28					; 0000001cH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 504
	push	28					; 0000001cH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 505
	push	28					; 0000001cH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 506
	push	28					; 0000001cH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 507
	jmp	$L428
$L429:
; Line 509
	push	28					; 0000001cH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 510
$L425:
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
; Line 513
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 518
	mov	eax, DWORD PTR _player_boost
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, 5
	sub	edx, edx
	div	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 519
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 520
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L441
$L442:
	inc	DWORD PTR _j$[ebp]
$L441:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L443
; Line 521
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	je	$L495
	mov	DWORD PTR _c$[ebp], 231			; 000000e7H
	jmp	$L496
$L495:
	mov	DWORD PTR _c$[ebp], 39			; 00000027H
$L496:
; Line 522
	mov	eax, DWORD PTR _k$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jle	$L444
	jmp	$L443
; Line 523
$L444:
	mov	DWORD PTR _pos1$[ebp], 312		; 00000138H
; Line 524
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 525
	mov	DWORD PTR _pos3$[ebp], 296		; 00000128H
; Line 526
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 527
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L445
; Line 529
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 530
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 532
$L445:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L446
; Line 533
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 534
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 536
$L446:
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
; Line 537
	add	DWORD PTR _i$[ebp], 8
; Line 538
	jmp	$L442
$L443:
; Line 539
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 540
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 541
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 542
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 543
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	312					; 00000138H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 544
$L432:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_boost_bar ENDP
_TEXT	ENDS
PUBLIC	_draw_radar
EXTRN	_plot_pixel:NEAR
_TEXT	SEGMENT
_i$ = -20
_j$ = -24
_c$ = -4
_k$ = -40
_draw_radar PROC NEAR
; Line 546
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 551
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L455
$L456:
	inc	DWORD PTR _i$[ebp]
$L455:
	cmp	DWORD PTR _i$[ebp], 60			; 0000003cH
	jge	$L457
; Line 552
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L458
$L459:
	inc	DWORD PTR _j$[ebp]
$L458:
	cmp	DWORD PTR _j$[ebp], 60			; 0000003cH
	jge	$L460
; Line 553
	mov	DWORD PTR _c$[ebp], 0
; Line 555
	cmp	DWORD PTR _i$[ebp], 0
	je	$L462
	cmp	DWORD PTR _i$[ebp], 59			; 0000003bH
	je	$L462
	cmp	DWORD PTR _j$[ebp], 0
	je	$L462
	cmp	DWORD PTR _j$[ebp], 59			; 0000003bH
	jne	$L461
$L462:
	mov	DWORD PTR _c$[ebp], 255			; 000000ffH
; Line 556
$L461:
	cmp	DWORD PTR _c$[ebp], 0
	jne	$L463
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _j$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 1
	xor	eax, edx
	sub	eax, edx
	je	$L463
	jmp	$L459
; Line 557
$L463:
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
; Line 558
	jmp	$L459
$L460:
; Line 559
	jmp	$L456
$L457:
; Line 563
	mov	DWORD PTR _j$[ebp], -1
	jmp	$L465
$L466:
	inc	DWORD PTR _j$[ebp]
$L465:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L467
; Line 565
	mov	DWORD PTR _k$[ebp], -1
	jmp	$L468
$L469:
	inc	DWORD PTR _k$[ebp]
$L468:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L470
; Line 566
	push	252					; 000000fcH
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 567
	jmp	$L469
$L470:
; Line 569
	jmp	$L466
$L467:
; Line 571
	push	252					; 000000fcH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 574
$L448:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_radar ENDP
_TEXT	ENDS
PUBLIC	_draw_battery
_TEXT	SEGMENT
_total_pixels$ = -28
_block_pixels$ = -12
_offset$ = -20
_i$ = -24
_r$ = -4
_g$ = -16
_c$ = -8
_draw_battery PROC NEAR
; Line 576
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 577
	mov	eax, DWORD PTR _player_battery
	mov	DWORD PTR _total_pixels$[ebp], eax
; Line 578
	mov	DWORD PTR _block_pixels$[ebp], 0
; Line 579
	mov	DWORD PTR _offset$[ebp], 140		; 0000008cH
; Line 585
	mov	DWORD PTR _r$[ebp], 7
	jmp	$L480
$L481:
	dec	DWORD PTR _r$[ebp]
$L480:
	cmp	DWORD PTR _r$[ebp], 0
	jl	$L482
; Line 586
	mov	eax, 7
	sub	eax, DWORD PTR _r$[ebp]
	mov	BYTE PTR _g$[ebp], al
; Line 587
	xor	eax, eax
	mov	al, BYTE PTR _g$[ebp]
	sar	eax, 1
	mov	ecx, DWORD PTR _r$[ebp]
	shl	ecx, 5
	or	al, cl
	mov	BYTE PTR _c$[ebp], al
; Line 589
	cmp	DWORD PTR _total_pixels$[ebp], 5
	jl	$L483
; Line 590
	mov	DWORD PTR _block_pixels$[ebp], 5
; Line 591
	sub	DWORD PTR _total_pixels$[ebp], 5
; Line 593
	jmp	$L484
$L483:
; Line 594
	mov	eax, DWORD PTR _total_pixels$[ebp]
	mov	DWORD PTR _block_pixels$[ebp], eax
; Line 595
	mov	DWORD PTR _total_pixels$[ebp], 0
; Line 596
$L484:
; Line 598
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L485
$L486:
	inc	DWORD PTR _i$[ebp]
$L485:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _block_pixels$[ebp], eax
	jle	$L487
; Line 599
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	push	170					; 000000aaH
	mov	eax, DWORD PTR _offset$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	push	eax
	push	160					; 000000a0H
	mov	eax, DWORD PTR _offset$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 600
	jmp	$L486
$L487:
; Line 602
	add	DWORD PTR _offset$[ebp], 5
; Line 603
	jmp	$L481
$L482:
; Line 605
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 606
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 607
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 608
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 609
$L472:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_battery ENDP
_TEXT	ENDS
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_camera_translate:NEAR
EXTRN	_draw_scene:NEAR
EXTRN	_draw_hypercraft:NEAR
EXTRN	_set_hypercraft_orientation:NEAR
_TEXT	SEGMENT
_blazer2_draw PROC NEAR
; Line 612
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 614
	cmp	DWORD PTR _shake_frames, 0
	je	$L489
; Line 615
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_X
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_X, ax
; Line 616
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_Y
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 618
	jmp	$L490
$L489:
; Line 619
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 620
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 621
$L490:
; Line 624
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 625
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 628
	push	500					; 000001f4H
	push	OFFSET FLAT:_title_stars
	push	0
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
; Line 631
	call	_draw_crosshair
; Line 634
	call	_draw_boost_bar
; Line 637
	call	_draw_HPbar
; Line 640
	call	_draw_radar
; Line 643
	call	_draw_battery
; Line 647
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	shr	ecx, 1
	cmp	DWORD PTR [eax+96], ecx
	jae	$L491
; Line 648
	call	_blazer2_screencrack
; Line 652
$L491:
	call	_draw_debug
; Line 654
	add	DWORD PTR _barcycle, 2
; Line 655
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	$L492
	mov	DWORD PTR _barcycle, 0
; Line 658
$L492:
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
; Line 659
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 8
; Line 660
$L488:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
