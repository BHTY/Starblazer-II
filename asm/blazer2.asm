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
;	COMDAT ??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@
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
_multiplayer DD	01H DUP (?)
_firing	DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_dying:DWORD
COMM	_impact_id:DWORD
_DATA	ENDS
_BSS	SEGMENT
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
COMM	_laser_type:DWORD
COMM	_frames:DWORD
_DATA	ENDS
_BSS	SEGMENT
_boost_overheating DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_velocity:BYTE:0cH
_DATA	ENDS
_BSS	SEGMENT
_barcycle DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_cam_template:BYTE:02cH
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
$L381:
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L703
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L703:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L704
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L704:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L705
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L705:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L706
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L706:
	mov	ecx, DWORD PTR [edi+8]
	lea	edx, DWORD PTR [eax+ecx-128]
	push	edx
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L707
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L707:
	mov	ecx, DWORD PTR [edi+4]
	lea	edx, DWORD PTR [eax+ecx-128]
	push	edx
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L708
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L708:
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
	jns	SHORT $L709
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L709:
	mov	edx, DWORD PTR _StarblazerEntities[esi*4]
	lea	ecx, DWORD PTR [eax+eax*2-384]
	mov	DWORD PTR [edx+36], ecx
; Line 64
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L710
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L710:
	mov	ecx, DWORD PTR _StarblazerEntities[esi*4]
	lea	eax, DWORD PTR [eax+eax*2-384]
	mov	DWORD PTR [ecx+40], eax
; Line 65
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L711
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L711:
	lea	edx, DWORD PTR [eax+eax*2-384]
	mov	eax, DWORD PTR _StarblazerEntities[esi*4]
	dec	ebx
	mov	DWORD PTR [eax+44], edx
	jne	$L381
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
$L401:
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
	jl	SHORT $L401
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
	mov	DWORD PTR _firing, 1
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
	jns	SHORT $L738
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L738:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L739
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L739:
	push	eax
	call	_rand
	and	eax, -2147483393			; 800000ffH
	jns	SHORT $L740
	dec	eax
	or	eax, -256				; ffffff00H
	inc	eax
$L740:
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
	test	eax, eax
	je	SHORT $L423
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
$L423:
; Line 168
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+32]
	test	ecx, ecx
	jne	SHORT $L424
; Line 169
	push	eax
	call	_free
	add	esp, 4
; Line 170
	mov	DWORD PTR [esi], 0
$L424:
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
$L429:
; Line 181
	mov	eax, DWORD PTR [edi]
	test	eax, eax
	je	SHORT $L430
	mov	ecx, DWORD PTR [esi]
	cmp	eax, ecx
	je	SHORT $L430
; Line 182
	mov	edx, DWORD PTR [eax]
	test	BYTE PTR [edx+32], 1
	je	SHORT $L430
; Line 183
	push	eax
	push	ecx
	call	_test_collisions
	add	esp, 8
	test	eax, eax
	jne	SHORT $L752
$L430:
; Line 180
	add	edi, 4
	inc	ebp
	cmp	edi, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L429
; Line 199
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+32]
	test	ecx, ecx
	jne	SHORT $L435
; Line 200
	push	eax
	call	_free
	add	esp, 4
; Line 201
	mov	DWORD PTR [esi], 0
$L435:
	pop	edi
	pop	esi
	pop	ebp
; Line 203
	ret	0
$L752:
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
	test	eax, eax
	je	SHORT $L439
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
$L439:
; Line 214
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax+96]
	test	ecx, ecx
	jg	SHORT $L440
; Line 215
	push	esi
	call	_explode_entity
	add	esp, 4
$L440:
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
	jne	SHORT $L444
; Line 229
	mov	edx, DWORD PTR [esi]
	push	edx
	call	_free
	add	esp, 4
; Line 230
	mov	DWORD PTR [esi], 0
$L444:
	pop	esi
; Line 232
	ret	0
_debris_script ENDP
_TEXT	ENDS
PUBLIC	_set_attributes
PUBLIC	??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@	; `string'
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
	push	esi
	push	edi
; Line 235
	push	OFFSET FLAT:??_C@_0BE@NGHL@assets?1shreder2?4obj?$AA@ ; `string'
	call	_load_model
	mov	DWORD PTR _ENEMY_LASER+12, eax
; Line 236
	mov	DWORD PTR [eax+12], OFFSET FLAT:_enemy_laser_script
; Line 237
	mov	eax, DWORD PTR _ENEMY_LASER+12
; Line 238
	xor	esi, esi
; Line 239
	mov	edi, 2
; Line 240
	push	196608					; 00030000H
	mov	BYTE PTR [eax+36], 239			; 000000efH
	mov	ecx, DWORD PTR _ENEMY_LASER+12
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	DWORD PTR [ecx+40], esi
	mov	edx, DWORD PTR _ENEMY_LASER+12
	mov	DWORD PTR [edx+32], edi
	mov	eax, DWORD PTR _ENEMY_LASER+12
	push	eax
	call	_create_hitbox
; Line 243
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR _ENEMY_LASER+8, 8
; Line 247
	push	196608					; 00030000H
	push	196608					; 00030000H
	mov	DWORD PTR [ecx+12], OFFSET FLAT:_laser_script
	mov	edx, DWORD PTR _LASER_PLAYER
	push	196608					; 00030000H
	mov	DWORD PTR [edx+32], edi
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR [eax+36], 191			; 000000bfH
	mov	ecx, DWORD PTR _LASER_PLAYER
	mov	DWORD PTR [ecx+40], esi
	mov	edx, DWORD PTR _LASER_PLAYER
	push	edx
	call	_create_hitbox
; Line 249
	mov	eax, 40					; 00000028H
