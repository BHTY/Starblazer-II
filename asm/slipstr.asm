	TITLE	src\slipstr.c
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
PUBLIC	_SL_CENTER_X
PUBLIC	_SL_CENTER_Y
PUBLIC	_SL_FOV_X
PUBLIC	_SL_FOV_Y
_DATA	SEGMENT
COMM	_SL_VERTEX_INDEX:WORD
COMM	_SL_TRIANGLE_INDEX:WORD
COMM	_SL_CAMERA_POS:BYTE:0cH
COMM	_SL_CAMERA_ORIENTATION:BYTE:024H
COMM	_SL_TRIANGLES:BYTE:07530H
COMM	_SL_VERTS:BYTE:07530H
COMM	_SL_ORIG_VERTS:BYTE:07530H
_SL_CENTER_X DW	0a0H
_SL_CENTER_Y DW	064H
_SL_FOV_X DD	0640000H
_SL_FOV_Y DD	0640000H
_DATA	ENDS
PUBLIC	_render_begin
_TEXT	SEGMENT
_render_begin PROC NEAR
; File src\slipstr.c
; Line 36
	push	ebp
	mov	ebp, esp
; Line 37
	mov	WORD PTR _SL_VERTEX_INDEX, 0
; Line 38
	mov	WORD PTR _SL_TRIANGLE_INDEX, 0
; Line 39
	pop	ebp
	ret	0
_render_begin ENDP
_TEXT	ENDS
PUBLIC	_camera_translate
_TEXT	SEGMENT
_v$ = 8
_camera_translate PROC NEAR
; Line 48
	push	ebp
	mov	ebp, esp
; Line 49
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _SL_CAMERA_POS, ecx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _SL_CAMERA_POS+4, edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _SL_CAMERA_POS+8, eax
; Line 50
	pop	ebp
	ret	0
_camera_translate ENDP
_TEXT	ENDS
PUBLIC	_put_vertex
EXTRN	_muldiv:NEAR
EXTRN	_vec3_subtract:NEAR
EXTRN	_mat3_mul:NEAR
_TEXT	SEGMENT
_vec$ = 8
_v$ = -12
_put_vertex PROC NEAR
; Line 59
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	esi
; Line 62
	mov	eax, DWORD PTR _vec$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	add	esp, 8
; Line 63
	lea	ecx, DWORD PTR _v$[ebp]
	push	ecx
	mov	edx, DWORD PTR _vec$[ebp]
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 66
	movsx	esi, WORD PTR _SL_CENTER_X
	mov	eax, DWORD PTR _v$[ebp+8]
	push	eax
	mov	ecx, DWORD PTR _SL_FOV_X
	push	ecx
	mov	edx, DWORD PTR _v$[ebp]
	push	edx
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	esi, eax
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	imul	eax, 12					; 0000000cH
	mov	DWORD PTR _SL_VERTS[eax], esi
; Line 67
	movsx	esi, WORD PTR _SL_CENTER_Y
	mov	ecx, DWORD PTR _v$[ebp+8]
	push	ecx
	mov	edx, DWORD PTR _SL_FOV_Y
	push	edx
	mov	eax, DWORD PTR _v$[ebp+4]
	push	eax
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	esi, eax
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	imul	ecx, 12					; 0000000cH
	mov	DWORD PTR _SL_VERTS[ecx+4], esi
; Line 68
	xor	edx, edx
	mov	dx, WORD PTR _SL_VERTEX_INDEX
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _v$[ebp+8]
	mov	DWORD PTR _SL_VERTS[edx+8], eax
; Line 70
	mov	ecx, DWORD PTR _vec$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR _SL_VERTEX_INDEX
	imul	edx, 12					; 0000000cH
	add	edx, OFFSET FLAT:_SL_ORIG_VERTS
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], ecx
; Line 75
	mov	dx, WORD PTR _SL_VERTEX_INDEX
	add	dx, 1
	mov	WORD PTR _SL_VERTEX_INDEX, dx
