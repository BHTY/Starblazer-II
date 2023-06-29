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
PUBLIC	_multiplayer
PUBLIC	_firing
PUBLIC	_frames_respawning
PUBLIC	_barcolors
PUBLIC	_boost_overheating
PUBLIC	_barcycle
PUBLIC	_shake_frames
PUBLIC	_firing_cooldown
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
COMM	_ENEMY_LASER_SHREDDER:BYTE:010H
COMM	_ENEMY_LASER_DRAGONBREATH:BYTE:010H
COMM	_laser_type:BYTE
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
_DATA	ENDS
PUBLIC	_explode_at
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_rand:NEAR
EXTRN	_play_soundfx:NEAR
;	COMDAT _explode_at
_TEXT	SEGMENT
_pos$ = 8
_explode_at PROC NEAR					; COMDAT
; File src\blazer2.c
; Line 57
	push	ebx
	push	esi
	push	edi
; Line 62
	mov	edi, DWORD PTR _pos$[esp+8]
	mov	ebx, 64					; 00000040H
$L384:
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L726
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L726:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L727
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L727:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L728
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L728:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L729
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L729:
	mov	ecx, DWORD PTR [edi+8]
	lea	edx, DWORD PTR [eax+ecx-128]
	push	edx
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L730
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L730:
	mov	ecx, DWORD PTR [edi+4]
	lea	edx, DWORD PTR [eax+ecx-128]
	push	edx
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L731
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L731:
	mov	ecx, DWORD PTR [edi]
	lea	edx, DWORD PTR [eax+ecx-128]
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	push	edx
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	esi, eax
; Line 63
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L732
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L732:
	mov	edx, DWORD PTR _StarblazerEntities[esi*4]
	lea	ecx, DWORD PTR [eax+eax*2-384]
	mov	DWORD PTR [edx+36], ecx
; Line 64
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L733
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L733:
	mov	ecx, DWORD PTR _StarblazerEntities[esi*4]
	lea	eax, DWORD PTR [eax+eax*2-384]
	mov	DWORD PTR [ecx+40], eax
; Line 65
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L734
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L734:
	lea	edx, DWORD PTR [eax+eax*2-384]
	mov	eax, DWORD PTR _StarblazerEntities[esi*4]
	dec	ebx
	mov	DWORD PTR [eax+44], edx
	jne	$L384
; Line 68
	mov	ecx, DWORD PTR _SND_EXPLODE
	push	ecx
	call	_play_soundfx
	add	esp, 4
	pop	edi
	pop	esi
	pop	ebx
; Line 69
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
; Line 72
	mov	esi, DWORD PTR _ptr$[esp+12]
	mov	eax, DWORD PTR [esi]
; Line 73
	push	eax
	lea	ecx, DWORD PTR [eax+4]
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _pos$[esp+20], edx
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _pos$[esp+24], edx
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR _pos$[esp+28], ecx
	call	_free
; Line 75
	lea	edx, DWORD PTR _pos$[esp+20]
	mov	DWORD PTR [esi], 0
	push	edx
	call	_explode_at
	add	esp, 8
	pop	esi
; Line 76
	add	esp, 12					; 0000000cH
	ret	0
_explode_entity ENDP
_TEXT	ENDS
PUBLIC	_print_vec
PUBLIC	??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@ ; `string'
EXTRN	_printf:NEAR
;	COMDAT ??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@
; File src\blazer2.c
_DATA	SEGMENT
??_C@_0O@GAAH@?$CI?$CFd?0?5?$CFd?0?5?$CFd?$CJ?6?$AA@ DB '(%d, %d, %d)', 0aH
	DB	00H						; `string'
_DATA	ENDS
;	COMDAT _print_vec
_TEXT	SEGMENT
_vec$ = 8
_print_vec PROC NEAR					; COMDAT
; File src\blazer2.c
; Line 79
	mov	eax, DWORD PTR _vec$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax]
	push	ecx
	push	edx
	push	eax
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
	mov	esi, DWORD PTR _ent$[esp]
	push	OFFSET FLAT:_rot_mat
	lea	eax, DWORD PTR [esi+16]
	push	eax
	call	_quat_tomat
; Line 84
	mov	ecx, DWORD PTR _vel$[esp+8]
	push	OFFSET FLAT:_pos_delta
	push	ecx
	push	OFFSET FLAT:_rot_mat
	call	_mat3_mul
; Line 85
	add	esi, 4
	push	esi
	push	OFFSET FLAT:_pos_delta
	call	_vec3_add
	add	esp, 28					; 0000001cH
	pop	esi
; Line 86
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
; Line 90
	mov	esi, OFFSET FLAT:_title_stars
$L404:
; Line 91
	push	255					; 000000ffH
	mov	eax, esi
	sub	esp, 12					; 0000000cH
	mov	edx, DWORD PTR [eax]
	mov	ecx, esp
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+4], edx
	mov	DWORD PTR [ecx+8], eax
	call	_plotpoint_3d
	add	esi, 12					; 0000000cH
	add	esp, 16					; 00000010H
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jl	SHORT $L404
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
	mov	eax, DWORD PTR _StarblazerEntities
	push	0
	push	0
	push	0
	mov	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	push	ecx
	mov	ecx, DWORD PTR _player_weapon+12
	push	edx
	push	eax
	push	ecx
	call	_spawn_entity
; Line 97
	mov	edx, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [edx+32], 280			; 00000118H
; Line 98
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR _player_weapon+8
	mov	DWORD PTR [ecx+92], edx
; Line 99
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR _StarblazerEntities[eax*4]
	add	ecx, 16					; 00000010H
	add	edx, 16					; 00000010H
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], eax
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+12], ecx
; Line 101
	mov	edx, DWORD PTR _SND_LASER
	push	edx
	mov	BYTE PTR _firing, 1
	call	_play_soundfx
	add	esp, 32					; 00000020H
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
	cdq
	mov	ecx, 2000				; 000007d0H
	mov	esi, DWORD PTR _star$[esp]
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
	pop	esi
; Line 112
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
	mov	esi, edx
	sub	esi, 250				; 000000faH
	shl	esi, 16					; 00000010H
; Line 118
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	mov	edi, edx
	sub	edi, 250				; 000000faH
	shl	edi, 16					; 00000010H
; Line 119
	call	_rand
	cdq
	mov	ecx, 500				; 000001f4H
	idiv	ecx
	mov	ebx, edx
	sub	ebx, 250				; 000000faH
	shl	ebx, 16					; 00000010H
; Line 121
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L761
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L761:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L762
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L762:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L763
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L763:
	mov	edx, DWORD PTR _ASTEROID
	push	eax
	push	ebx
	push	edi
	push	esi
	push	edx
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	pop	edi
	pop	esi
	pop	ebx
; Line 123
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
	mov	esi, DWORD PTR _ptr$[esp]
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_step_entity
; Line 136
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+32]
	dec	ecx
	mov	DWORD PTR [eax+32], ecx
; Line 139
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR [esi]
	push	ecx
	push	edx
	call	_test_collisions
	add	esp, 16					; 00000010H
	test	al, al
	je	SHORT $L426
; Line 140
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR [eax+96]
	add	ecx, -5					; fffffffbH
	mov	DWORD PTR [eax+96], ecx
; Line 143
	mov	edx, DWORD PTR _SND_HIT
	mov	DWORD PTR _shake_frames, 7
	mov	eax, DWORD PTR [esi]
	push	edx
	mov	ecx, DWORD PTR [eax+84]
	mov	DWORD PTR _impact_id, ecx
	call	_play_soundfx