; Line 273
	push	OFFSET FLAT:??_C@_0BB@BOHA@assets?1shard?4obj?$AA@ ; `string'
	mov	DWORD PTR _player_fighter, eax
	mov	DWORD PTR _player_fighter+16, eax
	mov	DWORD PTR _player_fighter+20, eax
	mov	eax, DWORD PTR _LASER_PLAYER
	mov	BYTE PTR _player_fighter+4, 25		; 00000019H
	mov	DWORD PTR _player_fighter+8, 12288	; 00003000H
	mov	DWORD PTR _player_fighter+12, 61440	; 0000f000H
	mov	DWORD PTR _player_weapon, 3
	mov	DWORD PTR _player_weapon+4, edi
	mov	DWORD PTR _player_weapon+8, edi
	mov	DWORD PTR _player_weapon+12, eax
	mov	DWORD PTR _laser_velocity, esi
	mov	DWORD PTR _laser_velocity+4, esi
	mov	DWORD PTR _laser_velocity+8, 65536	; 00010000H
	call	_load_model
	mov	DWORD PTR _EXPLOSION_SHARD, eax
; Line 274
	mov	DWORD PTR [eax+12], OFFSET FLAT:_debris_script
; Line 275
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
; Line 278
	push	esi
	push	esi
	push	esi
	mov	DWORD PTR [ecx+32], edi
	mov	edx, DWORD PTR _EXPLOSION_SHARD
	mov	BYTE PTR [edx+36], 127			; 0000007fH
	mov	eax, DWORD PTR _EXPLOSION_SHARD
	mov	DWORD PTR [eax+40], esi
	mov	ecx, DWORD PTR _EXPLOSION_SHARD
	push	ecx
	call	_create_hitbox
; Line 280
	push	OFFSET FLAT:??_C@_0BE@GKAM@assets?1asterold?4obj?$AA@ ; `string'
	call	_load_model
	mov	DWORD PTR _ASTEROID, eax
; Line 281
	mov	DWORD PTR [eax+12], OFFSET FLAT:_asteroid_script
; Line 282
	mov	edx, DWORD PTR _ASTEROID
; Line 286
	push	327680					; 00050000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	DWORD PTR [edx+32], 3
	mov	eax, DWORD PTR _ASTEROID
	mov	DWORD PTR [eax+28], 10			; 0000000aH
	mov	ecx, DWORD PTR _ASTEROID
	mov	BYTE PTR [ecx+36], 250			; 000000faH
	mov	edx, DWORD PTR _ASTEROID
	mov	DWORD PTR [edx+40], esi
	mov	eax, DWORD PTR _ASTEROID
	push	eax
	call	_create_hitbox
	add	esp, 76					; 0000004cH
; Line 288
	push	OFFSET FLAT:??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ ; `string'
	call	_load_model
	mov	DWORD PTR _AX5, eax
; Line 289
	mov	DWORD PTR [eax+12], OFFSET FLAT:_ax5_script
; Line 290
	mov	ecx, DWORD PTR _AX5
; Line 293
	push	458752					; 00070000H
	push	327680					; 00050000H
	push	327680					; 00050000H
	mov	DWORD PTR [ecx+32], 3
	mov	edx, DWORD PTR _AX5
	mov	DWORD PTR [edx+28], esi
	mov	eax, DWORD PTR _AX5
	mov	DWORD PTR [eax+40], 1
	mov	ecx, DWORD PTR _AX5
	push	ecx
	call	_create_hitbox
	add	esp, 20					; 00000014H
	pop	edi
	pop	esi
; Line 294
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
PUBLIC	??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@	; `string'
EXTRN	_SL_CENTER_X:WORD
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_SG_Draw:DWORD
EXTRN	_SG_Module:DWORD
EXTRN	_shading:DWORD
EXTRN	_init_hypercraft:NEAR
EXTRN	_sfx_enable:DWORD
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
;	COMDAT ??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@
_DATA	SEGMENT
??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@ DB 'assets/shreder1.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT _blazer2_init
_TEXT	SEGMENT
_blazer2_init PROC NEAR					; COMDAT
; File src\blazer2.c
; Line 303
	push	esi
	push	edi
; Line 306
	xor	edi, edi
; Line 307
	mov	esi, 1
	mov	DWORD PTR _frames, edi
	mov	DWORD PTR _shading, esi
; Line 310
	call	_stop_music
; Line 311
	push	OFFSET FLAT:??_C@_0M@KHLK@sfx?1net?4wav?$AA@ ; `string'
	call	_play_music
; Line 313
	push	edi
	push	esi
	push	OFFSET FLAT:??_C@_0BA@HMID@sfx?1explode?4wav?$AA@ ; `string'
	mov	DWORD PTR _sfx_enable, esi
	call	_load_soundfx
; Line 314
	push	edi
	push	2
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	mov	DWORD PTR _SND_EXPLODE, eax
	call	_load_soundfx
; Line 315
	push	edi
	push	3
	push	OFFSET FLAT:??_C@_0O@OLEL@sfx?1laser?4wav?$AA@ ; `string'
	mov	DWORD PTR _SND_LASER, eax
	call	_load_soundfx
; Line 316
	push	edi
	push	esi
	push	OFFSET FLAT:??_C@_0M@LLEG@sfx?1hit?4wav?$AA@ ; `string'
	mov	DWORD PTR _SND_LASER_ENEMY, eax
	call	_load_soundfx
