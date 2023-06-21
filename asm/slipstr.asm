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
COMM	_SL_TRIANGLES:BYTE:04650H
COMM	_SL_VERTS:BYTE:07530H
COMM	_SL_ORIG_VERTS:BYTE:07530H
_SL_CENTER_X DW	0a0H
	ORG $+2
_SL_CENTER_Y DW	064H
	ORG $+2
_SL_FOV_X DD	0640000H
_SL_FOV_Y DD	0640000H
_DATA	ENDS
PUBLIC	_render_begin
_TEXT	SEGMENT
; File src\slipstr.c
_render_begin PROC NEAR
; Line 36
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 37
	mov	WORD PTR _SL_VERTEX_INDEX, 0
; Line 38
	mov	WORD PTR _SL_TRIANGLE_INDEX, 0
; Line 39
$L415:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 49
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, OFFSET FLAT:_SL_CAMERA_POS
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 50
$L417:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 62
	mov	eax, DWORD PTR _vec$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	add	esp, 8
; Line 63
	lea	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 66
	movsx	ebx, WORD PTR _SL_CENTER_X
	mov	eax, DWORD PTR _v$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _SL_FOV_X
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	ebx, eax
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _SL_VERTS[eax*4], ebx
; Line 67
	movsx	ebx, WORD PTR _SL_CENTER_Y
	mov	eax, DWORD PTR _v$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _SL_FOV_Y
	push	eax
	mov	eax, DWORD PTR _v$[ebp+4]
	push	eax
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	ebx, eax
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _SL_VERTS[eax*4+4], ebx
; Line 68
	mov	eax, DWORD PTR _v$[ebp+8]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _SL_VERTS[ecx*4+8], eax
; Line 70
	mov	eax, DWORD PTR _vec$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	ecx, DWORD PTR _SL_ORIG_VERTS[ecx*4]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 75
	inc	WORD PTR _SL_VERTEX_INDEX
; Line 76
$L419:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 82
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _v$[ebp], eax
; Line 83
	mov	eax, DWORD PTR _y$[ebp]
	mov	DWORD PTR _v$[ebp+4], eax
; Line 84
	mov	eax, DWORD PTR _z$[ebp]
	mov	DWORD PTR _v$[ebp+8], eax
; Line 86
	lea	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_put_vertex
	add	esp, 4
; Line 87
$L424:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 100
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L435
$L436:
	inc	DWORD PTR _i$[ebp]
$L435:
	mov	eax, DWORD PTR _num_tris$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L437
; Line 101
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _vert_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	add	edx, eax
	mov	WORD PTR _v0index$[ebp], dx
; Line 102
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*4+2]
	mov	eax, DWORD PTR _vert_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	add	edx, eax
	mov	WORD PTR _v1index$[ebp], dx
; Line 103
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR _vert_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	add	edx, eax
	mov	WORD PTR _v2index$[ebp], dx
; Line 105
	xor	eax, eax
	mov	al, BYTE PTR _color_override$[ebp]
	test	eax, eax
	je	$L497
	mov	al, BYTE PTR _color_override$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	BYTE PTR _SL_TRIANGLES[ecx*4+6], al
	jmp	$L498
$L497:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	mov	al, BYTE PTR [ecx+eax*4+6]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	BYTE PTR _SL_TRIANGLES[ecx*4+6], al
$L498:
; Line 106
	mov	ax, WORD PTR _v0index$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	WORD PTR _SL_TRIANGLES[ecx*4], ax
; Line 107
	mov	ax, WORD PTR _v1index$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	WORD PTR _SL_TRIANGLES[ecx*4+2], ax
; Line 108
	mov	ax, WORD PTR _v2index$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	WORD PTR _SL_TRIANGLES[ecx*4+4], ax
; Line 109
	mov	eax, DWORD PTR _v0index$[ebp]
	and	eax, 65535				; 0000ffffH
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+8]
	mov	ecx, DWORD PTR _v1index$[ebp]
	and	ecx, 65535				; 0000ffffH
	lea	ecx, DWORD PTR [ecx+ecx*2]
	add	eax, DWORD PTR _SL_VERTS[ecx*4+8]
	mov	ecx, DWORD PTR _v2index$[ebp]
	and	ecx, 65535				; 0000ffffH
	lea	ecx, DWORD PTR [ecx+ecx*2]
	add	eax, DWORD PTR _SL_VERTS[ecx*4+8]
	mov	ecx, 3
	cdq
	idiv	ecx
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _SL_TRIANGLES[ecx*4+8], eax
; Line 111
	inc	WORD PTR _SL_TRIANGLE_INDEX
; Line 112
	jmp	$L436
