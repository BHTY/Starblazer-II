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
$L523:
; Line 24
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L521
	add	ecx, 4
	inc	eax
; Line 23
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L523
; Line 29
	mov	eax, -559038737				; deadbeefH
; Line 30
$L521:
	ret	0
_first_open_slot ENDP
_TEXT	ENDS
PUBLIC	_spawn_entity
EXTRN	_quat_create:NEAR
EXTRN	_malloc:NEAR
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
	push	108					; 0000006cH
	call	_malloc
	mov	ebp, DWORD PTR _type$[esp+16]
	add	esp, 4
	mov	DWORD PTR [ebx], eax
; Line 43
	mov	edx, DWORD PTR _y$[esp+12]
	mov	DWORD PTR [eax], ebp
; Line 44
	mov	eax, DWORD PTR _x$[esp+12]
	mov	ecx, DWORD PTR [ebx]
	mov	DWORD PTR [ecx+4], eax
; Line 45
	mov	ecx, DWORD PTR [ebx]
	mov	eax, DWORD PTR _z$[esp+12]
	mov	DWORD PTR [ecx+8], edx
; Line 46
	mov	ecx, DWORD PTR [ebx]
	mov	dl, BYTE PTR _yaw$[esp+12]
	mov	DWORD PTR [ecx+12], eax
; Line 47
	mov	eax, DWORD PTR [ebx]
	add	eax, 16					; 00000010H
	mov	cl, BYTE PTR _roll$[esp+12]
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
	pop	ebp
	pop	edi
	mov	BYTE PTR [eax+100], cl
; Line 51
	mov	eax, DWORD PTR [ebx]
	mov	DWORD PTR [eax+104], ecx
; Line 53
	mov	eax, esi
; Line 54
	pop	esi
	pop	ebx
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
;	COMDAT _draw_scene
_TEXT	SEGMENT
_cam_pos$ = 8
_cam_ori$ = 12
_shading$ = 28
_star_ptr$ = 32
_num_stars$ = 36
_temp_vert$ = -48
_model_rotation_matrix$ = -36
_draw_scene PROC NEAR					; COMDAT
; Line 63
	mov	eax, DWORD PTR _cam_pos$[esp-4]
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 68
	push	eax
	call	_camera_translate
	lea	eax, DWORD PTR _cam_ori$[esp+64]
	add	esp, 4
; Line 69
	push	eax
	call	_quat_conjugate
	lea	eax, DWORD PTR _cam_ori$[esp+64]
	add	esp, 4
; Line 70
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	eax
	call	_quat_tomat
	mov	edi, DWORD PTR _num_stars$[esp+68]
	add	esp, 8
; Line 72
	test	edi, edi
	jle	SHORT $L549
	mov	esi, DWORD PTR _star_ptr$[esp+60]
$L547:
; Line 73
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
	jne	SHORT $L547
; Line 74
$L549:
; Line 76
	mov	esi, OFFSET FLAT:_StarblazerEntities
	call	_render_begin
; Line 78
$L550:
	mov	eax, DWORD PTR [esi]
; Line 79
	test	eax, eax
	je	$L551
; Line 81
	cmp	DWORD PTR [eax+104], 0
	je	SHORT $L554
; Line 82
	mov	DWORD PTR [eax+104], 0
; Line 84
	jmp	SHORT $L555
$L554:
; Line 85
	mov	BYTE PTR [eax+100], 0
; Line 86
$L555:
; Line 88
	xor	edi, edi
	lea	eax, DWORD PTR _model_rotation_matrix$[esp+64]
	mov	di, WORD PTR _SL_VERTEX_INDEX
	push	eax
; Line 91
	mov	eax, DWORD PTR [esi]
	xor	ebx, ebx
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
	mov	ecx, DWORD PTR [esi]
; Line 94
	mov	eax, DWORD PTR [ecx]
	cmp	WORD PTR [eax+8], bx
	jbe	SHORT $L558
	xor	ebp, ebp
$L556:
; Line 95
	lea	eax, DWORD PTR _temp_vert$[esp+64]
	mov	ecx, DWORD PTR [esi]
	mov	edx, DWORD PTR [ecx]
	lea	ecx, DWORD PTR _model_rotation_matrix$[esp+64]
	push	eax
	inc	ebx
	mov	eax, DWORD PTR [edx+4]
	add	eax, ebp
	add	ebp, 12					; 0000000cH
	push	eax
	push	ecx
	call	_mat3_mul
	lea	ecx, DWORD PTR _temp_vert$[esp+76]
	add	esp, 12					; 0000000cH
; Line 96
	mov	eax, DWORD PTR [esi]
	push	ecx
	add	eax, 4
	push	eax
	call	_vec3_add
	lea	ecx, DWORD PTR _temp_vert$[esp+72]
	add	esp, 8
; Line 97
	push	ecx
	call	_put_vertex
	add	esp, 4
	mov	eax, DWORD PTR [esi]
; Line 94
	xor	ecx, ecx
	mov	edx, DWORD PTR [eax]
	mov	cx, WORD PTR [edx+8]
	cmp	ecx, ebx
	jg	SHORT $L556