; Line 144
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_free
	add	esp, 8
; Line 170
	mov	DWORD PTR [esi], 0
	pop	esi
; Line 172
	ret	0
$L426:
; Line 168
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+32]
	test	ecx, ecx
	jne	SHORT $L427
; Line 169
	push	eax
	call	_free
	add	esp, 4
; Line 170
	mov	DWORD PTR [esi], 0
$L427:
	pop	esi
; Line 172
	ret	0
_enemy_laser_script ENDP
_TEXT	ENDS
PUBLIC	_laser_script
;	COMDAT _laser_script
_TEXT	SEGMENT
_ptr$ = 8
_laser_script PROC NEAR					; COMDAT
; Line 174
	push	ebp
	push	esi
; Line 177
	mov	esi, DWORD PTR _ptr$[esp+4]
	push	edi
	push	OFFSET FLAT:_laser_velocity
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_step_entity
; Line 178
	mov	eax, DWORD PTR [esi]
	add	esp, 8
	mov	edi, OFFSET FLAT:_StarblazerEntities
	mov	ecx, DWORD PTR [eax+32]
	dec	ecx
; Line 180
	xor	ebp, ebp
	mov	DWORD PTR [eax+32], ecx
$L432:
; Line 181
	mov	eax, DWORD PTR [edi]
	test	eax, eax
	je	SHORT $L433
	mov	ecx, DWORD PTR [esi]
	cmp	eax, ecx
	je	SHORT $L433
; Line 182
	mov	edx, DWORD PTR [eax]
	test	BYTE PTR [edx+32], 1
	je	SHORT $L433
; Line 183
	push	eax
	push	ecx
	call	_test_collisions
	add	esp, 8
	test	al, al
	jne	SHORT $L775
$L433:
; Line 180
	add	edi, 4
	inc	ebp
	cmp	edi, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L432
; Line 199
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+32]
	test	ecx, ecx
	jne	SHORT $L438
; Line 200
	push	eax
	call	_free
	add	esp, 4
; Line 201
	mov	DWORD PTR [esi], 0
$L438:
	pop	edi
	pop	esi
	pop	ebp
; Line 203
	ret	0
$L775:
; Line 185
	mov	eax, DWORD PTR _StarblazerEntities[ebp*4]
	mov	BYTE PTR [eax+100], 192			; 000000c0H
; Line 186
	mov	ecx, DWORD PTR _StarblazerEntities[ebp*4]
	mov	DWORD PTR [ecx+104], 7
; Line 187
	mov	ebp, DWORD PTR _StarblazerEntities[ebp*4]
	mov	edx, DWORD PTR [esi]
	mov	ecx, DWORD PTR [ebp+96]
	mov	eax, DWORD PTR [edx+92]
	sub	ecx, eax
	mov	DWORD PTR [ebp+96], ecx
; Line 190
	mov	ecx, DWORD PTR _SND_HIT
	push	ecx
	call	_play_soundfx
; Line 191
	mov	edx, DWORD PTR [esi]
	push	edx
	call	_free
	add	esp, 8
; Line 201
	mov	DWORD PTR [esi], 0
	pop	edi
	pop	esi
	pop	ebp
; Line 203
	ret	0
_laser_script ENDP
_TEXT	ENDS
PUBLIC	_asteroid_script
;	COMDAT _asteroid_script
_TEXT	SEGMENT
_ptr$ = 8
_asteroid_script PROC NEAR				; COMDAT
; Line 206
	mov	eax, DWORD PTR _StarblazerEntities
	push	esi
	mov	esi, DWORD PTR _ptr$[esp]
	push	eax
	mov	ecx, DWORD PTR [esi]
	push	ecx
	call	_test_collisions
	add	esp, 8
	test	al, al
	je	SHORT $L442
; Line 207
	mov	eax, DWORD PTR _StarblazerEntities
; Line 209
	push	esi
	mov	ecx, DWORD PTR [eax+96]
	add	ecx, -5					; fffffffbH
	mov	DWORD PTR [eax+96], ecx
	mov	DWORD PTR _shake_frames, 7
	call	_explode_entity
; Line 210
	mov	edx, DWORD PTR _SND_HIT
	push	edx
	call	_play_soundfx
	add	esp, 8
	pop	esi
; Line 217
	ret	0
$L442:
; Line 214
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+96]
	test	ecx, ecx
	jg	SHORT $L443
; Line 215
	push	esi
	call	_explode_entity
	add	esp, 4
$L443:
	pop	esi
; Line 217
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
; Line 219
	push	esi
; Line 220
	mov	esi, DWORD PTR _ptr$[esp]
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+36]
	mov	edx, DWORD PTR [eax+4]
	shl	ecx, 6
	add	edx, ecx
	mov	DWORD PTR [eax+4], edx
; Line 221
	mov	eax, DWORD PTR [esi]
	mov	edx, DWORD PTR [eax+40]
	mov	ecx, DWORD PTR [eax+8]
	shl	edx, 6
	add	ecx, edx
	mov	DWORD PTR [eax+8], ecx
; Line 222
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+44]
	mov	edx, DWORD PTR [eax+12]
	shl	ecx, 6
	add	edx, ecx
	mov	DWORD PTR [eax+12], edx
; Line 223
	mov	edx, DWORD PTR [esi]
	add	edx, 16					; 00000010H
	push	edx
	push	32					; 00000020H
	call	_quat_pitch
; Line 224
	mov	eax, DWORD PTR [esi]
	add	eax, 16					; 00000010H
	push	eax
	push	32					; 00000020H
	call	_quat_yaw
; Line 225
	mov	ecx, DWORD PTR [esi]
	add	ecx, 16					; 00000010H
	push	ecx
	push	32					; 00000020H
	call	_quat_roll
	add	esp, 24					; 00000018H
; Line 227
	call	_rand
	cdq
	mov	ecx, 45					; 0000002dH
	idiv	ecx
	test	edx, edx
	jne	SHORT $L447
; Line 229
	mov	edx, DWORD PTR [esi]
	push	edx
	call	_free
	add	esp, 4
; Line 230
	mov	DWORD PTR [esi], 0
$L447:
	pop	esi
; Line 232
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
; File src\blazer2.c
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
; File src\blazer2.c
; Line 234
	push	ebx
	push	esi
	push	edi
; Line 235
	push	OFFSET FLAT:??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@ ; `string'
	call	_load_model
; Line 236
	mov	edi, OFFSET FLAT:_enemy_laser_script
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+12, eax
	mov	DWORD PTR [eax+12], edi
; Line 237
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
; Line 238
	xor	ebx, ebx
; Line 239
	mov	esi, 2
	mov	BYTE PTR [eax+36], 239			; 000000efH
	mov	ecx, DWORD PTR _ENEMY_LASER_SHREDDER+12
; Line 240
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [ecx+37], bl
	mov	edx, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	196608					; 00030000H
	mov	DWORD PTR [edx+32], esi
	mov	eax, DWORD PTR _ENEMY_LASER_SHREDDER+12
	push	eax
	call	_create_hitbox
; Line 243
	push	OFFSET FLAT:??_C@_0BD@BCCP@assets?1dragon2?4obj?$AA@ ; `string'
	mov	DWORD PTR _ENEMY_LASER_SHREDDER+8, 8
	call	_load_model
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+12, eax
; Line 244
	mov	DWORD PTR [eax+12], edi
; Line 245
	mov	ecx, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
