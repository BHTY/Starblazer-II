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
PUBLIC	_shake_frames
PUBLIC	_firing_cooldown
PUBLIC	_multiplayer
PUBLIC	_firing
PUBLIC	_frames_respawning
_DATA	SEGMENT
COMM	_TURRET_PLATFORM:DWORD
COMM	_TURRET:DWORD
COMM	_SND_EXPLODE:DWORD
COMM	_SND_HIT:DWORD
COMM	_SND_LASER:DWORD
COMM	_SND_LASER_ENEMY:DWORD
COMM	_ENEMY_LASER_SHREDDER:BYTE:010H
COMM	_ENEMY_LASER_DRAGONBREATH:BYTE:010H
COMM	_laser_type:BYTE
COMM	_tst:BYTE:0cH
COMM	_tst2:BYTE:0cH
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
COMM	_title_stars:BYTE:01770H
COMM	_dying:BYTE
COMM	_impact_id:DWORD
COMM	_AX5:DWORD
COMM	_LASER_PLAYER:DWORD
COMM	_LASER_ENEMY:DWORD
COMM	_EXPLOSION_SHARD:DWORD
COMM	_ASTEROID:DWORD
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
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_play_soundfx:NEAR
EXTRN	_rand:NEAR
;	COMDAT _explode_at
_TEXT	SEGMENT
; File src\blazer2.c
_pos$ = 8
_explode_at PROC NEAR					; COMDAT
; Line 62
	push	ebx
	push	esi
	push	edi
	mov	esi, 64					; 00000040H
	mov	edi, DWORD PTR _pos$[esp+8]
; Line 66
$L820:
; Line 67
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
; Line 68
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
; Line 69
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
; Line 70
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
	jne	$L820
; Line 73
	mov	eax, DWORD PTR _SND_EXPLODE
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 74
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
; Line 76
	sub	esp, 12					; 0000000cH
	push	esi
	push	edi
	mov	esi, DWORD PTR _ptr$[esp+16]
	lea	edi, DWORD PTR _pos$[esp+20]
	mov	edx, DWORD PTR [esi]
; Line 77
	lea	ecx, DWORD PTR [edx+4]
	push	edx
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edi], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edi+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edi+8], ecx
; Line 78
	call	_free
	lea	edi, DWORD PTR _pos$[esp+24]
	add	esp, 4
; Line 79
	mov	DWORD PTR [esi], 0
; Line 80
	push	edi
	call	_explode_at
	add	esp, 4
; Line 81
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
; Line 84
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
; Line 85
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
; Line 87
	push	esi
; Line 88
	push	OFFSET FLAT:_rot_mat
	mov	esi, DWORD PTR _ent$[esp+4]
	lea	eax, DWORD PTR [esi+16]
	push	eax
	call	_quat_tomat
	mov	eax, DWORD PTR _vel$[esp+8]
	add	esp, 8
; Line 89
	add	esi, 4
	push	OFFSET FLAT:_pos_delta
	push	eax
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 90
	push	esi
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 8
; Line 91
	pop	esi
	ret	0
_step_entity ENDP
_TEXT	ENDS
PUBLIC	_draw_stars
EXTRN	_plotpoint_3d:NEAR
;	COMDAT _draw_stars
_TEXT	SEGMENT
_draw_stars PROC NEAR					; COMDAT
; Line 93
	push	esi
	mov	esi, OFFSET FLAT:_title_stars
; Line 95
$L836:
; Line 96
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
	jb	SHORT $L836
; Line 98
	pop	esi
	ret	0
_draw_stars ENDP
_TEXT	ENDS
PUBLIC	_fire_laser
EXTRN	_rotate_object:NEAR
;	COMDAT _fire_laser
_TEXT	SEGMENT
_fire_laser PROC NEAR					; COMDAT
; Line 100
	push	esi
	mov	eax, DWORD PTR _StarblazerEntities
; Line 101
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
; Line 102
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+32], 280			; 00000118H
; Line 103
	mov	eax, DWORD PTR _player_weapon+8
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR [edx+92], eax
; Line 104
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
; Line 105
	mov	esi, DWORD PTR [ecx]
	push	esi
	call	_rotate_object
	add	esp, 4
	mov	ecx, DWORD PTR _SND_LASER
; Line 106
	mov	BYTE PTR _firing, 1
; Line 107
	push	ecx
	call	_play_soundfx
	add	esp, 4
; Line 108
	pop	esi
	ret	0
_fire_laser ENDP
_TEXT	ENDS
PUBLIC	_cam_script
;	COMDAT _cam_script
_TEXT	SEGMENT
_ptr$ = 8
_cam_script PROC NEAR					; COMDAT
; Line 111
	mov	eax, DWORD PTR _ptr$[esp-4]
	push	OFFSET FLAT:_velocity
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_step_entity
	add	esp, 8
; Line 112
	ret	0
_cam_script ENDP
_TEXT	ENDS
PUBLIC	_init_star
;	COMDAT _init_star
_TEXT	SEGMENT
_star$ = 8
_init_star PROC NEAR					; COMDAT
; Line 114
	push	esi
; Line 115
	call	_rand
	mov	ecx, 2000				; 000007d0H
	mov	esi, DWORD PTR _star$[esp]
	cdq
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi], edx
; Line 116
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi+4], edx
; Line 117
	call	_rand
	cdq
	mov	ecx, 2000				; 000007d0H
	idiv	ecx
	sub	edx, 1000				; 000003e8H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [esi+8], edx
; Line 118
	pop	esi
	ret	0
_init_star ENDP
_TEXT	ENDS
PUBLIC	_spawn_asteroid
;	COMDAT _spawn_asteroid
_TEXT	SEGMENT
_spawn_asteroid PROC NEAR				; COMDAT
; Line 120
	push	ebx
	push	esi
	push	edi
; Line 123
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	lea	edi, DWORD PTR [edx-250]
	call	_rand
	shl	edi, 16					; 00000010H
	mov	ecx, 500				; 000001f4H
