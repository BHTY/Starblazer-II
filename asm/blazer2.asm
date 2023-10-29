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
PUBLIC	_shake_frames
PUBLIC	_firing_cooldown
PUBLIC	_frames_respawning
_DATA	SEGMENT
COMM	_SND_EXPLODE:DWORD
COMM	_SND_HIT:DWORD
COMM	_SND_LASER:DWORD
COMM	_SND_LASER_ENEMY:DWORD
COMM	_ENEMY_LASER_SHREDDER:BYTE:010H
COMM	_ENEMY_LASER_DRAGONBREATH:BYTE:010H
COMM	_laser_type:BYTE
COMM	_frames:DWORD
COMM	_velocity:BYTE:0cH
COMM	_cam_template:BYTE:028H
COMM	_tst:BYTE:0cH
COMM	_camera:DWORD
COMM	_tst2:BYTE:0cH
COMM	_player_fighter:BYTE:01cH
COMM	_player_weapon:BYTE:010H
COMM	_title_stars:BYTE:01770H
COMM	_player_boost:DWORD
COMM	_player_battery:DWORD
COMM	_dying:BYTE
COMM	_impact_id:DWORD
COMM	_rot_mat:BYTE:024H
COMM	_AX5:DWORD
COMM	_pos_delta:BYTE:0cH
COMM	_LASER_PLAYER:DWORD
COMM	_laser_velocity:BYTE:0cH
COMM	_LASER_ENEMY:DWORD
COMM	_EXPLOSION_SHARD:DWORD
COMM	_ASTEROID:DWORD
COMM	_TURRET_PLATFORM:DWORD
COMM	_TURRET:DWORD
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
$L448:
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
	jne	$L448
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
$L468:
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
	jb	SHORT $L468
; Line 93
	pop	esi
	ret	0
_draw_stars ENDP
_TEXT	ENDS
PUBLIC	_fire_laser
EXTRN	_rotate_object:NEAR
;	COMDAT _fire_laser
_TEXT	SEGMENT
_fire_laser PROC NEAR					; COMDAT
; Line 95
	push	esi
	mov	eax, DWORD PTR _StarblazerEntities
; Line 96
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	edx, DWORD PTR [eax+8]
	push	edx
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _player_weapon+12
	push	edx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	lea	ecx, DWORD PTR _StarblazerEntities[eax*4]
; Line 97
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+32], 280			; 00000118H
; Line 98
	mov	eax, DWORD PTR _player_weapon+8
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+92], eax
; Line 99
	mov	edx, DWORD PTR _StarblazerEntities
	add	edx, 16					; 00000010H
	mov	esi, DWORD PTR [ecx]
	add	esi, 16					; 00000010H
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR [esi], eax
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR [esi+4], eax
	mov	eax, DWORD PTR [edx+8]
	mov	DWORD PTR [esi+8], eax
	mov	edx, DWORD PTR [edx+12]
	mov	DWORD PTR [esi+12], edx
; Line 100
	mov	esi, DWORD PTR [ecx]
	push	esi
	call	_rotate_object
	add	esp, 4
	mov	ecx, DWORD PTR _SND_LASER
; Line 101
	mov	BYTE PTR _firing, 1
; Line 102
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 103
	pop	esi
	ret	0
_fire_laser ENDP
_TEXT	ENDS
PUBLIC	_cam_script
;	COMDAT _cam_script
_TEXT	SEGMENT
_ptr$ = 8
_cam_script PROC NEAR					; COMDAT
; Line 106
	mov	eax, DWORD PTR _ptr$[esp-4]
	push	OFFSET FLAT:_velocity
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 107
	ret	0
_cam_script ENDP
_TEXT	ENDS
PUBLIC	_init_star
;	COMDAT _init_star
_TEXT	SEGMENT
_star$ = 8
_init_star PROC NEAR					; COMDAT
; Line 109
	push	esi
; Line 110
	call	_rand
	mov	ecx, 2000				; 000007d0H
	mov	esi, DWORD PTR _star$[esp]
	cdq
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi], edx
; Line 111
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi+4], edx
; Line 112
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi+8], edx
; Line 113
	pop	esi
	ret	0
_init_star ENDP
_TEXT	ENDS
PUBLIC	_spawn_asteroid
;	COMDAT _spawn_asteroid
_TEXT	SEGMENT
_spawn_asteroid PROC NEAR				; COMDAT
; Line 115
	push	ebx
	push	esi
	push	edi
; Line 118
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	lea	edi, DWORD PTR [edx-250]
	call	_rand
	shl	edi, 16					; 00000010H
	mov	ecx, 500				; 000001f4H
; Line 119
	cdq
	idiv	ecx
	lea	ebx, DWORD PTR [edx-250]
	call	_rand
	shl	ebx, 16					; 00000010H
	mov	ecx, 500				; 000001f4H
; Line 120
	cdq
	idiv	ecx
	lea	esi, DWORD PTR [edx-250]
	call	_rand
	cdq
	shl	esi, 16					; 00000010H
	xor	eax, edx
; Line 122
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
; Line 124
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
; Line 132
	ret	0