; Line 248
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	BYTE PTR [ecx+36], 207			; 000000cfH
	mov	edx, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	mov	BYTE PTR [edx+37], bl
	mov	eax, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	mov	DWORD PTR [eax+32], esi
	mov	ecx, DWORD PTR _ENEMY_LASER_DRAGONBREATH+12
	push	ecx
	call	_create_hitbox
; Line 251
	mov	al, BYTE PTR _laser_type
	add	esp, 40					; 00000028H
	cmp	al, bl
	mov	DWORD PTR _ENEMY_LASER_DRAGONBREATH+8, esi
	mov	edi, 3
	jne	SHORT $L452
; Line 252
	push	OFFSET FLAT:??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@ ; `string'
	call	_load_model
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 253
	mov	BYTE PTR [eax+36], 191			; 000000bfH
	add	esp, 4
; Line 254
	mov	DWORD PTR _player_weapon, 10		; 0000000aH
; Line 255
	mov	DWORD PTR _player_weapon+4, 7
; Line 256
	mov	DWORD PTR _player_weapon+8, 8
; Line 258
	jmp	SHORT $L454
$L452:
; Line 259
	push	OFFSET FLAT:??_C@_0BD@PCEA@assets?1dragon1?4obj?$AA@ ; `string'
	call	_load_model
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 260
	mov	BYTE PTR [eax+36], 175			; 000000afH
	add	esp, 4
; Line 261
	mov	DWORD PTR _player_weapon, edi
; Line 262
	mov	DWORD PTR _player_weapon+4, esi
; Line 263
	mov	DWORD PTR _player_weapon+8, 1
$L454:
; Line 266
	mov	edx, DWORD PTR _LASER_PLAYER
; Line 269
	push	196608					; 00030000H
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	DWORD PTR [edx+32], esi
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [eax+12], OFFSET FLAT:_laser_script
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [ecx+37], bl
	mov	edx, DWORD PTR _LASER_PLAYER
	push	edx
	call	_create_hitbox
; Line 271
	mov	eax, 40					; 00000028H
; Line 295
	push	OFFSET FLAT:??_C@_0BB@BOHA@assets?1shard?4obj?$AA@ ; `string'
	mov	DWORD PTR _player_fighter, eax
	mov	DWORD PTR _player_fighter+16, eax
	mov	DWORD PTR _player_fighter+20, eax
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
	mov	DWORD PTR _player_weapon+12, eax
	mov	DWORD PTR _laser_velocity, ebx
	mov	DWORD PTR _laser_velocity+4, ebx
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
	call	_load_model
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 296
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 297
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
; Line 300
	push	ebx
	push	ebx
	push	ebx
	mov	DWORD PTR [ecx+32], esi
	mov	edx, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [edx+36], 127			; 0000007fH
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [eax+37], bl
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
	push	ecx
	call	_create_hitbox
; Line 302
	push	OFFSET FLAT:??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@ ; `string'
	call	_load_model
	mov	DWORD PTR _ASTEROID, eax
; Line 303
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 304
	mov	edx, DWORD PTR _ASTEROID
; Line 308
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	DWORD PTR [edx+32], edi
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
	mov	ecx, DWORD PTR _ASTEROID
	mov	BYTE PTR [ecx+36], 250			; 000000faH
	mov	edx, DWORD PTR _ASTEROID
	mov	BYTE PTR [edx+37], bl
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
; Line 310
	push	OFFSET FLAT:??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ ; `string'
	call	_load_model
	mov	DWORD PTR _AX5, eax
; Line 311
	mov	DWORD PTR [eax+12], OFFSET FLAT:_ax5_script
; Line 312
	mov	ecx, DWORD PTR _AX5
; Line 315
	push	458752					; 00070000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	DWORD PTR [ecx+32], edi
	mov	edx, DWORD PTR _AX5
	mov	DWORD PTR [edx+28], ebx
	mov	eax, DWORD PTR _AX5
	mov	BYTE PTR [eax+37], 1
	mov	ecx, DWORD PTR _AX5
	push	ecx
	call	_create_hitbox
	add	esp, 76					; 0000004cH
	pop	edi
	pop	esi
	pop	ebx
; Line 316
	ret	0
_set_attributes ENDP
_TEXT	ENDS
PUBLIC	_blazer2_module
PUBLIC	_blazer2_draw
PUBLIC	_blazer2_init
PUBLIC	??_C@_0M@KHLK@sfx?1net?4wav?$AA@		; `string'
PUBLIC	??_C@_0BA@HMID@sfx?1explode?4wav?$AA@		; `string'
PUBLIC	??_C@_0O@OLEL@sfx?1laser?4wav?$AA@		; `string'
PUBLIC	??_C@_0M@LLEG@sfx?1hit?4wav?$AA@		; `string'
EXTRN	_SL_CENTER_X:WORD
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_SG_Draw:DWORD
EXTRN	_SG_Module:DWORD
EXTRN	_shading:BYTE
EXTRN	_init_hypercraft:NEAR
EXTRN	_sfx_enable:BYTE
EXTRN	_stop_music:NEAR
EXTRN	_play_music:NEAR
EXTRN	_load_soundfx:NEAR
;	COMDAT ??_C@_0M@KHLK@sfx?1net?4wav?$AA@
; File src\blazer2.c
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
; File src\blazer2.c
; Line 325
	push	ebx
; Line 328
	xor	ebx, ebx
	push	esi
	mov	DWORD PTR _frames, ebx
; Line 329
	mov	BYTE PTR _shading, 1
; Line 332
	call	_stop_music
; Line 333
	push	OFFSET FLAT:??_C@_0M@KHLK@sfx?1net?4wav?$AA@ ; `string'
	call	_play_music
; Line 335
	push	ebx
	push	1
	push	OFFSET FLAT:??_C@_0BA@HMID@sfx?1explode?4wav?$AA@ ; `string'
	mov	BYTE PTR _sfx_enable, 1
	call	_load_soundfx
; Line 336
	push	ebx
	push	2
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	mov	DWORD PTR _SND_EXPLODE, eax
	call	_load_soundfx
; Line 337
	push	ebx
	push	3
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	mov	DWORD PTR _SND_LASER, eax
	call	_load_soundfx
; Line 338
	push	ebx
	push	1
	push	OFFSET FLAT:??_C@_0M@LLEG@sfx?1hit?4wav?$AA@ ; `string'
	mov	DWORD PTR _SND_LASER_ENEMY, eax
	call	_load_soundfx
	mov	DWORD PTR _SND_HIT, eax
; Line 341
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 342
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 344
	call	_set_attributes
; Line 351
	mov	eax, DWORD PTR _player_fighter
; Line 354
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	push	OFFSET FLAT:_cam_template
	mov	DWORD PTR _cam_template, ebx
	mov	DWORD PTR _cam_template+4, ebx
	mov	WORD PTR _cam_template+8, bx
	mov	WORD PTR _cam_template+10, bx
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
	mov	DWORD PTR _cam_template+28, eax
	mov	DWORD PTR _cam_template+32, 2
	call	_create_hitbox
	add	esp, 68					; 00000044H
	mov	esi, OFFSET FLAT:_title_stars
$L469:
; Line 358
	push	esi
	call	_init_star
	add	esi, 12					; 0000000cH
	add	esp, 4
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jl	SHORT $L469
; Line 362
	mov	esi, OFFSET FLAT:_StarblazerEntities
$L472:
; Line 363
	mov	ecx, DWORD PTR [esi]
	push	ecx
	call	_free
; Line 364
	mov	DWORD PTR [esi], ebx
	add	esi, 4
	add	esp, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L472
