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
_i$ = -4
_first_open_slot PROC NEAR
; File src\ecs.c
; Line 20
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 23
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L485
$L486:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L485:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jae	SHORT $L487
; Line 24
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[ecx*4], 0
	jne	SHORT $L488
; Line 25
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L483
$L488:
; Line 27
	jmp	SHORT $L486
$L487:
; Line 29
	mov	eax, -559038737				; deadbeefH
$L483:
; Line 30
	mov	esp, ebp
	pop	ebp
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
	push	ecx
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
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	ecx, DWORD PTR _type$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 44
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 45
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	ecx, DWORD PTR _y$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 46
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	ecx, DWORD PTR _z$[ebp]
	mov	DWORD PTR [eax+12], ecx
; Line 47
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	add	eax, 16					; 00000010H
	push	eax
	mov	cl, BYTE PTR _roll$[ebp]
	push	ecx
	mov	dl, BYTE PTR _yaw$[ebp]
	push	edx
	mov	al, BYTE PTR _pitch$[ebp]
	push	eax
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 48
	push	64					; 00000040H
	push	0
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	add	edx, 32					; 00000020H
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
; Line 49
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR _type$[ebp]
	mov	eax, DWORD PTR [edx+28]
	mov	DWORD PTR [ecx+96], eax
; Line 50
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	BYTE PTR [edx+100], 0
; Line 51
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR [ecx+104], 0
; Line 53
	mov	eax, DWORD PTR _id$[ebp]
; Line 54
	mov	esp, ebp
	pop	ebp
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
; Line 68
	mov	eax, DWORD PTR _cam_pos$[ebp]
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 69
	lea	ecx, DWORD PTR _cam_ori$[ebp]
	push	ecx
	call	_quat_conjugate
	add	esp, 4
; Line 70
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	lea	edx, DWORD PTR _cam_ori$[ebp]
	push	edx
	call	_quat_tomat
	add	esp, 8
; Line 72
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L509
$L510:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L509:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _num_stars$[ebp]
	jge	SHORT $L511
; Line 73
	push	255					; 000000ffH
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _star_ptr$[ebp]
	add	eax, edx
	sub	esp, 12					; 0000000cH
	mov	ecx, esp
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
	call	_plotpoint_3d
	add	esp, 16					; 00000010H
; Line 74
	jmp	SHORT $L510
$L511:
; Line 76
	call	_render_begin
; Line 78
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L512
$L513:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L512:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	$L514
; Line 79
	mov	edx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[edx*4], 0
	jne	SHORT $L515
	jmp	SHORT $L513
$L515:
; Line 81
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	cmp	DWORD PTR [ecx+104], 0
	je	SHORT $L516
; Line 82
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	DWORD PTR [eax+104], 0
; Line 84
	jmp	SHORT $L517
$L516:
; Line 85
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	BYTE PTR [edx+100], 0
$L517:
; Line 88
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	mov	DWORD PTR _cur_index$[ebp], eax
; Line 91
	lea	ecx, DWORD PTR _model_rotation_matrix$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 94
	mov	DWORD PTR _p$[ebp], 0
	jmp	SHORT $L518
$L519:
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 1
	mov	DWORD PTR _p$[ebp], ecx
$L518:
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	ecx, DWORD PTR [eax]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+8]
	cmp	DWORD PTR _p$[ebp], edx
	jge	SHORT $L520
; Line 95
	lea	eax, DWORD PTR _temp_vert$[ebp]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR _p$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR [eax+4]
	add	edx, ecx
	push	edx
	lea	eax, DWORD PTR _model_rotation_matrix$[ebp]
	push	eax
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 96
	lea	ecx, DWORD PTR _temp_vert$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	add	eax, 4
	push	eax
	call	_vec3_add
	add	esp, 8
; Line 97
	lea	ecx, DWORD PTR _temp_vert$[ebp]
	push	ecx
	call	_put_vertex
	add	esp, 4
; Line 98
	jmp	SHORT $L519
$L520:
; Line 101
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[edx*4]
	mov	cl, BYTE PTR [eax+100]
	push	ecx
	mov	dx, WORD PTR _cur_index$[ebp]
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
	mov	edx, DWORD PTR [ecx]
	mov	ax, WORD PTR [edx+10]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	eax, DWORD PTR [edx]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_put_triangles
	add	esp, 16					; 00000010H
; Line 102
	jmp	$L513
$L514:
; Line 104
	call	_polygon_zsort
; Line 105
	mov	dl, BYTE PTR _shading$[ebp]
	push	edx
	call	_render_end
	add	esp, 4
; Line 106
	mov	esp, ebp
	pop	ebp
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
	push	ecx
; Line 118
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L523
$L524:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L523:
	cmp	DWORD PTR _i$[ebp], 1000		; 000003e8H
	jge	SHORT $L525
; Line 119
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _StarblazerEntities[ecx*4], 0
	je	SHORT $L526