; Line 76
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_put_vertex ENDP
_TEXT	ENDS
PUBLIC	_put_vert3f
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_z$ = 16
_v$ = -12
_put_vert3f PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 82
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _v$[ebp], eax
; Line 83
	mov	ecx, DWORD PTR _y$[ebp]
	mov	DWORD PTR _v$[ebp+4], ecx
; Line 84
	mov	edx, DWORD PTR _z$[ebp]
	mov	DWORD PTR _v$[ebp+8], edx
; Line 86
	lea	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_put_vertex
	add	esp, 4
; Line 87
	mov	esp, ebp
	pop	ebp
	ret	0
_put_vert3f ENDP
_TEXT	ENDS
PUBLIC	_put_triangles
_TEXT	SEGMENT
_tris$ = 8
_num_tris$ = 12
_vert_offset$ = 16
_color_override$ = 20
_i$ = -16
_v0index$ = -12
_v1index$ = -8
_v2index$ = -4
_put_triangles PROC NEAR
; Line 96
	push	ebp
	mov	ebp, esp
	sub	esp, 20					; 00000014H
; Line 100
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L441
$L442:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L441:
	mov	ecx, DWORD PTR _num_tris$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	DWORD PTR _i$[ebp], ecx
	jge	$L443
; Line 101
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _tris$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+edx]
	mov	edx, DWORD PTR _vert_offset$[ebp]
	and	edx, 65535				; 0000ffffH
	add	ecx, edx
	mov	WORD PTR _v0index$[ebp], cx
; Line 102
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _tris$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax+2]
	mov	eax, DWORD PTR _vert_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	add	edx, eax
	mov	WORD PTR _v1index$[ebp], dx
; Line 103
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _tris$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx+4]
	mov	ecx, DWORD PTR _vert_offset$[ebp]
	and	ecx, 65535				; 0000ffffH
	add	eax, ecx
	mov	WORD PTR _v2index$[ebp], ax
; Line 105
	mov	edx, DWORD PTR _color_override$[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	SHORT $L508
	mov	eax, DWORD PTR _color_override$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR -20+[ebp], eax
	jmp	SHORT $L509
$L508:
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _tris$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+ecx+6]
	mov	DWORD PTR -20+[ebp], eax
$L509:
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	imul	ecx, 12					; 0000000cH
	mov	dl, BYTE PTR -20+[ebp]
	mov	BYTE PTR _SL_TRIANGLES[ecx+6], dl
; Line 106
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	imul	eax, 12					; 0000000cH
	mov	cx, WORD PTR _v0index$[ebp]
	mov	WORD PTR _SL_TRIANGLES[eax], cx
; Line 107
	xor	edx, edx
	mov	dx, WORD PTR _SL_TRIANGLE_INDEX
	imul	edx, 12					; 0000000cH
	mov	ax, WORD PTR _v1index$[ebp]
	mov	WORD PTR _SL_TRIANGLES[edx+2], ax
; Line 108
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	imul	ecx, 12					; 0000000cH
	mov	dx, WORD PTR _v2index$[ebp]
	mov	WORD PTR _SL_TRIANGLES[ecx+4], dx
; Line 109
	mov	eax, DWORD PTR _v0index$[ebp]
	and	eax, 65535				; 0000ffffH
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _v1index$[ebp]
	and	ecx, 65535				; 0000ffffH
	imul	ecx, 12					; 0000000cH
	mov	eax, DWORD PTR _SL_VERTS[eax+8]
	add	eax, DWORD PTR _SL_VERTS[ecx+8]
	mov	edx, DWORD PTR _v2index$[ebp]
	and	edx, 65535				; 0000ffffH
	imul	edx, 12					; 0000000cH
	add	eax, DWORD PTR _SL_VERTS[edx+8]
	cdq
	mov	ecx, 3
	idiv	ecx
	xor	edx, edx
	mov	dx, WORD PTR _SL_TRIANGLE_INDEX
	imul	edx, 12					; 0000000cH
	mov	DWORD PTR _SL_TRIANGLES[edx+8], eax
