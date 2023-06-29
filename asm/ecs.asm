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
_first_open_slot PROC NEAR				; COMDAT
; File src\ecs.c
; Line 23
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_StarblazerEntities
$L527:
; Line 24
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L525
	add	ecx, 4
	inc	eax
	cmp	ecx, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L527
; Line 29
	mov	eax, -559038737				; deadbeefH
$L525:
; Line 30
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
; Line 40
	call	_first_open_slot
; Line 42
	push	108					; 0000006cH
	mov	esi, eax
	call	_malloc
; Line 43
	mov	ebx, DWORD PTR _type$[esp+12]
; Line 44
	mov	ecx, DWORD PTR _x$[esp+12]
	mov	DWORD PTR _StarblazerEntities[esi*4], eax
	mov	DWORD PTR [eax], ebx
	mov	eax, DWORD PTR _StarblazerEntities[esi*4]
	mov	DWORD PTR [eax+4], ecx
; Line 45
	mov	edx, DWORD PTR _StarblazerEntities[esi*4]
	mov	eax, DWORD PTR _y$[esp+12]
	mov	DWORD PTR [edx+8], eax
; Line 46
	mov	ecx, DWORD PTR _StarblazerEntities[esi*4]
	mov	edx, DWORD PTR _z$[esp+12]
	mov	DWORD PTR [ecx+12], edx
; Line 47
	mov	eax, DWORD PTR _StarblazerEntities[esi*4]
	mov	ecx, DWORD PTR _roll$[esp+12]
	mov	edx, DWORD PTR _yaw$[esp+12]
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _pitch$[esp+16]
	push	ecx
	push	edx
	push	eax
	call	_quat_create
; Line 48
	mov	edi, DWORD PTR _StarblazerEntities[esi*4]
	mov	ecx, 16					; 00000010H
	xor	eax, eax
	add	edi, 32					; 00000020H
	rep stosd
; Line 49
	mov	ecx, DWORD PTR _StarblazerEntities[esi*4]
	mov	edx, DWORD PTR [ebx+28]
	add	esp, 20					; 00000014H
	mov	DWORD PTR [ecx+96], edx
; Line 50
	mov	ecx, DWORD PTR _StarblazerEntities[esi*4]
	pop	edi
	mov	BYTE PTR [ecx+100], al
; Line 51
	mov	edx, DWORD PTR _StarblazerEntities[esi*4]
	mov	DWORD PTR [edx+104], eax
; Line 53
	mov	eax, esi
	pop	esi
	pop	ebx
; Line 54
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
; Line 68
	mov	eax, DWORD PTR _cam_pos$[esp-4]
	sub	esp, 48					; 00000030H
	push	ebx
	push	ebp
	push	esi
	push	edi
	push	eax
	call	_camera_translate
; Line 69
	lea	ecx, DWORD PTR _cam_ori$[esp+64]
	push	ecx
	call	_quat_conjugate
; Line 70
	lea	edx, DWORD PTR _cam_ori$[esp+68]
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	edx
	call	_quat_tomat
; Line 72
	mov	edi, DWORD PTR _num_stars$[esp+76]
	add	esp, 16					; 00000010H
	test	edi, edi
	jle	SHORT $L553
; Line 68
	mov	esi, DWORD PTR _star_ptr$[esp+60]
$L551:
; Line 73
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
	add	esp, 16					; 00000010H
	add	esi, 12					; 0000000cH
	dec	edi
	jne	SHORT $L551
$L553:
; Line 76
	call	_render_begin
	mov	esi, OFFSET FLAT:_StarblazerEntities
$L554:
; Line 79
	mov	eax, DWORD PTR [esi]
	xor	ebp, ebp
	cmp	eax, ebp
	je	$L555
; Line 81
	cmp	DWORD PTR [eax+104], ebp
	je	SHORT $L558
; Line 82
	mov	DWORD PTR [eax+104], ebp
; Line 84
	jmp	SHORT $L559
$L558:
; Line 85
	mov	BYTE PTR [eax+100], 0
$L559:
; Line 91
	mov	edx, DWORD PTR [esi]
	lea	ecx, DWORD PTR _model_rotation_matrix$[esp+64]
	add	edx, 16					; 00000010H
	xor	ebx, ebx
	mov	bx, WORD PTR _SL_VERTEX_INDEX
	push	ecx
	push	edx
	call	_quat_tomat
; Line 94
	mov	eax, DWORD PTR [esi]
	add	esp, 8
	xor	edi, edi
	mov	eax, DWORD PTR [eax]
	cmp	WORD PTR [eax+8], bp
	jbe	SHORT $L562