; Line 120
	mov	edx, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR _StarblazerEntities[edx*4]
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	eax, DWORD PTR [edx]
	call	DWORD PTR [eax+12]
	add	esp, 4
$L526:
; Line 122
	jmp	SHORT $L524
$L525:
; Line 123
	mov	esp, ebp
	pop	ebp
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
; Line 134
	mov	eax, DWORD PTR _ent1$[ebp]
	mov	ecx, DWORD PTR _ent2$[ebp]
	mov	edx, DWORD PTR [eax+4]
	sub	edx, DWORD PTR [ecx+4]
	push	edx
	call	_abs
	add	esp, 4
	mov	ecx, DWORD PTR _ent1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [edx+16]
	sar	ecx, 1
	cmp	eax, ecx
	jge	SHORT $L532
; Line 135
	mov	edx, DWORD PTR _ent1$[ebp]
	mov	eax, DWORD PTR _ent2$[ebp]
	mov	ecx, DWORD PTR [edx+8]
	sub	ecx, DWORD PTR [eax+8]
	push	ecx
	call	_abs
	add	esp, 4
	mov	edx, DWORD PTR _ent1$[ebp]
	mov	ecx, DWORD PTR [edx]
	mov	edx, DWORD PTR [ecx+20]
	sar	edx, 1
	cmp	eax, edx
	jge	SHORT $L532
; Line 136
	mov	eax, DWORD PTR _ent1$[ebp]
	mov	ecx, DWORD PTR _ent2$[ebp]
	mov	edx, DWORD PTR [eax+12]
	sub	edx, DWORD PTR [ecx+12]
	push	edx
	call	_abs
	add	esp, 4
	mov	ecx, DWORD PTR _ent1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	ecx, DWORD PTR [edx+24]
	sar	ecx, 1
	cmp	eax, ecx
	jge	SHORT $L532
; Line 137
	mov	al, 1
	jmp	SHORT $L529
$L532:
; Line 141
	xor	al, al
$L529:
; Line 142
	pop	ebp
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
; Line 152
	mov	eax, DWORD PTR _tpl$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [eax+16], ecx
; Line 153
	mov	edx, DWORD PTR _tpl$[ebp]
	mov	eax, DWORD PTR _y$[ebp]
	mov	DWORD PTR [edx+20], eax
; Line 154
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	edx, DWORD PTR _z$[ebp]
	mov	DWORD PTR [ecx+24], edx
; Line 155
	pop	ebp
	ret	0
_create_hitbox ENDP
_TEXT	ENDS
PUBLIC	_load_model
PUBLIC	__real@4@400f8000000000000000
EXTRN	_free:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
_DATA	SEGMENT
$SG541	DB	'r', 00H
	ORG $+2
$SG560	DB	'%s', 00H
	ORG $+1
$SG563	DB	'v', 00H
	ORG $+2
$SG564	DB	'%f %f %f', 0aH, 00H
	ORG $+2
$SG566	DB	'f', 00H
	ORG $+2
$SG567	DB	'%d %d %d', 0aH, 00H
	ORG $+2
$SG569	DB	'usemtl', 00H
	ORG $+1
$SG570	DB	'%d', 00H
_DATA	ENDS
;	COMDAT __real@4@400f8000000000000000
; File src\ecs.c
CONST	SEGMENT
__real@4@400f8000000000000000 DD 047800000r	; 65536
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
; File src\ecs.c
; Line 170
	push	ebp
	mov	ebp, esp
	sub	esp, 572				; 0000023cH
	push	esi
; Line 171
	push	OFFSET FLAT:$SG541
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
	push	40					; 00000028H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _tpl$[ebp], eax
$L558:
; Line 185
	cmp	DWORD PTR _eof$[ebp], 0
	jne	$L559
; Line 186
	lea	ecx, DWORD PTR _lineHeader$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG560
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	call	_fscanf
	add	esp, 12					; 0000000cH
	mov	DWORD PTR _res$[ebp], eax
; Line 187
	cmp	DWORD PTR _res$[ebp], -1
	jne	SHORT $L561
	mov	DWORD PTR _eof$[ebp], 1
	jmp	$L559
$L561:
; Line 189
	push	OFFSET FLAT:$SG563
	lea	eax, DWORD PTR _lineHeader$[ebp]
	push	eax
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L562
; Line 190
	lea	ecx, DWORD PTR _z$[ebp]
	push	ecx
	lea	edx, DWORD PTR _y$[ebp]
	push	edx
	lea	eax, DWORD PTR _x$[ebp]
	push	eax
	push	OFFSET FLAT:$SG564
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fscanf
	add	esp, 20					; 00000014H
; Line 191
	fld	DWORD PTR _x$[ebp]
	fmul	DWORD PTR __real@4@400f8000000000000000
	mov	esi, DWORD PTR _currentVert$[ebp]
	imul	esi, 12					; 0000000cH
	call	__ftol
	mov	edx, DWORD PTR _verts$[ebp]
	mov	DWORD PTR [edx+esi], eax
