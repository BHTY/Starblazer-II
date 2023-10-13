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
;	COMDAT ??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BB@BOHA@assets?1shard?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@KHLK@sfx?1net?4wav?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BA@HMID@sfx?1explode?4wav?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0O@OLEL@sfx?1laser?4wav?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@LLEG@sfx?1hit?4wav?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_03FBAE@ENT?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_03FKCM@TRI?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_03FKNI@FPS?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_02MECO@?$CFd?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_03HFLF@INF?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08NNKG@?$CFd?5?$CFd?5?$CFd?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_06BCGP@PLAYER?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@LPNF@RESPAWNING?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _explode_at
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _explode_entity
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _print_vec
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _step_entity
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_stars
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _fire_laser
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _cam_script
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _init_star
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _spawn_asteroid
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _ax5_script
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _enemy_laser_script
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _laser_script
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _asteroid_script
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _debris_script
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _set_attributes
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _blazer2_init
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _angle_multiply
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _vjoy_read
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _respawn_player
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _blazer2_module
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _blazer2_screencrack
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _count_entities
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_debug
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_HPbar
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_crosshair
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_boost_bar
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_radar
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_battery
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_nametags
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _blazer2_draw
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_barcolors
PUBLIC	_boost_overheating
PUBLIC	_barcycle
PUBLIC	_multiplayer
PUBLIC	_firing
PUBLIC	_frames_respawning
PUBLIC	_shake_frames
PUBLIC	_firing_cooldown
_DATA	SEGMENT
COMM	_SND_HIT:DWORD
COMM	_SND_LASER:DWORD
COMM	_SND_LASER_ENEMY:DWORD
COMM	_ENEMY_LASER_SHREDDER:BYTE:010H
COMM	_ENEMY_LASER_DRAGONBREATH:BYTE:010H
COMM	_laser_type:BYTE
COMM	_frames:DWORD
COMM	_velocity:BYTE:0cH
COMM	_title_stars:BYTE:01770H
COMM	_cam_template:BYTE:028H
COMM	_tst:BYTE:0cH
COMM	_camera:DWORD
COMM	_dying:BYTE
COMM	_tst2:BYTE:0cH
COMM	_player_fighter:BYTE:01cH
COMM	_impact_id:DWORD
COMM	_player_weapon:BYTE:010H
COMM	_player_boost:DWORD
COMM	_AX5:DWORD
COMM	_player_battery:DWORD
COMM	_LASER_PLAYER:DWORD
COMM	_LASER_ENEMY:DWORD
COMM	_rot_mat:BYTE:024H
COMM	_EXPLOSION_SHARD:DWORD
COMM	_ASTEROID:DWORD
COMM	_pos_delta:BYTE:0cH
COMM	_TURRET_PLATFORM:DWORD
COMM	_laser_velocity:BYTE:0cH
COMM	_TURRET:DWORD
COMM	_SND_EXPLODE:DWORD
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
_DATA	ENDS
PUBLIC	_explode_at
EXTRN	_rand:NEAR
EXTRN	_play_soundfx:NEAR
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
;	COMDAT _explode_at
_TEXT	SEGMENT
; File src\blazer2.c
_pos$ = 8
_explode_at PROC NEAR					; COMDAT
; Line 57
	push	ebx
	push	esi
	push	edi
	mov	esi, 64					; 00000040H
	mov	edi, DWORD PTR _pos$[esp+8]
; Line 61
$L451:
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
	mov	ecx, DWORD PTR [edi+8]
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	add	ecx, eax
	sub	ecx, 128				; 00000080H
	push	ecx
	call	_rand
	cdq
	xor	eax, edx
	mov	ecx, DWORD PTR [edi+4]
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	add	ecx, eax
	sub	ecx, 128				; 00000080H
	push	ecx
	call	_rand
	cdq
	xor	eax, edx
	mov	ecx, DWORD PTR [edi]
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	add	ecx, eax
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	sub	ecx, 128				; 00000080H
	push	ecx
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	lea	ebx, DWORD PTR _StarblazerEntities[eax*4]
; Line 63
	call	_rand
	cdq
	xor	eax, edx
	mov	ecx, DWORD PTR [ebx]
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	lea	eax, DWORD PTR [eax+eax*2]
	sub	eax, 384				; 00000180H
	mov	DWORD PTR [ecx+36], eax
; Line 64
	call	_rand
	cdq
	xor	eax, edx
	mov	ecx, DWORD PTR [ebx]
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	lea	eax, DWORD PTR [eax+eax*2]
	sub	eax, 384				; 00000180H
	mov	DWORD PTR [ecx+40], eax
; Line 65
	call	_rand
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 255				; 000000ffH
	xor	eax, edx
	sub	eax, edx
	lea	ecx, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR [ebx]
	sub	ecx, 384				; 00000180H
	dec	esi
	mov	DWORD PTR [eax+44], ecx
	jne	$L451
; Line 68
	mov	eax, DWORD PTR _SND_EXPLODE
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 69
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_explode_at ENDP
_TEXT	ENDS
PUBLIC	_explode_entity
EXTRN	_free:NEAR
;	COMDAT _explode_entity
_TEXT	SEGMENT
_ptr$ = 8
_pos$ = -12
_explode_entity PROC NEAR				; COMDAT
; Line 71
	sub	esp, 12					; 0000000cH
	push	esi
	push	edi
	mov	esi, DWORD PTR _ptr$[esp+16]
	lea	edi, DWORD PTR _pos$[esp+20]
	mov	edx, DWORD PTR [esi]
; Line 72
	lea	ecx, DWORD PTR [edx+4]
	push	edx
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edi], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edi+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edi+8], ecx
; Line 73
	call	_free
	lea	edi, DWORD PTR _pos$[esp+24]
	add	esp, 4
; Line 74
	mov	DWORD PTR [esi], 0
; Line 75
	push	edi
	call	_explode_at
	add	esp, 4
; Line 76
	pop	edi
	pop	esi
	add	esp, 12					; 0000000cH
	ret	0
_explode_entity ENDP
_TEXT	ENDS
PUBLIC	_print_vec
PUBLIC	??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@ ; `string'
EXTRN	_printf:NEAR
;	COMDAT ??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@
_DATA	SEGMENT
??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@ DB '(%d, %d, %d)', 0aH
	DB	00H						; `string'