; Line 124
	cdq
	idiv	ecx
	lea	ebx, DWORD PTR [edx-250]
	call	_rand
	shl	ebx, 16					; 00000010H
	mov	ecx, 500				; 000001f4H
; Line 125
	cdq
	idiv	ecx
	lea	esi, DWORD PTR [edx-250]
	call	_rand
	cdq
	shl	esi, 16					; 00000010H
	xor	eax, edx
; Line 127
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
; Line 129
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
; Line 137
	ret	0
_ax5_script ENDP
_TEXT	ENDS
PUBLIC	_enemy_laser_script
EXTRN	_test_collisions:NEAR
;	COMDAT _enemy_laser_script
_TEXT	SEGMENT
_ptr$ = 8
_enemy_laser_script PROC NEAR				; COMDAT
; Line 139
	push	esi
; Line 141
	push	OFFSET FLAT:_laser_velocity
	mov	esi, DWORD PTR _ptr$[esp+4]
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_step_entity
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 142
	dec	DWORD PTR [eax+32]
; Line 145
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR _StarblazerEntities
	push	ecx
	push	eax
	call	_test_collisions
	add	esp, 8
	test	al, al
	je	SHORT $L858
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR [esi]
; Line 146
	mov	edx, DWORD PTR [eax+92]
	sub	DWORD PTR [ecx+96], edx
; Line 147
	mov	edx, DWORD PTR _SND_HIT
	mov	DWORD PTR _shake_frames, 7
; Line 148
	mov	eax, DWORD PTR [esi]
	push	edx
	mov	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _impact_id, ecx
; Line 149
	call	_play_soundfx
	add	esp, 4
	mov	ecx, DWORD PTR [esi]
; Line 150
	push	ecx
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 152
	pop	esi
	ret	0
; Line 155
$L858:
	mov	eax, DWORD PTR [esi]
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L856
; Line 156
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 159
$L856:
	pop	esi
	ret	0
_enemy_laser_script ENDP
_TEXT	ENDS
PUBLIC	_laser_script
;	COMDAT _laser_script
_TEXT	SEGMENT
_ptr$ = 8
_laser_script PROC NEAR					; COMDAT
; Line 161
	push	ebx
	push	esi
	mov	esi, DWORD PTR _ptr$[esp+4]
	push	edi
	push	ebp
; Line 164
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR [esi]
	xor	ebx, ebx
	push	eax
	mov	edi, OFFSET FLAT:_StarblazerEntities
	mov	ebp, 1
	call	_step_entity
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 165
	dec	DWORD PTR [eax+32]
; Line 167
$L864:
	mov	ecx, DWORD PTR [edi]
; Line 168
	test	ecx, ecx
	je	SHORT $L865
	mov	eax, DWORD PTR [esi]
	cmp	ecx, eax
	je	SHORT $L865
; Line 169
	mov	edx, DWORD PTR [ecx]
	test	DWORD PTR [edx+32], ebp
	je	SHORT $L865
; Line 170
	push	ecx
	push	eax
	call	_test_collisions
	add	esp, 8
	test	al, al
	jne	SHORT $L1175
; Line 167
$L865:
	add	edi, 4
	inc	ebx
	cmp	edi, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L864
	mov	eax, DWORD PTR [esi]
; Line 186
	cmp	DWORD PTR [eax+32], 0
	jne	SHORT $L862
; Line 187
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 190
$L862:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
$L1175:
	lea	ecx, DWORD PTR _StarblazerEntities[ebx*4]
; Line 172
	mov	eax, DWORD PTR [ecx]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 173
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [eax+104], 7
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR [esi]
; Line 174
	mov	eax, DWORD PTR [edx+92]
	sub	DWORD PTR [ecx+96], eax
; Line 177
	mov	ecx, DWORD PTR _SND_HIT
	push	ecx
	call	_play_soundfx
	add	esp, 4
	mov	ecx, DWORD PTR [esi]
; Line 178
	push	ecx
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 180
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
; Line 192
	push	esi
	mov	eax, DWORD PTR _StarblazerEntities
; Line 193
	mov	esi, DWORD PTR _ptr$[esp]
	push	eax
	mov	ecx, DWORD PTR [esi]
	push	ecx
	call	_test_collisions
	add	esp, 8
	test	al, al
	je	SHORT $L874
	mov	eax, DWORD PTR _StarblazerEntities
	push	esi
; Line 194
	sub	DWORD PTR [eax+96], 5
; Line 195
	mov	DWORD PTR _shake_frames, 7
; Line 196
	call	_explode_entity
	add	esp, 4
	mov	eax, DWORD PTR _SND_HIT
; Line 197
	push	eax
	call	_play_soundfx
	add	esp, 4
; Line 198
	pop	esi
	ret	0
; Line 201
$L874:
	mov	eax, DWORD PTR [esi]
	cmp	DWORD PTR [eax+96], 0
	jg	SHORT $L873
; Line 202
	push	esi
	call	_explode_entity
	add	esp, 4
; Line 204
$L873:
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
; Line 206
	push	esi
	mov	esi, DWORD PTR _ptr$[esp]
	mov	eax, DWORD PTR [esi]
; Line 207
	mov	ecx, DWORD PTR [eax+36]
	shl	ecx, 6
	add	DWORD PTR [eax+4], ecx
	mov	eax, DWORD PTR [esi]
; Line 208
	mov	ecx, DWORD PTR [eax+40]
	shl	ecx, 6
	add	DWORD PTR [eax+8], ecx
	mov	eax, DWORD PTR [esi]
; Line 209
	mov	ecx, DWORD PTR [eax+44]
	shl	ecx, 6
	add	DWORD PTR [eax+12], ecx
; Line 210
	mov	eax, DWORD PTR [esi]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_pitch
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 211
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 212
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 8
	mov	ecx, DWORD PTR [esi]
; Line 213
	push	ecx
	call	_rotate_object
	add	esp, 4