; Line 111
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	add	ax, 1
	mov	WORD PTR _SL_TRIANGLE_INDEX, ax
; Line 112
	jmp	$L442
$L443:
; Line 113
	mov	esp, ebp
	pop	ebp
	ret	0
_put_triangles ENDP
_TEXT	ENDS
PUBLIC	_compare_tris
_TEXT	SEGMENT
_tri1$ = 8
_tri2$ = 12
_compare_tris PROC NEAR
; Line 115
	push	ebp
	mov	ebp, esp
	push	ebx
; Line 116
	mov	eax, DWORD PTR _tri1$[ebp]
	mov	ecx, DWORD PTR _tri2$[ebp]
	mov	edx, DWORD PTR [eax+8]
	xor	eax, eax
	cmp	edx, DWORD PTR [ecx+8]
	setl	al
	mov	ecx, DWORD PTR _tri1$[ebp]
	mov	edx, DWORD PTR _tri2$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	xor	ebx, ebx
	cmp	ecx, DWORD PTR [edx+8]
	setg	bl
	sub	eax, ebx
; Line 117
	pop	ebx
	pop	ebp
	ret	0
_compare_tris ENDP
_TEXT	ENDS
PUBLIC	_polygon_zsort
EXTRN	_qsort:NEAR
_TEXT	SEGMENT
_polygon_zsort PROC NEAR
; Line 126
	push	ebp
	mov	ebp, esp
; Line 127
	push	OFFSET FLAT:_compare_tris
	push	12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:_SL_TRIANGLES
	call	_qsort
	add	esp, 16					; 00000010H
; Line 128
	pop	ebp
	ret	0
_polygon_zsort ENDP
_TEXT	ENDS
PUBLIC	_plotpoint_3d
EXTRN	_plot_pixel:NEAR
_TEXT	SEGMENT
_pt$ = 8
_color$ = 20
_v$ = -12
_plotpoint_3d PROC NEAR
; Line 137
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	esi
; Line 141
	lea	eax, DWORD PTR _pt$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	add	esp, 8
; Line 143
	lea	ecx, DWORD PTR _v$[ebp]
	push	ecx
	lea	edx, DWORD PTR _pt$[ebp]
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 145
	cmp	DWORD PTR _v$[ebp+8], 0
	jle	SHORT $L453
; Line 146
	movsx	esi, WORD PTR _SL_CENTER_X
	mov	eax, DWORD PTR _v$[ebp+8]
	push	eax
	mov	ecx, DWORD PTR _SL_FOV_X
	push	ecx
	mov	edx, DWORD PTR _v$[ebp]
	push	edx
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	esi, eax
	mov	DWORD PTR _v$[ebp], esi
; Line 147
	movsx	esi, WORD PTR _SL_CENTER_Y
	mov	eax, DWORD PTR _v$[ebp+8]
	push	eax
	mov	ecx, DWORD PTR _SL_FOV_Y
	push	ecx
	mov	edx, DWORD PTR _v$[ebp+4]
	push	edx
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	esi, eax
	mov	DWORD PTR _v$[ebp+4], esi
; Line 148
	mov	al, BYTE PTR _color$[ebp]
	push	eax
	mov	cx, WORD PTR _v$[ebp+4]
	push	ecx
	mov	dx, WORD PTR _v$[ebp]
	push	edx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L453:
; Line 151
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_plotpoint_3d ENDP
_TEXT	ENDS
PUBLIC	_set_fov_x
_TEXT	SEGMENT
_fov$ = 8
_set_fov_x PROC NEAR
; Line 160
	push	ebp
	mov	ebp, esp
; Line 161
	mov	eax, DWORD PTR _fov$[ebp]
	mov	DWORD PTR _SL_FOV_X, eax
; Line 162
	pop	ebp
	ret	0
_set_fov_x ENDP
_TEXT	ENDS
PUBLIC	_set_fov_y
_TEXT	SEGMENT
_fov$ = 8
_set_fov_y PROC NEAR
; Line 171
	push	ebp
	mov	ebp, esp