_DATA	ENDS
;	COMDAT _print_vec
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR					; COMDAT
; Line 79
	mov	ecx, DWORD PTR _vec$[esp-4]
	mov	eax, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR [ecx+4]
	push	eax
	mov	ecx, DWORD PTR [ecx]
	push	edx
	push	ecx
	push	OFFSET FLAT:??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@ ; `string'
	call	_printf
	add	esp, 16					; 00000010H
; Line 80
	ret	0
_print_vec ENDP
_TEXT	ENDS
PUBLIC	_step_entity
EXTRN	_vec3_add:NEAR
EXTRN	_mat3_mul:NEAR
EXTRN	_quat_tomat:NEAR
;	COMDAT _step_entity
_TEXT	SEGMENT
_ent$ = 8
_vel$ = 12
_step_entity PROC NEAR					; COMDAT
; Line 82
	push	esi
; Line 83
	push	OFFSET FLAT:_rot_mat
	mov	esi, DWORD PTR _ent$[esp+4]
	lea	eax, DWORD PTR [esi+16]
	push	eax
	call	_quat_tomat
	mov	eax, DWORD PTR _vel$[esp+8]
	add	esp, 8
; Line 84
	add	esi, 4
	push	OFFSET FLAT:_pos_delta
	push	eax
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 85
	push	esi
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 86
	pop	esi
	ret	0
_step_entity ENDP
_TEXT	ENDS
PUBLIC	_draw_stars
EXTRN	_plotpoint_3d:NEAR
;	COMDAT _draw_stars
_TEXT	SEGMENT
_draw_stars PROC NEAR					; COMDAT
; Line 88
	push	esi
	mov	esi, OFFSET FLAT:_title_stars
; Line 90
$L471:
; Line 91
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [esi+4]
	mov	edx, DWORD PTR [esi]
	push	255					; 000000ffH
	push	eax
	add	esi, 12					; 0000000cH
	push	ecx
	push	edx
	call	_plotpoint_3d
	add	esp, 16					; 00000010H
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jb	SHORT $L471
; Line 93
	pop	esi
	ret	0
_draw_stars ENDP
_TEXT	ENDS
PUBLIC	_fire_laser
;	COMDAT _fire_laser
_TEXT	SEGMENT
_fire_laser PROC NEAR					; COMDAT
; Line 96
	push	0
	mov	eax, DWORD PTR _StarblazerEntities
	push	0
	push	0
	mov	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR [eax+8]
	push	ecx
	push	edx
	mov	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR _player_weapon+12
	push	ecx
	push	edx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	lea	edx, DWORD PTR _StarblazerEntities[eax*4]
; Line 97
	mov	ecx, DWORD PTR [edx]
	mov	DWORD PTR [ecx+32], 280			; 00000118H
; Line 98
	mov	eax, DWORD PTR _player_weapon+8
	mov	ecx, DWORD PTR [edx]
	mov	DWORD PTR [ecx+92], eax
; Line 99
	mov	ecx, DWORD PTR _StarblazerEntities
	add	ecx, 16					; 00000010H
	mov	edx, DWORD PTR [edx]
	add	edx, 16					; 00000010H
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], eax
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+12], ecx
; Line 100
	mov	edx, DWORD PTR _SND_LASER
	mov	BYTE PTR _firing, 1
; Line 101
	push	edx
	call	_play_soundfx
	add	esp, 4
; Line 102
	ret	0
_fire_laser ENDP
_TEXT	ENDS
PUBLIC	_cam_script
;	COMDAT _cam_script
_TEXT	SEGMENT
_ptr$ = 8
_cam_script PROC NEAR					; COMDAT
; Line 105
	mov	eax, DWORD PTR _ptr$[esp-4]
	push	OFFSET FLAT:_velocity
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 106
	ret	0
_cam_script ENDP
_TEXT	ENDS
PUBLIC	_init_star
;	COMDAT _init_star
_TEXT	SEGMENT
_star$ = 8
_init_star PROC NEAR					; COMDAT
; Line 108
	push	esi
; Line 109
	call	_rand
	mov	ecx, 2000				; 000007d0H
	mov	esi, DWORD PTR _star$[esp]
	cdq
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi], edx
; Line 110
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi+4], edx
; Line 111
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi+8], edx
; Line 112
	pop	esi
	ret	0
_init_star ENDP
_TEXT	ENDS
PUBLIC	_spawn_asteroid
;	COMDAT _spawn_asteroid
_TEXT	SEGMENT
_spawn_asteroid PROC NEAR				; COMDAT
; Line 114
	push	ebx
	push	esi
	push	edi
; Line 117
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	lea	edi, DWORD PTR [edx-250]
	call	_rand
	shl	edi, 16					; 00000010H
	mov	ecx, 500				; 000001f4H
; Line 118
	cdq
	idiv	ecx
	lea	ebx, DWORD PTR [edx-250]
	call	_rand
	shl	ebx, 16					; 00000010H
	mov	ecx, 500				; 000001f4H
; Line 119
	cdq
	idiv	ecx
	lea	esi, DWORD PTR [edx-250]
	call	_rand
	cdq
	shl	esi, 16					; 00000010H
	xor	eax, edx
; Line 121
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
	push	esi
	push	ebx
	mov	eax, DWORD PTR _ASTEROID
	push	edi
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
; Line 123
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_spawn_asteroid ENDP
_TEXT	ENDS
PUBLIC	_ax5_script
;	COMDAT _ax5_script
_TEXT	SEGMENT
_ax5_script PROC NEAR					; COMDAT
; Line 131
	ret	0
_ax5_script ENDP
_TEXT	ENDS
PUBLIC	_enemy_laser_script
EXTRN	_test_collisions:NEAR
;	COMDAT _enemy_laser_script
_TEXT	SEGMENT
_ptr$ = 8
_enemy_laser_script PROC NEAR				; COMDAT
; Line 133
	push	esi
; Line 135
	push	OFFSET FLAT:_laser_velocity
	mov	esi, DWORD PTR _ptr$[esp+4]
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_step_entity
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 136
	dec	DWORD PTR [eax+32]
; Line 139
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR _StarblazerEntities
	push	ecx
	push	eax
	call	_test_collisions
	add	esp, 8
	test	al, al
	je	SHORT $L493
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [esi]
; Line 140
	mov	edx, DWORD PTR [eax+92]
	sub	DWORD PTR [ecx+96], edx
; Line 141
	mov	edx, DWORD PTR _SND_HIT
	mov	DWORD PTR _shake_frames, 7
; Line 142
	mov	eax, DWORD PTR [esi]
	push	edx
	mov	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _impact_id, ecx
; Line 143
	call	_play_soundfx
	add	esp, 4
	mov	ecx, DWORD PTR [esi]
; Line 144
	push	ecx
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 146
	pop	esi
	ret	0
; Line 149
$L493:
	mov	eax, DWORD PTR [esi]
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L491
; Line 150
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 153
$L491:
	pop	esi
	ret	0
_enemy_laser_script ENDP
_TEXT	ENDS
PUBLIC	_laser_script
;	COMDAT _laser_script
_TEXT	SEGMENT
_ptr$ = 8
_laser_script PROC NEAR					; COMDAT
; Line 155
	push	ebx
	push	esi
	mov	esi, DWORD PTR _ptr$[esp+4]
	push	edi
	push	ebp
; Line 158
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR [esi]
	xor	edi, edi
	push	eax
	mov	ebx, OFFSET FLAT:_StarblazerEntities
	mov	ebp, 1
	call	_step_entity
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 159
	dec	DWORD PTR [eax+32]
; Line 161
$L499:
	mov	ecx, DWORD PTR [ebx]
; Line 162
	test	ecx, ecx
	je	SHORT $L500
	mov	eax, DWORD PTR [esi]
	cmp	ecx, eax
	je	SHORT $L500
; Line 163
	mov	edx, DWORD PTR [ecx]
	test	DWORD PTR [edx+32], ebp
	je	SHORT $L500
; Line 164
	push	ecx
	push	eax
	call	_test_collisions
	add	esp, 8
	test	al, al
	jne	SHORT $L820
; Line 161
$L500:
	add	ebx, 4
	inc	edi
	cmp	ebx, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L499
	mov	eax, DWORD PTR [esi]
; Line 180
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L497
; Line 181
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 184
$L497:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
$L820:
	lea	ecx, DWORD PTR _StarblazerEntities[edi*4]
; Line 166
	mov	eax, DWORD PTR [ecx]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 167
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [eax+104], 7
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR [esi]
; Line 168
	mov	eax, DWORD PTR [edx+92]
	sub	DWORD PTR [ecx+96], eax
; Line 171
	mov	ecx, DWORD PTR _SND_HIT
	push	ecx
	call	_play_soundfx
	add	esp, 4
	mov	ecx, DWORD PTR [esi]
; Line 172
	push	ecx
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 174
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_laser_script ENDP
_TEXT	ENDS
PUBLIC	_asteroid_script
;	COMDAT _asteroid_script
_TEXT	SEGMENT
_ptr$ = 8
_asteroid_script PROC NEAR				; COMDAT
; Line 186
	push	esi
	mov	eax, DWORD PTR _StarblazerEntities
; Line 187
	mov	esi, DWORD PTR _ptr$[esp]
	push	eax
	mov	ecx, DWORD PTR [esi]
	push	ecx
	call	_test_collisions
	add	esp, 8
	test	al, al
	je	SHORT $L509
	mov	eax, DWORD PTR _StarblazerEntities
	push	esi
; Line 188
	sub	DWORD PTR [eax+96], 5
; Line 189
	mov	DWORD PTR _shake_frames, 7
; Line 190
	call	_explode_entity
	add	esp, 4
	mov	eax, DWORD PTR _SND_HIT
; Line 191
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 192
	pop	esi
	ret	0
; Line 195
$L509:
	mov	eax, DWORD PTR [esi]
	cmp	DWORD PTR [eax+96], 0
	jg	SHORT $L508
; Line 196
	push	esi
	call	_explode_entity
	add	esp, 4
; Line 198
$L508:
	pop	esi
	ret	0
_asteroid_script ENDP
_TEXT	ENDS
PUBLIC	_debris_script
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
;	COMDAT _debris_script
_TEXT	SEGMENT
_ptr$ = 8
_debris_script PROC NEAR				; COMDAT
; Line 200
	push	esi
	mov	esi, DWORD PTR _ptr$[esp]
	mov	eax, DWORD PTR [esi]
; Line 201
	mov	ecx, DWORD PTR [eax+36]
	shl	ecx, 6
	add	DWORD PTR [eax+4], ecx
	mov	eax, DWORD PTR [esi]
; Line 202
	mov	ecx, DWORD PTR [eax+40]
	shl	ecx, 6
	add	DWORD PTR [eax+8], ecx
	mov	eax, DWORD PTR [esi]
; Line 203
	mov	ecx, DWORD PTR [eax+44]
	shl	ecx, 6
	add	DWORD PTR [eax+12], ecx
; Line 204
	mov	eax, DWORD PTR [esi]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 205
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 206
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
; Line 208
	call	_rand
	cdq
	mov	ecx, 45					; 0000002dH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L513
; Line 210
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 213
$L513:
	pop	esi
	ret	0
_debris_script ENDP
_TEXT	ENDS
PUBLIC	_set_attributes
PUBLIC	??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@	; `string'
PUBLIC	??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@	; `string'
PUBLIC	??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@	; `string'
PUBLIC	??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@	; `string'
PUBLIC	??_C@_0BB@BOHA@assets?1shard?4obj?$AA@		; `string'
PUBLIC	??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@	; `string'
PUBLIC	??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@		; `string'
EXTRN	_create_hitbox:NEAR
EXTRN	_load_model:NEAR
;	COMDAT ??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@
_DATA	SEGMENT
??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@ DB 'assets/shreder2.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@
_DATA	SEGMENT
??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@ DB 'assets/dragon2.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@
_DATA	SEGMENT
??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@ DB 'assets/shreder1.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@
_DATA	SEGMENT
??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@ DB 'assets/dragon1.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BB@BOHA@assets?1shard?4obj?$AA@
_DATA	SEGMENT
??_C@_0BB@BOHA@assets?1shard?4obj?$AA@ DB 'assets/shard.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@
_DATA	SEGMENT
??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@ DB 'assets/asterold.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@
_DATA	SEGMENT
??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ DB 'assets/hyper.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT _set_attributes
_TEXT	SEGMENT
_set_attributes PROC NEAR				; COMDAT
; Line 215
	push	ebx
	push	esi