; Line 215
	call	_rand
	cdq
	mov	ecx, 45					; 0000002dH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L878
; Line 217
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_free
	add	esp, 4
	mov	DWORD PTR [esi], 0
; Line 220
$L878:
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
; Line 222
	push	ebx
	push	esi
; Line 223
	push	OFFSET FLAT:??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@ ; `string'
	mov	esi, OFFSET FLAT:_enemy_laser_script
	call	_load_model
	add	esp, 4
	xor	ebx, ebx
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+12, eax
; Line 224
	mov	DWORD PTR [eax+12], esi
; Line 225
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [eax+36], 239			; 000000efH
; Line 226
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	196608					; 00030000H
	mov	BYTE PTR [eax+37], bl
; Line 227
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	mov	DWORD PTR [eax+32], 2
; Line 228
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+8, 8
; Line 231
	push	OFFSET FLAT:??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+12, eax
; Line 232
	mov	DWORD PTR [eax+12], esi
; Line 233
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [eax+36], 207			; 000000cfH
; Line 234
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	196608					; 00030000H
	mov	BYTE PTR [eax+37], bl
; Line 235
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	mov	DWORD PTR [eax+32], 2
; Line 236
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	eax
	call	_create_hitbox
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+8, 2
	add	esp, 16					; 00000010H
; Line 239
	cmp	BYTE PTR _laser_type, bl
	jne	SHORT $L884
; Line 240
	push	OFFSET FLAT:??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 241
	mov	BYTE PTR [eax+36], 191			; 000000bfH
; Line 242
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 243
	mov	DWORD PTR _player_weapon+4, 7
; Line 244
	mov	DWORD PTR _player_weapon+8, 8
; Line 246
	jmp	SHORT $L886
$L884:
; Line 247
	push	OFFSET FLAT:??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 248
	mov	BYTE PTR [eax+36], 175			; 000000afH
; Line 249
	mov	DWORD PTR _player_weapon, 3
; Line 250
	mov	eax, 2
	mov	DWORD PTR _player_weapon+4, eax
	mov	DWORD PTR _player_weapon+8, eax
; Line 252
$L886:
; Line 254
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	esi, 2
	xor	ebx, ebx
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	DWORD PTR [eax+32], esi
; Line 255
	mov	eax, DWORD PTR _LASER_PLAYER
	push	196608					; 00030000H
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
; Line 256
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+37], bl
; Line 257
	mov	eax, DWORD PTR _LASER_PLAYER
	push	eax
	call	_create_hitbox
	mov	DWORD PTR _player_fighter, 64		; 00000040H
	add	esp, 16					; 00000010H
	mov	eax, 40					; 00000028H
; Line 260
	mov	DWORD PTR _player_fighter+16, eax
	mov	DWORD PTR _player_fighter+20, eax
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _laser_velocity, ebx
	mov	DWORD PTR _player_weapon+12, ecx
	mov	DWORD PTR _laser_velocity+4, ebx
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
; Line 261
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
; Line 262
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
; Line 281
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
; Line 283
	push	OFFSET FLAT:??_C@_0BB@BOHA@assets?1shard?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 284
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 285
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	ebx
	mov	DWORD PTR [eax+32], esi
; Line 286
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	ebx
	push	ebx
	mov	BYTE PTR [eax+36], 127			; 0000007fH
; Line 287
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+37], bl
; Line 288
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 290
	mov	esi, 3
	push	OFFSET FLAT:??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _ASTEROID, eax
; Line 291
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 292
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+32], esi
; Line 293
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
; Line 294
	mov	eax, DWORD PTR _ASTEROID
	push	327680					; 00050000H
	mov	BYTE PTR [eax+36], 250			; 000000faH
; Line 295
	mov	eax, DWORD PTR _ASTEROID
	mov	BYTE PTR [eax+37], bl
; Line 296
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 298
	push	OFFSET FLAT:??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _AX5, eax
; Line 299
	mov	DWORD PTR [eax+12], OFFSET FLAT:_ax5_script
; Line 300
	mov	eax, DWORD PTR _AX5
	push	458752					; 00070000H
	mov	DWORD PTR [eax+32], esi
; Line 301
	mov	eax, DWORD PTR _AX5
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	DWORD PTR [eax+28], ebx
; Line 302
	mov	eax, DWORD PTR _AX5
	mov	BYTE PTR [eax+37], 1
; Line 303
	mov	eax, DWORD PTR _AX5
	push	eax
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 304
	pop	esi
	pop	ebx
	ret	0
_set_attributes ENDP
_TEXT	ENDS
PUBLIC	??_C@_0M@LLEG@sfx?1hit?4wav?$AA@		; `string'
PUBLIC	_blazer2_init
PUBLIC	_blazer2_module
PUBLIC	_blazer2_draw
PUBLIC	??_C@_0M@KHLK@sfx?1net?4wav?$AA@		; `string'
PUBLIC	??_C@_0BA@HMID@sfx?1explode?4wav?$AA@		; `string'
PUBLIC	??_C@_0O@OLEL@sfx?1laser?4wav?$AA@		; `string'
EXTRN	_SG_Draw:DWORD
EXTRN	_SG_Module:DWORD
EXTRN	_shading:BYTE
EXTRN	_init_hypercraft:NEAR
EXTRN	_play_music:NEAR
EXTRN	_stop_music:NEAR
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
; Line 313
	mov	BYTE PTR _shading, 1
	push	esi
; Line 316
	xor	esi, esi
	mov	DWORD PTR _frames, esi
; Line 320
	call	_stop_music
; Line 321
	push	OFFSET FLAT:??_C@_0M@KHLK@sfx?1net?4wav?$AA@ ; `string'
	call	_play_music
	add	esp, 4
	mov	BYTE PTR _sfx_enable, 1
; Line 323
	push	esi
	push	1
	push	OFFSET FLAT:??_C@_0BA@HMID@sfx?1explode?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_EXPLODE, eax