; Line 368
	push	ebx
	push	ebx
	push	ebx
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
; Line 372
	mov	eax, DWORD PTR _player_fighter+20
	mov	edx, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_battery, eax
; Line 377
	mov	al, BYTE PTR _multiplayer
	add	esp, 28					; 0000001cH
	cmp	al, bl
	mov	DWORD PTR _player_boost, edx
	jne	SHORT $L478
; Line 378
	mov	esi, 100				; 00000064H
$L476:
; Line 379
	call	_spawn_asteroid
	dec	esi
	jne	SHORT $L476
$L478:
; Line 389
	mov	ecx, DWORD PTR _player_fighter+8
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
	mov	DWORD PTR _velocity, ebx
	mov	DWORD PTR _velocity+4, ebx
	mov	DWORD PTR _velocity+8, ecx
; Line 391
	call	_init_hypercraft
	pop	esi
	pop	ebx
; Line 392
	ret	0
_blazer2_init ENDP
_TEXT	ENDS
PUBLIC	_angle_multiply
;	COMDAT _angle_multiply
_TEXT	SEGMENT
_angle$ = 8
_joy_amount$ = 12
_angle_multiply PROC NEAR				; COMDAT
; Line 395
	mov	eax, DWORD PTR _angle$[esp-4]
	movsx	ecx, BYTE PTR _joy_amount$[esp-4]
	and	eax, 255				; 000000ffH
	imul	eax, ecx
	sar	eax, 8
; Line 396
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
; Line 398
	sub	esp, 8
; Line 402
	lea	eax, DWORD PTR _mouse$[esp+8]
	push	esi
	push	eax
	call	_SG_ReadMouse
; Line 404
	push	74					; 0000004aH
	call	_SG_KeyDown
	mov	esi, DWORD PTR _joy$[esp+16]
; Line 406
	push	75					; 0000004bH
	mov	BYTE PTR [esi+3], al
	mov	BYTE PTR [esi+7], 0
	call	_SG_KeyDown
; Line 407
	push	66					; 00000042H
	mov	BYTE PTR [esi+6], al
	call	_SG_KeyDown
; Line 410
	push	87					; 00000057H
	mov	BYTE PTR [esi+5], al
	call	_SG_KeyDown
	add	esp, 20					; 00000014H
	test	al, al
	je	SHORT $L485
; Line 411
	mov	BYTE PTR [esi], 127			; 0000007fH
; Line 413
	jmp	SHORT $L487
$L485:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	neg	al
	sbb	al, al
	and	al, -127				; ffffff81H
	mov	BYTE PTR [esi], al
$L487:
; Line 421
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L489
; Line 422
	mov	BYTE PTR [esi+1], 127			; 0000007fH
; Line 424
	jmp	SHORT $L492
$L489:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L491
; Line 425
	mov	BYTE PTR [esi+1], -127			; ffffff81H
; Line 427
	jmp	SHORT $L492
$L491:
; Line 428
	mov	BYTE PTR [esi+1], 0
$L492:
; Line 432
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L493
; Line 433
	mov	BYTE PTR [esi+2], -127			; ffffff81H
	pop	esi
; Line 449
	add	esp, 8
	ret	0
$L493:
; Line 435
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	test	al, al
	je	SHORT $L495
; Line 436
	mov	BYTE PTR [esi+2], 127			; 0000007fH
	pop	esi
; Line 449
	add	esp, 8
	ret	0
$L495:
; Line 439
	mov	BYTE PTR [esi+2], 0
	pop	esi
; Line 449
	add	esp, 8
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
;	COMDAT _respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR				; COMDAT
; Line 468
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	mov	DWORD PTR [eax+96], ecx
; Line 469
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, DWORD PTR _StarblazerEntities
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+4], edx
; Line 470
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, DWORD PTR _StarblazerEntities
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+8], edx
; Line 471
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, DWORD PTR _StarblazerEntities
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+12], edx
; Line 472
	ret	0
_respawn_player ENDP
_TEXT	ENDS
EXTRN	_run_entity_scripts:NEAR
EXTRN	_BG_COLOR:BYTE
EXTRN	_timeout:DWORD
EXTRN	_net_syncstate:NEAR
;	COMDAT _blazer2_module
_TEXT	SEGMENT
_joy$ = -8
_blazer2_module PROC NEAR				; COMDAT
; Line 474
	sub	esp, 8
; Line 477
	lea	eax, DWORD PTR _joy$[esp+8]
	push	ebx
	push	eax
	call	_vjoy_read
; Line 479
	mov	eax, DWORD PTR _frames_respawning
	xor	ebx, ebx
	add	esp, 4
	cmp	eax, ebx
	jne	SHORT $L504
; Line 480
	mov	BYTE PTR _BG_COLOR, bl
$L504:
; Line 483
	mov	ecx, DWORD PTR _StarblazerEntities
	cmp	DWORD PTR [ecx+96], ebx
	jg	SHORT $L506
	cmp	eax, ebx
	jne	SHORT $L810
; Line 484
	mov	edx, DWORD PTR _SND_EXPLODE
	push	edx
	call	_play_soundfx
; Line 486
	mov	eax, DWORD PTR _timeout
	add	esp, 4
; Line 489
	cmp	eax, ebx
	mov	BYTE PTR _dying, 1
	mov	DWORD PTR _frames_respawning, eax
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
	jne	SHORT $L810
; Line 490
	call	_respawn_player
	mov	eax, DWORD PTR _frames_respawning
$L506:
; Line 494
	cmp	eax, ebx
	je	SHORT $L508
$L810:
; Line 495
	xor	ecx, ecx
; Line 496
	dec	eax
	mov	DWORD PTR _joy$[esp+12], ecx
	mov	DWORD PTR _frames_respawning, eax
	mov	DWORD PTR _joy$[esp+16], ecx
; Line 498
	jne	SHORT $L508
; Line 499
	call	_respawn_player
$L508:
; Line 503
	mov	eax, DWORD PTR _shake_frames
	cmp	eax, ebx
	je	SHORT $L509
; Line 504
	dec	eax
	mov	DWORD PTR _shake_frames, eax
$L509:
; Line 508
	mov	edx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _joy$[esp+12]
	mov	cl, BYTE PTR _player_fighter+4
	add	edx, 16					; 00000010H
	push	edx
	push	eax
	push	ecx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
; Line 509
	mov	edx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _joy$[esp+21]
	mov	cl, BYTE PTR _player_fighter+4
	add	esp, 8
	add	edx, 16					; 00000010H
	push	edx
	push	eax
	push	ecx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
; Line 510
	mov	edx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _joy$[esp+22]
	mov	cl, BYTE PTR _player_fighter+4
	add	esp, 8
	add	edx, 16					; 00000010H
	push	edx
	push	eax
	push	ecx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
; Line 512
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 12					; 0000000cH
	test	al, al
	je	SHORT $L510
; Line 513
	cmp	BYTE PTR _shading, bl
	sete	dl
	mov	BYTE PTR _shading, dl
$L510:
; Line 517
	mov	al, BYTE PTR _joy$[esp+15]
	mov	ecx, DWORD PTR _player_battery
	push	esi
	mov	esi, DWORD PTR _firing_cooldown
	cmp	al, bl
	push	edi
	je	SHORT $L511
	mov	eax, DWORD PTR _player_weapon+4
	cmp	ecx, eax
	jb	SHORT $L511
	cmp	esi, ebx
	jne	SHORT $L511
; Line 518
	sub	ecx, eax
