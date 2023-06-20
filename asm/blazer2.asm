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
PUBLIC	_shading
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
_barcolors DB	0e8H, 0e8H, 0c8H, 0c4H, 0c4H, 0a0H, 0a8H, 0a8H, 0acH, 08cH
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
; Line 48
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 52
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L286
$L287:
	inc	DWORD PTR _i$[ebp]
$L286:
	cmp	DWORD PTR _i$[ebp], 64			; 00000040H
	jge	$L288
; Line 53
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
; Line 54
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
; Line 55
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
; Line 56
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
; Line 57
	jmp	$L287
$L288:
; Line 58
$L283:
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
; Line 60
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 61
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
; Line 62
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 63
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 64
	lea	eax, DWORD PTR _pos$[ebp]
	push	eax
	call	_explode_at
	add	esp, 4
; Line 65
$L291:
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
$SG298	DB	'(%d, %d, %d)', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR
; Line 67
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 68
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	push	OFFSET FLAT:$SG298
	call	_printf
	add	esp, 16					; 00000010H
; Line 69
$L296:
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
; Line 71
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 72
	push	OFFSET FLAT:_rot_mat
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 73
	push	OFFSET FLAT:_pos_delta
	mov	eax, DWORD PTR _vel$[ebp]
	push	eax
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 74
	mov	eax, DWORD PTR _ent$[ebp]
	add	eax, 4
	push	eax
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 75
$L302:
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
; Line 77
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 79
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L305
$L306:
	inc	DWORD PTR _i$[ebp]
$L305:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L307
; Line 80
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
; Line 81
	jmp	$L306
$L307:
; Line 82
$L303:
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
; Line 84
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 85
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
; Line 86
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+32], 280			; 00000118H
; Line 87
	mov	eax, DWORD PTR _player_weapon+8
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+92], eax
; Line 88
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
; Line 89
	mov	BYTE PTR _firing, 1
; Line 90
$L309:
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
; Line 92
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 93
	push	OFFSET FLAT:_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 94
$L313:
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
; Line 96
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 97
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 98
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 99
	call	_rand
	mov	ecx, 2000				; 000007d0H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-1000]
	shl	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _star$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 100
$L315:
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
; Line 102
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 105
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp], eax
; Line 106
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+4], eax
; Line 107
	call	_rand
	mov	ecx, 500				; 000001f4H
	cdq
	idiv	ecx
	lea	eax, DWORD PTR [edx-250]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _pos$[ebp+8], eax
; Line 109
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
; Line 111
$L317:
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
; Line 113
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 116
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_step_entity
	add	esp, 8
; Line 117
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	dec	DWORD PTR [eax+32]
; Line 119
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L324
$L325:
	inc	DWORD PTR _i$[ebp]
$L324:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L326
; Line 120
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L327
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	cmp	DWORD PTR _StarblazerEntities[eax*4], ecx
	je	$L327
; Line 121
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	test	BYTE PTR [eax+32], 1
	je	$L328
; Line 122
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
	je	$L329
; Line 124
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 125
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+104], 7
; Line 126
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax+96]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	sub	eax, DWORD PTR [ecx+92]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+96], eax
; Line 129
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 130
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 131
	jmp	$L322
; Line 133
$L329:
; Line 134
$L328:
; Line 135
$L327:
	jmp	$L325
$L326:
; Line 137
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+32], 0
	jne	$L330
; Line 138
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 139
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 141
$L330:
$L322:
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
; Line 143
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 144
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
	je	$L334
; Line 145
	mov	eax, DWORD PTR _StarblazerEntities
	sub	DWORD PTR [eax+96], 5
; Line 146
	mov	DWORD PTR _shake_frames, 7
; Line 147
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 148
	jmp	$L333
; Line 151
$L334:
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	cmp	DWORD PTR [eax+96], 0
	jg	$L335
; Line 152
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_explode_entity
	add	esp, 4
; Line 154
$L335:
$L333:
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
; Line 156
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 157
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+36]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+4], eax
; Line 158
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+40]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+8], eax
; Line 159
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+44]
	shl	eax, 6
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR [ecx]
	add	DWORD PTR [ecx+12], eax
; Line 160
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
; Line 161
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
; Line 162
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
; Line 164
	call	_rand
	mov	ecx, 45					; 0000002dH
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L339
; Line 166
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 167
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	DWORD PTR [eax], 0
; Line 169
$L339:
$L338:
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
$SG342	DB	'assets/shard.obj', 00H
	ORG $+3
