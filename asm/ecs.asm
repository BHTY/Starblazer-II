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
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_02DILL@?$CFs?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_01KBCC@v?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09KPAJ@?$CFf?5?$CFf?5?$CFf?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_01IFC@f?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09FCEL@?$CFd?5?$CFd?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_06OPIA@usemtl?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_02MECO@?$CFd?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _first_open_slot
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _spawn_entity
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _rotate_object
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _perform_rotation
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_scene
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _run_entity_scripts
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _test_collisions
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _create_hitbox
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _load_model
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
COMM	_StarblazerEntities:DWORD:03e8H
_DATA	ENDS
PUBLIC	_first_open_slot
;	COMDAT _first_open_slot
_TEXT	SEGMENT
; File src\ecs.c
_first_open_slot PROC NEAR				; COMDAT
; Line 23
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_StarblazerEntities
$L587:
; Line 24
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L584
	add	ecx, 4
	inc	eax
; Line 23
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L587
; Line 29
	mov	eax, -559038737				; deadbeefH
; Line 30
$L584:
	ret	0
_first_open_slot ENDP
_TEXT	ENDS
PUBLIC	_spawn_entity
PUBLIC	_rotate_object
EXTRN	_malloc:NEAR
EXTRN	_quat_create:NEAR
;	COMDAT _spawn_entity
_TEXT	SEGMENT
_type$ = 8
_x$ = 12
_y$ = 16
_z$ = 20
_pitch$ = 24
_yaw$ = 28
_roll$ = 32
_spawn_entity PROC NEAR					; COMDAT
; Line 39
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 40
	call	_first_open_slot
	lea	ebx, DWORD PTR _StarblazerEntities[eax*4]
	mov	esi, eax
; Line 42
	mov	ebp, DWORD PTR _type$[esp+12]
	xor	eax, eax
	mov	ax, WORD PTR [ebp+8]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	add	eax, 112				; 00000070H
	push	eax
	call	_malloc
	mov	DWORD PTR [ebx], eax
; Line 43
	mov	DWORD PTR [eax], ebp
; Line 44
	mov	eax, DWORD PTR _y$[esp+16]
	mov	ecx, DWORD PTR [ebx]
	mov	edx, DWORD PTR _x$[esp+16]
	add	esp, 4
	mov	DWORD PTR [ecx+4], edx
; Line 45
	mov	ecx, DWORD PTR [ebx]
	mov	edx, DWORD PTR _z$[esp+12]
	mov	DWORD PTR [ecx+8], eax
; Line 46
	mov	ecx, DWORD PTR [ebx]
	mov	DWORD PTR [ecx+12], edx
; Line 47
	mov	cl, BYTE PTR _roll$[esp+12]
	mov	eax, DWORD PTR [ebx]
	mov	dl, BYTE PTR _yaw$[esp+12]
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	mov	al, BYTE PTR _pitch$[esp+20]
	push	edx
	push	eax
	call	_quat_create
	add	esp, 16					; 00000010H
	mov	edi, DWORD PTR [ebx]
; Line 48
	add	edi, 32					; 00000020H
	xor	eax, eax
	mov	ecx, 16					; 00000010H
	rep	stosd
; Line 49
	mov	edx, DWORD PTR [ebp+28]
	mov	ecx, DWORD PTR [ebx]
	mov	DWORD PTR [ecx+96], edx
; Line 50
	xor	ecx, ecx
	mov	eax, DWORD PTR [ebx]
	mov	BYTE PTR [eax+100], cl
; Line 51
	mov	eax, DWORD PTR [ebx]
	mov	DWORD PTR [eax+104], ecx
; Line 52
	mov	eax, DWORD PTR [ebx]
	mov	DWORD PTR [eax+108], ecx
; Line 53
	mov	eax, DWORD PTR [ebx]
	push	eax
	call	_rotate_object
	add	esp, 4
	mov	eax, esi