; Line 216
	push	OFFSET FLAT:??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@ ; `string'
	mov	esi, OFFSET FLAT:_enemy_laser_script
	call	_load_model
	add	esp, 4
	xor	ebx, ebx
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+12, eax
; Line 217
	mov	DWORD PTR [eax+12], esi
; Line 218
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [eax+36], 239			; 000000efH
; Line 219
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	196608					; 00030000H
	mov	BYTE PTR [eax+37], bl
; Line 220
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	mov	DWORD PTR [eax+32], 2
; Line 221
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+8, 8
; Line 224
	push	OFFSET FLAT:??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+12, eax
; Line 225
	mov	DWORD PTR [eax+12], esi
; Line 226
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [eax+36], 207			; 000000cfH
; Line 227
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	196608					; 00030000H
	mov	BYTE PTR [eax+37], bl
; Line 228
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	mov	DWORD PTR [eax+32], 2
; Line 229
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	eax
	call	_create_hitbox
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+8, 2
	add	esp, 16					; 00000010H
; Line 232
	cmp	BYTE PTR _laser_type, bl
	jne	SHORT $L519
; Line 233
	push	OFFSET FLAT:??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 234
	mov	BYTE PTR [eax+36], 191			; 000000bfH
; Line 235
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 236
	mov	DWORD PTR _player_weapon+4, 7
; Line 237
	mov	DWORD PTR _player_weapon+8, 8
; Line 239
	jmp	SHORT $L521
$L519:
; Line 240
	push	OFFSET FLAT:??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 241
	mov	BYTE PTR [eax+36], 175			; 000000afH
; Line 242
	mov	DWORD PTR _player_weapon, 3
; Line 243
	mov	eax, 2
	mov	DWORD PTR _player_weapon+4, eax
	mov	DWORD PTR _player_weapon+8, eax
; Line 245
$L521:
; Line 247
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	esi, 2
	xor	ebx, ebx
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	DWORD PTR [eax+32], esi
; Line 248
	mov	eax, DWORD PTR _LASER_PLAYER
	push	196608					; 00030000H
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
; Line 249
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+37], bl
; Line 250
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	mov	DWORD PTR _player_fighter, 64		; 00000040H
	add	esp, 16					; 00000010H
	mov	eax, 40					; 00000028H
; Line 253
	mov	DWORD PTR _player_fighter+16, eax
	mov	DWORD PTR _player_fighter+20, eax
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _laser_velocity, ebx
	mov	DWORD PTR _player_weapon+12, ecx
	mov	DWORD PTR _laser_velocity+4, ebx
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 254
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 255
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 274
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 276
	push	OFFSET FLAT:??_C@_0BB@BOHA@assets?1shard?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 277
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 278
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	ebx
	mov	DWORD PTR [eax+32], esi
; Line 279
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	ebx
	push	ebx
	mov	BYTE PTR [eax+36], 127			; 0000007fH
; Line 280
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+37], bl
; Line 281
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 283
	mov	esi, 3
	push	OFFSET FLAT:??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 284
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 285
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+32], esi
; Line 286
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 287
	mov	eax, DWORD PTR _ASTEROID
	push	327680					; 00050000H
	mov	BYTE PTR [eax+36], 250			; 000000faH
; Line 288
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+37], bl
; Line 289
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 291
	push	OFFSET FLAT:??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _AX5, eax
; Line 292
	mov	DWORD PTR [eax+12], OFFSET FLAT:_ax5_script
; Line 293
	mov	eax, DWORD PTR _AX5
	push	458752					; 00070000H
	mov	DWORD PTR [eax+32], esi
; Line 294
	mov	eax, DWORD PTR _AX5
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	DWORD PTR [eax+28], ebx
; Line 295
	mov	eax, DWORD PTR _AX5
	mov	BYTE PTR [eax+37], 1
; Line 296
	mov	eax, DWORD PTR _AX5
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 297
	pop	esi
	pop	ebx
	ret	0
_set_attributes ENDP
_TEXT	ENDS
PUBLIC	_blazer2_init
PUBLIC	_blazer2_module
PUBLIC	_blazer2_draw
PUBLIC	??_C@_0M@KHLK@sfx?1net?4wav?$AA@		; `string'
PUBLIC	??_C@_0BA@HMID@sfx?1explode?4wav?$AA@		; `string'
PUBLIC	??_C@_0O@OLEL@sfx?1laser?4wav?$AA@		; `string'
PUBLIC	??_C@_0M@LLEG@sfx?1hit?4wav?$AA@		; `string'
EXTRN	_shading:BYTE
EXTRN	_init_hypercraft:NEAR
EXTRN	_stop_music:NEAR
EXTRN	_play_music:NEAR
EXTRN	_load_soundfx:NEAR
EXTRN	_sfx_enable:BYTE
EXTRN	_SL_CENTER_X:WORD
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_SG_Draw:DWORD
EXTRN	_SG_Module:DWORD
;	COMDAT ??_C@_0M@KHLK@sfx?1net?4wav?$AA@
_DATA	SEGMENT
??_C@_0M@KHLK@sfx?1net?4wav?$AA@ DB 'sfx/net.wav', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BA@HMID@sfx?1explode?4wav?$AA@
_DATA	SEGMENT
??_C@_0BA@HMID@sfx?1explode?4wav?$AA@ DB 'sfx/explode.wav', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0O@OLEL@sfx?1laser?4wav?$AA@
_DATA	SEGMENT
??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ DB 'sfx/laser.wav', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@LLEG@sfx?1hit?4wav?$AA@
_DATA	SEGMENT
??_C@_0M@LLEG@sfx?1hit?4wav?$AA@ DB 'sfx/hit.wav', 00H	; `string'
_DATA	ENDS
;	COMDAT _blazer2_init
_TEXT	SEGMENT
_blazer2_init PROC NEAR					; COMDAT
; Line 306
	mov	BYTE PTR _shading, 1
	push	esi