$SG343	DB	'assets/asterold.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_set_attributes PROC NEAR
; Line 171
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 172
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
; Line 173
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+32], 2
; Line 174
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+36], 191			; 000000bfH
; Line 175
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+37], 0
; Line 176
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 178
	mov	DWORD PTR _player_fighter, 40		; 00000028H
; Line 179
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 180
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 181
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 182
	mov	DWORD PTR _player_fighter+16, 40	; 00000028H
; Line 183
	mov	DWORD PTR _player_fighter+20, 40	; 00000028H
; Line 185
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 186
	mov	DWORD PTR _player_weapon+4, 9
; Line 187
	mov	DWORD PTR _player_weapon+8, 8
; Line 188
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _player_weapon+12, eax
; Line 190
	mov	DWORD PTR _laser_velocity, 0
; Line 191
	mov	DWORD PTR _laser_velocity+4, 0
; Line 192
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 194
	push	OFFSET FLAT:$SG342
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 195
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 196
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+32], 2
; Line 197
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+36], 127			; 0000007fH
; Line 198
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+37], 0
; Line 199
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 201
	push	OFFSET FLAT:$SG343
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 202
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 203
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+32], 3
; Line 204
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 205
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+36], 207			; 000000cfH
; Line 206
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+37], 0
; Line 207
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 208
$L341:
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
$SG347	DB	'assets/bolt.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_i$ = -4
_blazer2_init PROC NEAR
; Line 217
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 220
	mov	DWORD PTR _frames, 0
; Line 223
	push	OFFSET FLAT:$SG347
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 224
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 225
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 227
	call	_set_attributes
; Line 229
	mov	DWORD PTR _cam_template, 0
; Line 230
	mov	DWORD PTR _cam_template+4, 0
; Line 231
	mov	WORD PTR _cam_template+8, 0
; Line 232
	mov	WORD PTR _cam_template+10, 0
; Line 233
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 234
	mov	eax, DWORD PTR _player_fighter
	mov	DWORD PTR _cam_template+28, eax
; Line 235
	mov	DWORD PTR _cam_template+32, 2
; Line 237
	push	131072					; 00020000H
	push	131072					; 00020000H
	push	131072					; 00020000H
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 240
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L348
$L349:
	inc	DWORD PTR _i$[ebp]
$L348:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jae	$L350
; Line 241
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
; Line 242
	jmp	$L349
$L350:
; Line 245
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L351
$L352:
	inc	DWORD PTR _i$[ebp]
$L351:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	$L353
; Line 246
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	call	_free
	add	esp, 4
; Line 247
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 248
	jmp	$L352
$L353:
; Line 251
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
; Line 254
	mov	eax, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_boost, eax
; Line 255
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 260
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L354
$L355:
	inc	DWORD PTR _i$[ebp]
$L354:
	cmp	DWORD PTR _i$[ebp], 100			; 00000064H
	jae	$L356
; Line 261
	call	_spawn_asteroid
; Line 262
	jmp	$L355
$L356:
; Line 265
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 266
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 268
	mov	DWORD PTR _velocity, 0
; Line 269
	mov	DWORD PTR _velocity+4, 0
; Line 270
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 272
	call	_init_hypercraft
; Line 273
$L345:
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
; Line 275
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 276
	movsx	eax, BYTE PTR _joy_amount$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _angle$[ebp]
	imul	eax, ecx
	mov	al, ah
	jmp	$L359
; Line 277
$L359:
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
; Line 279
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 283
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 285
	push	74					; 0000004aH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+3], al
; Line 286
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+7], 0
; Line 287
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+6], al
; Line 288
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	ecx, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 290
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L363
; Line 291
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+5], 1
; Line 295
$L363:
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L364
; Line 296
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 127			; 0000007fH
; Line 298
	jmp	$L365
$L364:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L366
; Line 299
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], -127			; ffffff81H
; Line 301
	jmp	$L367
$L366:
; Line 302
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax], 0
; Line 303
$L367:
$L365:
; Line 306
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L368
; Line 307
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 127			; 0000007fH
; Line 309
	jmp	$L369
$L368:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L370
; Line 310
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], -127			; ffffff81H
; Line 312
	jmp	$L371