; Line 56
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_spawn_entity ENDP
_TEXT	ENDS
;	COMDAT _rotate_object
_TEXT	SEGMENT
_ent$ = 8
_rotate_object PROC NEAR				; COMDAT
; Line 59
	mov	eax, DWORD PTR _ent$[esp-4]
	mov	DWORD PTR [eax+108], 1
; Line 60
	ret	0
_rotate_object ENDP
_TEXT	ENDS
PUBLIC	_perform_rotation
EXTRN	_mat3_mul:NEAR
EXTRN	_quat_tomat:NEAR
;	COMDAT _perform_rotation
_TEXT	SEGMENT
_ent$ = 8
_model_rotation_matrix$ = -36
_perform_rotation PROC NEAR				; COMDAT
; Line 62
	sub	esp, 36					; 00000024H
	lea	eax, DWORD PTR _model_rotation_matrix$[esp+36]
	push	ebx
	push	esi
	push	edi
	mov	edi, DWORD PTR _ent$[esp+44]
	push	ebp
; Line 66
	push	eax
	xor	ebx, ebx
	lea	ecx, DWORD PTR [edi+16]
	push	ecx
	call	_quat_tomat
	add	esp, 8
	mov	eax, DWORD PTR [edi]
; Line 68
	cmp	WORD PTR [eax+8], bx
	jbe	SHORT $L609
	xor	ebp, ebp
	lea	esi, DWORD PTR [edi+112]
$L607:
; Line 69
	push	esi
	mov	eax, DWORD PTR [edi]
	lea	ecx, DWORD PTR _model_rotation_matrix$[esp+56]
	add	esi, 12					; 0000000cH
	mov	eax, DWORD PTR [eax+4]
	inc	ebx
	add	eax, ebp
	add	ebp, 12					; 0000000cH
	push	eax
	push	ecx
	call	_mat3_mul
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR [edi]
; Line 68
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	cmp	ecx, ebx
	jg	SHORT $L607
; Line 70
$L609:
; Line 72
	mov	DWORD PTR [edi+108], 0
; Line 73
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 36					; 00000024H
	ret	0
_perform_rotation ENDP
_TEXT	ENDS
PUBLIC	_draw_scene
EXTRN	_camera_translate:NEAR
EXTRN	_vec3_add:NEAR
EXTRN	_put_vertex:NEAR
EXTRN	_put_triangles:NEAR
EXTRN	_polygon_zsort:NEAR
EXTRN	_plotpoint_3d:NEAR
EXTRN	_render_end:NEAR
EXTRN	_quat_conjugate:NEAR
EXTRN	_SL_VERTEX_INDEX:WORD
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_render_begin:NEAR
;	COMDAT _draw_scene
_TEXT	SEGMENT
_cam_pos$ = 8
_cam_ori$ = 12
_shading$ = 28
_star_ptr$ = 32
_num_stars$ = 36
_cur_index$ = -52
_temp_vert$ = -48
_model_rotation_matrix$ = -36
_draw_scene PROC NEAR					; COMDAT
; Line 82
	mov	eax, DWORD PTR _cam_pos$[esp-4]
	sub	esp, 52					; 00000034H
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 87
	push	eax
	call	_camera_translate
	lea	eax, DWORD PTR _cam_ori$[esp+68]
	add	esp, 4
; Line 88
	push	eax
	call	_quat_conjugate
	lea	eax, DWORD PTR _cam_ori$[esp+68]
	add	esp, 4
; Line 89
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	eax
	call	_quat_tomat
	mov	edi, DWORD PTR _num_stars$[esp+72]
	add	esp, 8
; Line 91
	test	edi, edi
	jle	SHORT $L623
	mov	esi, DWORD PTR _star_ptr$[esp+64]
$L621:
; Line 92
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
	dec	edi
	jne	SHORT $L621
; Line 93
$L623:
; Line 95
	mov	esi, OFFSET FLAT:_StarblazerEntities
	call	_render_begin
; Line 97
$L624:
	mov	eax, DWORD PTR [esi]
; Line 98
	test	eax, eax
	je	$L625
