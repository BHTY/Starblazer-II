	TITLE	src\ecs.c
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
_DATA	SEGMENT
COMM	_StarblazerEntities:DWORD:03e8H
_DATA	ENDS
PUBLIC	_first_open_slot
_TEXT	SEGMENT
; File src\ecs.c
_i$ = -4
_first_open_slot PROC NEAR
; Line 20
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 23
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L465
$L466:
	inc	DWORD PTR _i$[ebp]
$L465:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	$L467
; Line 24
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	jne	$L468
; Line 25
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L463
; Line 27
$L468:
	jmp	$L466
$L467:
; Line 29
	mov	eax, -559038737				; deadbeefH
	jmp	$L463
; Line 30
$L463:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_first_open_slot ENDP
_TEXT	ENDS
PUBLIC	_spawn_entity
EXTRN	_quat_create:NEAR
EXTRN	_malloc:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_type$ = 8
_x$ = 12
_y$ = 16
_z$ = 20
_pitch$ = 24
_yaw$ = 28
_roll$ = 32
_id$ = -4
_spawn_entity PROC NEAR
; Line 39
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 40
	call	_first_open_slot
	mov	DWORD PTR _id$[ebp], eax
; Line 42
	push	108					; 0000006cH
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _id$[ebp]
	mov	DWORD PTR _StarblazerEntities[ecx*4], eax
; Line 43
	mov	eax, DWORD PTR _type$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx], eax
; Line 44
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+4], eax
; Line 45
	mov	eax, DWORD PTR _y$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+8], eax
; Line 46
	mov	eax, DWORD PTR _z$[ebp]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+12], eax
; Line 47
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _roll$[ebp]
	push	eax
	mov	eax, DWORD PTR _yaw$[ebp]
	push	eax
	mov	eax, DWORD PTR _pitch$[ebp]
	push	eax
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 48
	push	64					; 00000040H
	push	0
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	add	eax, 32					; 00000020H
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 49
	mov	eax, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [eax+28]
	mov	ecx, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR [ecx+96], eax
; Line 50
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	BYTE PTR [eax+100], 0
; Line 51
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+104], 0
; Line 53
	mov	eax, DWORD PTR _id$[ebp]
	jmp	$L476
; Line 54
$L476:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_spawn_entity ENDP
_TEXT	ENDS
PUBLIC	_draw_scene
EXTRN	_vec3_add:NEAR
EXTRN	_mat3_mul:NEAR
EXTRN	_quat_tomat:NEAR
EXTRN	_quat_conjugate:NEAR
EXTRN	_SL_VERTEX_INDEX:WORD
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_render_begin:NEAR
EXTRN	_camera_translate:NEAR
EXTRN	_put_vertex:NEAR
EXTRN	_put_triangles:NEAR
EXTRN	_polygon_zsort:NEAR
EXTRN	_plotpoint_3d:NEAR
EXTRN	_render_end:NEAR
_TEXT	SEGMENT
_cam_pos$ = 8
_cam_ori$ = 12
_shading$ = 28
_star_ptr$ = 32
_num_stars$ = 36
_i$ = -12
_p$ = -4
_cur_index$ = -8
_temp_vert$ = -60
_model_rotation_matrix$ = -48
_draw_scene PROC NEAR
; Line 63
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	ebx
	push	esi
	push	edi
; Line 68
	mov	eax, DWORD PTR _cam_pos$[ebp]
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 69
	lea	eax, DWORD PTR _cam_ori$[ebp]
	push	eax
	call	_quat_conjugate
	add	esp, 4
; Line 70
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	lea	eax, DWORD PTR _cam_ori$[ebp]
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 72
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L489
$L490:
	inc	DWORD PTR _i$[ebp]
$L489:
	mov	eax, DWORD PTR _num_stars$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jge	$L491
; Line 73
	push	255					; 000000ffH
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	add	eax, DWORD PTR _star_ptr$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_plotpoint_3d
	add	esp, 16					; 00000010H
; Line 74
	jmp	$L490
$L491:
; Line 76
	call	_render_begin
; Line 78
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L492
$L493:
	inc	DWORD PTR _i$[ebp]
$L492:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L494
; Line 79
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	jne	$L495
	jmp	$L493
; Line 81
$L495:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	cmp	DWORD PTR [eax+104], 0
	je	$L496
; Line 82
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [eax+104], 0
; Line 84
	jmp	$L497
$L496:
; Line 85
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	BYTE PTR [eax+100], 0
; Line 86
$L497:
; Line 88
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	mov	DWORD PTR _cur_index$[ebp], eax
; Line 91
	lea	eax, DWORD PTR _model_rotation_matrix$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 94
	mov	DWORD PTR _p$[ebp], 0
	jmp	$L498
$L499:
	inc	DWORD PTR _p$[ebp]
$L498:
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	cmp	ecx, DWORD PTR _p$[ebp]
	jle	$L500