; Line 172
	mov	eax, DWORD PTR _fov$[ebp]
	mov	DWORD PTR _SL_FOV_Y, eax
; Line 173
	pop	ebp
	ret	0
_set_fov_y ENDP
_TEXT	ENDS
PUBLIC	_find_illumination
EXTRN	_int_abs:NEAR
EXTRN	_vec3_add:NEAR
EXTRN	_vec3_cross:NEAR
EXTRN	_vec3_normalize:NEAR
EXTRN	_vec3_dot:NEAR
_TEXT	SEGMENT
_x1$ = 8
_x2$ = 12
_x3$ = 16
_light$ = 20
_look$ = -48
_norm$ = -36
_v1$ = -12
_v2$ = -24
_find_illumination PROC NEAR
; Line 191
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
; Line 194
	mov	eax, DWORD PTR _x2$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _v1$[ebp], ecx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _v1$[ebp+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _v1$[ebp+8], eax
; Line 195
	mov	ecx, DWORD PTR _x3$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _v2$[ebp], edx
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _v2$[ebp+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR _v2$[ebp+8], ecx
; Line 196
	lea	edx, DWORD PTR _v1$[ebp]
	push	edx
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 197
	lea	ecx, DWORD PTR _v2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _x1$[ebp]
	push	edx
	call	_vec3_subtract
	add	esp, 8
; Line 198
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	lea	ecx, DWORD PTR _v2$[ebp]
	push	ecx
	lea	edx, DWORD PTR _v1$[ebp]
	push	edx
	call	_vec3_cross
	add	esp, 12					; 0000000cH
; Line 199
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 200
	lea	ecx, DWORD PTR _norm$[ebp]
	push	ecx
	call	_vec3_normalize
	add	esp, 4
; Line 201
	lea	edx, DWORD PTR _norm$[ebp]
	push	edx
	call	_vec3_normalize
	add	esp, 4
; Line 202
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 203
	mov	ecx, DWORD PTR _x1$[ebp]
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _look$[ebp], edx
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _look$[ebp+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR _look$[ebp+8], ecx
; Line 204
	lea	edx, DWORD PTR _look$[ebp]
	push	edx
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_vec3_add
	add	esp, 8
; Line 205
	lea	ecx, DWORD PTR _look$[ebp]
	push	ecx
	mov	edx, DWORD PTR _x3$[ebp]
	push	edx
	call	_vec3_add
	add	esp, 8
; Line 206
	mov	eax, DWORD PTR _look$[ebp]
	cdq
	mov	ecx, 3
	idiv	ecx
	mov	DWORD PTR _look$[ebp], eax
; Line 207
	mov	eax, DWORD PTR _look$[ebp+4]
	cdq
	mov	ecx, 3
	idiv	ecx
	mov	DWORD PTR _look$[ebp+4], eax
; Line 208
	mov	eax, DWORD PTR _look$[ebp+8]
	cdq
	mov	ecx, 3
	idiv	ecx
	mov	DWORD PTR _look$[ebp+8], eax
; Line 209
	lea	edx, DWORD PTR _look$[ebp]
	push	edx
	mov	eax, DWORD PTR _light$[ebp]
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 210
	lea	ecx, DWORD PTR _look$[ebp]
	push	ecx
	call	_vec3_normalize
	add	esp, 4
; Line 211
	lea	edx, DWORD PTR _look$[ebp]
	push	edx
	call	_vec3_normalize
	add	esp, 4
; Line 212
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 213
	lea	ecx, DWORD PTR _look$[ebp]
	push	ecx
	call	_vec3_normalize
	add	esp, 4
; Line 214
	lea	edx, DWORD PTR _norm$[ebp]
	push	edx
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	call	_vec3_dot
	add	esp, 8
	push	eax
	call	_int_abs
	add	esp, 4
; Line 215
	mov	esp, ebp
	pop	ebp
	ret	0
_find_illumination ENDP
_TEXT	ENDS
PUBLIC	_clip_polygon
_TEXT	SEGMENT
_tri$ = 8
_v0$ = -36
_v1$ = -12
_v2$ = -24
_clip_polygon PROC NEAR
; Line 216
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
; Line 217
	mov	eax, DWORD PTR _tri$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax]
	imul	ecx, 12					; 0000000cH
	add	ecx, OFFSET FLAT:_SL_VERTS
	mov	edx, DWORD PTR [ecx]
	mov	DWORD PTR _v0$[ebp], edx
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR _v0$[ebp+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR _v0$[ebp+8], ecx
; Line 218
	mov	edx, DWORD PTR _tri$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx+2]
	imul	eax, 12					; 0000000cH
	add	eax, OFFSET FLAT:_SL_VERTS
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _v1$[ebp], ecx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _v1$[ebp+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _v1$[ebp+8], eax
; Line 219
	mov	ecx, DWORD PTR _tri$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+4]
	imul	edx, 12					; 0000000cH
	add	edx, OFFSET FLAT:_SL_VERTS
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _v2$[ebp], eax
	mov	ecx, DWORD PTR [edx+4]
	mov	DWORD PTR _v2$[ebp+4], ecx
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR _v2$[ebp+8], edx
; Line 221
	cmp	DWORD PTR _v0$[ebp+8], 2048		; 00000800H
	jle	SHORT $L474
	cmp	DWORD PTR _v1$[ebp+8], 2048		; 00000800H
	jle	SHORT $L474
	cmp	DWORD PTR _v2$[ebp+8], 2048		; 00000800H
	jg	SHORT $L473
$L474:
; Line 222
	xor	al, al
	jmp	SHORT $L469
$L473:
; Line 225
	cmp	DWORD PTR _v0$[ebp], 320		; 00000140H
	jl	SHORT $L477
	cmp	DWORD PTR _v1$[ebp], 320		; 00000140H
	jl	SHORT $L477
	cmp	DWORD PTR _v2$[ebp], 320		; 00000140H
	jge	SHORT $L476
$L477:
	cmp	DWORD PTR _v0$[ebp], 0
	jge	SHORT $L478
	cmp	DWORD PTR _v1$[ebp], 0
	jge	SHORT $L478
	cmp	DWORD PTR _v2$[ebp], 0
	jl	SHORT $L476
$L478:
	cmp	DWORD PTR _v0$[ebp+4], 200		; 000000c8H
	jl	SHORT $L479
	cmp	DWORD PTR _v1$[ebp+4], 200		; 000000c8H
	jl	SHORT $L479
	cmp	DWORD PTR _v2$[ebp+4], 200		; 000000c8H
	jge	SHORT $L476
$L479:
	cmp	DWORD PTR _v0$[ebp+4], 0
	jge	SHORT $L475
	cmp	DWORD PTR _v1$[ebp+4], 0
	jge	SHORT $L475
	cmp	DWORD PTR _v2$[ebp+4], 0
	jge	SHORT $L475
$L476:
; Line 226
	xor	al, al
	jmp	SHORT $L469
$L475:
; Line 229
	mov	al, 1
$L469:
; Line 230
	mov	esp, ebp
	pop	ebp
	ret	0
_clip_polygon ENDP
_TEXT	ENDS
PUBLIC	_render_end
EXTRN	_fill_tri:NEAR
EXTRN	_drawline:NEAR
_TEXT	SEGMENT
_shading$ = 8
_i$ = -32
_c$ = -16
_illum$ = -12
_x1$ = -24
_y1$ = -40
_x2$ = -28
_y2$ = -44
_x3$ = -36
_y3$ = -48
_render_end PROC NEAR
; Line 239
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
; Line 245
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L494
$L495:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L494:
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	cmp	DWORD PTR _i$[ebp], ecx
	jge	$L496
; Line 246
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	add	edx, OFFSET FLAT:_SL_TRIANGLES
	push	edx
	call	_clip_polygon
	add	esp, 4
	and	eax, 255				; 000000ffH
	test	eax, eax
	je	$L499
; Line 247
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	cl, BYTE PTR _SL_TRIANGLES[eax+6]
	mov	BYTE PTR _c$[ebp], cl
; Line 249
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLES[edx]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _SL_VERTS[eax]
	mov	DWORD PTR _x1$[ebp], ecx
; Line 250
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLES[edx]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _SL_VERTS[eax+4]
	mov	DWORD PTR _y1$[ebp], ecx
; Line 251
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLES[edx+2]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _SL_VERTS[eax]
	mov	DWORD PTR _x2$[ebp], ecx
; Line 252
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLES[edx+2]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _SL_VERTS[eax+4]
	mov	DWORD PTR _y2$[ebp], ecx
; Line 253
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLES[edx+4]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _SL_VERTS[eax]
	mov	DWORD PTR _x3$[ebp], ecx
; Line 254
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLES[edx+4]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _SL_VERTS[eax+4]
	mov	DWORD PTR _y3$[ebp], ecx
; Line 256
	mov	edx, DWORD PTR _shading$[ebp]
	and	edx, 255				; 000000ffH
	test	edx, edx
	je	$L498
; Line 257
	push	OFFSET FLAT:_SL_CAMERA_POS
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax+4]
	imul	ecx, 12					; 0000000cH
	add	ecx, OFFSET FLAT:_SL_ORIG_VERTS
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLES[edx+2]
	imul	eax, 12					; 0000000cH
	add	eax, OFFSET FLAT:_SL_ORIG_VERTS
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	xor	edx, edx
	mov	dx, WORD PTR _SL_TRIANGLES[ecx]
	imul	edx, 12					; 0000000cH
	add	edx, OFFSET FLAT:_SL_ORIG_VERTS
	push	edx
	call	_find_illumination
	add	esp, 16					; 00000010H
	imul	eax, 3
	add	eax, 65536				; 00010000H
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _illum$[ebp], eax
; Line 269
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _illum$[ebp]
	sar	ecx, 12					; 0000000cH
	or	eax, ecx
	push	eax
	mov	edx, DWORD PTR _y3$[ebp]
	push	edx
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	mov	ecx, DWORD PTR _y2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _x2$[ebp]
	push	edx
	mov	eax, DWORD PTR _y1$[ebp]
	push	eax
	mov	ecx, DWORD PTR _x1$[ebp]
	push	ecx
	call	_fill_tri
	add	esp, 28					; 0000001cH
; Line 271
	jmp	SHORT $L499
$L498:
; Line 274
	mov	edx, DWORD PTR _c$[ebp]
	and	edx, 255				; 000000ffH
	or	edx, 15					; 0000000fH
	push	edx
	mov	eax, DWORD PTR _y2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _x2$[ebp]
	push	ecx
	mov	edx, DWORD PTR _y1$[ebp]
	push	edx
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 275
	mov	ecx, DWORD PTR _c$[ebp]
	and	ecx, 255				; 000000ffH
	or	ecx, 15					; 0000000fH
	push	ecx
	mov	edx, DWORD PTR _y3$[ebp]
	push	edx
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	mov	ecx, DWORD PTR _y1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _x1$[ebp]
	push	edx
	call	_drawline
	add	esp, 20					; 00000014H
; Line 276
	mov	eax, DWORD PTR _c$[ebp]
	and	eax, 255				; 000000ffH
	or	al, 15					; 0000000fH
	push	eax
	mov	ecx, DWORD PTR _y3$[ebp]
	push	ecx
	mov	edx, DWORD PTR _x3$[ebp]
	push	edx
	mov	eax, DWORD PTR _y2$[ebp]
	push	eax
	mov	ecx, DWORD PTR _x2$[ebp]
	push	ecx
	call	_drawline
	add	esp, 20					; 00000014H
$L499:
; Line 279
	jmp	$L495
$L496:
; Line 280
	mov	esp, ebp
	pop	ebp
	ret	0
_render_end ENDP
_TEXT	ENDS
END