; Line 309
	xor	esi, esi
	mov	DWORD PTR _frames, esi
; Line 313
	call	_stop_music
; Line 314
	push	OFFSET FLAT:??_C@_0M@KHLK@sfx?1net?4wav?$AA@ ; `string'
	call	_play_music
	add	esp, 4
	mov	BYTE PTR _sfx_enable, 1
; Line 316
	push	esi
	push	1
	push	OFFSET FLAT:??_C@_0BA@HMID@sfx?1explode?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_EXPLODE, eax
; Line 317
	push	esi
	push	2
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER, eax
; Line 318
	push	esi
	push	3
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER_ENEMY, eax
; Line 319
	push	esi
	push	1
	push	OFFSET FLAT:??_C@_0M@LLEG@sfx?1hit?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_HIT, eax
; Line 322
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 323
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 325
	call	_set_attributes
; Line 327
	mov	WORD PTR _cam_template+8, si
	mov	DWORD PTR _cam_template, esi
; Line 328
	mov	WORD PTR _cam_template+10, si
	mov	ecx, DWORD PTR _player_fighter
	push	458752					; 00070000H
	mov	DWORD PTR _cam_template+4, esi
; Line 331
	push	131072					; 00020000H
	mov	DWORD PTR _cam_template+28, ecx
	push	196608					; 00030000H
	mov	esi, OFFSET FLAT:_title_stars
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 333
	mov	DWORD PTR _cam_template+32, 2
; Line 335
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 338
$L536:
; Line 339
	push	esi
	call	_init_star
	add	esp, 4
	add	esi, 12					; 0000000cH
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jb	SHORT $L536
; Line 340
	mov	esi, OFFSET FLAT:_StarblazerEntities
; Line 343
$L539:
; Line 344
	mov	eax, DWORD PTR [esi]
	add	esi, 4
	push	eax
	call	_free
	mov	DWORD PTR [esi-4], 0
	add	esp, 4
; Line 345
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L539
; Line 349
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
	mov	eax, DWORD PTR _player_fighter+16
; Line 352
	cmp	BYTE PTR _multiplayer, 0
	mov	DWORD PTR _player_boost, eax
; Line 353
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 358
	jne	SHORT $L542
	mov	esi, 100				; 00000064H
; Line 359
$L543:
; Line 360
	call	_spawn_asteroid
	dec	esi
	jne	SHORT $L543
; Line 365
$L542:
	xor	eax, eax
	mov	ecx, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity, eax
	mov	DWORD PTR _velocity+4, eax
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 366
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 370
	mov	DWORD PTR _velocity+8, ecx
; Line 372
	call	_init_hypercraft
; Line 373
	pop	esi
	ret	0
_blazer2_init ENDP
_TEXT	ENDS
PUBLIC	_angle_multiply
;	COMDAT _angle_multiply
_TEXT	SEGMENT
_angle$ = 8
_joy_amount$ = 12
_angle_multiply PROC NEAR				; COMDAT
; Line 376
	xor	eax, eax
	mov	al, BYTE PTR _angle$[esp-4]
	movsx	ecx, BYTE PTR _joy_amount$[esp-4]
	imul	eax, ecx
	mov	al, ah
; Line 377
	ret	0
_angle_multiply ENDP
_TEXT	ENDS
PUBLIC	_vjoy_read
EXTRN	_SG_ReadMouse:NEAR
EXTRN	_SG_KeyDown:NEAR
;	COMDAT _vjoy_read
_TEXT	SEGMENT
_joy$ = 8
_mouse$ = -8
_vjoy_read PROC NEAR					; COMDAT
; Line 379
	sub	esp, 8
	lea	eax, DWORD PTR _mouse$[esp+8]
	push	esi
; Line 383
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 385
	push	74					; 0000004aH
	call	_SG_KeyDown
	mov	esi, DWORD PTR _joy$[esp+12]
	add	esp, 4
	push	75					; 0000004bH
	mov	BYTE PTR [esi+3], al
; Line 386
	mov	BYTE PTR [esi+7], 0
; Line 387
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi+6], al
; Line 388
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi+5], al
; Line 391
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L552
; Line 392
	mov	BYTE PTR [esi], 127			; 0000007fH
; Line 394
	jmp	SHORT $L553
$L552:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi], -127			; ffffff81H
	test	al, al
	jne	SHORT $L553
; Line 398
	mov	BYTE PTR [esi], 0
; Line 399
$L553:
; Line 402
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L556
; Line 403
	mov	BYTE PTR [esi+1], 127			; 0000007fH
; Line 405
	jmp	SHORT $L557
$L556:
	push	68					; 00000044H
	call	_SG_KeyDown
	mov	BYTE PTR [esi+1], -127			; ffffff81H
	add	esp, 4
	test	al, al
	jne	SHORT $L557
; Line 409
	mov	BYTE PTR [esi+1], 0
; Line 410
$L557:
; Line 413
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L560
; Line 414
	mov	BYTE PTR [esi+2], -127			; ffffff81H
; Line 416
	pop	esi
	add	esp, 8
	ret	0
$L560:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L562
; Line 417
	mov	BYTE PTR [esi+2], 127			; 0000007fH
; Line 419
	pop	esi
	add	esp, 8
	ret	0
$L562:
; Line 420
	mov	BYTE PTR [esi+2], 0
; Line 430
	pop	esi
	add	esp, 8
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
;	COMDAT _respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR				; COMDAT
; Line 449
	mov	eax, DWORD PTR _player_fighter
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+96], eax
; Line 450
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+4], edx
; Line 451
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+8], edx
; Line 452
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+12], edx
; Line 453
	ret	0
_respawn_player ENDP
_TEXT	ENDS
EXTRN	_BG_COLOR:BYTE
EXTRN	_timeout:DWORD
EXTRN	_net_syncstate:NEAR
EXTRN	_run_entity_scripts:NEAR
;	COMDAT _blazer2_module
_TEXT	SEGMENT
_joy$ = -8
_blazer2_module PROC NEAR				; COMDAT
; Line 455
	sub	esp, 8
; Line 458
	lea	eax, DWORD PTR _joy$[esp+8]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 460
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L571
; Line 461
	mov	BYTE PTR _BG_COLOR, 0
; Line 464
$L571:
	mov	eax, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [eax+96], 0
	jg	SHORT $L572
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L844
; Line 465
	mov	eax, DWORD PTR _SND_EXPLODE
	push	eax
	call	_play_soundfx
	add	esp, 4
	mov	eax, DWORD PTR _timeout
; Line 466
	mov	DWORD PTR _frames_respawning, eax
	test	eax, eax
	mov	BYTE PTR _dying, 1
; Line 468
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
; Line 470
	jne	SHORT $L572
; Line 471
	call	_respawn_player
; Line 475
$L572:
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L574
$L844:
; Line 476
	lea	eax, DWORD PTR _joy$[esp+8]
	dec	DWORD PTR _frames_respawning
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 0
; Line 479
	jne	SHORT $L574
; Line 480
	call	_respawn_player
; Line 484
$L574:
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L576
; Line 485
	dec	DWORD PTR _shake_frames
; Line 489
$L576:
	mov	eax, DWORD PTR _StarblazerEntities
	mov	cl, BYTE PTR _joy$[esp+8]
	add	eax, 16					; 00000010H
	mov	dl, BYTE PTR _player_fighter+4
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
	mov	cl, BYTE PTR _joy$[esp+17]
	add	esp, 8
; Line 490
	mov	eax, DWORD PTR _StarblazerEntities
	mov	dl, BYTE PTR _player_fighter+4
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
	mov	cl, BYTE PTR _joy$[esp+18]
	add	esp, 8
; Line 491
	mov	eax, DWORD PTR _StarblazerEntities
	mov	dl, BYTE PTR _player_fighter+4
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
	add	esp, 8
; Line 493
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L577
; Line 494
	cmp	BYTE PTR _shading, 1
	sbb	al, al
	neg	al
	mov	BYTE PTR _shading, al
; Line 498
$L577:
	cmp	BYTE PTR _joy$[esp+11], 0
	je	SHORT $L578
	mov	eax, DWORD PTR _player_weapon+4
	cmp	DWORD PTR _player_battery, eax
	jb	SHORT $L578
	cmp	DWORD PTR _firing_cooldown, 0
	jne	SHORT $L578
; Line 499
	mov	ecx, DWORD PTR _player_weapon
	sub	DWORD PTR _player_battery, eax
; Line 500
	mov	DWORD PTR _firing_cooldown, ecx
; Line 501
	call	_fire_laser
; Line 503
	jmp	SHORT $L579
$L578:
; Line 504
	mov	BYTE PTR _firing, 0
; Line 505
	mov	eax, DWORD PTR _player_fighter+20
	cmp	DWORD PTR _player_battery, eax
	jae	SHORT $L580
; Line 506
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L580
	inc	DWORD PTR _player_battery
; Line 508
$L580:
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	SHORT $L579
; Line 509
	dec	DWORD PTR _firing_cooldown
; Line 511
$L579:
; Line 514
	cmp	BYTE PTR _joy$[esp+13], 0
	je	SHORT $L583
	cmp	BYTE PTR _boost_overheating, 0
	jne	SHORT $L583
; Line 515
	mov	eax, DWORD PTR _player_fighter+12
	mov	ecx, 5
	mov	DWORD PTR _velocity+8, eax
; Line 516
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L585
	dec	DWORD PTR _player_boost
; Line 518
	jmp	SHORT $L585
$L583:
	cmp	BYTE PTR _joy$[esp+14], 0
	je	SHORT $L586
	cmp	BYTE PTR _boost_overheating, 0
	jne	SHORT $L586
; Line 519
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	mov	DWORD PTR _velocity+8, 0
; Line 520
	test	edx, edx
	jne	SHORT $L585
	dec	DWORD PTR _player_boost
; Line 522
	jmp	SHORT $L585
$L586:
; Line 523
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L589
; Line 524
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 526
	jmp	SHORT $L590
$L589:
; Line 527
	mov	DWORD PTR _velocity+8, 0
; Line 528
$L590:
; Line 529
	mov	eax, DWORD PTR _player_fighter+16
	cmp	DWORD PTR _player_boost, eax
	jae	SHORT $L585
; Line 530
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L585
	inc	DWORD PTR _player_boost
; Line 532
$L585:
; Line 536
	cmp	BYTE PTR _multiplayer, 0
	je	SHORT $L593
; Line 537
	call	_net_syncstate
; Line 540
$L593:
	call	_run_entity_scripts
; Line 543
	cmp	DWORD PTR _player_boost, 0
	jne	SHORT $L594
; Line 544
	mov	BYTE PTR _boost_overheating, 1
; Line 546
$L594:
	mov	eax, DWORD PTR _player_fighter+16
	shr	eax, 1
	cmp	eax, DWORD PTR _player_boost
	ja	SHORT $L595
; Line 547
	mov	BYTE PTR _boost_overheating, 0
; Line 551
$L595:
	add	DWORD PTR _barcycle, 2
	inc	DWORD PTR _frames
; Line 555
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	SHORT $L596
	mov	DWORD PTR _barcycle, 0
; Line 558
$L596:
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L597
; Line 559
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	dx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_X, dx
; Line 560
	call	_rand
	mov	ecx, 20					; 00000014H
	add	esp, 8
	cdq
	idiv	ecx
	sub	dx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_Y, dx
; Line 562
	ret	0
$L597:
; Line 563
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 564
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 566
	add	esp, 8
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
;	COMDAT _blazer2_screencrack
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR				; COMDAT
; Line 569
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 570
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 571
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 572
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 573
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 574
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 575
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 576
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 577
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 578
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 579
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 580
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 581
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 582
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 583
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 584
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 585
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
;	COMDAT _count_entities
_TEXT	SEGMENT
_count_entities PROC NEAR				; COMDAT
; Line 590
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_StarblazerEntities
; Line 592
$L606:
; Line 593
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L607
	inc	eax
; Line 592
$L607:
	add	ecx, 4
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L606
; Line 597
	ret	0
_count_entities ENDP
_TEXT	ENDS
PUBLIC	_draw_debug
PUBLIC	??_C@_03FBAE@ENT?$AA@				; `string'
PUBLIC	??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@		; `string'
PUBLIC	??_C@_03FKCM@TRI?$AA@				; `string'
PUBLIC	??_C@_03FKNI@FPS?$AA@				; `string'
PUBLIC	??_C@_02MECO@?$CFd?$AA@				; `string'
PUBLIC	??_C@_03HFLF@INF?$AA@				; `string'
PUBLIC	??_C@_08NNKG@?$CFd?5?$CFd?5?$CFd?$AA@		; `string'
PUBLIC	??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@	; `string'
EXTRN	_LAST_FRAME_TIME:DWORD
EXTRN	_vputs:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_SL_VERTEX_INDEX:WORD
EXTRN	_SL_TRIANGLE_INDEX:WORD
;	COMDAT ??_C@_03FBAE@ENT?$AA@
_DATA	SEGMENT
??_C@_03FBAE@ENT?$AA@ DB 'ENT', 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@
_DATA	SEGMENT
??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ DB '%d / %d', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_03FKCM@TRI?$AA@
_DATA	SEGMENT
??_C@_03FKCM@TRI?$AA@ DB 'TRI', 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_03FKNI@FPS?$AA@
_DATA	SEGMENT
??_C@_03FKNI@FPS?$AA@ DB 'FPS', 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_02MECO@?$CFd?$AA@
_DATA	SEGMENT
??_C@_02MECO@?$CFd?$AA@ DB '%d', 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_03HFLF@INF?$AA@
_DATA	SEGMENT
??_C@_03HFLF@INF?$AA@ DB 'INF', 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_08NNKG@?$CFd?5?$CFd?5?$CFd?$AA@
_DATA	SEGMENT
??_C@_08NNKG@?$CFd?5?$CFd?5?$CFd?$AA@ DB '%d %d %d', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@
_DATA	SEGMENT
??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@ DB 'VERT %d / %d', 00H ; `string'
_DATA	ENDS
;	COMDAT _draw_debug
_TEXT	SEGMENT
_num$ = -100
_draw_debug PROC NEAR					; COMDAT
; Line 600
	sub	esp, 100				; 00000064H