; Line 98
$L558:
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax]
; Line 101
	mov	al, BYTE PTR [eax+100]
	mov	dx, WORD PTR [ecx+10]
	push	eax
	push	edi
	mov	ecx, DWORD PTR [ecx]
	push	edx
	push	ecx
	call	_put_triangles
	add	esp, 16					; 00000010H
; Line 78
$L551:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jb	$L550
; Line 104
	call	_polygon_zsort
; Line 105
	mov	al, BYTE PTR _shading$[esp+60]
	push	eax
	call	_render_end
	add	esp, 4
; Line 106
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 48					; 00000030H
	ret	0
_draw_scene ENDP
_TEXT	ENDS
PUBLIC	_run_entity_scripts
;	COMDAT _run_entity_scripts
_TEXT	SEGMENT
_run_entity_scripts PROC NEAR				; COMDAT
; Line 115
	push	esi
	mov	esi, OFFSET FLAT:_StarblazerEntities
; Line 118
$L561:
	mov	eax, DWORD PTR [esi]
; Line 119
	test	eax, eax
	je	SHORT $L562
; Line 120
	push	esi
	mov	eax, DWORD PTR [eax]
	call	DWORD PTR [eax+12]
	add	esp, 4
; Line 118
$L562:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jb	SHORT $L561
; Line 123
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
; Line 133
	push	ebx
	push	esi
	mov	esi, DWORD PTR _ent1$[esp+4]
	push	edi
	mov	edi, DWORD PTR _ent2$[esp+8]
	mov	ebx, DWORD PTR [esi]
; Line 134
	mov	eax, DWORD PTR [esi+4]
	mov	ecx, DWORD PTR [ebx+16]
	sar	ecx, 1
	sub	eax, DWORD PTR [edi+4]
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	eax, ecx
	jge	SHORT $L568
; Line 135
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [ebx+20]
	sar	ecx, 1
	sub	eax, DWORD PTR [edi+8]
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	eax, ecx
	jge	SHORT $L568
; Line 136
	mov	eax, DWORD PTR [esi+12]
	mov	ecx, DWORD PTR [ebx+24]
	sar	ecx, 1
	sub	eax, DWORD PTR [edi+12]
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	eax, ecx
	jge	SHORT $L568
; Line 137
	mov	al, 1
	pop	edi
	pop	esi
	pop	ebx
	ret	0
; Line 141
$L568:
	xor	al, al
	pop	edi
; Line 142
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
; Line 152
	mov	eax, DWORD PTR _x$[esp-4]
	mov	ecx, DWORD PTR _tpl$[esp-4]
	mov	edx, DWORD PTR _y$[esp-4]
	mov	DWORD PTR [ecx+16], eax
; Line 153
	mov	eax, DWORD PTR _z$[esp-4]
	mov	DWORD PTR [ecx+20], edx
; Line 154
	mov	DWORD PTR [ecx+24], eax
; Line 155
	ret	0
_create_hitbox ENDP
_TEXT	ENDS
PUBLIC	_load_model
PUBLIC	??_C@_01LHO@r?$AA@				; `string'
PUBLIC	??_C@_02DILL@?$CFs?$AA@				; `string'
PUBLIC	??_C@_01KBCC@v?$AA@				; `string'
PUBLIC	??_C@_09KPAJ@?$CFf?5?$CFf?5?$CFf?6?$AA@		; `string'
PUBLIC	??_C@_01IFC@f?$AA@				; `string'
PUBLIC	??_C@_09FCEL@?$CFd?5?$CFd?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_06OPIA@usemtl?$AA@			; `string'
PUBLIC	??_C@_02MECO@?$CFd?$AA@				; `string'
EXTRN	_free:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
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
$T653	DD	047800000r			; 65536
CONST	ENDS
;	COMDAT _load_model
_TEXT	SEGMENT
_filename$ = 8
_fp$ = -560
_lineHeader$ = -512
_currentVert$ = -556
_currentFace$ = -552
_face1$ = -528
_face2$ = -524
_face3$ = -520
_x$ = -540
_y$ = -536
_z$ = -532
_current_color$ = -516
_polys$ = -544
_verts$ = -548
_tpl$ = -564
_load_model PROC NEAR					; COMDAT
; Line 170
	mov	eax, DWORD PTR _filename$[esp-4]
	sub	esp, 564				; 00000234H
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 171
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	eax
	call	_fopen
	mov	DWORD PTR _fp$[esp+588], eax
	add	esp, 8
; Line 175
	xor	eax, eax
	push	12000					; 00002ee0H
	mov	DWORD PTR _currentVert$[esp+584], eax
	mov	DWORD PTR _currentFace$[esp+584], eax
; Line 181
	call	_malloc
	mov	DWORD PTR _polys$[esp+584], eax
	add	esp, 4
; Line 182
	push	12000					; 00002ee0H
	call	_malloc
	mov	DWORD PTR _verts$[esp+584], eax
	add	esp, 4
; Line 183
	push	40					; 00000028H
	call	_malloc
	mov	ebx, DWORD PTR _polys$[esp+584]
	mov	ebp, DWORD PTR _verts$[esp+584]
	mov	DWORD PTR _tpl$[esp+584], eax
	add	esp, 4
	add	ebx, 6
; Line 185
$L596:
; Line 186
	lea	eax, DWORD PTR _lineHeader$[esp+580]
	mov	ecx, DWORD PTR _fp$[esp+580]
	push	eax
	push	OFFSET FLAT:??_C@_02DILL@?$CFs?$AA@	; `string'
	push	ecx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 187
	cmp	eax, -1
	je	$L650