; Line 100
	cmp	DWORD PTR [eax+104], 0
	je	SHORT $L628
; Line 101
	mov	DWORD PTR [eax+104], 0
; Line 103
	jmp	SHORT $L629
$L628:
; Line 104
	mov	BYTE PTR [eax+100], 0
; Line 105
$L629:
; Line 107
	xor	eax, eax
	lea	ecx, DWORD PTR _model_rotation_matrix$[esp+68]
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	push	ecx
	mov	DWORD PTR _cur_index$[esp+72], eax
; Line 110
	mov	eax, DWORD PTR [esi]
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
	mov	eax, DWORD PTR [esi]
; Line 112
	cmp	DWORD PTR [eax+108], 0
	je	SHORT $L630
; Line 113
	push	eax
	call	_perform_rotation
	add	esp, 4
; Line 117
$L630:
	xor	edi, edi
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax]
	cmp	WORD PTR [ecx+8], di
	jbe	SHORT $L633
	xor	ebx, ebx
$L631:
	mov	ecx, DWORD PTR [esi]
	lea	edx, DWORD PTR _temp_vert$[esp+68]
; Line 119
	push	edx
	add	ecx, 4
	inc	edi
	lea	ebp, DWORD PTR [ebx+ecx-4]
	mov	eax, DWORD PTR [ebp+112]
	add	ebp, 112				; 00000070H
	mov	DWORD PTR [edx], eax
	push	ecx
	add	ebx, 12					; 0000000cH
	mov	eax, DWORD PTR [ebp+4]
	mov	DWORD PTR [edx+4], eax
	mov	ebp, DWORD PTR [ebp+8]
	mov	DWORD PTR [edx+8], ebp
; Line 120
	call	_vec3_add
	lea	ecx, DWORD PTR _temp_vert$[esp+76]
	add	esp, 8
; Line 121
	push	ecx
	call	_put_vertex
	add	esp, 4
	mov	eax, DWORD PTR [esi]
; Line 117
	xor	edx, edx
	mov	ecx, DWORD PTR [eax]
	mov	dx, WORD PTR [ecx+8]
	cmp	edx, edi
	jg	SHORT $L631
; Line 122
$L633:
	mov	eax, DWORD PTR [esi]
	mov	edx, DWORD PTR _cur_index$[esp+68]
	mov	ecx, DWORD PTR [eax]
; Line 125
	mov	al, BYTE PTR [eax+100]
	mov	bx, WORD PTR [ecx+10]
	push	eax
	push	edx
	mov	eax, DWORD PTR [ecx]
	push	ebx
	push	eax
	call	_put_triangles
	add	esp, 16					; 00000010H
; Line 97
$L625:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jb	$L624
; Line 128
	call	_polygon_zsort
; Line 129
	mov	al, BYTE PTR _shading$[esp+64]
	push	eax
	call	_render_end
	add	esp, 4
; Line 130
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 52					; 00000034H
	ret	0
_draw_scene ENDP
_TEXT	ENDS
PUBLIC	_run_entity_scripts
;	COMDAT _run_entity_scripts
_TEXT	SEGMENT
_run_entity_scripts PROC NEAR				; COMDAT
; Line 139
	push	esi
	mov	esi, OFFSET FLAT:_StarblazerEntities
; Line 142
$L636:
	mov	eax, DWORD PTR [esi]
; Line 143
	test	eax, eax
	je	SHORT $L637
; Line 144
	push	esi
	mov	eax, DWORD PTR [eax]
	call	DWORD PTR [eax+12]
	add	esp, 4
; Line 142
$L637:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L636
; Line 147
	pop	esi
	ret	0
_run_entity_scripts ENDP
_TEXT	ENDS
PUBLIC	_test_collisions
;	COMDAT _test_collisions
_TEXT	SEGMENT
_ent1$ = 8
_ent2$ = 12
_test_collisions PROC NEAR				; COMDAT
; Line 157
	push	ebx
	push	esi
	mov	esi, DWORD PTR _ent1$[esp+4]
	push	edi
	mov	edi, DWORD PTR _ent2$[esp+8]
	mov	ebx, DWORD PTR [esi]