_ax5_script ENDP
_TEXT	ENDS
PUBLIC	_enemy_laser_script
EXTRN	_test_collisions:NEAR
;	COMDAT _enemy_laser_script
_TEXT	SEGMENT
_ptr$ = 8
_enemy_laser_script PROC NEAR				; COMDAT
; Line 134
	push	esi
; Line 136
	push	OFFSET FLAT:_laser_velocity
	mov	esi, DWORD PTR _ptr$[esp+4]
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_step_entity
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 137
	dec	DWORD PTR [eax+32]
; Line 140
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR _StarblazerEntities
	push	ecx
	push	eax
	call	_test_collisions
	add	esp, 8
	test	al, al
	je	SHORT $L490
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [esi]
; Line 141
	mov	edx, DWORD PTR [eax+92]
	sub	DWORD PTR [ecx+96], edx
; Line 142
	mov	edx, DWORD PTR _SND_HIT
	mov	DWORD PTR _shake_frames, 7
; Line 143
	mov	eax, DWORD PTR [esi]
	push	edx
	mov	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _impact_id, ecx
; Line 144
	call	_play_soundfx
	add	esp, 4
	mov	ecx, DWORD PTR [esi]
; Line 145
	push	ecx
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 147
	pop	esi
	ret	0
; Line 150
$L490:
	mov	eax, DWORD PTR [esi]
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L488
; Line 151
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 154
$L488:
	pop	esi
	ret	0
_enemy_laser_script ENDP
_TEXT	ENDS
PUBLIC	_laser_script
;	COMDAT _laser_script
_TEXT	SEGMENT
_ptr$ = 8
_laser_script PROC NEAR					; COMDAT
; Line 156
	push	ebx
	push	esi
	mov	esi, DWORD PTR _ptr$[esp+4]
	push	edi
	push	ebp
; Line 159
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR [esi]
	xor	edi, edi
	push	eax
	mov	ebx, OFFSET FLAT:_StarblazerEntities
	mov	ebp, 1
	call	_step_entity
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 160
	dec	DWORD PTR [eax+32]
; Line 162
$L496:
	mov	ecx, DWORD PTR [ebx]
; Line 163
	test	ecx, ecx
	je	SHORT $L497
	mov	eax, DWORD PTR [esi]
	cmp	ecx, eax
	je	SHORT $L497
; Line 164
	mov	edx, DWORD PTR [ecx]
	test	DWORD PTR [edx+32], ebp
	je	SHORT $L497
; Line 165
	push	ecx
	push	eax
	call	_test_collisions
	add	esp, 8
	test	al, al
	jne	SHORT $L817
; Line 162
$L497:
	add	ebx, 4
	inc	edi
	cmp	ebx, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L496
	mov	eax, DWORD PTR [esi]
; Line 181
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L494
; Line 182
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 185
$L494:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
$L817:
	lea	ecx, DWORD PTR _StarblazerEntities[edi*4]
; Line 167
	mov	eax, DWORD PTR [ecx]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 168
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [eax+104], 7
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR [esi]
; Line 169
	mov	eax, DWORD PTR [edx+92]
	sub	DWORD PTR [ecx+96], eax
; Line 172
	mov	ecx, DWORD PTR _SND_HIT
	push	ecx
	call	_play_soundfx
	add	esp, 4
	mov	ecx, DWORD PTR [esi]
; Line 173
	push	ecx
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 175
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
; Line 187
	push	esi
	mov	eax, DWORD PTR _StarblazerEntities
; Line 188
	mov	esi, DWORD PTR _ptr$[esp]
	push	eax
	mov	ecx, DWORD PTR [esi]
	push	ecx
	call	_test_collisions
	add	esp, 8
	test	al, al
	je	SHORT $L506
	mov	eax, DWORD PTR _StarblazerEntities
	push	esi
; Line 189
	sub	DWORD PTR [eax+96], 5
; Line 190
	mov	DWORD PTR _shake_frames, 7
; Line 191
	call	_explode_entity
	add	esp, 4
	mov	eax, DWORD PTR _SND_HIT
; Line 192
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 193
	pop	esi
	ret	0
; Line 196
$L506:
	mov	eax, DWORD PTR [esi]
	cmp	DWORD PTR [eax+96], 0
	jg	SHORT $L505
; Line 197
	push	esi
	call	_explode_entity
	add	esp, 4
; Line 199
$L505:
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
; Line 201
	push	esi
	mov	esi, DWORD PTR _ptr$[esp]
	mov	eax, DWORD PTR [esi]
; Line 202
	mov	ecx, DWORD PTR [eax+36]
	shl	ecx, 6
	add	DWORD PTR [eax+4], ecx
	mov	eax, DWORD PTR [esi]
; Line 203
	mov	ecx, DWORD PTR [eax+40]
	shl	ecx, 6
	add	DWORD PTR [eax+8], ecx
	mov	eax, DWORD PTR [esi]
; Line 204
	mov	ecx, DWORD PTR [eax+44]
	shl	ecx, 6
	add	DWORD PTR [eax+12], ecx
; Line 205
	mov	eax, DWORD PTR [esi]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 206
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 207
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
	mov	ecx, DWORD PTR [esi]