; Line 95
	lea	eax, DWORD PTR _temp_vert$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _p$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR [eax+ecx*4]
	push	eax
	lea	eax, DWORD PTR _model_rotation_matrix$[ebp]
	push	eax
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 96
	lea	eax, DWORD PTR _temp_vert$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	add	eax, 4
	push	eax
	call	_vec3_add
	add	esp, 8
; Line 97
	lea	eax, DWORD PTR _temp_vert$[ebp]
	push	eax
	call	_put_vertex
	add	esp, 4
; Line 98
	jmp	$L499
$L500:
; Line 101
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	al, BYTE PTR [eax+100]
	push	eax
	mov	eax, DWORD PTR _cur_index$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	ax, WORD PTR [eax+10]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_put_triangles
	add	esp, 16					; 00000010H
; Line 102
	jmp	$L493
$L494:
; Line 104
	call	_polygon_zsort
; Line 105
	mov	eax, DWORD PTR _shading$[ebp]
	push	eax
	call	_render_end
	add	esp, 4
; Line 106
$L483:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_scene ENDP
_TEXT	ENDS
PUBLIC	_run_entity_scripts
_TEXT	SEGMENT
_i$ = -4
_run_entity_scripts PROC NEAR
; Line 115
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 118
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L503
$L504:
	inc	DWORD PTR _i$[ebp]
$L503:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L505
; Line 119
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[eax*4], 0
	je	$L506
; Line 120
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR _StarblazerEntities[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	eax, DWORD PTR [eax]
	call	DWORD PTR [eax+12]
	add	esp, 4
; Line 122
$L506:
	jmp	$L504
$L505:
; Line 123
$L501:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_run_entity_scripts ENDP
_TEXT	ENDS
PUBLIC	_test_collisions
EXTRN	_abs:NEAR
_TEXT	SEGMENT
_ent1$ = 8
_ent2$ = 12
_test_collisions PROC NEAR
; Line 133
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 134
	mov	eax, DWORD PTR _ent1$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _ent2$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	push	eax
	call	_abs
	add	esp, 4
	mov	ecx, DWORD PTR _ent1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+16]
	sar	ecx, 1
	cmp	eax, ecx
	jge	$L510
; Line 135
	mov	eax, DWORD PTR _ent1$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _ent2$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	push	eax
	call	_abs
	add	esp, 4
	mov	ecx, DWORD PTR _ent1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+20]
	sar	ecx, 1
	cmp	eax, ecx
	jge	$L511
; Line 136
	mov	eax, DWORD PTR _ent1$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	ecx, DWORD PTR _ent2$[ebp]
	sub	eax, DWORD PTR [ecx+12]
	push	eax
	call	_abs
	add	esp, 4
	mov	ecx, DWORD PTR _ent1$[ebp]
	mov	ecx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [ecx+24]
	sar	ecx, 1
	cmp	eax, ecx
	jge	$L512
; Line 137
	mov	al, 1
	jmp	$L509
; Line 139
$L512:
; Line 140
$L511:
; Line 141
$L510:
	xor	al, al
	jmp	$L509
; Line 142
$L509:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_test_collisions ENDP
_TEXT	ENDS
PUBLIC	_create_hitbox
_TEXT	SEGMENT
_tpl$ = 8
_x$ = 12
_y$ = 16
_z$ = 20
_create_hitbox PROC NEAR
; Line 151
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 152
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 153
	mov	eax, DWORD PTR _y$[ebp]
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 154
	mov	eax, DWORD PTR _z$[ebp]
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 155
$L517:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_create_hitbox ENDP
_TEXT	ENDS
PUBLIC	_load_model
EXTRN	_free:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
_DATA	SEGMENT
$SG521	DB	'r', 00H
	ORG $+2
$SG540	DB	'%s', 00H
	ORG $+1
$SG543	DB	'v', 00H
	ORG $+2
$SG544	DB	'%f %f %f', 0aH, 00H
	ORG $+2
$SG546	DB	'f', 00H
	ORG $+2
$SG547	DB	'%d %d %d', 0aH, 00H
	ORG $+2
$SG549	DB	'usemtl', 00H
	ORG $+1
$SG550	DB	'%d', 00H
_DATA	ENDS
CONST	SEGMENT
$T553	DD	047800000r			; 65536
CONST	ENDS
_TEXT	SEGMENT
_filename$ = 8
_fp$ = -56
_eof$ = -40
_res$ = -16
_lineHeader$ = -572
_currentVert$ = -52
_currentFace$ = -32
_face1$ = -60
_face2$ = -4
_face3$ = -8
_x$ = -20
_y$ = -28
_z$ = -36
_current_color$ = -48
_polys$ = -24
_verts$ = -12
_tpl$ = -44
_load_model PROC NEAR
; Line 170
	push	ebp
	mov	ebp, esp
	sub	esp, 572				; 0000023cH
	push	ebx
	push	esi
	push	edi
; Line 171
	push	OFFSET FLAT:$SG521
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 172
	mov	DWORD PTR _eof$[ebp], 0