; Line 158
	mov	eax, DWORD PTR [esi+4]
	mov	ecx, DWORD PTR [ebx+16]
	sar	ecx, 1
	sub	eax, DWORD PTR [edi+4]
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	eax, ecx
	jge	SHORT $L643
; Line 159
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [ebx+20]
	sar	ecx, 1
	sub	eax, DWORD PTR [edi+8]
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	eax, ecx
	jge	SHORT $L643
; Line 160
	mov	eax, DWORD PTR [esi+12]
	mov	ecx, DWORD PTR [ebx+24]
	sar	ecx, 1
	sub	eax, DWORD PTR [edi+12]
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	eax, ecx
	jge	SHORT $L643
; Line 161
	mov	al, 1
	pop	edi
	pop	esi
	pop	ebx
	ret	0
; Line 165
$L643:
	xor	al, al
	pop	edi
; Line 166
	pop	esi
	pop	ebx
	ret	0
_test_collisions ENDP
_TEXT	ENDS
PUBLIC	_create_hitbox
;	COMDAT _create_hitbox
_TEXT	SEGMENT
_tpl$ = 8
_x$ = 12
_y$ = 16
_z$ = 20
_create_hitbox PROC NEAR				; COMDAT
; Line 176
	mov	eax, DWORD PTR _x$[esp-4]
	mov	ecx, DWORD PTR _tpl$[esp-4]
	mov	edx, DWORD PTR _y$[esp-4]
	mov	DWORD PTR [ecx+16], eax
; Line 177
	mov	eax, DWORD PTR _z$[esp-4]
	mov	DWORD PTR [ecx+20], edx
; Line 178
	mov	DWORD PTR [ecx+24], eax
; Line 179
	ret	0
_create_hitbox ENDP
_TEXT	ENDS
PUBLIC	??_C@_01LHO@r?$AA@				; `string'
PUBLIC	??_C@_02DILL@?$CFs?$AA@				; `string'
PUBLIC	??_C@_01KBCC@v?$AA@				; `string'
PUBLIC	??_C@_09KPAJ@?$CFf?5?$CFf?5?$CFf?6?$AA@		; `string'
PUBLIC	??_C@_01IFC@f?$AA@				; `string'
PUBLIC	??_C@_09FCEL@?$CFd?5?$CFd?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_06OPIA@usemtl?$AA@			; `string'
PUBLIC	??_C@_02MECO@?$CFd?$AA@				; `string'
PUBLIC	_load_model
EXTRN	_free:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT
??_C@_01LHO@r?$AA@ DB 'r', 00H				; `string'
_DATA	ENDS
;	COMDAT ??_C@_02DILL@?$CFs?$AA@
_DATA	SEGMENT
??_C@_02DILL@?$CFs?$AA@ DB '%s', 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_01KBCC@v?$AA@
_DATA	SEGMENT
??_C@_01KBCC@v?$AA@ DB 'v', 00H				; `string'
_DATA	ENDS
;	COMDAT ??_C@_09KPAJ@?$CFf?5?$CFf?5?$CFf?6?$AA@
_DATA	SEGMENT
??_C@_09KPAJ@?$CFf?5?$CFf?5?$CFf?6?$AA@ DB '%f %f %f', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_01IFC@f?$AA@
_DATA	SEGMENT
??_C@_01IFC@f?$AA@ DB 'f', 00H				; `string'
_DATA	ENDS
;	COMDAT ??_C@_09FCEL@?$CFd?5?$CFd?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_09FCEL@?$CFd?5?$CFd?5?$CFd?6?$AA@ DB '%d %d %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_06OPIA@usemtl?$AA@
_DATA	SEGMENT
??_C@_06OPIA@usemtl?$AA@ DB 'usemtl', 00H		; `string'
_DATA	ENDS
;	COMDAT ??_C@_02MECO@?$CFd?$AA@
_DATA	SEGMENT
??_C@_02MECO@?$CFd?$AA@ DB '%d', 00H			; `string'
_DATA	ENDS
CONST	SEGMENT
$T736	DD	047800000r			; 65536
CONST	ENDS
;	COMDAT _load_model
_TEXT	SEGMENT
_filename$ = 8
_fp$ = -564
_lineHeader$ = -512
_currentVert$ = -524
_currentFace$ = -528
_face1$ = -548
_face2$ = -552
_face3$ = -556
_x$ = -536
_y$ = -540
_z$ = -544
_current_color$ = -560
_polys$ = -520
_verts$ = -516
_tpl$ = -532
_load_model PROC NEAR					; COMDAT
; Line 194
	mov	eax, DWORD PTR _filename$[esp-4]
	sub	esp, 564				; 00000234H
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 195
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	eax
	call	_fopen
	mov	DWORD PTR _fp$[esp+588], eax
	add	esp, 8