; Line 208
	push	ecx
	call	_rotate_object
	add	esp, 4
; Line 210
	call	_rand
	cdq
	mov	ecx, 45					; 0000002dH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L510
; Line 212
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 215
$L510:
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
; Line 217
	push	ebx
	push	esi
; Line 218
	push	OFFSET FLAT:??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@ ; `string'
	mov	esi, OFFSET FLAT:_enemy_laser_script
	call	_load_model
	add	esp, 4
	xor	ebx, ebx
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+12, eax
; Line 219
	mov	DWORD PTR [eax+12], esi
; Line 220
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [eax+36], 239			; 000000efH
; Line 221
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	196608					; 00030000H
	mov	BYTE PTR [eax+37], bl
; Line 222
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	mov	DWORD PTR [eax+32], 2
; Line 223
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+8, 8
; Line 226
	push	OFFSET FLAT:??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+12, eax
; Line 227
	mov	DWORD PTR [eax+12], esi
; Line 228
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [eax+36], 207			; 000000cfH
; Line 229
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	196608					; 00030000H
	mov	BYTE PTR [eax+37], bl
; Line 230
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	mov	DWORD PTR [eax+32], 2
; Line 231
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	eax
	call	_create_hitbox
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+8, 2
	add	esp, 16					; 00000010H
; Line 234
	cmp	BYTE PTR _laser_type, bl
	jne	SHORT $L516
; Line 235
	push	OFFSET FLAT:??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 236
	mov	BYTE PTR [eax+36], 191			; 000000bfH
; Line 237
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 238
	mov	DWORD PTR _player_weapon+4, 7
; Line 239
	mov	DWORD PTR _player_weapon+8, 8
; Line 241
	jmp	SHORT $L518
$L516:
; Line 242
	push	OFFSET FLAT:??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 243
	mov	BYTE PTR [eax+36], 175			; 000000afH
; Line 244
	mov	DWORD PTR _player_weapon, 3
; Line 245
	mov	eax, 2
	mov	DWORD PTR _player_weapon+4, eax
	mov	DWORD PTR _player_weapon+8, eax
; Line 247
$L518:
; Line 249
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	esi, 2
	xor	ebx, ebx
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	DWORD PTR [eax+32], esi
; Line 250
	mov	eax, DWORD PTR _LASER_PLAYER
	push	196608					; 00030000H
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
; Line 251
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+37], bl
; Line 252
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	mov	DWORD PTR _player_fighter, 64		; 00000040H
	add	esp, 16					; 00000010H
	mov	eax, 40					; 00000028H
; Line 255
	mov	DWORD PTR _player_fighter+16, eax
	mov	DWORD PTR _player_fighter+20, eax
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _laser_velocity, ebx
	mov	DWORD PTR _player_weapon+12, ecx
	mov	DWORD PTR _laser_velocity+4, ebx
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 256
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 257
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 276
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 278
	push	OFFSET FLAT:??_C@_0BB@BOHA@assets?1shard?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 279
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 280
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	ebx
	mov	DWORD PTR [eax+32], esi
; Line 281
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	ebx
	push	ebx
	mov	BYTE PTR [eax+36], 127			; 0000007fH
; Line 282
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+37], bl
; Line 283
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 285
	mov	esi, 3
	push	OFFSET FLAT:??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 286
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 287
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+32], esi
; Line 288
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 289
	mov	eax, DWORD PTR _ASTEROID
	push	327680					; 00050000H
	mov	BYTE PTR [eax+36], 250			; 000000faH
; Line 290
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+37], bl
; Line 291
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 293
	push	OFFSET FLAT:??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _AX5, eax
; Line 294
	mov	DWORD PTR [eax+12], OFFSET FLAT:_ax5_script
; Line 295
	mov	eax, DWORD PTR _AX5
	push	458752					; 00070000H
	mov	DWORD PTR [eax+32], esi
; Line 296
	mov	eax, DWORD PTR _AX5
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	DWORD PTR [eax+28], ebx
; Line 297
	mov	eax, DWORD PTR _AX5
	mov	BYTE PTR [eax+37], 1
; Line 298
	mov	eax, DWORD PTR _AX5
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 299
	pop	esi
	pop	ebx
	ret	0
_set_attributes ENDP
_TEXT	ENDS
PUBLIC	_blazer2_init
PUBLIC	_blazer2_module
PUBLIC	??_C@_0M@KHLK@sfx?1net?4wav?$AA@		; `string'
PUBLIC	_blazer2_draw
PUBLIC	??_C@_0BA@HMID@sfx?1explode?4wav?$AA@		; `string'
PUBLIC	??_C@_0O@OLEL@sfx?1laser?4wav?$AA@		; `string'
PUBLIC	??_C@_0M@LLEG@sfx?1hit?4wav?$AA@		; `string'
EXTRN	_SG_Draw:DWORD
EXTRN	_SG_Module:DWORD
EXTRN	_shading:BYTE
EXTRN	_init_hypercraft:NEAR
EXTRN	_stop_music:NEAR
EXTRN	_play_music:NEAR
EXTRN	_load_soundfx:NEAR
EXTRN	_sfx_enable:BYTE
EXTRN	_SL_CENTER_X:WORD
EXTRN	_SL_CENTER_Y:WORD
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
; Line 308
	mov	BYTE PTR _shading, 1
	push	esi
; Line 311
	xor	esi, esi
	mov	DWORD PTR _frames, esi
; Line 315
	call	_stop_music
; Line 316
	push	OFFSET FLAT:??_C@_0M@KHLK@sfx?1net?4wav?$AA@ ; `string'
	call	_play_music
	add	esp, 4
	mov	BYTE PTR _sfx_enable, 1