$L560:
; Line 95
	mov	edx, DWORD PTR [eax+4]
	lea	ecx, DWORD PTR _temp_vert$[esp+64]
	add	edx, ebp
	push	ecx
	lea	eax, DWORD PTR _model_rotation_matrix$[esp+68]
	push	edx
	push	eax
	call	_mat3_mul
; Line 96
	mov	edx, DWORD PTR [esi]
	lea	ecx, DWORD PTR _temp_vert$[esp+76]
	add	edx, 4
	push	ecx
	push	edx
	call	_vec3_add
; Line 97
	lea	eax, DWORD PTR _temp_vert$[esp+84]
	push	eax
	call	_put_vertex
	mov	ecx, DWORD PTR [esi]
	xor	edx, edx
	add	esp, 24					; 00000018H
	inc	edi
	mov	eax, DWORD PTR [ecx]
	add	ebp, 12					; 0000000cH
	mov	dx, WORD PTR [eax+8]
	cmp	edi, edx
	jl	SHORT $L560
$L562:
; Line 101
	mov	eax, DWORD PTR [esi]
	mov	ecx, DWORD PTR [eax]
	mov	al, BYTE PTR [eax+100]
	push	eax
	push	ebx
	mov	dx, WORD PTR [ecx+10]
	mov	eax, DWORD PTR [ecx]
	push	edx
	push	eax
	call	_put_triangles
	add	esp, 16					; 00000010H
$L555:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jl	$L554
; Line 104
	call	_polygon_zsort
; Line 105
	mov	ecx, DWORD PTR _shading$[esp+60]
	push	ecx
	call	_render_end
	add	esp, 4
; Line 106
	pop	edi
	pop	esi
	pop	ebp
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
; Line 118
	mov	esi, OFFSET FLAT:_StarblazerEntities
$L565:
; Line 119
	mov	eax, DWORD PTR [esi]
	test	eax, eax
	je	SHORT $L566
; Line 120
	mov	eax, DWORD PTR [eax]
	push	esi
	call	DWORD PTR [eax+12]
	add	esp, 4
$L566:
	add	esi, 4
	cmp	esi, OFFSET FLAT:_StarblazerEntities+4000
	jl	SHORT $L565
	pop	esi
; Line 123
	ret	0
_run_entity_scripts ENDP
_TEXT	ENDS
PUBLIC	_test_collisions
;	COMDAT _test_collisions
_TEXT	SEGMENT
_ent1$ = 8
_ent2$ = 12
_test_collisions PROC NEAR				; COMDAT
; Line 134
	mov	ecx, DWORD PTR _ent1$[esp-4]
	push	esi
	push	edi
	mov	edi, DWORD PTR _ent2$[esp+4]
	mov	eax, DWORD PTR [ecx+4]
	mov	esi, DWORD PTR [ecx]
	sub	eax, DWORD PTR [edi+4]
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	edx, DWORD PTR [esi+16]
	sar	edx, 1
	cmp	eax, edx
	jge	SHORT $L574
; Line 135
	mov	eax, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR [edi+8]
	sub	eax, edx
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	edx, DWORD PTR [esi+20]
	sar	edx, 1
	cmp	eax, edx
	jge	SHORT $L574
; Line 136
	mov	eax, DWORD PTR [ecx+12]
	mov	edx, DWORD PTR [edi+12]
	mov	ecx, DWORD PTR [esi+24]
	sub	eax, edx
	cdq
	xor	eax, edx
	sub	eax, edx
	sar	ecx, 1
	cmp	eax, ecx
	jge	SHORT $L574
	pop	edi
; Line 137
	mov	al, 1
	pop	esi
; Line 142
	ret	0
$L574:
	pop	edi
; Line 141
	xor	al, al
	pop	esi
; Line 142
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
	mov	eax, DWORD PTR _tpl$[esp-4]
	mov	ecx, DWORD PTR _x$[esp-4]
; Line 153
	mov	edx, DWORD PTR _y$[esp-4]
	mov	DWORD PTR [eax+16], ecx