; Line 519
	mov	eax, DWORD PTR _player_weapon
	mov	DWORD PTR _player_battery, ecx
	mov	DWORD PTR _firing_cooldown, eax
; Line 520
	call	_fire_laser
; Line 522
	mov	edi, DWORD PTR _frames
	jmp	SHORT $L515
$L511:
; Line 524
	mov	eax, DWORD PTR _player_fighter+20
	mov	edi, DWORD PTR _frames
	cmp	ecx, eax
	mov	BYTE PTR _firing, bl
	jae	SHORT $L514
; Line 525
	mov	eax, edi
	push	ebp
	cdq
	mov	ebp, 15					; 0000000fH
	idiv	ebp
	pop	ebp
	test	edx, edx
	jne	SHORT $L514
	inc	ecx
	mov	DWORD PTR _player_battery, ecx
$L514:
; Line 527
	cmp	esi, ebx
	jbe	SHORT $L515
; Line 528
	dec	esi
	mov	DWORD PTR _firing_cooldown, esi
$L515:
; Line 533
	mov	al, BYTE PTR _joy$[esp+25]
	cmp	al, bl
	mov	al, BYTE PTR _boost_overheating
	je	SHORT $L516
	cmp	al, bl
	jne	SHORT $L516
; Line 534
	mov	ecx, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, ecx
; Line 537
	jmp	SHORT $L816
$L516:
	cmp	BYTE PTR _joy$[esp+26], bl
	je	SHORT $L519
	cmp	al, bl
	jne	SHORT $L519
; Line 538
	mov	DWORD PTR _velocity+8, ebx
$L816:
; Line 539
	mov	eax, edi
	mov	ecx, 5
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L525
	mov	eax, DWORD PTR _player_boost
	dec	eax
; Line 541
	jmp	SHORT $L815
$L519:
; Line 542
	mov	edx, DWORD PTR _frames_respawning
	mov	esi, DWORD PTR _player_fighter+8
; Line 548
	mov	eax, DWORD PTR _player_boost
	mov	ecx, DWORD PTR _player_fighter+16
	neg	edx
	sbb	edx, edx
	not	edx
	and	edx, esi
	cmp	eax, ecx
	mov	DWORD PTR _velocity+8, edx
	jae	SHORT $L525
; Line 549
	mov	eax, edi
	mov	ecx, 15					; 0000000fH
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L525
	mov	eax, DWORD PTR _player_boost
	inc	eax
$L815:
	mov	DWORD PTR _player_boost, eax
$L525:
; Line 555
	mov	al, BYTE PTR _multiplayer
	pop	edi
	cmp	al, bl
	pop	esi
	je	SHORT $L526
; Line 556
	call	_net_syncstate
$L526:
; Line 559
	call	_run_entity_scripts
; Line 562
	mov	eax, DWORD PTR _player_boost
	cmp	eax, ebx
	jne	SHORT $L527
; Line 563
	mov	BYTE PTR _boost_overheating, 1
$L527:
; Line 565
	mov	edx, DWORD PTR _player_fighter+16
	shr	edx, 1
	cmp	eax, edx
	jb	SHORT $L811
; Line 566
	mov	BYTE PTR _boost_overheating, bl
$L811:
; Line 570
	mov	eax, DWORD PTR _frames
	pop	ebx
	inc	eax
	mov	DWORD PTR _frames, eax
; Line 571
	add	esp, 8
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
;	COMDAT _blazer2_screencrack
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR				; COMDAT
; Line 574
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
; Line 575
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
; Line 576
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
; Line 577
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 578
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
; Line 579
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
; Line 580
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
; Line 581
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 582
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
; Line 583
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
; Line 584
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
; Line 585
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 586
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
; Line 587
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
; Line 588
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
; Line 589
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 590
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
;	COMDAT _count_entities
_TEXT	SEGMENT
_count_entities PROC NEAR				; COMDAT
; Line 595
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_StarblazerEntities
$L536:
; Line 598
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L537
	inc	eax
$L537:
; Line 597
	add	ecx, 4
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L536
; Line 602
	ret	0
_count_entities ENDP
_TEXT	ENDS
PUBLIC	_draw_debug
PUBLIC	??_C@_03FBAE@ENT?$AA@				; `string'
PUBLIC	??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@		; `string'
PUBLIC	??_C@_03FKCM@TRI?$AA@				; `string'
PUBLIC	??_C@_03FKNI@FPS?$AA@				; `string'
PUBLIC	??_C@_02MECO@?$CFd?$AA@				; `string'
PUBLIC	??_C@_08NNKG@?$CFd?5?$CFd?5?$CFd?$AA@		; `string'
PUBLIC	??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@	; `string'
EXTRN	_SL_VERTEX_INDEX:WORD
EXTRN	_SL_TRIANGLE_INDEX:WORD
EXTRN	_LAST_FRAME_TIME:DWORD
EXTRN	_vputs:NEAR
EXTRN	_sprintf:NEAR
;	COMDAT ??_C@_03FBAE@ENT?$AA@
; File src\blazer2.c
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
; File src\blazer2.c
; Line 605
	sub	esp, 100				; 00000064H
; Line 609
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:??_C@_03FBAE@ENT?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 610
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	lea	eax, DWORD PTR _num$[esp+108]
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	eax
	call	_sprintf
; Line 611
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	lea	ecx, DWORD PTR _num$[esp+136]
	push	15					; 0000000fH
	push	ecx
	call	_vputs
; Line 613
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:??_C@_03FKCM@TRI?$AA@	; `string'
	call	_vputs
	add	esp, 72					; 00000048H
; Line 614
	xor	edx, edx
	mov	dx, WORD PTR _SL_TRIANGLE_INDEX
	lea	eax, DWORD PTR _num$[esp+100]
	push	2500					; 000009c4H
	push	edx
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	eax
	call	_sprintf
; Line 615
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	lea	ecx, DWORD PTR _num$[esp+136]
	push	15					; 0000000fH
	push	ecx
	call	_vputs
; Line 617
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:??_C@_03FKNI@FPS?$AA@	; `string'
	call	_vputs
; Line 618
	mov	ecx, DWORD PTR _LAST_FRAME_TIME
	add	esp, 72					; 00000048H
	test	ecx, ecx
	je	SHORT $L549
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	ecx
	lea	edx, DWORD PTR _num$[esp+100]
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
$L549:
; Line 619
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	lea	eax, DWORD PTR _num$[esp+120]
	push	15					; 0000000fH
	push	eax
	call	_vputs
; Line 622
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR [eax+12]
	mov	edx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR [eax+4]
	sar	ecx, 16					; 00000010H
	sar	edx, 16					; 00000010H
	push	ecx
	push	edx
	sar	eax, 16					; 00000010H
	push	eax
	lea	ecx, DWORD PTR _num$[esp+140]
	push	OFFSET FLAT:??_C@_08NNKG@?$CFd?5?$CFd?5?$CFd?$AA@ ; `string'
	push	ecx
	call	_sprintf
; Line 623
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	0
	lea	edx, DWORD PTR _num$[esp+168]
	push	240					; 000000f0H
	push	edx
	call	_vputs
	add	esp, 76					; 0000004cH
; Line 625
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	lea	ecx, DWORD PTR _num$[esp+100]
	push	2500					; 000009c4H
	push	eax
	push	OFFSET FLAT:??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	ecx
	call	_sprintf
; Line 626
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	7
	lea	edx, DWORD PTR _num$[esp+136]
	push	240					; 000000f0H
	push	edx
	call	_vputs