$L370:
; Line 313
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+1], 0
; Line 314
$L371:
$L369:
; Line 317
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L372
; Line 318
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 127			; 0000007fH
; Line 320
	jmp	$L373
$L372:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L374
; Line 321
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], -127			; ffffff81H
; Line 323
	jmp	$L375
$L374:
; Line 324
	mov	eax, DWORD PTR _joy$[ebp]
	mov	BYTE PTR [eax+2], 0
; Line 325
$L375:
$L373:
; Line 334
$L361:
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
; Line 352
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 355
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 357
	cmp	DWORD PTR _shake_frames, 0
	je	$L381
; Line 358
	dec	DWORD PTR _shake_frames
; Line 362
$L381:
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
; Line 363
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
; Line 364
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
; Line 366
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L382
; Line 367
	xor	eax, eax
	mov	al, BYTE PTR _shading
	test	eax, eax
	jne	$L527
	mov	BYTE PTR _shading, 1
	jmp	$L528
$L527:
	mov	BYTE PTR _shading, 0
$L528:
; Line 371
$L382:
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+3]
	test	eax, eax
	je	$L383
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_weapon+4, eax
	ja	$L383
	cmp	DWORD PTR _firing_cooldown, 0
	jne	$L383
; Line 372
	xor	eax, eax
	sub	eax, DWORD PTR _player_weapon+4
	neg	eax
	sub	DWORD PTR _player_battery, eax
; Line 373
	mov	eax, DWORD PTR _player_weapon
	mov	DWORD PTR _firing_cooldown, eax
; Line 374
	call	_fire_laser
; Line 376
	jmp	$L384
$L383:
; Line 377
	mov	BYTE PTR _firing, 0
; Line 378
	mov	eax, DWORD PTR _player_battery
	cmp	DWORD PTR _player_fighter+20, eax
	jbe	$L385
; Line 379
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L386
	inc	DWORD PTR _player_battery
; Line 380
$L386:
; Line 381
$L385:
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	$L387
; Line 382
	dec	DWORD PTR _firing_cooldown
; Line 384
$L387:
$L384:
; Line 387
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+5]
	test	eax, eax
	je	$L388
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L388
; Line 388
	mov	eax, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, eax
; Line 389
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L389
	dec	DWORD PTR _player_boost
; Line 390
$L389:
; Line 391
	jmp	$L390
$L388:
	xor	eax, eax
	mov	al, BYTE PTR _joy$[ebp+6]
	test	eax, eax
	je	$L391
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	jne	$L391
; Line 392
	mov	DWORD PTR _velocity+8, 0
; Line 393
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L392
	dec	DWORD PTR _player_boost
; Line 394
$L392:
; Line 395
	jmp	$L393
$L391:
; Line 396
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 397
	mov	eax, DWORD PTR _player_boost
	cmp	DWORD PTR _player_fighter+16, eax
	jbe	$L394
; Line 398
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	$L395
	inc	DWORD PTR _player_boost
; Line 399
$L395:
; Line 400
$L394:
$L393:
$L390:
; Line 404
	xor	eax, eax
	mov	al, BYTE PTR _multiplayer
	test	eax, eax
	je	$L396
; Line 408
$L396:
	call	_run_entity_scripts
; Line 411
	cmp	DWORD PTR _player_boost, 0
	jne	$L397
; Line 412
	mov	BYTE PTR _boost_overheating, 1
; Line 414
$L397:
	mov	eax, DWORD PTR _player_fighter+16
	shr	eax, 1
	cmp	eax, DWORD PTR _player_boost
	ja	$L398
; Line 415
	mov	BYTE PTR _boost_overheating, 0
; Line 419
$L398:
	inc	DWORD PTR _frames
; Line 420
$L378:
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
; Line 422
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 423
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 424
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 425
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 426
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 427
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 428
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 429
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 430
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 431
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 432
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 433
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 434
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 435
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 436
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 437
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 438
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 439
$L400:
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
; Line 442
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 444
	mov	DWORD PTR _c$[ebp], 0
; Line 446
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L406
$L407:
	inc	DWORD PTR _i$[ebp]
$L406:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L408
; Line 447
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L409
	inc	DWORD PTR _c$[ebp]
; Line 448
$L409:
	jmp	$L407
