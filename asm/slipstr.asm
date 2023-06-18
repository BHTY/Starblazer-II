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
COMM	_SL_TRIANGLES:BYTE:02ee0H
COMM	_SL_VERTS:BYTE:07530H
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
; Line 35
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 36
	mov	WORD PTR _SL_VERTEX_INDEX, 0
; Line 37
	mov	WORD PTR _SL_TRIANGLE_INDEX, 0
; Line 38
$L397:
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
; Line 47
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 48
	mov	eax, DWORD PTR _v$[ebp]
	mov	ecx, OFFSET FLAT:_SL_CAMERA_POS
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], eax
; Line 49
$L399:
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
; Line 58
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 61
	mov	eax, DWORD PTR _vec$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	add	esp, 8
; Line 62
	lea	eax, DWORD PTR _v$[ebp]
	push	eax
	mov	eax, DWORD PTR _vec$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 65
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
; Line 66
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
; Line 67
	mov	eax, DWORD PTR _v$[ebp+8]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _SL_VERTS[ecx*4+8], eax
; Line 72
	inc	WORD PTR _SL_VERTEX_INDEX
; Line 73
$L401:
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
; Line 76
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 79
	mov	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _v$[ebp], eax
; Line 80
	mov	eax, DWORD PTR _y$[ebp]
	mov	DWORD PTR _v$[ebp+4], eax
; Line 81
	mov	eax, DWORD PTR _z$[ebp]
	mov	DWORD PTR _v$[ebp+8], eax
; Line 83
	lea	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_put_vertex
	add	esp, 4
; Line 84
$L406:
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
; Line 93
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 97
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L417
$L418:
	inc	DWORD PTR _i$[ebp]
$L417:
	mov	eax, DWORD PTR _num_tris$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L419
; Line 98
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*4]
	mov	eax, DWORD PTR _vert_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	add	edx, eax
	mov	WORD PTR _v0index$[ebp], dx
; Line 99
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*4+2]
	mov	eax, DWORD PTR _vert_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	add	edx, eax
	mov	WORD PTR _v1index$[ebp], dx
; Line 100
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*4+4]
	mov	eax, DWORD PTR _vert_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	add	edx, eax
	mov	WORD PTR _v2index$[ebp], dx
; Line 102
	xor	eax, eax
	mov	al, BYTE PTR _color_override$[ebp]
	test	eax, eax
	je	$L466
	mov	al, BYTE PTR _color_override$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	BYTE PTR _SL_TRIANGLES[ecx*4+6], al
	jmp	$L467
$L466:
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	ecx, DWORD PTR _tris$[ebp]
	mov	al, BYTE PTR [ecx+eax*4+6]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	BYTE PTR _SL_TRIANGLES[ecx*4+6], al
$L467:
; Line 103
	mov	ax, WORD PTR _v0index$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	WORD PTR _SL_TRIANGLES[ecx*4], ax
; Line 104
	mov	ax, WORD PTR _v1index$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	WORD PTR _SL_TRIANGLES[ecx*4+2], ax
; Line 105
	mov	ax, WORD PTR _v2index$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	WORD PTR _SL_TRIANGLES[ecx*4+4], ax
; Line 106
	mov	eax, DWORD PTR _v1index$[ebp]
	and	eax, 65535				; 0000ffffH
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+8]
	mov	ecx, DWORD PTR _v0index$[ebp]
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
; Line 108
	inc	WORD PTR _SL_TRIANGLE_INDEX
; Line 109
	jmp	$L418
$L419:
; Line 110
$L412:
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
; Line 112
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 113
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
	jmp	$L423
; Line 114
$L423:
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
; Line 123
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 124
	push	OFFSET FLAT:_compare_tris
	push	12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	eax
	push	OFFSET FLAT:_SL_TRIANGLES
	call	_qsort
	add	esp, 16					; 00000010H
; Line 125
$L424:
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
; Line 134
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 138
	lea	eax, DWORD PTR _pt$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	add	esp, 8
; Line 140
	lea	eax, DWORD PTR _v$[ebp]
	push	eax
	lea	eax, DWORD PTR _pt$[ebp]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 142
	cmp	DWORD PTR _v$[ebp+8], 0
	jle	$L429
; Line 143
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
; Line 144
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
; Line 145
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _v$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _v$[ebp]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 148
$L429:
$L427:
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
; Line 157
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 158
	mov	eax, DWORD PTR _fov$[ebp]
	mov	DWORD PTR _SL_FOV_X, eax