; Line 318
	push	esi
	push	1
	push	OFFSET FLAT:??_C@_0BA@HMID@sfx?1explode?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_EXPLODE, eax
; Line 319
	push	esi
	push	2
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER, eax
; Line 320
	push	esi
	push	3
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER_ENEMY, eax
; Line 321
	push	esi
	push	1
	push	OFFSET FLAT:??_C@_0M@LLEG@sfx?1hit?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_HIT, eax
; Line 324
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 325
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 327
	call	_set_attributes
; Line 329
	mov	WORD PTR _cam_template+8, si
	mov	DWORD PTR _cam_template, esi
; Line 330
	mov	WORD PTR _cam_template+10, si
	mov	ecx, DWORD PTR _player_fighter
	push	458752					; 00070000H
	mov	DWORD PTR _cam_template+4, esi
; Line 333
	push	131072					; 00020000H
	mov	DWORD PTR _cam_template+28, ecx
	push	196608					; 00030000H
	mov	esi, OFFSET FLAT:_title_stars
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 335
	mov	DWORD PTR _cam_template+32, 2
; Line 337
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 340
$L533:
; Line 341
	push	esi
	call	_init_star
	add	esp, 4
	add	esi, 12					; 0000000cH
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jb	SHORT $L533
; Line 342
	mov	esi, OFFSET FLAT:_StarblazerEntities
; Line 345
$L536:
; Line 346
	mov	eax, DWORD PTR [esi]
	add	esi, 4
	push	eax
	call	_free
	mov	DWORD PTR [esi-4], 0
	add	esp, 4
; Line 347
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L536
; Line 351
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
; Line 354
	cmp	BYTE PTR _multiplayer, 0
	mov	DWORD PTR _player_boost, eax
; Line 355
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 360
	jne	SHORT $L539
	mov	esi, 100				; 00000064H
; Line 361
$L540:
; Line 362
	call	_spawn_asteroid
	dec	esi
	jne	SHORT $L540
; Line 367
$L539:
	xor	eax, eax
	mov	ecx, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity, eax
	mov	DWORD PTR _velocity+4, eax
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 368
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 372
	mov	DWORD PTR _velocity+8, ecx
; Line 374
	call	_init_hypercraft
; Line 375
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
; Line 378
	xor	ecx, ecx
	mov	cl, BYTE PTR _angle$[esp-4]
	movsx	eax, BYTE PTR _joy_amount$[esp-4]
	imul	eax, ecx
	mov	al, ah
; Line 379
	ret	0
_angle_multiply ENDP
_TEXT	ENDS
PUBLIC	_vjoy_read
EXTRN	_SG_ReadStick:NEAR
EXTRN	_SG_KeyDown:NEAR
;	COMDAT _vjoy_read
_TEXT	SEGMENT
_joy$ = 8
_stick$ = -8
_vjoy_read PROC NEAR					; COMDAT
; Line 381
	sub	esp, 8
	lea	eax, DWORD PTR _stick$[esp+8]
	push	esi
; Line 385
	push	eax
	call	_SG_ReadStick
	add	esp, 4
; Line 387
	push	74					; 0000004aH
	call	_SG_KeyDown
	mov	esi, DWORD PTR _joy$[esp+12]
	add	esp, 4
	push	75					; 0000004bH
	mov	BYTE PTR [esi+3], al
; Line 388
	mov	BYTE PTR [esi+7], 0
; Line 389
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi+6], al
; Line 390
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi+5], al
; Line 393
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L549
; Line 394
	mov	BYTE PTR [esi], 127			; 0000007fH
; Line 396
	jmp	SHORT $L550
$L549:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi], -127			; ffffff81H
	test	al, al
	jne	SHORT $L550
; Line 400
	mov	BYTE PTR [esi], 0
; Line 401
$L550:
; Line 404
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L553
; Line 405
	mov	BYTE PTR [esi+1], 127			; 0000007fH
; Line 407
	jmp	SHORT $L554
$L553:
	push	68					; 00000044H
	call	_SG_KeyDown
	mov	BYTE PTR [esi+1], -127			; ffffff81H
	add	esp, 4
	test	al, al
	jne	SHORT $L554
; Line 411
	mov	BYTE PTR [esi+1], 0
; Line 412
$L554:
; Line 415
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L557
; Line 416
	mov	BYTE PTR [esi+2], -127			; ffffff81H
; Line 418
	pop	esi
	add	esp, 8
	ret	0
$L557:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L559
; Line 419
	mov	BYTE PTR [esi+2], 127			; 0000007fH