; Line 154
	mov	ecx, DWORD PTR _z$[esp-4]
	mov	DWORD PTR [eax+20], edx
	mov	DWORD PTR [eax+24], ecx
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
PUBLIC	__real@4@400f8000000000000000
EXTRN	_free:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
;	COMDAT ??_C@_01LHO@r?$AA@
; File src\ecs.c
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
;	COMDAT __real@4@400f8000000000000000
CONST	SEGMENT
__real@4@400f8000000000000000 DD 047800000r	; 65536
CONST	ENDS
;	COMDAT _load_model
_TEXT	SEGMENT
_filename$ = 8
_fp$ = -520
_lineHeader$ = -512
_currentVert$ = -564
_currentFace$ = -560
_face1$ = -552
_face2$ = -532
_face3$ = -548
_x$ = -524
_y$ = -516
_z$ = -540
_current_color$ = -544
_polys$ = -528
_verts$ = -536
_load_model PROC NEAR					; COMDAT
; File src\ecs.c
; Line 170
	sub	esp, 564				; 00000234H
; Line 171
	mov	eax, DWORD PTR _filename$[esp+560]
	push	ebx
	push	ebp
	push	esi
	push	edi
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	eax
	call	_fopen
	mov	ebx, eax
; Line 175
	xor	eax, eax
; Line 181
	push	12000					; 00002ee0H
	mov	DWORD PTR _fp$[esp+592], ebx
	mov	DWORD PTR _currentVert$[esp+592], eax
	mov	DWORD PTR _currentFace$[esp+592], eax
	call	_malloc
	mov	esi, eax
; Line 182
	push	12000					; 00002ee0H
	mov	DWORD PTR _polys$[esp+596], esi
	call	_malloc
	mov	edi, eax
; Line 183
	push	40					; 00000028H
	mov	DWORD PTR _verts$[esp+600], edi
	call	_malloc
	add	esp, 20					; 00000014H
	add	esi, 2
	add	edi, 8
	mov	ebp, eax
	mov	DWORD PTR -556+[esp+580], edi
$L600:
; Line 186
	lea	ecx, DWORD PTR _lineHeader$[esp+580]
	push	ecx
	push	OFFSET FLAT:??_C@_02DILL@?$CFs?$AA@	; `string'
	push	ebx
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 187
	cmp	eax, -1
	je	$L662
; Line 189
	mov	edi, OFFSET FLAT:??_C@_01KBCC@v?$AA@	; `string'
	lea	eax, DWORD PTR _lineHeader$[esp+580]
$L663:
	mov	dl, BYTE PTR [eax]
	mov	cl, dl
	cmp	dl, BYTE PTR [edi]
	jne	SHORT $L664
	test	cl, cl
	je	SHORT $L665
	mov	dl, BYTE PTR [eax+1]
	mov	cl, dl
	cmp	dl, BYTE PTR [edi+1]
	jne	SHORT $L664
	add	eax, 2
	add	edi, 2
	test	cl, cl
	jne	SHORT $L663
$L665:
	xor	eax, eax
	jmp	SHORT $L666
$L664:
	sbb	eax, eax
	sbb	eax, -1
$L666:
	test	eax, eax
	jne	SHORT $L604
; Line 190
	lea	eax, DWORD PTR _z$[esp+580]
	lea	ecx, DWORD PTR _y$[esp+580]
	push	eax
	lea	edx, DWORD PTR _x$[esp+584]
	push	ecx
	push	edx
	push	OFFSET FLAT:??_C@_09KPAJ@?$CFf?5?$CFf?5?$CFf?6?$AA@ ; `string'
	push	ebx
	call	_fscanf
; Line 191
	fld	DWORD PTR _x$[esp+600]
	fmul	DWORD PTR __real@4@400f8000000000000000
	add	esp, 20					; 00000014H
	call	__ftol
	mov	edi, DWORD PTR -556+[esp+580]
	mov	DWORD PTR [edi-8], eax
; Line 192
	fld	DWORD PTR _y$[esp+580]
	fmul	DWORD PTR __real@4@400f8000000000000000
	call	__ftol
	mov	DWORD PTR [edi-4], eax
; Line 193
	fld	DWORD PTR _z$[esp+580]
	fmul	DWORD PTR __real@4@400f8000000000000000
	call	__ftol
; Line 194
	mov	ecx, DWORD PTR _currentVert$[esp+580]
	mov	DWORD PTR [edi], eax
	inc	ecx
	add	edi, 12					; 0000000cH
	mov	DWORD PTR _currentVert$[esp+580], ecx
	mov	DWORD PTR -556+[esp+580], edi
$L604:
; Line 197
	mov	edi, OFFSET FLAT:??_C@_01IFC@f?$AA@	; `string'
	lea	eax, DWORD PTR _lineHeader$[esp+580]
$L668:
	mov	dl, BYTE PTR [eax]
	mov	cl, dl
	cmp	dl, BYTE PTR [edi]
	jne	SHORT $L669
	test	cl, cl
	je	SHORT $L670
	mov	dl, BYTE PTR [eax+1]
	mov	cl, dl
	cmp	dl, BYTE PTR [edi+1]
	jne	SHORT $L669
	add	eax, 2
	add	edi, 2
	test	cl, cl
	jne	SHORT $L668