; Line 175
	mov	DWORD PTR _currentVert$[ebp], 0
; Line 176
	mov	DWORD PTR _currentFace$[ebp], 0
; Line 181
	push	12000					; 00002ee0H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _polys$[ebp], eax
; Line 182
	push	12000					; 00002ee0H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _verts$[ebp], eax
; Line 183
	push	36					; 00000024H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _tpl$[ebp], eax
; Line 185
$L538:
	cmp	DWORD PTR _eof$[ebp], 0
	jne	$L539
; Line 186
	lea	eax, DWORD PTR _lineHeader$[ebp]
	push	eax
	push	OFFSET FLAT:$SG540
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _res$[ebp], eax
; Line 187
	cmp	DWORD PTR _res$[ebp], -1
	jne	$L541
	mov	DWORD PTR _eof$[ebp], 1
	jmp	$L539
; Line 189
$L541:
	push	OFFSET FLAT:$SG543
	lea	eax, DWORD PTR _lineHeader$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L542
; Line 190
	lea	eax, DWORD PTR _z$[ebp]
	push	eax
	lea	eax, DWORD PTR _y$[ebp]
	push	eax
	lea	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG544
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 20					; 00000014H
; Line 191
	fld	DWORD PTR _x$[ebp]
	fmul	DWORD PTR $T553
	call	__ftol
	mov	ecx, DWORD PTR _currentVert$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _verts$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 192
	fld	DWORD PTR _y$[ebp]
	fmul	DWORD PTR $T553
	call	__ftol
	mov	ecx, DWORD PTR _currentVert$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _verts$[ebp]
	mov	DWORD PTR [edx+ecx*4+4], eax
; Line 193
	fld	DWORD PTR _z$[ebp]
	fmul	DWORD PTR $T553
	call	__ftol
	mov	ecx, DWORD PTR _currentVert$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _verts$[ebp]
	mov	DWORD PTR [edx+ecx*4+8], eax
; Line 194
	inc	DWORD PTR _currentVert$[ebp]
; Line 197
$L542:
	push	OFFSET FLAT:$SG546
	lea	eax, DWORD PTR _lineHeader$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L545
; Line 198
	lea	eax, DWORD PTR _face3$[ebp]
	push	eax
	lea	eax, DWORD PTR _face2$[ebp]
	push	eax
	lea	eax, DWORD PTR _face1$[ebp]
	push	eax
	push	OFFSET FLAT:$SG547
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 20					; 00000014H
; Line 199
	mov	al, BYTE PTR _current_color$[ebp]
	mov	ecx, DWORD PTR _currentFace$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _polys$[ebp]
	mov	BYTE PTR [edx+ecx*4+6], al
; Line 200
	mov	eax, DWORD PTR _face1$[ebp]
	dec	eax
	mov	ecx, DWORD PTR _currentFace$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _polys$[ebp]
	mov	WORD PTR [edx+ecx*4], ax
; Line 201
	mov	eax, DWORD PTR _face2$[ebp]
	dec	eax
	mov	ecx, DWORD PTR _currentFace$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _polys$[ebp]
	mov	WORD PTR [edx+ecx*4+2], ax
; Line 202
	mov	eax, DWORD PTR _face3$[ebp]
	dec	eax
	mov	ecx, DWORD PTR _currentFace$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	edx, DWORD PTR _polys$[ebp]
	mov	WORD PTR [edx+ecx*4+4], ax
; Line 203
	inc	DWORD PTR _currentFace$[ebp]
; Line 206
$L545:
	push	OFFSET FLAT:$SG549
	lea	eax, DWORD PTR _lineHeader$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	$L548
; Line 207
	lea	eax, DWORD PTR _current_color$[ebp]
	push	eax
	push	OFFSET FLAT:$SG550
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 209
$L548:
	jmp	$L538
$L539:
; Line 211
	mov	eax, DWORD PTR _currentFace$[ebp]
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	WORD PTR [ecx+10], ax
; Line 212
	mov	eax, DWORD PTR _currentVert$[ebp]
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	WORD PTR [ecx+8], ax
; Line 213
	mov	eax, DWORD PTR _currentVert$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	push	eax
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 214
	mov	eax, DWORD PTR _currentFace$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	push	eax
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 216
	mov	eax, DWORD PTR _currentVert$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _verts$[ebp]
	push	eax
	mov	eax, DWORD PTR _tpl$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 217
	mov	eax, DWORD PTR _currentFace$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	push	eax
	mov	eax, DWORD PTR _polys$[ebp]
	push	eax
	mov	eax, DWORD PTR _tpl$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 219
	mov	eax, DWORD PTR _verts$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 220
	mov	eax, DWORD PTR _polys$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 221
	mov	eax, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 223
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 225
	mov	eax, DWORD PTR _tpl$[ebp]
	jmp	$L519
; Line 226
$L519:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_load_model ENDP
_TEXT	ENDS
END