; Line 159
$L431:
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
; Line 168
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 169
	mov	eax, DWORD PTR _fov$[ebp]
	mov	DWORD PTR _SL_FOV_Y, eax
; Line 170
$L433:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_fov_y ENDP
_TEXT	ENDS
PUBLIC	_clip_polygon
_TEXT	SEGMENT
_tri$ = 8
_v0$ = -36
_v1$ = -12
_v2$ = -24
_clip_polygon PROC NEAR
; Line 182
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
	push	ebx
	push	esi
	push	edi
; Line 183
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
; Line 184
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
; Line 185
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
; Line 187
	cmp	DWORD PTR _v0$[ebp+8], 2048		; 00000800H
	jle	$L441
	cmp	DWORD PTR _v1$[ebp+8], 2048		; 00000800H
	jle	$L441
	cmp	DWORD PTR _v2$[ebp+8], 2048		; 00000800H
	jg	$L440
$L441:
; Line 188
	xor	al, al
	jmp	$L436
; Line 191
$L440:
	cmp	DWORD PTR _v0$[ebp], 320		; 00000140H
	jl	$L444
	cmp	DWORD PTR _v1$[ebp], 320		; 00000140H
	jl	$L444
	cmp	DWORD PTR _v2$[ebp], 320		; 00000140H
	jge	$L443
$L444:
	cmp	DWORD PTR _v0$[ebp], 0
	jge	$L445
	cmp	DWORD PTR _v1$[ebp], 0
	jge	$L445
	cmp	DWORD PTR _v2$[ebp], 0
	jl	$L443
$L445:
	cmp	DWORD PTR _v0$[ebp+4], 200		; 000000c8H
	jl	$L446
	cmp	DWORD PTR _v1$[ebp+4], 200		; 000000c8H
	jl	$L446
	cmp	DWORD PTR _v2$[ebp+4], 200		; 000000c8H
	jge	$L443
$L446:
	cmp	DWORD PTR _v0$[ebp+4], 0
	jge	$L442
	cmp	DWORD PTR _v1$[ebp+4], 0
	jge	$L442
	cmp	DWORD PTR _v2$[ebp+4], 0
	jge	$L442
$L443:
; Line 192
	xor	al, al
	jmp	$L436
; Line 195
$L442:
	mov	al, 1
	jmp	$L436
; Line 196
$L436:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_clip_polygon ENDP
_TEXT	ENDS
PUBLIC	_render_end
EXTRN	_drawline:NEAR
_TEXT	SEGMENT
_shading$ = 8
_i$ = -16
_c$ = -4
_x1$ = -8
_y1$ = -24
_x2$ = -12
_y2$ = -28
_x3$ = -20
_y3$ = -32
_render_end PROC NEAR
; Line 205
	push	ebp
	mov	ebp, esp
	sub	esp, 32					; 00000020H
	push	ebx
	push	esi
	push	edi
; Line 210
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L457
$L458:
	inc	DWORD PTR _i$[ebp]
$L457:
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L459
; Line 211
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _SL_TRIANGLES[eax*4]
	push	eax
	call	_clip_polygon
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	je	$L460
; Line 212
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	al, BYTE PTR _SL_TRIANGLES[eax*4+6]
	mov	BYTE PTR _c$[ebp], al
; Line 214
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4]
	mov	WORD PTR _x1$[ebp], ax
; Line 215
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+4]
	mov	WORD PTR _y1$[ebp], ax
; Line 216
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+2]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4]
	mov	WORD PTR _x2$[ebp], ax
; Line 217
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+2]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+4]
	mov	WORD PTR _y2$[ebp], ax
; Line 218
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4]
	mov	WORD PTR _x3$[ebp], ax
; Line 219
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLES[eax*4+4]
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+4]
	mov	WORD PTR _y3$[ebp], ax
; Line 221
	xor	eax, eax
	mov	al, BYTE PTR _shading$[ebp]
	test	eax, eax
	je	$L461
; Line 224
	jmp	$L462
$L461:
; Line 227
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 228
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _y3$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 229
	xor	eax, eax
	mov	al, BYTE PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _y3$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x3$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 230
$L462:
; Line 232
$L460:
	jmp	$L458
$L459:
; Line 233
$L448:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_render_end ENDP
_TEXT	ENDS
END