$L437:
; Line 113
$L430:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	esi
	push	edi
; Line 116
	mov	eax, DWORD PTR _tri2$[ebp]
	mov	ecx, DWORD PTR _tri1$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	xor	edx, edx
	cmp	DWORD PTR [eax+8], ecx
	setg	dl
	mov	eax, DWORD PTR _tri2$[ebp]
	mov	ecx, DWORD PTR _tri1$[ebp]
	mov	ecx, DWORD PTR [ecx+8]
	xor	ebx, ebx
	cmp	DWORD PTR [eax+8], ecx
	setl	bl
	sub	edx, ebx
	mov	eax, edx
	jmp	$L441
; Line 117
$L441:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
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
$L442:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 141
	lea	eax, DWORD PTR _pt$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	add	esp, 8
; Line 143
	lea	eax, DWORD PTR _v$[ebp]
	push	eax
	lea	eax, DWORD PTR _pt$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 145
	cmp	DWORD PTR _v$[ebp+8], 0
	jle	$L447
; Line 146
	movsx	ebx, WORD PTR _SL_CENTER_X
	mov	eax, DWORD PTR _v$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _SL_FOV_X
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	ebx, eax
	mov	DWORD PTR _v$[ebp], ebx
; Line 147
	movsx	ebx, WORD PTR _SL_CENTER_Y
	mov	eax, DWORD PTR _v$[ebp+8]
	push	eax
	mov	eax, DWORD PTR _SL_FOV_Y
	push	eax
	mov	eax, DWORD PTR _v$[ebp+4]
	push	eax
	call	_muldiv
	add	esp, 12					; 0000000cH
	sar	eax, 16					; 00000010H
	sub	ebx, eax
	mov	DWORD PTR _v$[ebp+4], ebx
; Line 148
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 151
$L447:
$L445:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 161
	mov	eax, DWORD PTR _fov$[ebp]
	mov	DWORD PTR _SL_FOV_X, eax
; Line 162
$L449:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 172
	mov	eax, DWORD PTR _fov$[ebp]
	mov	DWORD PTR _SL_FOV_Y, eax
; Line 173
$L451:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 194
	mov	eax, DWORD PTR _x2$[ebp]
	lea	ecx, DWORD PTR _v1$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 195
	mov	eax, DWORD PTR _x3$[ebp]
	lea	ecx, DWORD PTR _v2$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 196
	lea	eax, DWORD PTR _v1$[ebp]
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 197
	lea	eax, DWORD PTR _v2$[ebp]
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 198
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	lea	eax, DWORD PTR _v2$[ebp]
	push	eax
	lea	eax, DWORD PTR _v1$[ebp]
	push	eax
	call	_vec3_cross
	add	esp, 12					; 0000000cH
; Line 199
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 200
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 201
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 202
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 203
	mov	eax, DWORD PTR _x1$[ebp]
	lea	ecx, DWORD PTR _look$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 204
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_vec3_add
	add	esp, 8
; Line 205
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	call	_vec3_add
	add	esp, 8
; Line 206
	mov	ecx, 3
	mov	eax, DWORD PTR _look$[ebp]
	cdq
	idiv	ecx
	mov	DWORD PTR _look$[ebp], eax
; Line 207
	mov	ecx, 3
	mov	eax, DWORD PTR _look$[ebp+4]
	cdq
	idiv	ecx
	mov	DWORD PTR _look$[ebp+4], eax
; Line 208
	mov	ecx, 3
	mov	eax, DWORD PTR _look$[ebp+8]
	cdq
	idiv	ecx
	mov	DWORD PTR _look$[ebp+8], eax
; Line 209
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	mov	eax, DWORD PTR _light$[ebp]
	push	eax
	call	_vec3_subtract
	add	esp, 8
; Line 210
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 211
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 212
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 213
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	call	_vec3_normalize
	add	esp, 4
; Line 214
	lea	eax, DWORD PTR _norm$[ebp]
	push	eax
	lea	eax, DWORD PTR _look$[ebp]
	push	eax
	call	_vec3_dot
	add	esp, 8
	push	eax
	call	_int_abs
	add	esp, 4
	jmp	$L456
; Line 215
$L456:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	push	ebx
	push	esi
	push	edi
; Line 217
	mov	eax, DWORD PTR _tri$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax]
	lea	eax, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR _SL_VERTS[eax*4]
	lea	ecx, DWORD PTR _v0$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 218
	mov	eax, DWORD PTR _tri$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+2]
	lea	eax, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR _SL_VERTS[eax*4]
	lea	ecx, DWORD PTR _v1$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 219
	mov	eax, DWORD PTR _tri$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR _SL_VERTS[eax*4]
	lea	ecx, DWORD PTR _v2$[ebp]
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 221
	cmp	DWORD PTR _v0$[ebp+8], 2048		; 00000800H
	jle	$L468
	cmp	DWORD PTR _v1$[ebp+8], 2048		; 00000800H
	jle	$L468
	cmp	DWORD PTR _v2$[ebp+8], 2048		; 00000800H
	jg	$L467