$L408:
; Line 450
	mov	eax, DWORD PTR _c$[ebp]
	jmp	$L403
; Line 451
$L403:
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
$SG414	DB	'ENT', 00H
$SG416	DB	'%d / %d', 00H
$SG417	DB	'TRI', 00H
$SG418	DB	'%d / %d', 00H
$SG419	DB	'FPS', 00H
$SG421	DB	'%d', 00H
	ORG $+1
$SG422	DB	'%d %d %d', 00H
	ORG $+3
$SG423	DB	'VERT %d / %d', 00H
_DATA	ENDS
_TEXT	SEGMENT
_num$ = -100
_draw_debug PROC NEAR
; Line 454
	push	ebp
	mov	ebp, esp
	sub	esp, 100				; 00000064H
	push	ebx
	push	esi
	push	edi
; Line 458
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:$SG414
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 459
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:$SG416
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 460
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
; Line 462
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:$SG417
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 463
	push	1500					; 000005dcH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:$SG418
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 464
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
; Line 466
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:$SG419
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 467
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	$L420
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:$SG421
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 468
$L420:
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
; Line 471
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
	push	OFFSET FLAT:$SG422
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 472
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
; Line 474
	push	2500					; 000009c4H
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	push	eax
	push	OFFSET FLAT:$SG423
	lea	eax, DWORD PTR _num$[ebp]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 475
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
; Line 476
$L411:
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
; Line 478
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 483
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
; Line 484
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 485
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L434
$L435:
	inc	DWORD PTR _j$[ebp]
$L434:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L436
; Line 486
	mov	eax, DWORD PTR _j$[ebp]
	movsx	eax, BYTE PTR _barcolors[eax]
	mov	DWORD PTR _c$[ebp], eax
; Line 487
	mov	eax, DWORD PTR _k$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jle	$L437
	jmp	$L436
; Line 488
$L437:
	mov	DWORD PTR _pos1$[ebp], 24		; 00000018H
; Line 489
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 490
	mov	DWORD PTR _pos3$[ebp], 8
; Line 491
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 492
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L438
; Line 494
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 495
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 497
$L438:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L439
; Line 498
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 499
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 501
$L439:
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
; Line 502
	add	DWORD PTR _i$[ebp], 8
; Line 503
	jmp	$L435
$L436:
; Line 504
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 505
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 506
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 507
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 508
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	24					; 00000018H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 509
$L425:
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
; Line 511
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 513
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L444
$L445:
	inc	DWORD PTR _i$[ebp]
$L444:
	cmp	DWORD PTR _i$[ebp], 7
	jge	$L446
; Line 516
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 517
	push	175					; 000000afH
	push	90					; 0000005aH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 518
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 150				; 00000096H
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 519
	push	175					; 000000afH
	push	110					; 0000006eH
	mov	eax, 170				; 000000aaH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 520
	push	175					; 000000afH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 521
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 522
	push	175					; 000000afH
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 90					; 0000005aH
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 523
	push	175					; 000000afH
	mov	eax, 110				; 0000006eH
	sub	eax, DWORD PTR _i$[ebp]
	push	eax
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 524
	jmp	$L445
$L446:
; Line 526
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 527
$L442:
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
; Line 530
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 535
	mov	eax, DWORD PTR _player_boost
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*4]
	mov	ecx, 5
	sub	edx, edx
	div	ecx
	add	eax, 16					; 00000010H
	mov	DWORD PTR _k$[ebp], eax
; Line 536
	mov	eax, DWORD PTR _barcycle
	sar	eax, 3
	add	eax, 8
	mov	DWORD PTR _i$[ebp], eax
; Line 537
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L458
$L459:
	inc	DWORD PTR _j$[ebp]
$L458:
	cmp	DWORD PTR _j$[ebp], 22			; 00000016H
	jge	$L460
; Line 538
	xor	eax, eax
	mov	al, BYTE PTR _boost_overheating
	test	eax, eax
	je	$L529
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
	jmp	$L530
$L529:
	mov	DWORD PTR _c$[ebp], 159			; 0000009fH
$L530:
; Line 539
	mov	eax, DWORD PTR _k$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jle	$L461
	jmp	$L460
; Line 540
$L461:
	mov	DWORD PTR _pos1$[ebp], 312		; 00000138H
; Line 541
	mov	eax, DWORD PTR _i$[ebp]
	mov	DWORD PTR _pos2$[ebp], eax