; Line 192
	fld	DWORD PTR _y$[ebp]
	fmul	DWORD PTR __real@4@400f8000000000000000
	mov	esi, DWORD PTR _currentVert$[ebp]
	imul	esi, 12					; 0000000cH
	call	__ftol
	mov	ecx, DWORD PTR _verts$[ebp]
	mov	DWORD PTR [ecx+esi+4], eax
; Line 193
	fld	DWORD PTR _z$[ebp]
	fmul	DWORD PTR __real@4@400f8000000000000000
	mov	esi, DWORD PTR _currentVert$[ebp]
	imul	esi, 12					; 0000000cH
	call	__ftol
	mov	edx, DWORD PTR _verts$[ebp]
	mov	DWORD PTR [edx+esi+8], eax
; Line 194
	mov	eax, DWORD PTR _currentVert$[ebp]
	add	eax, 1
	mov	DWORD PTR _currentVert$[ebp], eax
$L562:
; Line 197
	push	OFFSET FLAT:$SG566
	lea	ecx, DWORD PTR _lineHeader$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L565
; Line 198
	lea	edx, DWORD PTR _face3$[ebp]
	push	edx
	lea	eax, DWORD PTR _face2$[ebp]
	push	eax
	lea	ecx, DWORD PTR _face1$[ebp]
	push	ecx
	push	OFFSET FLAT:$SG567
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	call	_fscanf
	add	esp, 20					; 00000014H
; Line 199
	mov	eax, DWORD PTR _currentFace$[ebp]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _polys$[ebp]
	mov	dl, BYTE PTR _current_color$[ebp]
	mov	BYTE PTR [ecx+eax+6], dl
; Line 200
	mov	eax, DWORD PTR _face1$[ebp]
	sub	eax, 1
	mov	ecx, DWORD PTR _currentFace$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _polys$[ebp]
	mov	WORD PTR [edx+ecx], ax
; Line 201
	mov	eax, DWORD PTR _face2$[ebp]
	sub	eax, 1
	mov	ecx, DWORD PTR _currentFace$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _polys$[ebp]
	mov	WORD PTR [edx+ecx+2], ax
; Line 202
	mov	eax, DWORD PTR _face3$[ebp]
	sub	eax, 1
	mov	ecx, DWORD PTR _currentFace$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _polys$[ebp]
	mov	WORD PTR [edx+ecx+4], ax
; Line 203
	mov	eax, DWORD PTR _currentFace$[ebp]
	add	eax, 1
	mov	DWORD PTR _currentFace$[ebp], eax
$L565:
; Line 206
	push	OFFSET FLAT:$SG569
	lea	ecx, DWORD PTR _lineHeader$[ebp]
	push	ecx
	call	_strcmp
	add	esp, 8
	test	eax, eax
	jne	SHORT $L568
; Line 207
	lea	edx, DWORD PTR _current_color$[ebp]
	push	edx
	push	OFFSET FLAT:$SG570
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fscanf
	add	esp, 12					; 0000000cH
$L568:
; Line 209
	jmp	$L558
$L559:
; Line 211
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	dx, WORD PTR _currentFace$[ebp]
	mov	WORD PTR [ecx+10], dx
; Line 212
	mov	eax, DWORD PTR _tpl$[ebp]
	mov	cx, WORD PTR _currentVert$[ebp]
	mov	WORD PTR [eax+8], cx
; Line 213
	mov	edx, DWORD PTR _currentVert$[ebp]
	imul	edx, 12					; 0000000cH
	push	edx
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 214
	mov	edx, DWORD PTR _currentFace$[ebp]
	imul	edx, 12					; 0000000cH
	push	edx
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 216
	mov	edx, DWORD PTR _currentVert$[ebp]
	imul	edx, 12					; 0000000cH
	push	edx
	mov	eax, DWORD PTR _verts$[ebp]
	push	eax
	mov	ecx, DWORD PTR _tpl$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 217
	mov	eax, DWORD PTR _currentFace$[ebp]
	imul	eax, 12					; 0000000cH
	push	eax
	mov	ecx, DWORD PTR _polys$[ebp]
	push	ecx
	mov	edx, DWORD PTR _tpl$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 219
	mov	ecx, DWORD PTR _verts$[ebp]
	push	ecx
	call	_free
	add	esp, 4
; Line 220
	mov	edx, DWORD PTR _polys$[ebp]
	push	edx
	call	_free
	add	esp, 4
; Line 221
	mov	eax, DWORD PTR _tpl$[ebp]
	mov	DWORD PTR [eax+32], 0
; Line 223
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
; Line 225
	mov	eax, DWORD PTR _tpl$[ebp]
; Line 226
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_load_model ENDP
_TEXT	ENDS
END