; Line 604
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:??_C@_03FBAE@ENT?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 605
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	lea	eax, DWORD PTR _num$[esp+112]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 606
	lea	eax, DWORD PTR _num$[esp+100]
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	15					; 0000000fH
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 608
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:??_C@_03FKCM@TRI?$AA@	; `string'
	call	_vputs
	lea	ecx, DWORD PTR _num$[esp+128]
	add	esp, 28					; 0000001cH
; Line 609
	xor	eax, eax
	push	2500					; 000009c4H
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 610
	lea	ecx, DWORD PTR _num$[esp+100]
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	15					; 0000000fH
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 612
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:??_C@_03FKNI@FPS?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 613
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	SHORT $L619
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	lea	eax, DWORD PTR _num$[esp+108]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	jmp	SHORT $L621
$L619:
; Line 614
	lea	eax, DWORD PTR _num$[esp+100]
	push	OFFSET FLAT:??_C@_03HFLF@INF?$AA@	; `string'
	push	eax
	call	_sprintf
	add	esp, 8
; Line 615
$L621:
; Line 616
	lea	eax, DWORD PTR _num$[esp+100]
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	15					; 0000000fH
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
	mov	eax, DWORD PTR _StarblazerEntities
; Line 619
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [eax+12]
	sar	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR [ecx+8]
	sar	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR [ecx+4]
	sar	eax, 16					; 00000010H
	lea	ecx, DWORD PTR _num$[esp+108]
	push	eax
	push	OFFSET FLAT:??_C@_08NNKG@?$CFd?5?$CFd?5?$CFd?$AA@ ; `string'
	push	ecx
	call	_sprintf
	add	esp, 20					; 00000014H
; Line 620
	lea	ecx, DWORD PTR _num$[esp+100]
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	0
	push	240					; 000000f0H
	push	ecx
	call	_vputs
	lea	edx, DWORD PTR _num$[esp+128]
	add	esp, 28					; 0000001cH
; Line 622
	xor	ecx, ecx
	push	2500					; 000009c4H
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	push	ecx
	push	OFFSET FLAT:??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 623
	lea	ecx, DWORD PTR _num$[esp+100]
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	7
	push	240					; 000000f0H
	push	ecx
	call	_vputs
; Line 624
	add	esp, 128				; 00000080H
	ret	0
_draw_debug ENDP
_TEXT	ENDS
PUBLIC	_draw_HPbar
EXTRN	_drawline:NEAR
;	COMDAT _draw_HPbar
_TEXT	SEGMENT
_pos2$ = -16
_pos3$ = -12
_pos4$ = -8
_draw_HPbar PROC NEAR					; COMDAT
; Line 626
	sub	esp, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	push	ebx
	mov	eax, DWORD PTR [eax+96]
	push	esi
	mov	ecx, 40					; 00000028H
	push	edi
	lea	edx, DWORD PTR [eax+eax*4]
	push	ebp
	mov	ebx, DWORD PTR _barcycle
; Line 632
	sar	ebx, 3
	lea	eax, DWORD PTR [eax+edx*4]
	lea	eax, DWORD PTR [eax+eax*4]
	lea	ebp, DWORD PTR [ebx*2+8]
	cdq
	idiv	ecx
	add	ebx, 8
	xor	edi, edi
	lea	esi, DWORD PTR [eax+16]
; Line 634
	mov	eax, ebx
	sub	eax, esi
	lea	ecx, DWORD PTR [eax*2+24]
	mov	DWORD PTR -4+[esp+32], ecx
$L635:
; Line 635
	movsx	edx, BYTE PTR _barcolors[edi]
; Line 636
	cmp	ebx, esi
	jg	SHORT $L637
; Line 637
	mov	ecx, 24					; 00000018H
	mov	DWORD PTR _pos2$[esp+32], ebx
; Line 639
	mov	DWORD PTR _pos3$[esp+32], 8
	add	ebx, 8
; Line 640
	mov	DWORD PTR _pos4$[esp+32], ebx
	cmp	esi, ebx
; Line 641
	jge	SHORT $L639
; Line 643
	mov	eax, DWORD PTR -4+[esp+32]
	mov	DWORD PTR _pos4$[esp+32], esi
	mov	DWORD PTR _pos3$[esp+32], eax
; Line 646
$L639:
	cmp	ebp, 24					; 00000018H
	jge	SHORT $L640
; Line 647
	mov	DWORD PTR _pos2$[esp+32], 16		; 00000010H
	mov	ecx, ebp
; Line 650
$L640:
	mov	eax, DWORD PTR _pos4$[esp+32]
	push	edx
	mov	edx, DWORD PTR _pos3$[esp+36]
	push	eax
	mov	eax, DWORD PTR _pos2$[esp+40]
	push	edx
	push	eax
	add	ebp, 16					; 00000010H
	push	ecx
	inc	edi
	call	_drawline
	add	DWORD PTR -4+[esp+52], 16		; 00000010H
	add	esp, 20					; 00000014H
; Line 634
	cmp	edi, 22					; 00000016H
	jl	SHORT $L635
; Line 652
$L637:
; Line 653
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 654
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 655
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 656
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 657
	push	255					; 000000ffH
	push	esi
	push	24					; 00000018H
	push	esi
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 658
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_draw_HPbar ENDP
_TEXT	ENDS
PUBLIC	_draw_crosshair
EXTRN	_bitset_pixel:NEAR
;	COMDAT _draw_crosshair
_TEXT	SEGMENT
_draw_crosshair PROC NEAR				; COMDAT
; Line 660
	push	ebx
	push	esi
	push	edi
	xor	ebx, ebx
; Line 662
$L645:
	lea	edi, DWORD PTR [ebx+150]
	push	175					; 000000afH
; Line 665
	push	90					; 0000005aH
	mov	esi, 170				; 000000aaH
	push	edi
	sub	esi, ebx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 666
	push	175					; 000000afH
	push	90					; 0000005aH
	push	esi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 667
	push	175					; 000000afH
	push	110					; 0000006eH
	push	edi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
	lea	edi, DWORD PTR [ebx+90]
; Line 668
	push	175					; 000000afH
	push	110					; 0000006eH
	push	esi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
	mov	esi, 110				; 0000006eH
; Line 669
	sub	esi, ebx
	push	175					; 000000afH
	push	edi
	inc	ebx
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 670
	push	175					; 000000afH
	push	esi
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 671
	push	175					; 000000afH
	push	edi
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 672
	push	175					; 000000afH
	push	esi
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 662
	cmp	ebx, 7
	jl	$L645
; Line 675
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 676
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_draw_crosshair ENDP
_TEXT	ENDS
PUBLIC	_draw_boost_bar
;	COMDAT _draw_boost_bar
_TEXT	SEGMENT
_pos2$ = -16
_pos3$ = -12
_pos4$ = -8
_draw_boost_bar PROC NEAR				; COMDAT
; Line 679
	sub	esp, 16					; 00000010H
	mov	eax, DWORD PTR _player_boost
	push	ebx
	lea	ecx, DWORD PTR [eax+eax*4]
	push	esi
	mov	ebx, 5
	push	edi
	lea	eax, DWORD PTR [eax+ecx*4]
	push	ebp
	sub	edx, edx
; Line 684
	div	ebx
	mov	ebx, DWORD PTR _barcycle
	xor	edi, edi
	sar	ebx, 3
	lea	esi, DWORD PTR [eax+16]
; Line 685
	add	ebx, 8
; Line 686
	mov	eax, ebx
	lea	ebp, DWORD PTR [ebx*2+280]
	sub	eax, esi
	lea	edx, DWORD PTR [eax*2+312]
	mov	al, BYTE PTR _boost_overheating
	mov	DWORD PTR -4+[esp+32], edx
$L659:
; Line 687
	cmp	al, 1
	sbb	eax, eax
	and	eax, -64				; ffffffc0H
	add	eax, 223				; 000000dfH
; Line 688
	cmp	ebx, esi
	jg	SHORT $L661
; Line 689
	mov	ecx, 312				; 00000138H
	mov	DWORD PTR _pos2$[esp+32], ebx
; Line 691
	mov	DWORD PTR _pos3$[esp+32], 296		; 00000128H
	add	ebx, 8
; Line 692
	mov	DWORD PTR _pos4$[esp+32], ebx
	cmp	ebx, esi
; Line 693
	jle	SHORT $L663
; Line 695
	mov	edx, DWORD PTR -4+[esp+32]
	mov	DWORD PTR _pos4$[esp+32], esi
	mov	DWORD PTR _pos3$[esp+32], edx
; Line 698
$L663:
	cmp	ebp, 312				; 00000138H
	jge	SHORT $L664
; Line 699
	mov	DWORD PTR _pos2$[esp+32], 16		; 00000010H
	mov	ecx, ebp
; Line 702
$L664:
	mov	edx, DWORD PTR _pos3$[esp+32]
	push	eax
	mov	eax, DWORD PTR _pos4$[esp+36]
	add	ebp, 16					; 00000010H
	push	eax
	inc	edi
	mov	eax, DWORD PTR _pos2$[esp+40]
	push	edx
	push	eax
	push	ecx
	call	_drawline
	add	DWORD PTR -4+[esp+52], 16		; 00000010H
	add	esp, 20					; 00000014H
	mov	al, BYTE PTR _boost_overheating
; Line 686
	cmp	edi, 22					; 00000016H
	jl	SHORT $L659
; Line 704
$L661:
; Line 705
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 706
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 707
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 708
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 709
	push	255					; 000000ffH
	push	esi
	push	312					; 00000138H
	push	esi
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 710
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_draw_boost_bar ENDP
_TEXT	ENDS
PUBLIC	_draw_radar
EXTRN	_vec3_subtract:NEAR
EXTRN	_plot_pixel:NEAR
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
;	COMDAT _draw_radar
_TEXT	SEGMENT
_c$ = -32
_vector_pos$ = -12
_screen_coords$ = -24
_draw_radar PROC NEAR					; COMDAT
; Line 712
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
	xor	esi, esi
	push	ebp
; Line 717
$L675:
; Line 718
	xor	edi, edi
$L678:
; Line 719
	xor	ecx, ecx
; Line 721
	test	esi, esi
	je	SHORT $L682
	cmp	esi, 59					; 0000003bH
	je	SHORT $L682
	test	edi, edi
	je	SHORT $L682
	cmp	edi, 59					; 0000003bH
	jne	SHORT $L681
$L682:
	mov	ecx, 255				; 000000ffH
; Line 722
$L681:
	test	ecx, ecx
	jne	SHORT $L683
	lea	eax, DWORD PTR [esi+edi]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 1
	xor	eax, edx
	sub	eax, edx
	jne	SHORT $L679
; Line 723
$L683:
	push	ecx
	lea	eax, DWORD PTR [edi+10]
	push	eax
	lea	ecx, DWORD PTR [esi+130]
	push	ecx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 718
$L679:
	inc	edi
	cmp	edi, 60					; 0000003cH
	jl	SHORT $L678
; Line 717
	inc	esi
	cmp	esi, 60					; 0000003cH
	jl	SHORT $L675
; Line 728
	mov	edi, -1
$L685:
; Line 729
	mov	ebx, -1
	lea	esi, DWORD PTR [edi+160]
$L688:
; Line 730
	lea	eax, DWORD PTR [ebx+40]
	push	239					; 000000efH
	push	eax
	inc	ebx
	push	esi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 729
	cmp	ebx, 2
	jl	SHORT $L688
; Line 728
	inc	edi
	cmp	edi, 2
	jl	SHORT $L685
; Line 734
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	mov	DWORD PTR -28+[esp+68], OFFSET FLAT:_StarblazerEntities+4
	add	esp, 20					; 00000014H
; Line 737
$L691:
	mov	eax, DWORD PTR -28+[esp+48]
	mov	ecx, DWORD PTR [eax]
; Line 738
	test	ecx, ecx
	je	$L692
	mov	eax, DWORD PTR [ecx]
	test	BYTE PTR [eax+32], 2
	je	$L692
; Line 739
	mov	eax, DWORD PTR [ecx+4]
	add	ecx, 4
	lea	edx, DWORD PTR _vector_pos$[esp+48]
	push	edx
	mov	DWORD PTR [edx], eax
	mov	ebx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	mov	DWORD PTR [edx+4], ebx
	mov	ecx, DWORD PTR [ecx+8]
	push	eax
	mov	DWORD PTR [edx+8], ecx
; Line 740
	call	_vec3_subtract
	lea	ecx, DWORD PTR _screen_coords$[esp+56]
	lea	edx, DWORD PTR _vector_pos$[esp+56]
	add	esp, 8
; Line 741
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	mov	edi, DWORD PTR _screen_coords$[esp+60]
	mov	esi, DWORD PTR _screen_coords$[esp+68]
	sar	edi, 17					; 00000011H
	add	esp, 12					; 0000000cH
; Line 744
	sar	esi, 17					; 00000011H
; Line 746
	cmp	edi, 30					; 0000001eH
	jle	SHORT $L695
	mov	edi, 30					; 0000001eH
; Line 747
$L695:
	cmp	edi, -30				; ffffffe2H
	jge	SHORT $L696
	mov	edi, -30				; ffffffe2H
; Line 748
$L696:
	cmp	esi, 30					; 0000001eH
	jle	SHORT $L697
	mov	esi, 30					; 0000001eH
; Line 749
$L697:
	cmp	esi, -30				; ffffffe2H
	jge	SHORT $L698
	mov	esi, -30				; ffffffe2H
; Line 751
$L698:
	mov	eax, DWORD PTR -28+[esp+48]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ecx]
	cmp	BYTE PTR [eax+37], 0
	je	SHORT $L699
; Line 752
	cmp	DWORD PTR _screen_coords$[esp+52], 0
	mov	eax, 175				; 000000afH
	jge	SHORT $L881
	mov	eax, 223				; 000000dfH
$L881:
	mov	ebx, -1
	mov	DWORD PTR _c$[esp+48], eax
; Line 759
$L702:
; Line 760
	mov	ebp, -1
$L705:
	lea	eax, DWORD PTR [ebp+esi+40]
; Line 761
	test	eax, eax
	jl	SHORT $L706
; Line 762
	mov	ecx, DWORD PTR _c$[esp+48]
	push	ecx
	push	eax
	lea	eax, DWORD PTR [ebx+edi]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 760
$L706:
	inc	ebp
	cmp	ebp, 2
	jl	SHORT $L705
; Line 759
	inc	ebx
	cmp	ebx, 2
	jl	SHORT $L702
	jmp	SHORT $L692
; Line 766
$L699:
; Line 767
	mov	al, BYTE PTR [eax+36]
	add	esi, 40					; 00000028H
	and	eax, 255				; 000000ffH
	add	edi, 160				; 000000a0H
	push	eax
	push	esi
	push	edi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 737
$L692:
	add	DWORD PTR -28+[esp+48], 4
	cmp	DWORD PTR -28+[esp+48], OFFSET FLAT:_StarblazerEntities+4000
	jb	$L691
; Line 771
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 32					; 00000020H
	ret	0
_draw_radar ENDP
_TEXT	ENDS
PUBLIC	_draw_battery
;	COMDAT _draw_battery
_TEXT	SEGMENT
_draw_battery PROC NEAR					; COMDAT
; Line 773
	push	esi
	mov	eax, DWORD PTR _player_battery
	push	edi
	xor	esi, esi
; Line 776
	lea	edi, DWORD PTR [eax+eax*2]
	add	edi, edi
	shr	edi, 4
; Line 778
$L715:
; Line 779
	cmp	eax, esi
	jb	SHORT $L716
	lea	eax, DWORD PTR [esi+140]
	mov	ecx, edi
; Line 780
	or	ecx, 160				; 000000a0H
	push	ecx
	push	170					; 000000aaH
	push	eax
	push	160					; 000000a0H
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _player_battery
; Line 778
$L716:
	inc	esi
	cmp	esi, 40					; 00000028H
	jl	SHORT $L715
; Line 804
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 805
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 806
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 807
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 808
	pop	edi
	pop	esi
	ret	0
_draw_battery ENDP
_TEXT	ENDS
PUBLIC	_draw_nametags
PUBLIC	??_C@_06BCGP@PLAYER?$AA@			; `string'
EXTRN	_players:BYTE
EXTRN	_muldiv:NEAR
EXTRN	_SL_FOV_X:DWORD
EXTRN	_SL_FOV_Y:DWORD
;	COMDAT ??_C@_06BCGP@PLAYER?$AA@
_DATA	SEGMENT
??_C@_06BCGP@PLAYER?$AA@ DB 'PLAYER', 00H		; `string'
_DATA	ENDS
;	COMDAT _draw_nametags
_TEXT	SEGMENT
_vector_pos$ = -12
_screen_coords$ = -24
_draw_nametags PROC NEAR				; COMDAT
; Line 817
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
	mov	esi, OFFSET FLAT:_players
	push	ebp
	mov	edi, 65535				; 0000ffffH
	mov	ebx, 6553600				; 00640000H
; Line 821
$L724:
; Line 822
	cmp	BYTE PTR [esi], 1
	jne	$L725
; Line 823
	mov	eax, DWORD PTR [esi+4]
	lea	ecx, DWORD PTR _vector_pos$[esp+40]
	push	ecx
	mov	edx, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [edx+4]
	add	edx, 4
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ebp, DWORD PTR [edx+4]
	add	eax, 4
	mov	DWORD PTR [ecx+4], ebp
	mov	edx, DWORD PTR [edx+8]
	push	eax
	mov	DWORD PTR [ecx+8], edx
; Line 824
	call	_vec3_subtract
	lea	ecx, DWORD PTR _screen_coords$[esp+48]
	lea	edx, DWORD PTR _vector_pos$[esp+48]
	add	esp, 8
; Line 825
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	mov	ecx, DWORD PTR _screen_coords$[esp+60]
	mov	edx, DWORD PTR _screen_coords$[esp+52]
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _SL_FOV_X
; Line 827
	movsx	ebp, WORD PTR _SL_CENTER_X
	push	ecx
	push	eax
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	mov	edx, DWORD PTR _screen_coords$[esp+56]
	add	esp, 12					; 0000000cH
	sub	ebp, eax
	mov	ecx, DWORD PTR _SL_FOV_Y
	mov	eax, DWORD PTR _screen_coords$[esp+48]
	mov	DWORD PTR _screen_coords$[esp+40], ebp
	push	eax
; Line 828
	movsx	ebp, WORD PTR _SL_CENTER_Y
	push	ecx
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	add	esp, 12					; 0000000cH
	sub	ebp, eax
	cmp	DWORD PTR _screen_coords$[esp+48], edi
	mov	DWORD PTR _screen_coords$[esp+44], ebp
; Line 830
	jle	SHORT $L725
	cmp	DWORD PTR _screen_coords$[esp+48], ebx
	jge	SHORT $L725
; Line 831
	mov	eax, DWORD PTR _screen_coords$[esp+44]
	push	1
	mov	ecx, DWORD PTR _screen_coords$[esp+44]
	push	255					; 000000ffH
	push	1
	push	1
	push	eax
	push	ecx
	push	OFFSET FLAT:??_C@_06BCGP@PLAYER?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 821
$L725:
	add	esi, 32					; 00000020H
	cmp	esi, OFFSET FLAT:_players+512
	jb	$L724
; Line 835
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 24					; 00000018H
	ret	0
_draw_nametags ENDP
_TEXT	ENDS
PUBLIC	??_C@_0L@LPNF@RESPAWNING?$AA@			; `string'
PUBLIC	??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@		; `string'
EXTRN	_camera_translate:NEAR
EXTRN	_draw_hypercraft:NEAR
EXTRN	_set_hypercraft_orientation:NEAR
EXTRN	_draw_scene:NEAR
;	COMDAT ??_C@_0L@LPNF@RESPAWNING?$AA@
_DATA	SEGMENT
??_C@_0L@LPNF@RESPAWNING?$AA@ DB 'RESPAWNING', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@
_DATA	SEGMENT
??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@ DB ' IN %d SEC', 00H ; `string'
_DATA	ENDS
;	COMDAT _blazer2_draw
_TEXT	SEGMENT
_text$ = -80
_blazer2_draw PROC NEAR					; COMDAT
; Line 838
	sub	esp, 80					; 00000050H
	mov	eax, DWORD PTR _StarblazerEntities