; Line 199
	xor	eax, eax
	push	12000					; 00002ee0H
	mov	DWORD PTR _currentVert$[esp+584], eax
	mov	DWORD PTR _currentFace$[esp+584], eax
; Line 205
	call	_malloc
	mov	DWORD PTR _polys$[esp+584], eax
	add	esp, 4
; Line 206
	push	12000					; 00002ee0H
	call	_malloc
	mov	DWORD PTR _verts$[esp+584], eax
	add	esp, 4
; Line 207
	push	40					; 00000028H
	call	_malloc
	mov	ebx, DWORD PTR _polys$[esp+584]
	mov	ebp, DWORD PTR _verts$[esp+584]
	mov	DWORD PTR _tpl$[esp+584], eax
	add	esp, 4
	add	ebx, 6
; Line 209
$L671:
; Line 210
	lea	eax, DWORD PTR _lineHeader$[esp+580]
	mov	ecx, DWORD PTR _fp$[esp+580]
	push	eax
	push	OFFSET FLAT:??_C@_02DILL@?$CFs?$AA@	; `string'
	push	ecx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 211
	cmp	eax, -1
	je	$L733
; Line 213
	lea	esi, DWORD PTR _lineHeader$[esp+580]
	mov	edi, OFFSET FLAT:??_C@_01KBCC@v?$AA@	; `string'
	mov	ecx, 2
	rep	cmpsb
	jne	SHORT $L675
; Line 214
	lea	eax, DWORD PTR _z$[esp+580]
	lea	ecx, DWORD PTR _y$[esp+580]
	lea	edx, DWORD PTR _x$[esp+580]
	push	eax
	mov	eax, DWORD PTR _fp$[esp+584]
	push	ecx
	push	edx
	add	ebp, 12					; 0000000cH
	push	OFFSET FLAT:??_C@_09KPAJ@?$CFf?5?$CFf?5?$CFf?6?$AA@ ; `string'
	push	eax
	call	_fscanf
	fld	DWORD PTR _x$[esp+600]
	fmul	DWORD PTR $T736
	add	esp, 20					; 00000014H
; Line 215
	call	__ftol
	mov	DWORD PTR [ebp-12], eax
; Line 216
	fld	DWORD PTR _y$[esp+580]
	fmul	DWORD PTR $T736
	call	__ftol
	mov	DWORD PTR [ebp-8], eax
; Line 217
	fld	DWORD PTR _z$[esp+580]
	fmul	DWORD PTR $T736
	call	__ftol
	mov	DWORD PTR [ebp-4], eax
	inc	DWORD PTR _currentVert$[esp+580]
; Line 221
$L675:
	lea	esi, DWORD PTR _lineHeader$[esp+580]
	mov	edi, OFFSET FLAT:??_C@_01IFC@f?$AA@	; `string'
	mov	ecx, 2
	rep	cmpsb
	jne	SHORT $L678