; Line 189
	lea	esi, DWORD PTR _lineHeader$[esp+580]
	mov	edi, OFFSET FLAT:??_C@_01KBCC@v?$AA@	; `string'
	mov	ecx, 2
	rep	cmpsb
	jne	SHORT $L600
; Line 190
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
	fmul	DWORD PTR $T653
	add	esp, 20					; 00000014H
; Line 191
	call	__ftol
	mov	DWORD PTR [ebp-12], eax
; Line 192
	fld	DWORD PTR _y$[esp+580]
	fmul	DWORD PTR $T653
	call	__ftol
	mov	DWORD PTR [ebp-8], eax
; Line 193
	fld	DWORD PTR _z$[esp+580]
	fmul	DWORD PTR $T653
	call	__ftol
	mov	DWORD PTR [ebp-4], eax
	inc	DWORD PTR _currentVert$[esp+580]
; Line 197
$L600:
	lea	esi, DWORD PTR _lineHeader$[esp+580]
	mov	edi, OFFSET FLAT:??_C@_01IFC@f?$AA@	; `string'
	mov	ecx, 2
	rep	cmpsb
	jne	SHORT $L603
; Line 198
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
; Line 199
	mov	BYTE PTR [ebx-12], cl
; Line 200
	mov	eax, DWORD PTR _face1$[esp+580]
	dec	ax
	mov	WORD PTR [ebx-18], ax
; Line 201
	mov	eax, DWORD PTR _face2$[esp+580]
	dec	ax
	mov	WORD PTR [ebx-16], ax
; Line 202
	mov	eax, DWORD PTR _face3$[esp+580]
	dec	ax
	inc	DWORD PTR _currentFace$[esp+580]
	mov	WORD PTR [ebx-14], ax
; Line 206
$L603:
	lea	esi, DWORD PTR _lineHeader$[esp+580]
	mov	edi, OFFSET FLAT:??_C@_06OPIA@usemtl?$AA@ ; `string'
	mov	ecx, 7
	rep	cmpsb
	jne	$L596
; Line 207
	lea	eax, DWORD PTR _current_color$[esp+580]
	mov	ecx, DWORD PTR _fp$[esp+580]
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	push	ecx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 209
	jmp	$L596
$L650:
; Line 211
	mov	ax, WORD PTR _currentFace$[esp+580]
	mov	ecx, DWORD PTR _tpl$[esp+580]
	mov	dx, WORD PTR _currentVert$[esp+580]
	mov	WORD PTR [ecx+10], ax
; Line 212
	mov	WORD PTR [ecx+8], dx
	mov	edx, DWORD PTR _currentVert$[esp+580]
	lea	eax, DWORD PTR [edx+edx*2]
	lea	ebx, DWORD PTR [eax*4]
; Line 213
	push	ebx
	call	_malloc
	mov	ecx, DWORD PTR _tpl$[esp+584]
	add	esp, 4
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _currentFace$[esp+580]
	lea	edx, DWORD PTR [eax+eax*2]
	lea	ebp, DWORD PTR [edx*4]
; Line 214
	push	ebp
	call	_malloc
	mov	ecx, DWORD PTR _tpl$[esp+584]
	mov	esi, DWORD PTR _verts$[esp+584]
	add	esp, 4
	mov	DWORD PTR [ecx], eax
; Line 216
	mov	edi, DWORD PTR [ecx+4]
	mov	ecx, ebx
	shr	ecx, 2
	rep	movsd
	mov	ecx, ebx
	and	ecx, 3
	rep	movsb
; Line 217
	mov	ecx, DWORD PTR _tpl$[esp+580]
	mov	esi, DWORD PTR _polys$[esp+580]
	mov	edi, DWORD PTR [ecx]
	mov	ecx, ebp
	shr	ecx, 2
	rep	movsd
	mov	ecx, ebp
	and	ecx, 3
	rep	movsb
; Line 219
	mov	eax, DWORD PTR _verts$[esp+580]
	push	eax
	call	_free
	mov	ecx, DWORD PTR _polys$[esp+584]
	add	esp, 4
; Line 220
	push	ecx
	call	_free
	mov	ecx, DWORD PTR _tpl$[esp+584]
	mov	edx, DWORD PTR _fp$[esp+584]
	add	esp, 4
; Line 221
	mov	DWORD PTR [ecx+32], 0
; Line 223
	push	edx
	call	_fclose
	mov	eax, DWORD PTR _tpl$[esp+584]
	add	esp, 4
; Line 226
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 564				; 00000234H
	ret	0
_load_model ENDP
_TEXT	ENDS
END