$L468:
; Line 222
	xor	al, al
	jmp	$L463
; Line 225
$L467:
	cmp	DWORD PTR _v0$[ebp], 320		; 00000140H
	jl	$L471
	cmp	DWORD PTR _v1$[ebp], 320		; 00000140H
	jl	$L471
	cmp	DWORD PTR _v2$[ebp], 320		; 00000140H
	jge	$L470
$L471:
	cmp	DWORD PTR _v0$[ebp], 0
	jge	$L472
	cmp	DWORD PTR _v1$[ebp], 0
	jge	$L472
	cmp	DWORD PTR _v2$[ebp], 0
	jl	$L470
$L472:
	cmp	DWORD PTR _v0$[ebp+4], 200		; 000000c8H
	jl	$L473
	cmp	DWORD PTR _v1$[ebp+4], 200		; 000000c8H
	jl	$L473
	cmp	DWORD PTR _v2$[ebp+4], 200		; 000000c8H
	jge	$L470
$L473:
	cmp	DWORD PTR _v0$[ebp+4], 0
	jge	$L469
	cmp	DWORD PTR _v1$[ebp+4], 0
	jge	$L469
	cmp	DWORD PTR _v2$[ebp+4], 0
	jge	$L469
$L470:
; Line 226
	xor	al, al
	jmp	$L463
; Line 229
$L469:
	mov	al, 1
	jmp	$L463
; Line 230
$L463:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
_r$ = -8
_g$ = -20
_b$ = -4
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
	push	ebx
	push	esi
	push	edi
; Line 245
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L488
$L489:
	inc	DWORD PTR _i$[ebp]
$L488:
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L490
; Line 246
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _SL_TRIANGLES[eax*4]
	push	eax
	call	_clip_polygon
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L491
; Line 247
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	al, BYTE PTR _SL_TRIANGLES[eax*4+6]
	mov	BYTE PTR _c$[ebp], al
; Line 249
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4]
	mov	DWORD PTR _x1$[ebp], eax
; Line 250
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+4]
	mov	DWORD PTR _y1$[ebp], eax
; Line 251
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+2]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4]
	mov	DWORD PTR _x2$[ebp], eax
; Line 252
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+2]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+4]
	mov	DWORD PTR _y2$[ebp], eax
; Line 253
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4]
	mov	DWORD PTR _x3$[ebp], eax
; Line 254
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+4]
	mov	DWORD PTR _y3$[ebp], eax
; Line 256
	xor	eax, eax
	mov	al, BYTE PTR _shading$[ebp]
	test	eax, eax
	je	$L492
; Line 257
	push	OFFSET FLAT:_SL_CAMERA_POS
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR _SL_ORIG_VERTS[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+2]
	lea	eax, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR _SL_ORIG_VERTS[eax*4]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR _SL_ORIG_VERTS[eax*4]
	push	eax
	call	_find_illumination
	add	esp, 16					; 00000010H
	lea	eax, DWORD PTR [eax+eax*2+65536]
	cdq
	and	edx, 3
	add	eax, edx
	sar	eax, 2
	mov	DWORD PTR _illum$[ebp], eax
; Line 268
	mov	eax, DWORD PTR _r$[ebp]
	shl	eax, 2
	lea	eax, DWORD PTR [eax+eax*8]
	mov	ecx, DWORD PTR _g$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR [eax+ecx*2]
	add	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	eax, DWORD PTR _y3$[ebp]
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_fill_tri
	add	esp, 28					; 0000001cH
; Line 269
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	mov	ecx, DWORD PTR _illum$[ebp]
	sar	ecx, 12					; 0000000cH
	or	eax, ecx
	push	eax
	mov	eax, DWORD PTR _y3$[ebp]
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_fill_tri
	add	esp, 28					; 0000001cH
; Line 271
	jmp	$L493
$L492:
; Line 274
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	or	eax, 15					; 0000000fH
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 275
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	or	eax, 15					; 0000000fH
	push	eax
	mov	eax, DWORD PTR _y3$[ebp]
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 276
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	or	eax, 15					; 0000000fH
	push	eax
	mov	eax, DWORD PTR _y3$[ebp]
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 277
$L493:
; Line 279
$L491:
	jmp	$L489
$L490:
; Line 280
$L475:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_render_end ENDP
_TEXT	ENDS
END