; Line 319
	push	OFFSET FLAT:??_C@_0BE@DGBE@assets?1shreder1?4obj?$AA@ ; `string'
	mov	DWORD PTR _SND_HIT, eax
	call	_load_model
	mov	DWORD PTR _LASER_PLAYER, eax
; Line 320
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 321
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
; Line 323
	call	_set_attributes
; Line 330
	mov	eax, DWORD PTR _player_fighter
; Line 333
	push	458752					; 00070000H
	push	131072					; 00020000H
	push	196608					; 00030000H
	push	OFFSET FLAT:_cam_template
	mov	DWORD PTR _cam_template, edi
	mov	DWORD PTR _cam_template+4, edi
	mov	WORD PTR _cam_template+8, di
	mov	WORD PTR _cam_template+10, di
	mov	DWORD PTR _cam_template+12, OFFSET FLAT:_cam_script
	mov	DWORD PTR _cam_template+28, eax
	mov	DWORD PTR _cam_template+32, 2
	call	_create_hitbox
	add	esp, 72					; 00000048H
	mov	esi, OFFSET FLAT:_title_stars
$L462:
; Line 337
	push	esi
	call	_init_star
	add	esi, 12					; 0000000cH
	add	esp, 4
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jl	SHORT $L462
; Line 341
	mov	esi, OFFSET FLAT:_StarblazerEntities
$L465:
; Line 342
	mov	ecx, DWORD PTR [esi]
	push	ecx
	call	_free
; Line 343
	mov	DWORD PTR [esi], edi
	add	esi, 4
	add	esp, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L465
; Line 347
	push	edi
	push	edi
	push	edi
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
; Line 351
	mov	eax, DWORD PTR _player_fighter+20
	mov	edx, DWORD PTR _player_fighter+16
	mov	DWORD PTR _player_battery, eax
; Line 356
	mov	eax, DWORD PTR _multiplayer
	add	esp, 28					; 0000001cH
	cmp	eax, edi
	mov	DWORD PTR _player_boost, edx
	jne	SHORT $L471
; Line 357
	mov	esi, 100				; 00000064H
$L469:
; Line 358
	call	_spawn_asteroid
	dec	esi
	jne	SHORT $L469
$L471:
; Line 368
	mov	ecx, DWORD PTR _player_fighter+8
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_blazer2_module
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_blazer2_draw
	mov	DWORD PTR _velocity, edi
	mov	DWORD PTR _velocity+4, edi
	mov	DWORD PTR _velocity+8, ecx
; Line 370
	call	_init_hypercraft
	pop	edi
	pop	esi
; Line 371
	ret	0
_blazer2_init ENDP
_TEXT	ENDS
PUBLIC	_angle_multiply
;	COMDAT _angle_multiply
_TEXT	SEGMENT
_angle$ = 8
_joy_amount$ = 12
_angle_multiply PROC NEAR				; COMDAT
; Line 374
	mov	eax, DWORD PTR _angle$[esp-4]
	movsx	ecx, BYTE PTR _joy_amount$[esp-4]
	and	eax, 255				; 000000ffH
	imul	eax, ecx
	sar	eax, 8
; Line 375
	ret	0
_angle_multiply ENDP
_TEXT	ENDS
PUBLIC	_vjoy_read
EXTRN	_SG_ReadMouse:NEAR
EXTRN	_SG_KeyDown:NEAR
;	COMDAT _vjoy_read
_TEXT	SEGMENT
_joy$ = 8
_mouse$ = -12
_vjoy_read PROC NEAR					; COMDAT
; Line 377
	sub	esp, 12					; 0000000cH
; Line 381
	lea	eax, DWORD PTR _mouse$[esp+12]
	push	esi
	push	eax
	call	_SG_ReadMouse
; Line 383
	push	74					; 0000004aH
	call	_SG_KeyDown
	mov	esi, DWORD PTR _joy$[esp+20]
; Line 385
	push	75					; 0000004bH
	mov	DWORD PTR [esi+4], eax
	mov	DWORD PTR [esi+20], 0
	call	_SG_KeyDown
; Line 386
	push	66					; 00000042H
	mov	DWORD PTR [esi+16], eax
	call	_SG_KeyDown
; Line 389
	push	87					; 00000057H
	mov	DWORD PTR [esi+12], eax
	call	_SG_KeyDown
	add	esp, 20					; 00000014H
	test	eax, eax
	je	SHORT $L478
; Line 390
	mov	BYTE PTR [esi], 127			; 0000007fH
; Line 392
	jmp	SHORT $L480
$L478:
	push	83					; 00000053H
	call	_SG_KeyDown
	add	esp, 4
	neg	eax
	sbb	al, al
	and	al, -127				; ffffff81H
	mov	BYTE PTR [esi], al
$L480:
; Line 400
	push	65					; 00000041H
	call	_SG_KeyDown
	add	esp, 4
	test	eax, eax
	je	SHORT $L482
; Line 401
	mov	BYTE PTR [esi+1], 127			; 0000007fH
; Line 403
	jmp	SHORT $L485
$L482:
	push	68					; 00000044H
	call	_SG_KeyDown
	add	esp, 4
	test	eax, eax
	je	SHORT $L484
; Line 404
	mov	BYTE PTR [esi+1], -127			; ffffff81H
; Line 406
	jmp	SHORT $L485
$L484:
; Line 407
	mov	BYTE PTR [esi+1], 0
$L485:
; Line 411
	push	81					; 00000051H
	call	_SG_KeyDown
	add	esp, 4
	test	eax, eax
	je	SHORT $L486
; Line 412
	mov	BYTE PTR [esi+2], -127			; ffffff81H
	pop	esi
; Line 428
	add	esp, 12					; 0000000cH
	ret	0
$L486:
; Line 414
	push	69					; 00000045H
	call	_SG_KeyDown
	add	esp, 4
	test	eax, eax
	je	SHORT $L488
; Line 415
	mov	BYTE PTR [esi+2], 127			; 0000007fH
	pop	esi
; Line 428
	add	esp, 12					; 0000000cH
	ret	0
$L488:
; Line 418
	mov	BYTE PTR [esi+2], 0
	pop	esi
; Line 428
	add	esp, 12					; 0000000cH
	ret	0
_vjoy_read ENDP
_TEXT	ENDS
PUBLIC	_respawn_player
;	COMDAT _respawn_player
_TEXT	SEGMENT
_respawn_player PROC NEAR				; COMDAT
; Line 447
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _player_fighter
	mov	DWORD PTR [eax+96], ecx
; Line 448
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, DWORD PTR _StarblazerEntities
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+4], edx
; Line 449
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, DWORD PTR _StarblazerEntities
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+8], edx
; Line 450
	call	_rand
	cdq
	mov	ecx, 100				; 00000064H
	idiv	ecx
	mov	eax, DWORD PTR _StarblazerEntities
	sub	edx, 50					; 00000032H
	shl	edx, 16					; 00000010H
	mov	DWORD PTR [eax+12], edx
; Line 451
	ret	0
_respawn_player ENDP
_TEXT	ENDS
EXTRN	_run_entity_scripts:NEAR
EXTRN	_BG_COLOR:BYTE
EXTRN	_timeout:DWORD
EXTRN	_net_syncstate:NEAR
;	COMDAT _blazer2_module
_TEXT	SEGMENT
_joy$ = -24
_blazer2_module PROC NEAR				; COMDAT
; Line 453
	sub	esp, 24					; 00000018H
; Line 456
	lea	eax, DWORD PTR _joy$[esp+24]
	push	ebx
	push	eax
	call	_vjoy_read
; Line 458
	mov	edx, DWORD PTR _frames_respawning
	xor	ebx, ebx
	add	esp, 4
	cmp	edx, ebx
	jne	SHORT $L497
; Line 459
	mov	BYTE PTR _BG_COLOR, bl
$L497:
; Line 462
	mov	ecx, DWORD PTR _StarblazerEntities
	push	esi
	push	edi
	cmp	DWORD PTR [ecx+96], ebx
	jg	SHORT $L499
	cmp	edx, ebx
	jne	SHORT $L787
; Line 463
	mov	edx, DWORD PTR _SND_EXPLODE
	push	edx
	call	_play_soundfx
; Line 465
	mov	edx, DWORD PTR _timeout
	add	esp, 4
; Line 468
	cmp	edx, ebx
	mov	DWORD PTR _dying, 1
	mov	DWORD PTR _frames_respawning, edx
	mov	BYTE PTR _BG_COLOR, 127			; 0000007fH
	jne	SHORT $L787
; Line 469
	call	_respawn_player
	mov	edx, DWORD PTR _frames_respawning
$L499:
; Line 473
	cmp	edx, ebx
	je	SHORT $L501
$L787:
; Line 474
	xor	eax, eax
	mov	ecx, 6
	lea	edi, DWORD PTR _joy$[esp+36]
; Line 475
	dec	edx
	rep stosd
	mov	DWORD PTR _frames_respawning, edx
; Line 477
	jne	SHORT $L501
; Line 478
	call	_respawn_player
$L501:
; Line 482
	mov	eax, DWORD PTR _shake_frames
	cmp	eax, ebx
	je	SHORT $L502
; Line 483
	dec	eax
	mov	DWORD PTR _shake_frames, eax
$L502:
; Line 487
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _joy$[esp+36]
	mov	dl, BYTE PTR _player_fighter+4
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
; Line 488
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _joy$[esp+45]
	mov	dl, BYTE PTR _player_fighter+4
	add	esp, 8
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
; Line 489
	mov	eax, DWORD PTR _StarblazerEntities
	mov	ecx, DWORD PTR _joy$[esp+46]
	mov	dl, BYTE PTR _player_fighter+4
	add	esp, 8
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
; Line 491
	push	80					; 00000050H
	call	_SG_KeyDown
	add	esp, 12					; 0000000cH
	test	eax, eax
	je	SHORT $L503
; Line 492
	mov	ecx, DWORD PTR _shading
	xor	eax, eax
	cmp	ecx, ebx
	sete	al
	mov	DWORD PTR _shading, eax
$L503:
; Line 496
	mov	eax, DWORD PTR _joy$[esp+40]
	mov	ecx, DWORD PTR _player_battery
	mov	esi, DWORD PTR _firing_cooldown
	cmp	eax, ebx
	je	SHORT $L504
	mov	eax, DWORD PTR _player_weapon+4
	cmp	ecx, eax
	jb	SHORT $L504
	cmp	esi, ebx
	jne	SHORT $L504
; Line 497
	sub	ecx, eax
	mov	DWORD PTR _player_battery, ecx
; Line 498
	mov	ecx, DWORD PTR _player_weapon
	mov	DWORD PTR _firing_cooldown, ecx
; Line 499
	call	_fire_laser
; Line 501
	mov	edi, DWORD PTR _frames
	jmp	SHORT $L508
$L504:
; Line 503
	mov	eax, DWORD PTR _player_fighter+20
	mov	edi, DWORD PTR _frames
	cmp	ecx, eax
	mov	DWORD PTR _firing, ebx
	jae	SHORT $L507
; Line 504
	mov	eax, edi
	push	ebp
	cdq
	mov	ebp, 15					; 0000000fH
	idiv	ebp
	pop	ebp
	test	edx, edx
	jne	SHORT $L507
	inc	ecx
	mov	DWORD PTR _player_battery, ecx
$L507:
; Line 506
	cmp	esi, ebx
	jbe	SHORT $L508
; Line 507
	dec	esi
	mov	DWORD PTR _firing_cooldown, esi
$L508:
; Line 512
	mov	eax, DWORD PTR _joy$[esp+48]
	cmp	eax, ebx
	mov	eax, DWORD PTR _boost_overheating
	je	SHORT $L509
	cmp	eax, ebx
	jne	SHORT $L509
; Line 513
	mov	edx, DWORD PTR _player_fighter+12
	mov	DWORD PTR _velocity+8, edx
; Line 516
	jmp	SHORT $L793
$L509:
	cmp	DWORD PTR _joy$[esp+52], ebx
	je	SHORT $L512
	cmp	eax, ebx
	jne	SHORT $L512
; Line 517
	mov	DWORD PTR _velocity+8, ebx
$L793:
; Line 518
	mov	eax, edi
	mov	ecx, 5
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L518
	mov	eax, DWORD PTR _player_boost
	dec	eax
; Line 520
	jmp	SHORT $L792
$L512:
; Line 521
	mov	edx, DWORD PTR _frames_respawning
	mov	esi, DWORD PTR _player_fighter+8
; Line 527
	mov	eax, DWORD PTR _player_boost
	mov	ecx, DWORD PTR _player_fighter+16
	neg	edx
	sbb	edx, edx
	not	edx
	and	edx, esi
	cmp	eax, ecx
	mov	DWORD PTR _velocity+8, edx
	jae	SHORT $L518
; Line 528
	mov	eax, edi
	mov	ecx, 15					; 0000000fH
	cdq
	idiv	ecx
	test	edx, edx
	jne	SHORT $L518
	mov	eax, DWORD PTR _player_boost
	inc	eax
$L792:
	mov	DWORD PTR _player_boost, eax
$L518:
; Line 534
	mov	eax, DWORD PTR _multiplayer
	pop	edi
	cmp	eax, ebx
	pop	esi
	je	SHORT $L519
; Line 535
	call	_net_syncstate
$L519:
; Line 538
	call	_run_entity_scripts
; Line 541
	mov	eax, DWORD PTR _player_boost
	cmp	eax, ebx
	jne	SHORT $L520
; Line 542
	mov	DWORD PTR _boost_overheating, 1
$L520:
; Line 544
	mov	edx, DWORD PTR _player_fighter+16
	shr	edx, 1
	cmp	eax, edx
	jb	SHORT $L788
; Line 545
	mov	DWORD PTR _boost_overheating, ebx
$L788:
; Line 549
	mov	eax, DWORD PTR _frames
	pop	ebx
	inc	eax
	mov	DWORD PTR _frames, eax
; Line 550
	add	esp, 24					; 00000018H
	ret	0
_blazer2_module ENDP
_TEXT	ENDS
PUBLIC	_blazer2_screencrack
EXTRN	_draw_line:NEAR
;	COMDAT _blazer2_screencrack
_TEXT	SEGMENT
_blazer2_screencrack PROC NEAR				; COMDAT
; Line 553
	push	255					; 000000ffH
	push	50					; 00000032H
	push	40					; 00000028H
	push	0
	push	30					; 0000001eH
	call	_draw_line
; Line 554
	push	255					; 000000ffH
	push	80					; 00000050H
	push	70					; 00000046H
	push	50					; 00000032H
	push	40					; 00000028H
	call	_draw_line
; Line 555
	push	255					; 000000ffH
	push	85					; 00000055H
	push	120					; 00000078H
	push	80					; 00000050H
	push	70					; 00000046H
	call	_draw_line
; Line 556
	push	255					; 000000ffH
	push	155					; 0000009bH
	push	180					; 000000b4H
	push	140					; 0000008cH
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 557
	push	255					; 000000ffH
	push	200					; 000000c8H
	push	220					; 000000dcH
	push	155					; 0000009bH
	push	180					; 000000b4H
	call	_draw_line
; Line 558
	push	255					; 000000ffH
	push	70					; 00000046H
	push	200					; 000000c8H
	push	85					; 00000055H
	push	215					; 000000d7H
	call	_draw_line
; Line 559
	push	255					; 000000ffH
	push	50					; 00000032H
	push	215					; 000000d7H
	push	70					; 00000046H
	push	200					; 000000c8H
	call	_draw_line
; Line 560
	push	255					; 000000ffH
	push	40					; 00000028H
	push	319					; 0000013fH
	push	50					; 00000032H
	push	215					; 000000d7H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 561
	push	255					; 000000ffH
	push	130					; 00000082H
	push	100					; 00000064H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
; Line 562
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
; Line 563
	push	255					; 000000ffH
	push	140					; 0000008cH
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
; Line 564
	push	255					; 000000ffH
	push	85					; 00000055H
	push	215					; 000000d7H
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 565
	push	255					; 000000ffH
	push	100					; 00000064H
	push	160					; 000000a0H
	push	85					; 00000055H
	push	120					; 00000078H
	call	_draw_line
; Line 566
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	80					; 00000050H
	push	130					; 00000082H
	push	100					; 00000064H
	call	_draw_line
; Line 567
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	20					; 00000014H
	push	160					; 000000a0H
	push	80					; 00000050H
	call	_draw_line
; Line 568
	push	255					; 000000ffH
	push	192					; 000000c0H
	push	0
	push	170					; 000000aaH
	push	20					; 00000014H
	call	_draw_line
	add	esp, 80					; 00000050H
; Line 569
	ret	0
_blazer2_screencrack ENDP
_TEXT	ENDS
PUBLIC	_count_entities
;	COMDAT _count_entities
_TEXT	SEGMENT
_count_entities PROC NEAR				; COMDAT
; Line 574
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_StarblazerEntities
$L529:
; Line 577
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L530
	inc	eax
$L530:
; Line 576
	add	ecx, 4
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L529
; Line 581
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
; Line 584
	sub	esp, 100				; 00000064H
; Line 588
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	push	0
	push	OFFSET FLAT:??_C@_03FBAE@ENT?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 589
	push	1000					; 000003e8H
	call	_count_entities
	push	eax
	lea	eax, DWORD PTR _num$[esp+108]
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	eax
	call	_sprintf
; Line 590
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	0
	lea	ecx, DWORD PTR _num$[esp+136]
	push	15					; 0000000fH
	push	ecx
	call	_vputs
; Line 592
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	push	0
	push	OFFSET FLAT:??_C@_03FKCM@TRI?$AA@	; `string'
	call	_vputs
	add	esp, 72					; 00000048H