; Line 627
	add	esp, 144				; 00000090H
	ret	0
_draw_debug ENDP
_TEXT	ENDS
PUBLIC	_draw_HPbar
EXTRN	_drawline:NEAR
;	COMDAT _draw_HPbar
_TEXT	SEGMENT
_j$ = -8
_pos2$ = -4
_draw_HPbar PROC NEAR					; COMDAT
; Line 629
	sub	esp, 8
; Line 634
	mov	eax, DWORD PTR _StarblazerEntities
	push	ebx
	push	ebp
	push	esi
	mov	ecx, DWORD PTR [eax+96]
	push	edi
; Line 636
	mov	DWORD PTR _j$[esp+24], 0
	lea	eax, DWORD PTR [ecx*8]
	sub	eax, ecx
	lea	ecx, DWORD PTR [eax+eax*2]
	mov	eax, 1717986919				; 66666667H
	imul	ecx
	mov	eax, DWORD PTR _barcycle
	sar	edx, 1
	mov	ecx, edx
	sar	eax, 3
	shr	ecx, 31					; 0000001fH
	add	eax, 8
	lea	esi, DWORD PTR [edx+ecx+16]
	lea	ebx, DWORD PTR [eax+eax]
$L563:
; Line 638
	cmp	eax, esi
	jg	SHORT $L832
	lea	edi, DWORD PTR [eax+8]
; Line 640
	mov	DWORD PTR _pos2$[esp+24], eax
; Line 642
	mov	eax, edi
	mov	edx, 24					; 00000018H
; Line 643
	cmp	eax, esi
	mov	ecx, 8
	jle	SHORT $L567
; Line 645
	mov	eax, ebx
	lea	ecx, DWORD PTR [esi+esi]
	sub	eax, ecx
	lea	ecx, DWORD PTR [eax+24]
; Line 646
	mov	eax, esi
$L567:
; Line 648
	cmp	ebx, 32					; 00000020H
	jge	SHORT $L568
	lea	edx, DWORD PTR [ebx-8]
; Line 650
	mov	DWORD PTR _pos2$[esp+24], 16		; 00000010H
$L568:
; Line 652
	mov	ebp, DWORD PTR _j$[esp+24]
	movsx	ebp, BYTE PTR _barcolors[ebp]
	push	ebp
	push	eax
	mov	eax, DWORD PTR _pos2$[esp+32]
	push	ecx
	push	eax
	push	edx
	call	_drawline
	mov	ecx, DWORD PTR _j$[esp+44]
	add	esp, 20					; 00000014H
; Line 653
	add	ebx, 16					; 00000010H
	inc	ecx
	cmp	ecx, 22					; 00000016H
	mov	eax, edi
	mov	DWORD PTR _j$[esp+24], ecx
	jl	SHORT $L563
$L832:
; Line 655
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
; Line 656
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
; Line 657
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
; Line 658
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 80					; 00000050H
; Line 659
	push	255					; 000000ffH
	push	esi
	push	24					; 00000018H
	push	esi
	push	8
	call	_drawline
	add	esp, 20					; 00000014H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 660
	add	esp, 8
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
	push	ebp
	push	esi
	push	edi
; Line 664
	mov	esi, 90					; 0000005aH
	mov	edi, 110				; 0000006eH
$L573:
; Line 667
	lea	ebx, DWORD PTR [esi+60]
	push	175					; 000000afH
	push	90					; 0000005aH
	push	ebx
	call	_bitset_pixel
; Line 668
	lea	ebp, DWORD PTR [edi+60]
	push	175					; 000000afH
	push	90					; 0000005aH
	push	ebp
	call	_bitset_pixel
; Line 669
	push	175					; 000000afH
	push	110					; 0000006eH
	push	ebx
	call	_bitset_pixel
; Line 670
	push	175					; 000000afH
	push	110					; 0000006eH
	push	ebp
	call	_bitset_pixel
; Line 671
	push	175					; 000000afH
	push	esi
	push	150					; 00000096H
	call	_bitset_pixel
; Line 672
	push	175					; 000000afH
	push	edi
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 72					; 00000048H
; Line 673
	push	175					; 000000afH
	push	esi
	push	170					; 000000aaH
	call	_bitset_pixel
; Line 674
	push	175					; 000000afH
	push	edi
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 24					; 00000018H
	inc	esi
	dec	edi
	lea	eax, DWORD PTR [esi-90]
	cmp	eax, 7
	jl	$L573
; Line 677
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 678
	ret	0
_draw_crosshair ENDP
_TEXT	ENDS
PUBLIC	_draw_boost_bar
;	COMDAT _draw_boost_bar
_TEXT	SEGMENT
_j$ = -8
_c$ = -4
_draw_boost_bar PROC NEAR				; COMDAT
; Line 681
	sub	esp, 12					; 0000000cH
; Line 686
	mov	ecx, DWORD PTR _player_boost
	push	ebx
	push	ebp
	push	esi
	lea	eax, DWORD PTR [ecx*8]
	push	edi
	sub	eax, ecx
; Line 688
	mov	DWORD PTR _j$[esp+28], 0
	lea	ecx, DWORD PTR [eax+eax*2]
	mov	eax, -858993459				; cccccccdH
	mul	ecx
	mov	eax, DWORD PTR _barcycle
	mov	esi, edx
	shr	esi, 2
	sar	eax, 3
	add	esi, 16					; 00000010H
	add	eax, 8
	lea	ebp, DWORD PTR [eax+eax]
	mov	DWORD PTR -12+[esp+28], ebp
$L587:
; Line 689
	mov	dl, BYTE PTR _boost_overheating
	neg	dl
	sbb	edx, edx
	and	edx, 64					; 00000040H
	add	edx, 159				; 0000009fH
; Line 690
	cmp	eax, esi
	mov	DWORD PTR _c$[esp+28], edx
	jg	SHORT $L845
	lea	edi, DWORD PTR [eax+8]
; Line 692
	mov	ebx, eax
; Line 694
	mov	eax, edi
	mov	edx, 312				; 00000138H
; Line 695
	cmp	eax, esi
	mov	ecx, 296				; 00000128H
	jle	SHORT $L591
; Line 697
	mov	eax, ebp
	lea	ecx, DWORD PTR [esi+esi]
	sub	eax, ecx
	lea	ecx, DWORD PTR [eax+312]
; Line 698
	mov	eax, esi
$L591:
; Line 700
	cmp	ebp, 32					; 00000020H
	jge	SHORT $L592
	lea	edx, DWORD PTR [ebp+280]
; Line 702
	mov	ebx, 16					; 00000010H
$L592:
; Line 704
	mov	ebp, DWORD PTR _c$[esp+28]
	push	ebp
	push	eax
	push	ecx
	push	ebx
	push	edx
	call	_drawline
; Line 705
	mov	ebp, DWORD PTR -12+[esp+48]
	mov	ecx, DWORD PTR _j$[esp+48]
	add	esp, 20					; 00000014H
	add	ebp, 16					; 00000010H
	inc	ecx
	mov	eax, edi
	cmp	ecx, 22					; 00000016H
	mov	DWORD PTR -12+[esp+28], ebp
	mov	DWORD PTR _j$[esp+28], ecx
	jl	SHORT $L587
$L845:
; Line 707
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
; Line 708
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
; Line 709
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
; Line 710
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 80					; 00000050H
; Line 711
	push	255					; 000000ffH
	push	esi
	push	312					; 00000138H
	push	esi
	push	296					; 00000128H
	call	_drawline
	add	esp, 20					; 00000014H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 712
	add	esp, 12					; 0000000cH
	ret	0