; Line 324
	push	esi
	push	2
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER, eax
; Line 325
	push	esi
	push	3
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_LASER_ENEMY, eax
; Line 326
	push	esi
	push	1
	push	OFFSET FLAT:??_C@_0M@LLEG@sfx?1hit?4wav?$AA@ ; `string'
	call	_load_soundfx
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _SND_HIT, eax
; Line 329
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 330
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 332
	call	_set_attributes
; Line 334
	mov	WORD PTR _cam_template+8, si
	mov	DWORD PTR _cam_template, esi
; Line 335
	mov	WORD PTR _cam_template+10, si
	mov	ecx, DWORD PTR _player_fighter
	push	458752					; 00070000H
	mov	DWORD PTR _cam_template+4, esi
; Line 338
	push	131072					; 00020000H
	mov	DWORD PTR _cam_template+28, ecx
	push	196608					; 00030000H
	mov	esi, OFFSET FLAT:_title_stars
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
; Line 340
	mov	DWORD PTR _cam_template+32, 2
; Line 342
	push	OFFSET FLAT:_cam_template
	call	_create_hitbox
	add	esp, 16					; 00000010H
; Line 345
$L897:
; Line 346
	push	esi
	call	_init_star
	add	esp, 4
	add	esi, 12					; 0000000cH
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jb	SHORT $L897
; Line 347
	mov	esi, OFFSET FLAT:_StarblazerEntities
; Line 350
$L900:
; Line 351
	mov	eax, DWORD PTR [esi]
	add	esi, 4
	push	eax
	call	_free
	mov	DWORD PTR [esi-4], 0
	add	esp, 4
; Line 352
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L900
; Line 356
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
; Line 359
	cmp	BYTE PTR _multiplayer, 0
	mov	DWORD PTR _player_boost, eax
; Line 360
	mov	eax, DWORD PTR _player_fighter+20
	mov	DWORD PTR _player_battery, eax
; Line 365
	jne	SHORT $L903
	mov	esi, 100				; 00000064H
; Line 366
$L904:
; Line 367
	call	_spawn_asteroid
	dec	esi
	jne	SHORT $L904
; Line 372
$L903:
	xor	eax, eax
	mov	ecx, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity, eax
	mov	DWORD PTR _velocity+4, eax
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
; Line 373
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
; Line 377
	mov	DWORD PTR _velocity+8, ecx
; Line 379
	call	_init_hypercraft
; Line 380
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
; Line 383
	xor	ecx, ecx
	mov	cl, BYTE PTR _angle$[esp-4]
	movsx	eax, BYTE PTR _joy_amount$[esp-4]
	imul	eax, ecx
	mov	al, ah
; Line 384
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
; Line 386
	sub	esp, 8
	lea	eax, DWORD PTR _stick$[esp+8]
	push	esi
; Line 390
	push	eax
	call	_SG_ReadStick
	add	esp, 4
; Line 392
	push	74					; 0000004aH
	call	_SG_KeyDown
	mov	esi, DWORD PTR _joy$[esp+12]
	add	esp, 4
	push	75					; 0000004bH
	mov	BYTE PTR [esi+3], al
; Line 393
	mov	BYTE PTR [esi+7], 0
; Line 394
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi+6], al
; Line 395
	push	66					; 00000042H
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi+5], al
; Line 398
	push	87					; 00000057H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L913
; Line 399
	mov	BYTE PTR [esi], 127			; 0000007fH
; Line 401
	jmp	SHORT $L914
$L913:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	mov	BYTE PTR [esi], -127			; ffffff81H
	test	al, al
	jne	SHORT $L914
; Line 405
	mov	BYTE PTR [esi], 0
; Line 406
$L914:
; Line 409
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L917
; Line 410
	mov	BYTE PTR [esi+1], 127			; 0000007fH
; Line 412
	jmp	SHORT $L918
$L917:
	push	68					; 00000044H
	call	_SG_KeyDown
	mov	BYTE PTR [esi+1], -127			; ffffff81H
	add	esp, 4
	test	al, al
	jne	SHORT $L918
; Line 416
	mov	BYTE PTR [esi+1], 0
; Line 417
$L918:
; Line 420
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L921
; Line 421
	mov	BYTE PTR [esi+2], -127			; ffffff81H
; Line 423
	pop	esi
	add	esp, 8
	ret	0
$L921:
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L923
; Line 424
	mov	BYTE PTR [esi+2], 127			; 0000007fH
; Line 426
	pop	esi
	add	esp, 8
	ret	0
$L923:
; Line 427
	mov	BYTE PTR [esi+2], 0
; Line 437
	pop	esi
	add	esp, 8
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
;	COMDAT _respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR				; COMDAT
; Line 456
	mov	eax, DWORD PTR _player_fighter
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	DWORD PTR [ecx+96], eax
; Line 457
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+4], edx
; Line 458
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+8], edx
; Line 459
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	sub	edx, 50					; 00000032H
	mov	eax, DWORD PTR _StarblazerEntities
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+12], edx
; Line 460
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
; Line 462
	sub	esp, 8
; Line 465
	lea	eax, DWORD PTR _joy$[esp+8]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 467
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L932
; Line 468
	mov	BYTE PTR _BG_COLOR, 0
; Line 471
$L932:
	mov	eax, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [eax+96], 0
	jg	SHORT $L933
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L1199
; Line 472
	mov	eax, DWORD PTR _SND_EXPLODE
	push	eax
	call	_play_soundfx
	add	esp, 4
	mov	eax, DWORD PTR _timeout
; Line 473
	mov	DWORD PTR _frames_respawning, eax
	test	eax, eax
	mov	BYTE PTR _dying, 1
; Line 475
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
; Line 477
	jne	SHORT $L933
; Line 478
	call	_respawn_player
; Line 482
$L933:
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L935
$L1199:
; Line 483
	lea	eax, DWORD PTR _joy$[esp+8]
	dec	DWORD PTR _frames_respawning
	mov	DWORD PTR [eax], 0
	mov	DWORD PTR [eax+4], 0
; Line 486
	jne	SHORT $L935
; Line 487
	call	_respawn_player
; Line 491
$L935:
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L937
; Line 492
	dec	DWORD PTR _shake_frames
; Line 496
$L937:
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
; Line 497
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
; Line 498
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
; Line 500
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L938
; Line 501
	cmp	BYTE PTR _shading, 1
	sbb	al, al
	neg	al
	mov	BYTE PTR _shading, al
; Line 505
$L938:
	cmp	BYTE PTR _joy$[esp+11], 0
	je	SHORT $L939
	mov	eax, DWORD PTR _player_weapon+4
	cmp	DWORD PTR _player_battery, eax
	jb	SHORT $L939
	cmp	DWORD PTR _firing_cooldown, 0
	jne	SHORT $L939
; Line 506
	mov	ecx, DWORD PTR _player_weapon
	sub	DWORD PTR _player_battery, eax
; Line 507
	mov	DWORD PTR _firing_cooldown, ecx
; Line 508
	call	_fire_laser
; Line 510
	jmp	SHORT $L940
$L939:
; Line 511
	mov	BYTE PTR _firing, 0
; Line 512
	mov	eax, DWORD PTR _player_fighter+20
	cmp	DWORD PTR _player_battery, eax
	jae	SHORT $L941
; Line 513
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L941
	inc	DWORD PTR _player_battery
; Line 515
$L941:
	cmp	DWORD PTR _firing_cooldown, 0
	jbe	SHORT $L940
; Line 516
	dec	DWORD PTR _firing_cooldown
; Line 518
$L940:
; Line 521
	cmp	BYTE PTR _joy$[esp+13], 0
	je	SHORT $L944
	cmp	BYTE PTR _boost_overheating, 0
	jne	SHORT $L944
; Line 522
	mov	eax, DWORD PTR _player_fighter+12
	mov	ecx, 5
	mov	DWORD PTR _velocity+8, eax
; Line 523
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L946
	dec	DWORD PTR _player_boost
; Line 525
	jmp	SHORT $L946
$L944:
	cmp	BYTE PTR _joy$[esp+14], 0
	je	SHORT $L947
	cmp	BYTE PTR _boost_overheating, 0
	jne	SHORT $L947
; Line 526
	mov	ecx, 5
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	mov	DWORD PTR _velocity+8, 0
; Line 527
	test	edx, edx
	jne	SHORT $L946
	dec	DWORD PTR _player_boost
; Line 529
	jmp	SHORT $L946
$L947:
; Line 530
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L950
; Line 531
	mov	eax, DWORD PTR _player_fighter+8
	mov	DWORD PTR _velocity+8, eax
; Line 533
	jmp	SHORT $L951
$L950:
; Line 534
	mov	DWORD PTR _velocity+8, 0
; Line 535
$L951:
; Line 536
	mov	eax, DWORD PTR _player_fighter+16
	cmp	DWORD PTR _player_boost, eax
	jae	SHORT $L946
; Line 537
	mov	ecx, 15					; 0000000fH
	mov	eax, DWORD PTR _frames
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L946
	inc	DWORD PTR _player_boost
; Line 539
$L946:
; Line 543
	cmp	BYTE PTR _multiplayer, 0
	je	SHORT $L954
; Line 544
	call	_net_syncstate
; Line 547
$L954:
	call	_run_entity_scripts
; Line 550
	cmp	DWORD PTR _player_boost, 0
	jne	SHORT $L955
; Line 551
	mov	BYTE PTR _boost_overheating, 1
; Line 553
$L955:
	mov	eax, DWORD PTR _player_fighter+16
	shr	eax, 1
	cmp	eax, DWORD PTR _player_boost
	ja	SHORT $L956
; Line 554
	mov	BYTE PTR _boost_overheating, 0
; Line 558
$L956:
	add	DWORD PTR _barcycle, 2
	inc	DWORD PTR _frames
; Line 562
	cmp	DWORD PTR _barcycle, 64			; 00000040H
	jne	SHORT $L957
	mov	DWORD PTR _barcycle, 0
; Line 565
$L957:
	cmp	DWORD PTR _shake_frames, 0
	je	SHORT $L958
; Line 566
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	dx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_X, dx
; Line 567
	call	_rand
	mov	ecx, 20					; 00000014H
	add	esp, 8
	cdq
	idiv	ecx
	sub	dx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_Y, dx
; Line 569
	ret	0
$L958:
; Line 570
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 571
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 573
	add	esp, 8
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
;	COMDAT _blazer2_screencrack
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR				; COMDAT
; Line 576
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 577
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 578
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 579
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 580
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 581
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 582
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 583
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 584
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 585
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 586
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 587
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 588
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 589
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 590
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 591
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 592
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
;	COMDAT _count_entities
_TEXT	SEGMENT
_count_entities PROC NEAR				; COMDAT
; Line 597
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_StarblazerEntities
; Line 599
$L966:
; Line 600
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L967
	inc	eax
; Line 599
$L967:
	add	ecx, 4
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L966
; Line 604
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
EXTRN	_SL_VERTEX_INDEX:WORD
EXTRN	_SL_TRIANGLE_INDEX:WORD
EXTRN	_sprintf:NEAR
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
; Line 607
	sub	esp, 100				; 00000064H
; Line 611
	push	1
	push	-17					; ffffffefH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:??_C@_03FBAE@ENT?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 612
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	lea	eax, DWORD PTR _num$[esp+112]
	push	eax
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 613
	lea	eax, DWORD PTR _num$[esp+100]
	push	1
	push	-17					; ffffffefH
	push	1
	push	1
	push	0
	push	15					; 0000000fH
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 615
	push	1
	push	-17					; ffffffefH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:??_C@_03FKCM@TRI?$AA@	; `string'
	call	_vputs
	lea	ecx, DWORD PTR _num$[esp+128]
	add	esp, 28					; 0000001cH