; Line 842
	add	eax, 4
	push	eax
	call	_camera_translate
	add	esp, 4
	mov	eax, DWORD PTR _StarblazerEntities
; Line 843
	add	eax, 16					; 00000010H
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	eax
	call	_quat_tomat
	add	esp, 8
	mov	cl, BYTE PTR _shading
; Line 846
	push	500					; 000001f4H
	push	OFFSET FLAT:_title_stars
	push	ecx
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [ecx+28]
	mov	edx, DWORD PTR [ecx+24]
	add	ecx, 16					; 00000010H
	push	eax
	push	edx
	mov	eax, DWORD PTR [ecx+4]
	push	eax
	mov	ecx, DWORD PTR [ecx]
	push	ecx
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 4
	push	eax
	call	_draw_scene
	add	esp, 32					; 00000020H
; Line 849
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L732
	call	_draw_crosshair
; Line 852
$L732:
	call	_draw_boost_bar
; Line 855
	call	_draw_HPbar
; Line 858
	call	_draw_radar
; Line 861
	call	_draw_battery
; Line 863
	cmp	BYTE PTR _multiplayer, 0
	je	SHORT $L733
	call	_draw_nametags
; Line 867
$L733:
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _player_fighter
	shr	eax, 1
	cmp	DWORD PTR [ecx+96], eax
	jae	SHORT $L734
; Line 868
	call	_blazer2_screencrack
; Line 871
$L734:
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L735
; Line 872
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	90					; 0000005aH
	push	110					; 0000006eH
	push	OFFSET FLAT:??_C@_0L@LPNF@RESPAWNING?$AA@ ; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
	mov	ecx, 70					; 00000046H
; Line 873
	mov	eax, DWORD PTR _frames_respawning
	sub	edx, edx
	div	ecx
	push	eax
	push	OFFSET FLAT:??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@ ; `string'
	lea	eax, DWORD PTR _text$[esp+88]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 874
	lea	ecx, DWORD PTR _text$[esp+80]
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	100					; 00000064H
	push	110					; 0000006eH
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 878
$L735:
	call	_draw_debug
; Line 881
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [ecx+28]
	mov	edx, DWORD PTR [ecx+24]
	add	ecx, 16					; 00000010H
	push	eax
	push	edx
	mov	eax, DWORD PTR [ecx+4]
	push	eax
	mov	ecx, DWORD PTR [ecx]
	push	ecx
	call	_set_hypercraft_orientation
	add	esp, 16					; 00000010H
; Line 882
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
; Line 883
	add	esp, 88					; 00000058H
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