; Line 593
	xor	edx, edx
	mov	dx, WORD PTR _SL_TRIANGLE_INDEX
	lea	eax, DWORD PTR _num$[esp+100]
	push	2500					; 000009c4H
	push	edx
	push	OFFSET FLAT:??_C@_07DEMH@?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	eax
	call	_sprintf
; Line 594
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	7
	lea	ecx, DWORD PTR _num$[esp+136]
	push	15					; 0000000fH
	push	ecx
	call	_vputs
; Line 596
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	push	0
	push	OFFSET FLAT:??_C@_03FKNI@FPS?$AA@	; `string'
	call	_vputs
; Line 597
	mov	ecx, DWORD PTR _LAST_FRAME_TIME
	add	esp, 72					; 00000048H
	test	ecx, ecx
	je	SHORT $L542
	mov	eax, 1000				; 000003e8H
	cdq
	idiv	ecx
	lea	edx, DWORD PTR _num$[esp+100]
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	push	edx
	call	_sprintf
	add	esp, 12					; 0000000cH
$L542:
; Line 598
	push	1
	push	239					; 000000efH
	push	1
	push	1
	push	14					; 0000000eH
	lea	eax, DWORD PTR _num$[esp+120]
	push	15					; 0000000fH
	push	eax
	call	_vputs
; Line 601
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
; Line 602
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
; Line 604
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	lea	ecx, DWORD PTR _num$[esp+100]
	push	2500					; 000009c4H
	push	eax
	push	OFFSET FLAT:??_C@_0N@LGLK@VERT?5?$CFd?5?1?5?$CFd?$AA@ ; `string'
	push	ecx
	call	_sprintf