; Line 616
	xor	eax, eax
	push	2500					; 000009c4H
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	ecx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 617
	lea	ecx, DWORD PTR _num$[esp+100]
	push	1
	push	-17					; ffffffefH
	push	1
	push	1
	push	7
	push	15					; 0000000fH
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 619
	push	1
	push	-17					; ffffffefH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:??_C@_03FKNI@FPS?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 620
	cmp	DWORD PTR _LAST_FRAME_TIME, 0
	je	SHORT $L977
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	DWORD PTR _LAST_FRAME_TIME
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	lea	eax, DWORD PTR _num$[esp+108]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
	jmp	SHORT $L979
$L977:
; Line 621
	lea	eax, DWORD PTR _num$[esp+100]
	push	OFFSET FLAT:??_C@_03HFLF@INF?$AA@	; `string'
	push	eax
	call	_sprintf
	add	esp, 8
; Line 622
$L979:
; Line 623
	lea	eax, DWORD PTR _num$[esp+100]
	push	1
	push	-17					; ffffffefH
	push	1
	push	1
	push	14					; 0000000eH
	push	15					; 0000000fH
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
	mov	eax, DWORD PTR _StarblazerEntities
; Line 626
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
; Line 627
	lea	ecx, DWORD PTR _num$[esp+100]
	push	1
	push	-81					; ffffffafH
	push	1
	push	1
	push	0
	push	240					; 000000f0H
	push	ecx
	call	_vputs
	lea	edx, DWORD PTR _num$[esp+128]
	add	esp, 28					; 0000001cH
; Line 629
	xor	ecx, ecx
	push	2500					; 000009c4H
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	push	ecx
	push	OFFSET FLAT:??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	edx
	call	_sprintf
	add	esp, 16					; 00000010H
; Line 630
	lea	ecx, DWORD PTR _num$[esp+100]
	push	1
	push	-81					; ffffffafH
	push	1
	push	1
	push	7
	push	240					; 000000f0H
	push	ecx
	call	_vputs
; Line 631
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
; Line 633
	sub	esp, 16					; 00000010H
	mov	eax, DWORD PTR _StarblazerEntities
	push	ebx
	mov	eax, DWORD PTR [eax+96]
	push	esi
	mov	ecx, 40					; 00000028H
	push	edi
	lea	edx, DWORD PTR [eax+eax*4]
	push	ebp
	mov	esi, DWORD PTR _barcycle
; Line 639
	sar	esi, 3
	lea	eax, DWORD PTR [eax+edx*4]
	lea	eax, DWORD PTR [eax+eax*4]
	lea	ebp, DWORD PTR [esi*2+8]
	cdq
	idiv	ecx
	add	esi, 8
	xor	ebx, ebx
	lea	edi, DWORD PTR [eax+16]
; Line 641
	mov	eax, esi
	sub	eax, edi
	lea	edx, DWORD PTR [eax*2+24]
	mov	DWORD PTR -4+[esp+32], edx
$L993:
; Line 642
	movsx	eax, BYTE PTR _barcolors[ebx]
; Line 643
	cmp	esi, edi
	jg	SHORT $L995
; Line 644
	mov	ecx, 24					; 00000018H
	mov	DWORD PTR _pos2$[esp+32], esi
; Line 646
	mov	DWORD PTR _pos3$[esp+32], 8
	add	esi, 8
; Line 647
	mov	DWORD PTR _pos4$[esp+32], esi
	cmp	edi, esi
; Line 648
	jge	SHORT $L997
; Line 650
	mov	edx, DWORD PTR -4+[esp+32]
	mov	DWORD PTR _pos4$[esp+32], edi
	mov	DWORD PTR _pos3$[esp+32], edx
; Line 653
$L997:
	cmp	ebp, 24					; 00000018H
	jge	SHORT $L998
; Line 654
	mov	DWORD PTR _pos2$[esp+32], 16		; 00000010H
	mov	ecx, ebp
; Line 657
$L998:
	mov	edx, DWORD PTR _pos3$[esp+32]
	push	eax
	mov	eax, DWORD PTR _pos4$[esp+36]
	add	ebp, 16					; 00000010H
	push	eax
	inc	ebx
	mov	eax, DWORD PTR _pos2$[esp+40]
	push	edx
	push	eax
	push	ecx
	call	_drawline
	add	DWORD PTR -4+[esp+52], 16		; 00000010H
	add	esp, 20					; 00000014H
; Line 641
	cmp	ebx, 22					; 00000016H
	jl	SHORT $L993
; Line 659
$L995:
; Line 660
	push	-1
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 661
	push	-1
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 662
	push	-1
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 663
	push	-1
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 664
	push	-1
	push	edi
	push	24					; 00000018H
	push	edi
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
; Line 665
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
; Line 667
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 669
	xor	edi, edi
$L1002:
	mov	bx, di
	lea	ebp, DWORD PTR [edi+150]
; Line 672
	mov	si, 170					; 000000aaH
	push	-81					; ffffffafH
	sub	si, bx
	push	90					; 0000005aH
	push	ebp
	inc	edi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 673
	push	-81					; ffffffafH
	push	90					; 0000005aH
	push	esi
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 674
	push	-81					; ffffffafH
	push	110					; 0000006eH
	push	ebp
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
	lea	ebp, DWORD PTR [edi+89]
; Line 675
	push	-81					; ffffffafH
	push	110					; 0000006eH
	push	esi
	call	_bitset_pixel
	mov	si, 110					; 0000006eH
	add	esp, 12					; 0000000cH
; Line 676
	sub	si, bx
	push	-81					; ffffffafH
	push	ebp
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 677
	push	-81					; ffffffafH
	push	esi
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 678
	push	-81					; ffffffafH
	push	ebp
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 679
	push	-81					; ffffffafH
	push	esi
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 669
	cmp	edi, 7
	jl	$L1002
; Line 682
	push	-81					; ffffffafH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
; Line 683
	pop	ebp
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
; Line 686
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
; Line 691
	div	ebx
	mov	ebx, DWORD PTR _barcycle
	xor	edi, edi
	sar	ebx, 3
	lea	esi, DWORD PTR [eax+16]
; Line 692
	add	ebx, 8
; Line 693
	mov	eax, ebx
	lea	ebp, DWORD PTR [ebx*2+280]
	sub	eax, esi
	lea	edx, DWORD PTR [eax*2+312]
	mov	al, BYTE PTR _boost_overheating
	mov	DWORD PTR -4+[esp+32], edx
$L1015:
; Line 694
	cmp	al, 1
	sbb	eax, eax
	and	eax, -64				; ffffffc0H
	add	eax, 223				; 000000dfH
; Line 695
	cmp	ebx, esi
	jg	SHORT $L1017
; Line 696
	mov	ecx, 312				; 00000138H
	mov	DWORD PTR _pos2$[esp+32], ebx
; Line 698
	mov	DWORD PTR _pos3$[esp+32], 296		; 00000128H
	add	ebx, 8
; Line 699
	mov	DWORD PTR _pos4$[esp+32], ebx
	cmp	ebx, esi
; Line 700
	jle	SHORT $L1019
; Line 702
	mov	edx, DWORD PTR -4+[esp+32]
	mov	DWORD PTR _pos4$[esp+32], esi
	mov	DWORD PTR _pos3$[esp+32], edx
; Line 705
$L1019:
	cmp	ebp, 312				; 00000138H
	jge	SHORT $L1020
; Line 706
	mov	DWORD PTR _pos2$[esp+32], 16		; 00000010H
	mov	ecx, ebp
; Line 709
$L1020:
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
; Line 693
	cmp	edi, 22					; 00000016H
	jl	SHORT $L1015
; Line 711
$L1017:
; Line 712
	push	-1
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 713
	push	-1
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 714
	push	-1
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 715
	push	-1
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 716
	push	-1
	push	esi
	push	312					; 00000138H
	push	esi
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 717
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
; Line 719
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 724
	xor	edi, edi
$L1031:
; Line 725
	xor	esi, esi
$L1034:
; Line 726
	xor	ecx, ecx
; Line 728
	test	edi, edi
	je	SHORT $L1038
	cmp	edi, 59					; 0000003bH
	je	SHORT $L1038
	test	esi, esi
	je	SHORT $L1038
	cmp	esi, 59					; 0000003bH
	jne	SHORT $L1037
$L1038:
	mov	ecx, 255				; 000000ffH
; Line 729
$L1037:
	test	ecx, ecx
	jne	SHORT $L1039
	lea	eax, DWORD PTR [esi+edi]
	cdq
	xor	eax, edx
	sub	eax, edx
	and	eax, 1
	xor	eax, edx
	sub	eax, edx
	jne	SHORT $L1035
; Line 730
$L1039:
	push	ecx
	lea	eax, DWORD PTR [esi+10]
	push	eax
	lea	ecx, DWORD PTR [edi+130]
	push	ecx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 725
$L1035:
	inc	esi
	cmp	esi, 60					; 0000003cH
	jl	SHORT $L1034
; Line 724
	inc	edi
	cmp	edi, 60					; 0000003cH
	jl	SHORT $L1031
; Line 735
	mov	esi, -1
$L1040:
; Line 736
	mov	edi, -1
	lea	ebx, DWORD PTR [esi+160]
$L1043:
; Line 737
	lea	eax, DWORD PTR [edi+40]
	push	239					; 000000efH
	push	eax
	inc	edi
	push	ebx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 736
	cmp	edi, 2
	jl	SHORT $L1043
; Line 735
	inc	esi
	cmp	esi, 2
	jl	SHORT $L1040
; Line 741
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	mov	DWORD PTR -28+[esp+68], OFFSET FLAT:_StarblazerEntities+4
	add	esp, 20					; 00000014H
; Line 744
$L1046:
	mov	eax, DWORD PTR -28+[esp+48]
	mov	ecx, DWORD PTR [eax]
; Line 745
	test	ecx, ecx
	je	$L1047
	mov	eax, DWORD PTR [ecx]
	test	BYTE PTR [eax+32], 2
	je	$L1047
; Line 746
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
; Line 747
	call	_vec3_subtract
	lea	ecx, DWORD PTR _screen_coords$[esp+56]
	lea	edx, DWORD PTR _vector_pos$[esp+56]
	add	esp, 8
; Line 748
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	mov	esi, DWORD PTR _screen_coords$[esp+60]
	mov	edi, DWORD PTR _screen_coords$[esp+68]
	sar	esi, 17					; 00000011H
	add	esp, 12					; 0000000cH
; Line 751
	sar	edi, 17					; 00000011H
; Line 753
	cmp	esi, 30					; 0000001eH
	jle	SHORT $L1050
	mov	esi, 30					; 0000001eH
; Line 754
$L1050:
	cmp	esi, -30				; ffffffe2H
	jge	SHORT $L1051
	mov	esi, -30				; ffffffe2H
; Line 755
$L1051:
	cmp	edi, 30					; 0000001eH
	jle	SHORT $L1052
	mov	edi, 30					; 0000001eH
; Line 756
$L1052:
	cmp	edi, -30				; ffffffe2H
	jge	SHORT $L1053
	mov	edi, -30				; ffffffe2H
; Line 758
$L1053:
	mov	eax, DWORD PTR -28+[esp+48]
	mov	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR [ecx]
	cmp	BYTE PTR [eax+37], 0
	je	SHORT $L1054
; Line 759
	cmp	DWORD PTR _screen_coords$[esp+52], 0
	mov	eax, 175				; 000000afH
	jge	SHORT $L1236
	mov	eax, 223				; 000000dfH
$L1236:
	mov	ebx, -1
	mov	DWORD PTR _c$[esp+48], eax
; Line 766
$L1057:
; Line 767
	mov	ebp, -1
$L1060:
; Line 768
	lea	eax, DWORD PTR [ebp+edi]
	add	eax, 40					; 00000028H
	js	SHORT $L1061
; Line 769
	mov	eax, DWORD PTR _c$[esp+48]
	push	eax
	lea	eax, DWORD PTR [ebp+edi]
	add	ax, 40					; 00000028H
	push	eax
	lea	eax, DWORD PTR [esi+ebx]
	add	ax, 160					; 000000a0H
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 767
$L1061:
	inc	ebp
	cmp	ebp, 2
	jl	SHORT $L1060
; Line 766
	inc	ebx
	cmp	ebx, 2
	jl	SHORT $L1057
	jmp	SHORT $L1047
; Line 773
$L1054:
; Line 774
	add	di, 40					; 00000028H
	mov	al, BYTE PTR [eax+36]
	add	si, 160					; 000000a0H
	push	eax
	push	edi
	push	esi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 744
$L1047:
	add	DWORD PTR -28+[esp+48], 4
	cmp	DWORD PTR -28+[esp+48], OFFSET FLAT:_StarblazerEntities+4000
	jb	$L1046
; Line 778
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
; Line 780
	push	esi
	mov	eax, DWORD PTR _player_battery
	push	edi
	xor	esi, esi
; Line 783
	lea	edi, DWORD PTR [eax+eax*2]
	add	edi, edi
	shr	edi, 4
; Line 785
$L1070:
; Line 786
	cmp	esi, eax
	ja	SHORT $L1071
	lea	eax, DWORD PTR [esi+140]
	mov	ecx, edi
; Line 787
	or	cl, -96					; ffffffa0H
	push	ecx
	push	170					; 000000aaH
	push	eax
	push	160					; 000000a0H
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
	mov	eax, DWORD PTR _player_battery
; Line 785
$L1071:
	inc	esi
	cmp	esi, 40					; 00000028H
	jl	SHORT $L1070
; Line 811
	push	-1
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 812
	push	-1
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 813
	push	-1
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
	add	esp, 20					; 00000014H
; Line 814
	push	-1
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 20					; 00000014H
; Line 815
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
; Line 824
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
	mov	esi, OFFSET FLAT:_players
	push	ebp
	mov	edi, 65535				; 0000ffffH
	mov	ebx, 6553600				; 00640000H
; Line 828
$L1079:
; Line 829
	cmp	BYTE PTR [esi], 1
	jne	$L1080
; Line 830
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
; Line 831
	call	_vec3_subtract
	lea	ecx, DWORD PTR _screen_coords$[esp+48]
	lea	edx, DWORD PTR _vector_pos$[esp+48]
	add	esp, 8
; Line 832
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	mov	ecx, DWORD PTR _screen_coords$[esp+60]
	mov	edx, DWORD PTR _screen_coords$[esp+52]
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _SL_FOV_X
; Line 834
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
; Line 835
	movsx	ebp, WORD PTR _SL_CENTER_Y
	push	ecx
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	add	esp, 12					; 0000000cH
	sub	ebp, eax
	cmp	DWORD PTR _screen_coords$[esp+48], edi
	mov	DWORD PTR _screen_coords$[esp+44], ebp
; Line 837
	jle	SHORT $L1080
	cmp	DWORD PTR _screen_coords$[esp+48], ebx
	jge	SHORT $L1080
; Line 838
	mov	eax, DWORD PTR _screen_coords$[esp+44]
	push	1
	mov	ecx, DWORD PTR _screen_coords$[esp+44]
	push	-1
	push	1
	push	1
	push	eax
	push	ecx
	push	OFFSET FLAT:??_C@_06BCGP@PLAYER?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 828
$L1080:
	add	esi, 32					; 00000020H
	cmp	esi, OFFSET FLAT:_players+512
	jb	$L1079
; Line 842
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
; Line 845
	sub	esp, 80					; 00000050H
	mov	eax, DWORD PTR _StarblazerEntities
; Line 849
	add	eax, 4
	push	eax
	call	_camera_translate
	add	esp, 4
	mov	eax, DWORD PTR _StarblazerEntities
; Line 850
	add	eax, 16					; 00000010H
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	eax
	call	_quat_tomat
	add	esp, 8
	mov	cl, BYTE PTR _shading
; Line 853
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
; Line 856
	cmp	DWORD PTR _frames_respawning, 0
	jne	SHORT $L1087
	call	_draw_crosshair
; Line 859
$L1087:
	call	_draw_boost_bar
; Line 862
	call	_draw_HPbar
; Line 865
	call	_draw_radar
; Line 868
	call	_draw_battery
; Line 870
	cmp	BYTE PTR _multiplayer, 0
	je	SHORT $L1088
	call	_draw_nametags
; Line 874
$L1088:
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _player_fighter
	shr	eax, 1
	cmp	DWORD PTR [ecx+96], eax
	jae	SHORT $L1089
; Line 875
	call	_blazer2_screencrack
; Line 878
$L1089:
	cmp	DWORD PTR _frames_respawning, 0
	je	SHORT $L1090
; Line 879
	push	1
	push	-97					; ffffff9fH
	push	2
	push	3
	push	90					; 0000005aH
	push	110					; 0000006eH
	push	OFFSET FLAT:??_C@_0L@LPNF@RESPAWNING?$AA@ ; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
	mov	ecx, 70					; 00000046H
; Line 880
	mov	eax, DWORD PTR _frames_respawning
	sub	edx, edx
	div	ecx
	push	eax
	push	OFFSET FLAT:??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@ ; `string'
	lea	eax, DWORD PTR _text$[esp+88]
	push	eax
	call	_sprintf
	add	esp, 12					; 0000000cH
; Line 881
	lea	ecx, DWORD PTR _text$[esp+80]
	push	1
	push	-97					; ffffff9fH
	push	2
	push	3
	push	100					; 00000064H
	push	110					; 0000006eH
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 885
$L1090:
	call	_draw_debug
; Line 888
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
; Line 889
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
; Line 890
	add	esp, 88					; 00000058H
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