_draw_boost_bar ENDP
_TEXT	ENDS
PUBLIC	_draw_radar
EXTRN	_vec3_subtract:NEAR
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_plot_pixel:NEAR
;	COMDAT _draw_radar
_TEXT	SEGMENT
_c$ = -28
_vector_pos$ = -24
_screen_coords$ = -12
_draw_radar PROC NEAR					; COMDAT
; Line 714
	sub	esp, 36					; 00000024H
	push	ebx
	push	ebp
	push	esi
	push	edi
; Line 719
	xor	edi, edi
$L603:
; Line 720
	xor	esi, esi
	lea	ebx, DWORD PTR [edi+130]
$L606:
; Line 721
	xor	eax, eax
; Line 723
	test	edi, edi
	je	SHORT $L610
	cmp	edi, 59					; 0000003bH
	je	SHORT $L610
	test	esi, esi
	je	SHORT $L610
	cmp	esi, 59					; 0000003bH
	jne	SHORT $L865
$L610:
	mov	eax, 255				; 000000ffH
; Line 724
	jmp	SHORT $L611
$L865:
	lea	ecx, DWORD PTR [ebx+esi-130]
	and	ecx, -2147483647			; 80000001H
	jns	SHORT $L869
	dec	ecx
	or	ecx, -2					; fffffffeH
	inc	ecx
$L869:
	jne	SHORT $L607
$L611:
; Line 725
	lea	edx, DWORD PTR [esi+10]
	push	eax
	push	edx
	push	ebx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L607:
	inc	esi
	cmp	esi, 60					; 0000003cH
	jl	SHORT $L606
	inc	edi
	cmp	edi, 60					; 0000003cH
	jl	SHORT $L603
; Line 730
	or	ebx, -1
$L613:
; Line 731
	or	esi, -1
; Line 732
	lea	edi, DWORD PTR [ebx+160]
$L616:
	lea	eax, DWORD PTR [esi+40]
	push	239					; 000000efH
	push	eax
	push	edi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
	inc	esi
	cmp	esi, 2
	jl	SHORT $L616
	inc	ebx
	cmp	ebx, 2
	jl	SHORT $L613
; Line 736
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	mov	esi, OFFSET FLAT:_StarblazerEntities+4
	add	esp, 20					; 00000014H
	mov	DWORD PTR -32+[esp+52], esi
$L619:
; Line 740
	mov	eax, DWORD PTR [esi]
	test	eax, eax
	je	$L620
	mov	ecx, DWORD PTR [eax]
	test	BYTE PTR [ecx+32], 2
	je	$L620
; Line 741
	add	eax, 4
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR _vector_pos$[esp+52], edx
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _vector_pos$[esp+56], ecx
; Line 742
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR [eax+8]
	lea	eax, DWORD PTR _vector_pos$[esp+52]
	add	ecx, 4
	push	eax
	push	ecx
	mov	DWORD PTR _vector_pos$[esp+68], edx
	call	_vec3_subtract
; Line 743
	lea	edx, DWORD PTR _screen_coords$[esp+60]
	lea	eax, DWORD PTR _vector_pos$[esp+60]
	push	edx
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
; Line 745
	mov	eax, DWORD PTR _screen_coords$[esp+72]
; Line 746
	mov	edi, DWORD PTR _screen_coords$[esp+80]
	sar	eax, 17					; 00000011H
	add	esp, 20					; 00000014H
	sar	edi, 17					; 00000011H
; Line 748
	cmp	eax, 30					; 0000001eH
	jle	SHORT $L623
	mov	eax, 30					; 0000001eH
; Line 749
	jmp	SHORT $L624
$L623:
	cmp	eax, -30				; ffffffe2H
	jge	SHORT $L624
	mov	eax, -30				; ffffffe2H
$L624:
; Line 750
	cmp	edi, 30					; 0000001eH
	jle	SHORT $L625
	mov	edi, 30					; 0000001eH
; Line 751
	jmp	SHORT $L626
$L625:
	cmp	edi, -30				; ffffffe2H
	jge	SHORT $L626
	mov	edi, -30				; ffffffe2H
$L626:
; Line 753
	mov	ecx, DWORD PTR [esi]
	mov	ecx, DWORD PTR [ecx]
	mov	dl, BYTE PTR [ecx+37]
	test	dl, dl
	je	SHORT $L627
; Line 754
	mov	ebp, DWORD PTR _screen_coords$[esp+56]
	xor	edx, edx
	test	ebp, ebp
	setl	dl
	dec	edx
; Line 761
	lea	ebx, DWORD PTR [eax+159]
	and	edx, -48				; ffffffd0H
	mov	DWORD PTR -36+[esp+52], 3
	add	edx, 223				; 000000dfH
	mov	DWORD PTR _c$[esp+52], edx
$L630:
; Line 762
	mov	ebp, -40				; ffffffd8H
	lea	esi, DWORD PTR [edi+39]
	sub	ebp, edi
$L633:
; Line 763
	test	esi, esi
	jl	SHORT $L634
; Line 764
	mov	eax, DWORD PTR _c$[esp+52]
	push	eax
	push	esi
	push	ebx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L634:
	inc	esi
	lea	ecx, DWORD PTR [esi+ebp]
	cmp	ecx, 2
	jl	SHORT $L633
	mov	eax, DWORD PTR -36+[esp+52]
	inc	ebx
	dec	eax
	mov	DWORD PTR -36+[esp+52], eax
	jne	SHORT $L630
; Line 768
	mov	esi, DWORD PTR -32+[esp+52]
	jmp	SHORT $L620
$L627:
; Line 769
	xor	edx, edx
	add	edi, 40					; 00000028H
	mov	dl, BYTE PTR [ecx+36]
	add	eax, 160				; 000000a0H
	push	edx
	push	edi
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L620:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	mov	DWORD PTR -32+[esp+52], esi
	jl	$L619
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 773
	add	esp, 36					; 00000024H
	ret	0
_draw_radar ENDP
_TEXT	ENDS
PUBLIC	_draw_battery
;	COMDAT _draw_battery
_TEXT	SEGMENT
_draw_battery PROC NEAR					; COMDAT
; Line 778
	mov	eax, DWORD PTR _player_battery
	push	esi
	push	edi
	lea	edi, DWORD PTR [eax+eax*2]
	shl	edi, 1
	shr	edi, 4
; Line 780
	xor	esi, esi
$L643:
; Line 781
	cmp	eax, esi
	jb	SHORT $L644
; Line 782
	mov	ecx, edi
	lea	eax, DWORD PTR [esi+140]
	or	cl, -96					; ffffffa0H
	push	ecx
	push	170					; 000000aaH
	push	eax
	push	160					; 000000a0H
	push	eax
	call	_drawline
	mov	eax, DWORD PTR _player_battery
	add	esp, 20					; 00000014H
$L644:
	inc	esi
	cmp	esi, 40					; 00000028H
	jl	SHORT $L643
; Line 806
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
; Line 807
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
; Line 808
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
; Line 809
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 80					; 00000050H
	pop	edi
	pop	esi
; Line 810
	ret	0