; Line 605
	push	1
	push	175					; 000000afH
	push	1
	push	1
	push	7
	lea	edx, DWORD PTR _num$[esp+136]
	push	240					; 000000f0H
	push	edx
	call	_vputs
; Line 606
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
; Line 608
	sub	esp, 8
; Line 613
	mov	eax, DWORD PTR _StarblazerEntities
	push	ebx
	push	ebp
	push	esi
	mov	ecx, DWORD PTR [eax+96]
	push	edi
; Line 615
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
$L556:
; Line 617
	cmp	eax, esi
	jg	SHORT $L809
	lea	edi, DWORD PTR [eax+8]
; Line 619
	mov	DWORD PTR _pos2$[esp+24], eax
; Line 621
	mov	eax, edi
	mov	edx, 24					; 00000018H
; Line 622
	cmp	eax, esi
	mov	ecx, 8
	jle	SHORT $L560
; Line 624
	mov	eax, ebx
	lea	ecx, DWORD PTR [esi+esi]
	sub	eax, ecx
	lea	ecx, DWORD PTR [eax+24]
; Line 625
	mov	eax, esi
$L560:
; Line 627
	cmp	ebx, 32					; 00000020H
	jge	SHORT $L561
	lea	edx, DWORD PTR [ebx-8]
; Line 629
	mov	DWORD PTR _pos2$[esp+24], 16		; 00000010H