; Line 542
	mov	DWORD PTR _pos3$[ebp], 296		; 00000128H
; Line 543
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	mov	DWORD PTR _pos4$[ebp], eax
; Line 544
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	cmp	eax, DWORD PTR _k$[ebp]
	jle	$L462
; Line 546
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 8
	sub	eax, DWORD PTR _k$[ebp]
	add	eax, eax
	add	DWORD PTR _pos3$[ebp], eax
; Line 547
	mov	eax, DWORD PTR _k$[ebp]
	mov	DWORD PTR _pos4$[ebp], eax
; Line 549
$L462:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L463
; Line 550
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	sub	ecx, DWORD PTR _i$[ebp]
	add	ecx, ecx
	sub	eax, ecx
	neg	eax
	sub	DWORD PTR _pos1$[ebp], eax
; Line 551
	mov	DWORD PTR _pos2$[ebp], 16		; 00000010H
; Line 553
$L463:
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
; Line 554
	add	DWORD PTR _i$[ebp], 8
; Line 555
	jmp	$L459
$L460:
; Line 556
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 557
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 558
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 559
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 560
	push	255					; 000000ffH
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	312					; 00000138H
	mov	eax, DWORD PTR _k$[ebp]
	push	eax
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 561
$L449:
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
; Line 563
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 568
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L474
$L475:
	inc	DWORD PTR _i$[ebp]
$L474:
	cmp	DWORD PTR _i$[ebp], 60			; 0000003cH
	jge	$L476
; Line 569
	mov	DWORD PTR _j$[ebp], 0
	jmp	$L477
$L478:
	inc	DWORD PTR _j$[ebp]
$L477:
	cmp	DWORD PTR _j$[ebp], 60			; 0000003cH
	jge	$L479
; Line 570
	mov	DWORD PTR _c$[ebp], 0
; Line 572
	cmp	DWORD PTR _i$[ebp], 0
	je	$L481
	cmp	DWORD PTR _i$[ebp], 59			; 0000003bH
	je	$L481
	cmp	DWORD PTR _j$[ebp], 0
	je	$L481
	cmp	DWORD PTR _j$[ebp], 59			; 0000003bH
	jne	$L480
$L481:
	mov	DWORD PTR _c$[ebp], 255			; 000000ffH
; Line 573
$L480:
	cmp	DWORD PTR _c$[ebp], 0
	jne	$L482
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 1
	xor	eax, edx
	sub	eax, edx
	je	$L482
	jmp	$L478
; Line 574
$L482:
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
; Line 575
	jmp	$L478
$L479:
; Line 576
	jmp	$L475
$L476:
; Line 579
	mov	DWORD PTR _j$[ebp], -1
	jmp	$L484
$L485:
	inc	DWORD PTR _j$[ebp]
$L484:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L486
; Line 580
	mov	DWORD PTR _k$[ebp], -1
	jmp	$L487
$L488:
	inc	DWORD PTR _k$[ebp]
$L487:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L489
; Line 581
	push	239					; 000000efH
	mov	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	push	eax
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 582
	jmp	$L488
$L489:
; Line 583
	jmp	$L485
$L486:
; Line 585
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 588
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L490
$L491:
	inc	DWORD PTR _i$[ebp]
$L490:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L492
; Line 589
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L493
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	test	BYTE PTR [eax+32], 2
	je	$L493
; Line 590
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
; Line 591
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 592
	lea	eax, DWORD PTR _screen_coords$[ebp]
	push	eax
	lea	eax, DWORD PTR _vector_pos$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 594
	mov	eax, DWORD PTR _screen_coords$[ebp]
	sar	eax, 17					; 00000011H
	mov	DWORD PTR _pos1$[ebp], eax
; Line 595
	mov	eax, DWORD PTR _screen_coords$[ebp+8]
	sar	eax, 17					; 00000011H
	mov	DWORD PTR _pos2$[ebp], eax
; Line 597
	cmp	DWORD PTR _pos1$[ebp], 30		; 0000001eH
	jle	$L494
	mov	DWORD PTR _pos1$[ebp], 30		; 0000001eH
; Line 598
$L494:
	cmp	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
	jge	$L495
	mov	DWORD PTR _pos1$[ebp], -30		; ffffffe2H