_draw_battery ENDP
_TEXT	ENDS
PUBLIC	_draw_nametags
PUBLIC	??_C@_06BCGP@PLAYER?$AA@			; `string'
EXTRN	_muldiv:NEAR
EXTRN	_SL_FOV_X:DWORD
EXTRN	_SL_FOV_Y:DWORD
EXTRN	_players:BYTE
;	COMDAT ??_C@_06BCGP@PLAYER?$AA@
; File src\blazer2.c
_DATA	SEGMENT
??_C@_06BCGP@PLAYER?$AA@ DB 'PLAYER', 00H		; `string'
_DATA	ENDS
;	COMDAT _draw_nametags
_TEXT	SEGMENT
_vector_pos$ = -12
_screen_coords$ = -24
_draw_nametags PROC NEAR				; COMDAT
; File src\blazer2.c
; Line 819
	sub	esp, 24					; 00000018H
	push	esi
; Line 823
	mov	esi, OFFSET FLAT:_players+4
$L652:
; Line 824
	cmp	BYTE PTR [esi-4], 1
	jne	$L653
; Line 825
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	add	ecx, 4
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _vector_pos$[esp+28], edx
; Line 826
	lea	edx, DWORD PTR _vector_pos$[esp+28]
	mov	eax, DWORD PTR [ecx+4]
	push	edx
	mov	DWORD PTR _vector_pos$[esp+36], eax
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR [ecx+8]
	add	eax, 4
	push	eax
	mov	DWORD PTR _vector_pos$[esp+44], ecx
	call	_vec3_subtract
; Line 827
	lea	ecx, DWORD PTR _screen_coords$[esp+36]
	lea	edx, DWORD PTR _vector_pos$[esp+36]
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
; Line 829
	mov	eax, DWORD PTR _screen_coords$[esp+56]
	mov	ecx, DWORD PTR _SL_FOV_X
	mov	edx, DWORD PTR _screen_coords$[esp+48]
	push	eax
	push	ecx
	push	edx
	call	_muldiv
	movsx	ecx, WORD PTR _SL_CENTER_X
; Line 830
	mov	edx, DWORD PTR _screen_coords$[esp+68]
	sar	eax, 16					; 00000010H
	sub	ecx, eax
	mov	eax, DWORD PTR _SL_FOV_Y
	mov	DWORD PTR _screen_coords$[esp+60], ecx
	mov	ecx, DWORD PTR _screen_coords$[esp+64]
	push	edx
	push	eax
	push	ecx
	call	_muldiv
; Line 832
	mov	ecx, DWORD PTR _screen_coords$[esp+80]
	mov	edx, eax
	movsx	eax, WORD PTR _SL_CENTER_Y
	sar	edx, 16					; 00000010H
	add	esp, 44					; 0000002cH
	sub	eax, edx
	cmp	ecx, 65535				; 0000ffffH
	mov	DWORD PTR _screen_coords$[esp+32], eax
	jle	SHORT $L653
	cmp	ecx, 6553600				; 00640000H
	jge	SHORT $L653
; Line 833
	push	1
	push	255					; 000000ffH
	push	1
	push	1
	push	eax
	mov	eax, DWORD PTR _screen_coords$[esp+48]
	push	eax
	push	OFFSET FLAT:??_C@_06BCGP@PLAYER?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
$L653:
	add	esi, 32					; 00000020H
	cmp	esi, OFFSET FLAT:_players+516
	jl	$L652
	pop	esi
; Line 837
	add	esp, 24					; 00000018H
	ret	0
_draw_nametags ENDP
_TEXT	ENDS
PUBLIC	??_C@_0L@LPNF@RESPAWNING?$AA@			; `string'
PUBLIC	??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@		; `string'
EXTRN	_camera_translate:NEAR
EXTRN	_draw_scene:NEAR
EXTRN	_draw_hypercraft:NEAR
EXTRN	_set_hypercraft_orientation:NEAR
;	COMDAT ??_C@_0L@LPNF@RESPAWNING?$AA@
; File src\blazer2.c
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
; File src\blazer2.c
; Line 844
	mov	eax, DWORD PTR _shake_frames
	sub	esp, 80					; 00000050H
	test	eax, eax
	push	esi
	je	SHORT $L660
; Line 845
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_X, dx
; Line 846
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_Y, dx
; Line 848
	jmp	SHORT $L661
$L660:
; Line 849
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 850
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
$L661:
; Line 854
	mov	edx, DWORD PTR _StarblazerEntities
	add	edx, 4
	push	edx
	call	_camera_translate
; Line 855
	mov	eax, DWORD PTR _StarblazerEntities
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
; Line 858
	mov	cl, BYTE PTR _shading
	mov	eax, DWORD PTR _StarblazerEntities
	add	esp, 12					; 0000000cH
	lea	edx, DWORD PTR [eax+16]
	add	eax, 4
	push	500					; 000001f4H
	push	OFFSET FLAT:_title_stars
	mov	esi, DWORD PTR [edx]
	push	ecx
	sub	esp, 16					; 00000010H
	mov	ecx, esp
	push	eax
	mov	DWORD PTR [ecx], esi
	mov	esi, DWORD PTR [edx+4]
	mov	DWORD PTR [ecx+4], esi
	mov	esi, DWORD PTR [edx+8]
	mov	edx, DWORD PTR [edx+12]
	mov	DWORD PTR [ecx+8], esi
	mov	DWORD PTR [ecx+12], edx
	call	_draw_scene
; Line 861
	mov	eax, DWORD PTR _frames_respawning
	add	esp, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L662
	call	_draw_crosshair
$L662:
; Line 864
	call	_draw_boost_bar
; Line 867
	call	_draw_HPbar
; Line 870
	call	_draw_radar
; Line 873
	call	_draw_battery
; Line 875
	mov	al, BYTE PTR _multiplayer
	test	al, al
	je	SHORT $L663
	call	_draw_nametags
$L663:
; Line 879
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _player_fighter
	shr	eax, 1
	cmp	DWORD PTR [ecx+96], eax
	jae	SHORT $L664
; Line 880
	call	_blazer2_screencrack
$L664:
; Line 883
	mov	eax, DWORD PTR _frames_respawning
	test	eax, eax
	je	SHORT $L665
; Line 884
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	90					; 0000005aH
	push	110					; 0000006eH
	push	OFFSET FLAT:??_C@_0L@LPNF@RESPAWNING?$AA@ ; `string'
	call	_vputs
; Line 885
	mov	ecx, DWORD PTR _frames_respawning
	mov	eax, -736280107				; d41d41d5H
	mul	ecx
	sub	ecx, edx
	shr	ecx, 1
	add	ecx, edx
	lea	edx, DWORD PTR _text$[esp+112]
	shr	ecx, 6
	push	ecx
	push	OFFSET FLAT:??_C@_0L@CMOD@?5IN?5?$CFd?5SEC?$AA@ ; `string'
	push	edx
	call	_sprintf
; Line 886
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	100					; 00000064H
	lea	eax, DWORD PTR _text$[esp+144]
	push	110					; 0000006eH
	push	eax
	call	_vputs
	add	esp, 68					; 00000044H
$L665:
; Line 890
	call	_draw_debug
; Line 892
	mov	eax, DWORD PTR _barcycle
	add	eax, 2
; Line 893
	cmp	eax, 64					; 00000040H
	mov	DWORD PTR _barcycle, eax
	jne	SHORT $L668
	mov	DWORD PTR _barcycle, 0
$L668:
; Line 896
	mov	ecx, DWORD PTR _StarblazerEntities
	sub	esp, 16					; 00000010H
	add	ecx, 16					; 00000010H
	mov	edx, esp
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	eax, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], eax
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+12], ecx
	call	_set_hypercraft_orientation
; Line 897
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 24					; 00000018H
; Line 898
	pop	esi
	add	esp, 80					; 00000050H
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