$L561:
; Line 631
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
; Line 632
	add	ebx, 16					; 00000010H
	inc	ecx
	cmp	ecx, 22					; 00000016H
	mov	eax, edi
	mov	DWORD PTR _j$[esp+24], ecx
	jl	SHORT $L556
$L809:
; Line 634
	push	255					; 000000ffH
	push	16					; 00000010H
	push	24					; 00000018H
	push	16					; 00000010H
	push	8
	call	_drawline
; Line 635
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	24					; 00000018H
	push	16					; 00000010H
	push	24					; 00000018H
	call	_drawline
; Line 636
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	8
	push	184					; 000000b8H
	push	24					; 00000018H
	call	_drawline
; Line 637
	push	255					; 000000ffH
	push	16					; 00000010H
	push	8
	push	184					; 000000b8H
	push	8
	call	_drawline
	add	esp, 80					; 00000050H
; Line 638
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
; Line 639
	add	esp, 8
	ret	0
_draw_HPbar ENDP
_TEXT	ENDS
PUBLIC	_draw_crosshair
EXTRN	_bitset_pixel:NEAR
;	COMDAT _draw_crosshair
_TEXT	SEGMENT
_draw_crosshair PROC NEAR				; COMDAT
; Line 641
	push	ebx
	push	ebp
	push	esi
	push	edi
; Line 643
	mov	esi, 90					; 0000005aH
	mov	edi, 110				; 0000006eH
$L566:
; Line 646
	lea	ebx, DWORD PTR [esi+60]
	push	175					; 000000afH
	push	90					; 0000005aH
	push	ebx
	call	_bitset_pixel
; Line 647
	lea	ebp, DWORD PTR [edi+60]
	push	175					; 000000afH
	push	90					; 0000005aH
	push	ebp
	call	_bitset_pixel
; Line 648
	push	175					; 000000afH
	push	110					; 0000006eH
	push	ebx
	call	_bitset_pixel
; Line 649
	push	175					; 000000afH
	push	110					; 0000006eH
	push	ebp
	call	_bitset_pixel
; Line 650
	push	175					; 000000afH
	push	esi
	push	150					; 00000096H
	call	_bitset_pixel
; Line 651
	push	175					; 000000afH
	push	edi
	push	150					; 00000096H
	call	_bitset_pixel
	add	esp, 72					; 00000048H
; Line 652
	push	175					; 000000afH
	push	esi
	push	170					; 000000aaH
	call	_bitset_pixel
; Line 653
	push	175					; 000000afH
	push	edi
	push	170					; 000000aaH
	call	_bitset_pixel
	add	esp, 24					; 00000018H
	inc	esi
	dec	edi
	lea	eax, DWORD PTR [esi-90]
	cmp	eax, 7
	jl	$L566
; Line 656
	push	175					; 000000afH
	push	100					; 00000064H
	push	160					; 000000a0H
	call	_bitset_pixel
	add	esp, 12					; 0000000cH
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 657
	ret	0
_draw_crosshair ENDP
_TEXT	ENDS
PUBLIC	_draw_boost_bar
;	COMDAT _draw_boost_bar
_TEXT	SEGMENT
_j$ = -4
_pos2$ = -12
_draw_boost_bar PROC NEAR				; COMDAT
; Line 660
	sub	esp, 12					; 0000000cH
; Line 665
	mov	ecx, DWORD PTR _player_boost
	push	ebx
	push	ebp
	push	esi
	lea	eax, DWORD PTR [ecx*8]
	push	edi
	sub	eax, ecx
; Line 667
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
	mov	DWORD PTR -8+[esp+28], ebp
$L580:
; Line 668
	mov	ecx, DWORD PTR _boost_overheating
	neg	ecx
	sbb	ecx, ecx
	and	ecx, 64					; 00000040H
	add	ecx, 159				; 0000009fH