; Line 421
	pop	esi
	add	esp, 8
	ret	0
$L559:
; Line 422
	mov	BYTE PTR [esi+2], 0
; Line 432
	pop	esi
	add	esp, 8
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
;	COMDAT _respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR				; COMDAT
; Line 451
	mov	eax, DWORD PTR _player_fighter
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+96], eax
; Line 452
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+4], edx
; Line 453
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+8], edx
; Line 454
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+12], edx
; Line 455
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
; Line 457
	sub	esp, 8
; Line 460
	lea	eax, DWORD PTR _joy$[esp+8]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 462
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L568
; Line 463
	mov	BYTE PTR _BG_COLOR, 0
; Line 466
$L568:
	mov	eax, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [eax+96], 0
	jg	SHORT $L569
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L841
; Line 467
	mov	eax, DWORD PTR _SND_EXPLODE
	push	eax
	call	_play_soundfx
	add	esp, 4
	mov	eax, DWORD PTR _timeout
; Line 468
	mov	DWORD PTR _frames_respawning, eax
	test	eax, eax
	mov	BYTE PTR _dying, 1
; Line 470
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
; Line 472
	jne	SHORT $L569
; Line 473
	call	_respawn_player
; Line 477
$L569:
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L571
$L841:
; Line 478
	lea	eax, DWORD PTR _joy$[esp+8]
	dec	DWORD PTR _frames_respawning
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 0
; Line 481
	jne	SHORT $L571
; Line 482
	call	_respawn_player
; Line 486
$L571:
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L573
; Line 487
	dec	DWORD PTR _shake_frames
; Line 491
$L573:
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
; Line 492
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
; Line 493
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
; Line 495
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L574
; Line 496
	cmp	BYTE PTR _shading, 1
	sbb	al, al
	neg	al
	mov	BYTE PTR _shading, al
; Line 500
$L574:
	cmp	BYTE PTR _joy$[esp+11], 0
	je	SHORT $L575
	mov	eax, DWORD PTR _player_weapon+4
	cmp	DWORD PTR _player_battery, eax
	jb	SHORT $L575
	cmp	DWORD PTR _firing_cooldown, 0
	jne	SHORT $L575
; Line 501
	mov	ecx, DWORD PTR _player_weapon
	sub	DWORD PTR _player_battery, eax
; Line 502
	mov	DWORD PTR _firing_cooldown, ecx
; Line 503
	call	_fire_laser
; Line 505
	jmp	SHORT $L576
$L575:
; Line 506
	mov	BYTE PTR _firing, 0
; Line 507
	mov	eax, DWORD PTR _player_fighter+20
	cmp	DWORD PTR _player_battery, eax
	jae	SHORT $L577
; Line 508
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L577
	inc	DWORD PTR _player_battery
; Line 510
$L577:
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	SHORT $L576
; Line 511
	dec	DWORD PTR _firing_cooldown
; Line 513
$L576:
; Line 516
	cmp	BYTE PTR _joy$[esp+13], 0
	je	SHORT $L580
	cmp	BYTE PTR _boost_overheating, 0
	jne	SHORT $L580
; Line 517
	mov	eax, DWORD PTR _player_fighter+12
	mov	ecx, 5
	mov	DWORD PTR _velocity+8, eax
; Line 518
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L582
	dec	DWORD PTR _player_boost
; Line 520
	jmp	SHORT $L582
$L580:
	cmp	BYTE PTR _joy$[esp+14], 0
	je	SHORT $L583
	cmp	BYTE PTR _boost_overheating, 0
	jne	SHORT $L583
; Line 521
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	mov	DWORD PTR _velocity+8, 0
; Line 522
	test	edx, edx
	jne	SHORT $L582
	dec	DWORD PTR _player_boost
; Line 524
	jmp	SHORT $L582
$L583:
; Line 525
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L586
; Line 526
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 528
	jmp	SHORT $L587
$L586:
; Line 529
	mov	DWORD PTR _velocity+8, 0
; Line 530
$L587:
; Line 531
	mov	eax, DWORD PTR _player_fighter+16
	cmp	DWORD PTR _player_boost, eax
	jae	SHORT $L582
; Line 532
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L582
	inc	DWORD PTR _player_boost
; Line 534
$L582:
; Line 538
	cmp	BYTE PTR _multiplayer, 0
	je	SHORT $L590
; Line 539
	call	_net_syncstate
; Line 542
$L590:
	call	_run_entity_scripts
; Line 545
	cmp	DWORD PTR _player_boost, 0
	jne	SHORT $L591
; Line 546
	mov	BYTE PTR _boost_overheating, 1
; Line 548
$L591:
	mov	eax, DWORD PTR _player_fighter+16
	shr	eax, 1
	cmp	eax, DWORD PTR _player_boost
	ja	SHORT $L592
; Line 549
	mov	BYTE PTR _boost_overheating, 0
; Line 553
$L592:
	add	DWORD PTR _barcycle, 2
	inc	DWORD PTR _frames
; Line 557
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	SHORT $L593
	mov	DWORD PTR _barcycle, 0