$L670:
	xor	eax, eax
	jmp	SHORT $L671
$L669:
	sbb	eax, eax
	sbb	eax, -1
$L671:
	test	eax, eax
	jne	SHORT $L607
; Line 198
	lea	eax, DWORD PTR _face3$[esp+580]
	lea	ecx, DWORD PTR _face2$[esp+580]
	push	eax
	lea	edx, DWORD PTR _face1$[esp+584]
	push	ecx
	push	edx
	push	OFFSET FLAT:??_C@_09FCEL@?$CFd?5?$CFd?5?$CFd?6?$AA@ ; `string'
	push	ebx
	call	_fscanf
; Line 199
	mov	al, BYTE PTR _current_color$[esp+600]
	add	esp, 20					; 00000014H
	mov	BYTE PTR [esi+4], al
; Line 200
	mov	ecx, DWORD PTR _face1$[esp+580]
	dec	ecx
	mov	WORD PTR [esi-2], cx
; Line 201
	mov	edx, DWORD PTR _face2$[esp+580]
; Line 203
	mov	ecx, DWORD PTR _currentFace$[esp+580]
	dec	edx
	mov	WORD PTR [esi], dx
	mov	eax, DWORD PTR _face3$[esp+580]
	dec	eax
	inc	ecx
	mov	WORD PTR [esi+2], ax
	mov	DWORD PTR _currentFace$[esp+580], ecx
	add	esi, 12					; 0000000cH
$L607:
; Line 206
	mov	edi, OFFSET FLAT:??_C@_06OPIA@usemtl?$AA@ ; `string'
	lea	eax, DWORD PTR _lineHeader$[esp+580]
$L672:
	mov	dl, BYTE PTR [eax]
	mov	cl, dl
	cmp	dl, BYTE PTR [edi]
	jne	SHORT $L673
	test	cl, cl
	je	SHORT $L674
	mov	dl, BYTE PTR [eax+1]
	mov	cl, dl
	cmp	dl, BYTE PTR [edi+1]
	jne	SHORT $L673
	add	eax, 2
	add	edi, 2
	test	cl, cl
	jne	SHORT $L672
$L674:
	xor	eax, eax
	jmp	SHORT $L675
$L673:
	sbb	eax, eax
	sbb	eax, -1
$L675:
	test	eax, eax
	jne	$L600
; Line 207
	lea	eax, DWORD PTR _current_color$[esp+580]
	push	eax
	push	OFFSET FLAT:??_C@_02MECO@?$CFd?$AA@	; `string'
	push	ebx
	call	_fscanf
	add	esp, 12					; 0000000cH
	jmp	$L600
$L662:
; Line 212
	mov	esi, DWORD PTR _currentVert$[esp+580]
	mov	ebx, DWORD PTR _currentFace$[esp+580]
	mov	WORD PTR [ebp+8], si
	mov	WORD PTR [ebp+10], bx
; Line 213
	lea	esi, DWORD PTR [esi+esi*2]
	shl	esi, 2
	push	esi
	call	_malloc
; Line 214
	lea	ebx, DWORD PTR [ebx+ebx*2]
	mov	DWORD PTR [ebp+4], eax
	shl	ebx, 2
	push	ebx
	call	_malloc
; Line 216
	mov	edi, DWORD PTR [ebp+4]
	mov	ecx, esi
	mov	DWORD PTR [ebp], eax
	mov	eax, DWORD PTR _verts$[esp+588]
	mov	edx, ecx
	mov	esi, eax
	shr	ecx, 2
	rep movsd
	mov	ecx, edx
; Line 219
	push	eax
	and	ecx, 3
	rep movsb
	mov	edi, DWORD PTR [ebp]
	mov	ecx, ebx
	mov	ebx, DWORD PTR _polys$[esp+592]
	mov	edx, ecx
	mov	esi, ebx
	shr	ecx, 2
	rep movsd
	mov	ecx, edx
	and	ecx, 3
	rep movsb
	call	_free
; Line 220
	push	ebx
	call	_free
; Line 223
	mov	eax, DWORD PTR _fp$[esp+596]
	mov	DWORD PTR [ebp+32], 0
	push	eax
	call	_fclose
	add	esp, 20					; 00000014H
; Line 225
	mov	eax, ebp
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 226
	add	esp, 564				; 00000234H
	ret	0
_load_model ENDP
_TEXT	ENDS
END