; Line 669
	cmp	eax, esi
	jg	SHORT $L822
	lea	edi, DWORD PTR [eax+8]
; Line 671
	mov	DWORD PTR _pos2$[esp+28], eax
; Line 673
	mov	eax, edi
	mov	ebx, 312				; 00000138H
; Line 674
	cmp	eax, esi
	mov	edx, 296				; 00000128H
	jle	SHORT $L584
; Line 676
	mov	eax, ebp
	lea	edx, DWORD PTR [esi+esi]
	sub	eax, edx
	lea	edx, DWORD PTR [eax+312]
; Line 677
	mov	eax, esi
$L584:
; Line 679
	cmp	ebp, 32					; 00000020H
	jge	SHORT $L585
	lea	ebx, DWORD PTR [ebp+280]
; Line 681
	mov	ebp, DWORD PTR -8+[esp+28]
	mov	DWORD PTR _pos2$[esp+28], 16		; 00000010H
$L585:
; Line 683
	push	ecx
	push	eax
	push	edx
	mov	edx, DWORD PTR _pos2$[esp+40]
	push	edx
	push	ebx
	call	_drawline
	mov	ecx, DWORD PTR _j$[esp+48]
	add	esp, 20					; 00000014H
; Line 684
	add	ebp, 16					; 00000010H
	inc	ecx
	cmp	ecx, 22					; 00000016H
	mov	eax, edi
	mov	DWORD PTR -8+[esp+28], ebp
	mov	DWORD PTR _j$[esp+28], ecx
	jl	SHORT $L580
$L822:
; Line 686
	push	255					; 000000ffH
	push	16					; 00000010H
	push	312					; 00000138H
	push	16					; 00000010H
	push	296					; 00000128H
	call	_drawline
; Line 687
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	312					; 00000138H
	push	16					; 00000010H
	push	312					; 00000138H
	call	_drawline
; Line 688
	push	255					; 000000ffH
	push	184					; 000000b8H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	312					; 00000138H
	call	_drawline
; Line 689
	push	255					; 000000ffH
	push	16					; 00000010H
	push	296					; 00000128H
	push	184					; 000000b8H
	push	296					; 00000128H
	call	_drawline
	add	esp, 80					; 00000050H
; Line 690
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
; Line 691
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
; Line 693
	sub	esp, 36					; 00000024H
	push	ebx
	push	ebp
	push	esi
	push	edi
; Line 698
	xor	edi, edi
$L596:
; Line 699
	xor	esi, esi
	lea	ebx, DWORD PTR [edi+130]
$L599:
; Line 700
	xor	eax, eax
; Line 702
	test	edi, edi
	je	SHORT $L603
	cmp	edi, 59					; 0000003bH
	je	SHORT $L603
	test	esi, esi
	je	SHORT $L603
	cmp	esi, 59					; 0000003bH
	jne	SHORT $L843
$L603:
	mov	eax, 255				; 000000ffH
; Line 703
	jmp	SHORT $L604
$L843:
	lea	ecx, DWORD PTR [ebx+esi-130]
	and	ecx, -2147483647			; 80000001H
	jns	SHORT $L847
	dec	ecx
	or	ecx, -2					; fffffffeH
	inc	ecx
$L847:
	jne	SHORT $L600
$L604:
; Line 704
	lea	edx, DWORD PTR [esi+10]
	push	eax
	push	edx
	push	ebx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L600:
	inc	esi
	cmp	esi, 60					; 0000003cH
	jl	SHORT $L599
	inc	edi
	cmp	edi, 60					; 0000003cH
	jl	SHORT $L596
; Line 709
	or	ebx, -1
$L606:
; Line 710
	or	esi, -1
; Line 711
	lea	edi, DWORD PTR [ebx+160]
$L609:
	lea	eax, DWORD PTR [esi+40]
	push	239					; 000000efH
	push	eax
	push	edi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
	inc	esi
	cmp	esi, 2
	jl	SHORT $L609
	inc	ebx
	cmp	ebx, 2
	jl	SHORT $L606
; Line 715
	push	239					; 000000efH
	push	44					; 0000002cH
	push	160					; 000000a0H
	push	40					; 00000028H
	push	160					; 000000a0H
	call	_draw_line
	mov	esi, OFFSET FLAT:_StarblazerEntities+4
	add	esp, 20					; 00000014H
	mov	DWORD PTR -32+[esp+52], esi
$L612:
; Line 719
	mov	eax, DWORD PTR [esi]
	test	eax, eax
	je	$L613
	mov	ecx, DWORD PTR [eax]
	test	BYTE PTR [ecx+32], 2
	je	$L613
; Line 720
	add	eax, 4
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR _vector_pos$[esp+52], edx
	mov	ecx, DWORD PTR [eax+4]
	mov	DWORD PTR _vector_pos$[esp+56], ecx
; Line 721
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	edx, DWORD PTR [eax+8]
	lea	eax, DWORD PTR _vector_pos$[esp+52]
	add	ecx, 4
	push	eax
	push	ecx
	mov	DWORD PTR _vector_pos$[esp+68], edx
	call	_vec3_subtract
; Line 722
	lea	edx, DWORD PTR _screen_coords$[esp+60]
	lea	eax, DWORD PTR _vector_pos$[esp+60]
	push	edx
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
; Line 724
	mov	eax, DWORD PTR _screen_coords$[esp+72]
; Line 725
	mov	edi, DWORD PTR _screen_coords$[esp+80]
	sar	eax, 17					; 00000011H
	add	esp, 20					; 00000014H
	sar	edi, 17					; 00000011H
; Line 727
	cmp	eax, 30					; 0000001eH
	jle	SHORT $L616
	mov	eax, 30					; 0000001eH
; Line 728
	jmp	SHORT $L617
$L616:
	cmp	eax, -30				; ffffffe2H
	jge	SHORT $L617
	mov	eax, -30				; ffffffe2H
$L617:
; Line 729
	cmp	edi, 30					; 0000001eH
	jle	SHORT $L618
	mov	edi, 30					; 0000001eH