; Line 560
$L593:
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L594
; Line 561
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	dx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_X, dx
; Line 562
	call	_rand
	mov	ecx, 20					; 00000014H
	add	esp, 8
	cdq
	idiv	ecx
	sub	dx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_Y, dx
; Line 564
	ret	0
$L594:
; Line 565
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 566
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 568
	add	esp, 8
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
;	COMDAT _blazer2_screencrack
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR				; COMDAT
; Line 571
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 572
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 573
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 574
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 575
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 576
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 577
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 578
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 579
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 580
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 581
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 582
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 583
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 584
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 585
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 586
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 587
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
;	COMDAT _count_entities
_TEXT	SEGMENT
_count_entities PROC NEAR				; COMDAT
; Line 592
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_StarblazerEntities
; Line 594
$L603:
; Line 595
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L604
	inc	eax
; Line 594
$L604:
	add	ecx, 4
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L603
; Line 599
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
; Line 602
	sub	esp, 100				; 00000064H
; Line 606
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:??_C@_03FBAE@ENT?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 607
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	lea	eax, DWORD PTR _num$[esp+112]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 608
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
; Line 610
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
; Line 611
	xor	eax, eax
	push	2500					; 000009c4H
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 612
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
; Line 614
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:??_C@_03FKNI@FPS?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 615
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	SHORT $L616
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	lea	eax, DWORD PTR _num$[esp+108]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	jmp	SHORT $L618
$L616:
; Line 616
	lea	eax, DWORD PTR _num$[esp+100]
	push	OFFSET FLAT:??_C@_03HFLF@INF?$AA@	; `string'
	push	eax
	call	_sprintf
	add	esp, 8
; Line 617
$L618:
; Line 618
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
; Line 621
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
; Line 622
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
; Line 624
	xor	ecx, ecx
	push	2500					; 000009c4H
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	push	ecx
	push	OFFSET FLAT:??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 625
	lea	ecx, DWORD PTR _num$[esp+100]
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	7
	push	240					; 000000f0H
	push	ecx
	call	_vputs
; Line 626
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
; Line 628
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
; Line 634
	sar	ebx, 3
	lea	eax, DWORD PTR [eax+edx*4]
	lea	eax, DWORD PTR [eax+eax*4]
	lea	ebp, DWORD PTR [ebx*2+8]
	cdq
	idiv	ecx
	add	ebx, 8
	xor	edi, edi
	lea	esi, DWORD PTR [eax+16]
; Line 636
	mov	eax, ebx
	sub	eax, esi
	lea	edx, DWORD PTR [eax*2+24]
	mov	DWORD PTR -4+[esp+32], edx
$L632:
; Line 637
	movsx	eax, BYTE PTR _barcolors[edi]
; Line 638
	cmp	ebx, esi
	jg	SHORT $L634
; Line 639
	mov	ecx, 24					; 00000018H
	mov	DWORD PTR _pos2$[esp+32], ebx
; Line 641
	mov	DWORD PTR _pos3$[esp+32], 8
	add	ebx, 8
; Line 642
	mov	DWORD PTR _pos4$[esp+32], ebx
	cmp	esi, ebx
; Line 643
	jge	SHORT $L636
; Line 645
	mov	edx, DWORD PTR -4+[esp+32]
	mov	DWORD PTR _pos4$[esp+32], esi
	mov	DWORD PTR _pos3$[esp+32], edx
; Line 648
$L636:
	cmp	ebp, 24					; 00000018H
	jge	SHORT $L637
; Line 649
	mov	DWORD PTR _pos2$[esp+32], 16		; 00000010H
	mov	ecx, ebp
; Line 652
$L637:
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
; Line 636
	cmp	edi, 22					; 00000016H
	jl	SHORT $L632
; Line 654
$L634:
; Line 655
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 656
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 657
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 658
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 659
	push	255					; 000000ffH
	push	esi
	push	24					; 00000018H
	push	esi
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 660
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
; Line 662
	push	ebx
	push	esi
	push	edi
	xor	ebx, ebx
; Line 664
$L642:
	lea	edi, DWORD PTR [ebx+150]
	push	175					; 000000afH
; Line 667
	push	90					; 0000005aH
	mov	esi, 170				; 000000aaH
	push	edi
	sub	esi, ebx
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 668
	push	175					; 000000afH
	push	90					; 0000005aH
	push	esi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 669
	push	175					; 000000afH
	push	110					; 0000006eH
	push	edi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
	lea	edi, DWORD PTR [ebx+90]
; Line 670
	push	175					; 000000afH
	push	110					; 0000006eH
	push	esi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
	mov	esi, 110				; 0000006eH
; Line 671
	sub	esi, ebx
	push	175					; 000000afH
	push	edi
	inc	ebx
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 672
	push	175					; 000000afH
	push	esi
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 673
	push	175					; 000000afH
	push	edi
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 674
	push	175					; 000000afH
	push	esi
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 664
	cmp	ebx, 7
	jl	$L642
; Line 677
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 678
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
; Line 681
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
; Line 686
	div	ebx
	mov	ebx, DWORD PTR _barcycle
	xor	edi, edi
	sar	ebx, 3
	lea	esi, DWORD PTR [eax+16]
; Line 687
	add	ebx, 8
; Line 688
	mov	eax, ebx
	lea	ebp, DWORD PTR [ebx*2+280]
	sub	eax, esi
	lea	edx, DWORD PTR [eax*2+312]
	mov	al, BYTE PTR _boost_overheating
	mov	DWORD PTR -4+[esp+32], edx
$L656:
; Line 689
	cmp	al, 1
	sbb	eax, eax
	and	eax, -64				; ffffffc0H
	add	eax, 223				; 000000dfH
; Line 690
	cmp	ebx, esi
	jg	SHORT $L658
; Line 691
	mov	ecx, 312				; 00000138H
	mov	DWORD PTR _pos2$[esp+32], ebx
; Line 693
	mov	DWORD PTR _pos3$[esp+32], 296		; 00000128H
	add	ebx, 8
; Line 694
	mov	DWORD PTR _pos4$[esp+32], ebx
	cmp	ebx, esi
; Line 695
	jle	SHORT $L660
; Line 697
	mov	edx, DWORD PTR -4+[esp+32]
	mov	DWORD PTR _pos4$[esp+32], esi
	mov	DWORD PTR _pos3$[esp+32], edx
; Line 700
$L660:
	cmp	ebp, 312				; 00000138H
	jge	SHORT $L661
; Line 701
	mov	DWORD PTR _pos2$[esp+32], 16		; 00000010H
	mov	ecx, ebp
; Line 704
$L661:
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
; Line 688
	cmp	edi, 22					; 00000016H
	jl	SHORT $L656
; Line 706
$L658:
; Line 707
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 708
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 709
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 710
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 711
	push	255					; 000000ffH
	push	esi
	push	312					; 00000138H
	push	esi
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 712
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
; Line 714
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
	xor	esi, esi
	push	ebp
; Line 719
$L672:
; Line 720
	xor	edi, edi
$L675:
; Line 721
	xor	ecx, ecx
; Line 723
	test	esi, esi
	je	SHORT $L679
	cmp	esi, 59					; 0000003bH
	je	SHORT $L679
	test	edi, edi
	je	SHORT $L679
	cmp	edi, 59					; 0000003bH
	jne	SHORT $L678
$L679:
	mov	ecx, 255				; 000000ffH
; Line 724
$L678:
	test	ecx, ecx
	jne	SHORT $L680
	lea	eax, DWORD PTR [edi+esi]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 1
	xor	eax, edx
	sub	eax, edx
	jne	SHORT $L676
; Line 725
$L680:
	push	ecx
	lea	eax, DWORD PTR [edi+10]
	push	eax
	lea	ecx, DWORD PTR [esi+130]
	push	ecx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 720
$L676:
	inc	edi
	cmp	edi, 60					; 0000003cH
	jl	SHORT $L675
; Line 719
	inc	esi
	cmp	esi, 60					; 0000003cH
	jl	SHORT $L672
; Line 730
	mov	edi, -1
$L682:
; Line 731
	mov	ebx, -1
	lea	esi, DWORD PTR [edi+160]
$L685:
; Line 732
	lea	eax, DWORD PTR [ebx+40]
	push	239					; 000000efH
	push	eax
	inc	ebx
	push	esi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 731
	cmp	ebx, 2
	jl	SHORT $L685
; Line 730
	inc	edi
	cmp	edi, 2
	jl	SHORT $L682
; Line 736
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	mov	DWORD PTR -28+[esp+68], OFFSET FLAT:_StarblazerEntities+4
	add	esp, 20					; 00000014H
; Line 739
$L688:
	mov	eax, DWORD PTR -28+[esp+48]
	mov	ecx, DWORD PTR [eax]
; Line 740
	test	ecx, ecx
	je	$L689
	mov	eax, DWORD PTR [ecx]
	test	BYTE PTR [eax+32], 2
	je	$L689
; Line 741
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
; Line 742
	call	_vec3_subtract
	lea	ecx, DWORD PTR _screen_coords$[esp+56]
	lea	edx, DWORD PTR _vector_pos$[esp+56]
	add	esp, 8
; Line 743
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	mov	esi, DWORD PTR _screen_coords$[esp+60]
	mov	edi, DWORD PTR _screen_coords$[esp+68]
	sar	esi, 17					; 00000011H
	add	esp, 12					; 0000000cH
; Line 746
	sar	edi, 17					; 00000011H
; Line 748
	cmp	esi, 30					; 0000001eH
	jle	SHORT $L692
	mov	esi, 30					; 0000001eH
; Line 749
$L692:
	cmp	esi, -30				; ffffffe2H
	jge	SHORT $L693
	mov	esi, -30				; ffffffe2H
; Line 750
$L693:
	cmp	edi, 30					; 0000001eH
	jle	SHORT $L694
	mov	edi, 30					; 0000001eH
; Line 751
$L694:
	cmp	edi, -30				; ffffffe2H
	jge	SHORT $L695
	mov	edi, -30				; ffffffe2H
; Line 753
$L695:
	mov	eax, DWORD PTR -28+[esp+48]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ecx]
	cmp	BYTE PTR [eax+37], 0
	je	SHORT $L696
; Line 754
	cmp	DWORD PTR _screen_coords$[esp+52], 0
	mov	eax, 175				; 000000afH
	jge	SHORT $L878
	mov	eax, 223				; 000000dfH
$L878:
	mov	ebx, -1
	mov	DWORD PTR _c$[esp+48], eax
; Line 761
$L699:
; Line 762
	mov	ebp, -1
$L702:
	lea	ecx, DWORD PTR [ebp+edi+40]
; Line 763
	test	ecx, ecx
	jl	SHORT $L703
; Line 764
	mov	eax, DWORD PTR _c$[esp+48]
	push	eax
	push	ecx
	lea	eax, DWORD PTR [ebx+esi]
	add	eax, 160				; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 762
$L703:
	inc	ebp
	cmp	ebp, 2
	jl	SHORT $L702
; Line 761
	inc	ebx
	cmp	ebx, 2
	jl	SHORT $L699
	jmp	SHORT $L689
; Line 768
$L696:
; Line 769
	mov	al, BYTE PTR [eax+36]
	add	edi, 40					; 00000028H
	and	eax, 255				; 000000ffH
	add	esi, 160				; 000000a0H
	push	eax
	push	edi
	push	esi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 739
$L689:
	add	DWORD PTR -28+[esp+48], 4
	cmp	DWORD PTR -28+[esp+48], OFFSET FLAT:_StarblazerEntities+4000
	jb	$L688
; Line 773
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
; Line 775
	push	esi
	mov	eax, DWORD PTR _player_battery
	push	edi
	xor	esi, esi
; Line 778
	lea	edi, DWORD PTR [eax+eax*2]
	add	edi, edi
	shr	edi, 4
; Line 780
$L712:
; Line 781
	cmp	eax, esi
	jb	SHORT $L713
	lea	eax, DWORD PTR [esi+140]
	mov	ecx, edi
; Line 782
	or	ecx, 160				; 000000a0H
	push	ecx
	push	170					; 000000aaH
	push	eax
	push	160					; 000000a0H
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _player_battery
; Line 780
$L713:
	inc	esi
	cmp	esi, 40					; 00000028H
	jl	SHORT $L712
; Line 806
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 807
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 808
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 809
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 810
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
; Line 819
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
	mov	esi, OFFSET FLAT:_players
	push	ebp
	mov	edi, 65535				; 0000ffffH
	mov	ebx, 6553600				; 00640000H
; Line 823
$L721:
; Line 824
	cmp	BYTE PTR [esi], 1
	jne	$L722
; Line 825
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
; Line 826
	call	_vec3_subtract
	lea	ecx, DWORD PTR _screen_coords$[esp+48]
	lea	edx, DWORD PTR _vector_pos$[esp+48]
	add	esp, 8
; Line 827
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	mov	ecx, DWORD PTR _screen_coords$[esp+60]
	mov	edx, DWORD PTR _screen_coords$[esp+52]
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _SL_FOV_X
; Line 829
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
; Line 830
	movsx	ebp, WORD PTR _SL_CENTER_Y
	push	ecx
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	add	esp, 12					; 0000000cH
	sub	ebp, eax
	cmp	DWORD PTR _screen_coords$[esp+48], edi
	mov	DWORD PTR _screen_coords$[esp+44], ebp
; Line 832
	jle	SHORT $L722
	cmp	DWORD PTR _screen_coords$[esp+48], ebx
	jge	SHORT $L722
; Line 833
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
; Line 823
$L722:
	add	esi, 32					; 00000020H
	cmp	esi, OFFSET FLAT:_players+512
	jb	$L721
; Line 837
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
; Line 840
	sub	esp, 80					; 00000050H
	mov	eax, DWORD PTR _StarblazerEntities
; Line 844
	add	eax, 4
	push	eax
	call	_camera_translate
	add	esp, 4
	mov	eax, DWORD PTR _StarblazerEntities
; Line 845
	add	eax, 16					; 00000010H
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	eax
	call	_quat_tomat
	add	esp, 8
	mov	cl, BYTE PTR _shading
; Line 848
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
; Line 851
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L729
	call	_draw_crosshair
; Line 854
$L729:
	call	_draw_boost_bar
; Line 857
	call	_draw_HPbar
; Line 860
	call	_draw_radar
; Line 863
	call	_draw_battery
; Line 865
	cmp	BYTE PTR _multiplayer, 0
	je	SHORT $L730
	call	_draw_nametags
; Line 869
$L730:
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _player_fighter
	shr	eax, 1
	cmp	DWORD PTR [ecx+96], eax
	jae	SHORT $L731
; Line 870
	call	_blazer2_screencrack
; Line 873
$L731:
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L732
; Line 874
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
; Line 875
	mov	eax, DWORD PTR _frames_respawning
	sub	edx, edx
	div	ecx
	push	eax
	push	OFFSET FLAT:??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@ ; `string'
	lea	eax, DWORD PTR _text$[esp+88]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 876
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
; Line 880
$L732:
	call	_draw_debug
; Line 883
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
; Line 884
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
; Line 885
	add	esp, 88					; 00000058H
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