; Line 222
	lea	eax, DWORD PTR _face3$[esp+580]
	lea	ecx, DWORD PTR _face2$[esp+580]
	lea	edx, DWORD PTR _face1$[esp+580]
	push	eax
	mov	eax, DWORD PTR _fp$[esp+584]
	push	ecx
	push	edx
	add	ebx, 12					; 0000000cH
	push	OFFSET FLAT:??_C@_09FCEL@?$CFd?5?$CFd?5?$CFd?6?$AA@ ; `string'
	push	eax
	call	_fscanf
	mov	cl, BYTE PTR _current_color$[esp+600]
	add	esp, 20					; 00000014H
; Line 223
	mov	BYTE PTR [ebx-12], cl
; Line 224
	mov	eax, DWORD PTR _face1$[esp+580]
	dec	ax
	mov	WORD PTR [ebx-18], ax
; Line 225
	mov	eax, DWORD PTR _face2$[esp+580]
	dec	ax
	mov	WORD PTR [ebx-16], ax
; Line 226
	mov	eax, DWORD PTR _face3$[esp+580]
	dec	ax
	inc	DWORD PTR _currentFace$[esp+580]
	mov	WORD PTR [ebx-14], ax
; Line 230
$L678:
	lea	esi, DWORD PTR _lineHeader$[esp+580]
	mov	edi, OFFSET FLAT:??_C@_06OPIA@usemtl?$AA@ ; `string'
	mov	ecx, 7
	rep	cmpsb
	jne	$L671
; Line 231
	lea	eax, DWORD PTR _current_color$[esp+580]
	mov	ecx, DWORD PTR _fp$[esp+580]
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	push	ecx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 233
	jmp	$L671
$L733:
; Line 235
	mov	ax, WORD PTR _currentFace$[esp+580]
	mov	ecx, DWORD PTR _tpl$[esp+580]
	mov	dx, WORD PTR _currentVert$[esp+580]
	mov	WORD PTR [ecx+10], ax
; Line 236
	mov	WORD PTR [ecx+8], dx
	mov	edx, DWORD PTR _currentVert$[esp+580]
	lea	eax, DWORD PTR [edx+edx*2]
	lea	ebx, DWORD PTR [eax*4]
; Line 237
	push	ebx
	call	_malloc
	mov	ecx, DWORD PTR _tpl$[esp+584]
	add	esp, 4
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _currentFace$[esp+580]
	lea	edx, DWORD PTR [eax+eax*2]
	lea	ebp, DWORD PTR [edx*4]
; Line 238
	push	ebp
	call	_malloc
	mov	ecx, DWORD PTR _tpl$[esp+584]
	mov	esi, DWORD PTR _verts$[esp+584]
	add	esp, 4
	mov	DWORD PTR [ecx], eax
; Line 240
	mov	edi, DWORD PTR [ecx+4]
	mov	ecx, ebx
	shr	ecx, 2
	rep	movsd
	mov	ecx, ebx
	and	ecx, 3
	rep	movsb
; Line 241
	mov	ecx, DWORD PTR _tpl$[esp+580]
	mov	esi, DWORD PTR _polys$[esp+580]
	mov	edi, DWORD PTR [ecx]
	mov	ecx, ebp
	shr	ecx, 2
	rep	movsd
	mov	ecx, ebp
	and	ecx, 3
	rep	movsb
; Line 243
	mov	eax, DWORD PTR _verts$[esp+580]
	push	eax
	call	_free
	mov	ecx, DWORD PTR _polys$[esp+584]
	add	esp, 4
; Line 244
	push	ecx
	call	_free
	mov	ecx, DWORD PTR _tpl$[esp+584]
	mov	edx, DWORD PTR _fp$[esp+584]
	add	esp, 4
; Line 245
	mov	DWORD PTR [ecx+32], 0
; Line 247
	push	edx
	call	_fclose
	mov	eax, DWORD PTR _tpl$[esp+584]
	add	esp, 4
; Line 250
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 564				; 00000234H
	ret	0
_load_model ENDP
_TEXT	ENDS
END