; Line 730
	jmp	SHORT $L619
$L618:
	cmp	edi, -30				; ffffffe2H
	jge	SHORT $L619
	mov	edi, -30				; ffffffe2H
$L619:
; Line 732
	mov	ecx, DWORD PTR [esi]
	mov	ecx, DWORD PTR [ecx]
	mov	edx, DWORD PTR [ecx+40]
	test	edx, edx
	je	SHORT $L620
; Line 733
	mov	ebp, DWORD PTR _screen_coords$[esp+56]
	xor	edx, edx
	test	ebp, ebp
	setl	dl
	dec	edx
; Line 740
	lea	ebx, DWORD PTR [eax+159]
	and	edx, -48				; ffffffd0H
	mov	DWORD PTR -36+[esp+52], 3
	add	edx, 223				; 000000dfH
	mov	DWORD PTR _c$[esp+52], edx
$L623:
; Line 741
	mov	ebp, -40				; ffffffd8H
	lea	esi, DWORD PTR [edi+39]
	sub	ebp, edi
$L626:
; Line 742
	test	esi, esi
	jl	SHORT $L627
; Line 743
	mov	eax, DWORD PTR _c$[esp+52]
	push	eax
	push	esi
	push	ebx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L627:
	inc	esi
	lea	ecx, DWORD PTR [esi+ebp]
	cmp	ecx, 2
	jl	SHORT $L626
	mov	eax, DWORD PTR -36+[esp+52]
	inc	ebx
	dec	eax
	mov	DWORD PTR -36+[esp+52], eax
	jne	SHORT $L623
; Line 747
	mov	esi, DWORD PTR -32+[esp+52]
	jmp	SHORT $L613
$L620:
; Line 748
	xor	edx, edx
	add	edi, 40					; 00000028H
	mov	dl, BYTE PTR [ecx+36]
	add	eax, 160				; 000000a0H
	push	edx
	push	edi
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L613:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	mov	DWORD PTR -32+[esp+52], esi
	jl	$L612
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 752
	add	esp, 36					; 00000024H
	ret	0
_draw_radar ENDP
_TEXT	ENDS
PUBLIC	_draw_battery
;	COMDAT _draw_battery
_TEXT	SEGMENT
_draw_battery PROC NEAR					; COMDAT
; Line 757
	mov	eax, DWORD PTR _player_battery
	push	esi
	push	edi
	lea	edi, DWORD PTR [eax+eax*2]
	shl	edi, 1
	shr	edi, 4
; Line 759
	xor	esi, esi
$L636:
; Line 760
	cmp	eax, esi
	jb	SHORT $L637
; Line 761
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
$L637:
	inc	esi
	cmp	esi, 40					; 00000028H
	jl	SHORT $L636
; Line 785
	push	255					; 000000ffH
	push	160					; 000000a0H
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
; Line 786
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	170					; 000000aaH
	push	139					; 0000008bH
	call	_drawline
; Line 787
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	139					; 0000008bH
	push	160					; 000000a0H
	push	139					; 0000008bH
	call	_drawline
; Line 788
	push	255					; 000000ffH
	push	170					; 000000aaH
	push	180					; 000000b4H
	push	160					; 000000a0H
	push	180					; 000000b4H
	call	_drawline
	add	esp, 80					; 00000050H
	pop	edi
	pop	esi
; Line 789
	ret	0
_draw_battery ENDP
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
; Line 796
	mov	eax, DWORD PTR _shake_frames
	sub	esp, 80					; 00000050H
	test	eax, eax
	push	esi
	je	SHORT $L642
; Line 797
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_X, dx
; Line 798
	call	_rand
	cdq
	mov	ecx, 20					; 00000014H
	idiv	ecx
	sub	edx, 10					; 0000000aH
	add	WORD PTR _SL_CENTER_Y, dx
; Line 800
	jmp	SHORT $L643
$L642:
; Line 801
	mov	WORD PTR _SL_CENTER_X, 160		; 000000a0H
; Line 802
	mov	WORD PTR _SL_CENTER_Y, 100		; 00000064H
$L643:
; Line 806
	mov	edx, DWORD PTR _StarblazerEntities
	add	edx, 4
	push	edx
	call	_camera_translate
; Line 807
	mov	eax, DWORD PTR _StarblazerEntities
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
; Line 810
	mov	ecx, DWORD PTR _shading
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
; Line 813
	mov	eax, DWORD PTR _frames_respawning
	add	esp, 32					; 00000020H
	test	eax, eax
	jne	SHORT $L644
	call	_draw_crosshair
$L644:
; Line 816
	call	_draw_boost_bar
; Line 819
	call	_draw_HPbar
; Line 822
	call	_draw_radar
; Line 825
	call	_draw_battery
; Line 829
	mov	ecx, DWORD PTR _StarblazerEntities
	mov	eax, DWORD PTR _player_fighter
	shr	eax, 1
	cmp	DWORD PTR [ecx+96], eax
	jae	SHORT $L645
; Line 830
	call	_blazer2_screencrack
$L645:
; Line 833
	mov	eax, DWORD PTR _frames_respawning
	test	eax, eax
	je	SHORT $L646
; Line 834
	push	1
	push	159					; 0000009fH
	push	2
	push	3
	push	90					; 0000005aH
	push	110					; 0000006eH
	push	OFFSET FLAT:??_C@_0L@LPNF@RESPAWNING?$AA@ ; `string'
	call	_vputs
; Line 835
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
; Line 836
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
$L646:
; Line 840
	call	_draw_debug
; Line 842
	mov	eax, DWORD PTR _barcycle
	add	eax, 2
; Line 843
	cmp	eax, 64					; 00000040H
	mov	DWORD PTR _barcycle, eax
	jne	SHORT $L649
	mov	DWORD PTR _barcycle, 0
$L649:
; Line 846
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
; Line 847
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 24					; 00000018H
; Line 848
	pop	esi
	add	esp, 80					; 00000050H
	ret	0
_blazer2_draw ENDP
_TEXT	ENDS
END