; Line 599
$L495:
	cmp	DWORD PTR _pos2$[ebp], 30		; 0000001eH
	jle	$L496
	mov	DWORD PTR _pos2$[ebp], 30		; 0000001eH
; Line 600
$L496:
	cmp	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
	jge	$L497
	mov	DWORD PTR _pos2$[ebp], -30		; ffffffe2H
; Line 602
$L497:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+37]
	test	ecx, ecx
	je	$L498
; Line 603
	cmp	DWORD PTR _screen_coords$[ebp+4], 0
	jl	$L499
; Line 604
	mov	DWORD PTR _c$[ebp], 175			; 000000afH
; Line 606
	jmp	$L500
$L499:
; Line 607
	mov	DWORD PTR _c$[ebp], 223			; 000000dfH
; Line 608
$L500:
; Line 610
	mov	DWORD PTR _j$[ebp], -1
	jmp	$L501
$L502:
	inc	DWORD PTR _j$[ebp]
$L501:
	cmp	DWORD PTR _j$[ebp], 2
	jge	$L503
; Line 611
	mov	DWORD PTR _k$[ebp], -1
	jmp	$L504
$L505:
	inc	DWORD PTR _k$[ebp]
$L504:
	cmp	DWORD PTR _k$[ebp], 2
	jge	$L506
; Line 612
	mov	eax, DWORD PTR _pos2$[ebp]
	add	eax, DWORD PTR _k$[ebp]
	add	eax, 40					; 00000028H
	jns	$L507
	jmp	$L505
; Line 613
$L507:
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
; Line 614
	jmp	$L505
$L506:
; Line 615
	jmp	$L502
$L503:
; Line 617
	jmp	$L508
$L498:
; Line 618
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
; Line 619
$L508:
; Line 621
$L493:
	jmp	$L491
$L492:
; Line 622
$L465:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_radar ENDP
_TEXT	ENDS
PUBLIC	_draw_battery
_TEXT	SEGMENT
_total_pixels$ = -20
_block_pixels$ = -8
_offset$ = -12
_i$ = -16
_r$ = -4
_draw_battery PROC NEAR
; Line 624
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
	push	ebx
	push	esi
	push	edi
; Line 625
	mov	eax, DWORD PTR _player_battery
	mov	DWORD PTR _total_pixels$[ebp], eax
; Line 626
	mov	DWORD PTR _block_pixels$[ebp], 0
; Line 627
	mov	DWORD PTR _offset$[ebp], 140		; 0000008cH
; Line 629
	mov	DWORD PTR _r$[ebp], 0
; Line 631
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L516
$L517:
	inc	DWORD PTR _i$[ebp]
$L516:
	cmp	DWORD PTR _i$[ebp], 40			; 00000028H
	jge	$L518
; Line 632
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _player_battery, eax
	jb	$L519
; Line 633
	mov	eax, DWORD PTR _r$[ebp]
	sar	eax, 4
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
; Line 635
$L519:
	add	DWORD PTR _r$[ebp], 6
; Line 636
	jmp	$L517
$L518:
; Line 658
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 659
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 660
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 661
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 662
$L510:
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
_TEXT	SEGMENT
_blazer2_draw PROC NEAR
; Line 665
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 667
	cmp	DWORD PTR _shake_frames, 0
	je	$L521
; Line 668
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_X
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_X, ax
; Line 669
	call	_rand
	mov	ecx, 20					; 00000014H
	cdq
	idiv	ecx
	movsx	eax, WORD PTR _SL_CENTER_Y
	lea	eax, DWORD PTR [edx+eax-10]
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 671
	jmp	$L522
$L521:
; Line 672
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 673
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 674
$L522:
; Line 677
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 678
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 681
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
; Line 684
	call	_draw_crosshair
; Line 687
	call	_draw_boost_bar
; Line 690
	call	_draw_HPbar
; Line 693
	call	_draw_radar
; Line 696
	call	_draw_battery
; Line 700
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	shr	ecx, 1
	cmp	DWORD PTR [eax+96], ecx
	jae	$L523
; Line 701
	call	_blazer2_screencrack
; Line 705
$L523:
	call	_draw_debug
; Line 707
	add	DWORD PTR _barcycle, 2
; Line 708
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	$L524
	mov	DWORD PTR _barcycle, 0
; Line 711
$L524:
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
; Line 712
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 8
; Line 713
$L520:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
