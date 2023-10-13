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
;	COMDAT _render_begin
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _camera_translate
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _put_vertex
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _put_vert3f
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _put_triangles
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _compare_tris
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _polygon_zsort
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _plotpoint_3d
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _set_fov_x
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _set_fov_y
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _find_illumination
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _clip_polygon
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _render_end
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
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
	ORG $+2
_SL_CENTER_Y DW	064H
	ORG $+2
_SL_FOV_X DD	0640000H
_SL_FOV_Y DD	0640000H
_DATA	ENDS
PUBLIC	_render_begin
;	COMDAT _render_begin
_TEXT	SEGMENT
; File src\slipstr.c
_render_begin PROC NEAR					; COMDAT
; Line 37
	xor	eax, eax
	mov	WORD PTR _SL_VERTEX_INDEX, ax
; Line 38
	mov	WORD PTR _SL_TRIANGLE_INDEX, ax
; Line 39
	ret	0
_render_begin ENDP
_TEXT	ENDS
PUBLIC	_camera_translate
;	COMDAT _camera_translate
_TEXT	SEGMENT
_v$ = 8
_camera_translate PROC NEAR				; COMDAT
; Line 49
	mov	ecx, DWORD PTR _v$[esp-4]
	mov	edx, OFFSET FLAT:_SL_CAMERA_POS
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	ecx, DWORD PTR [ecx+8]
	mov	DWORD PTR [edx+8], ecx
; Line 50
	ret	0
_camera_translate ENDP
_TEXT	ENDS
PUBLIC	_put_vertex
EXTRN	_muldiv:NEAR
EXTRN	_vec3_subtract:NEAR
EXTRN	_mat3_mul:NEAR
;	COMDAT _put_vertex
_TEXT	SEGMENT
_vec$ = 8
_v$ = -12
_put_vertex PROC NEAR					; COMDAT
; Line 59
	sub	esp, 12					; 0000000cH
	push	esi
	push	edi
; Line 62
	mov	esi, DWORD PTR _vec$[esp+16]
	push	esi
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	lea	eax, DWORD PTR _v$[esp+28]
	add	esp, 8
; Line 63
	push	eax
	push	esi
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	mov	eax, DWORD PTR _v$[esp+40]
	mov	edx, DWORD PTR _v$[esp+32]
	add	esp, 12					; 0000000cH
	mov	ecx, DWORD PTR _SL_FOV_X
; Line 66
	movsx	edi, WORD PTR _SL_CENTER_X
	push	eax
	push	ecx
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	add	esp, 12					; 0000000cH
	sub	edi, eax
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	lea	ecx, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _v$[esp+28]
	mov	edx, DWORD PTR _v$[esp+24]
	push	eax
	mov	DWORD PTR _SL_VERTS[ecx*4], edi
; Line 67
	mov	ecx, DWORD PTR _SL_FOV_Y
	movsx	edi, WORD PTR _SL_CENTER_Y
	push	ecx
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	add	esp, 12					; 0000000cH
	sub	edi, eax
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	mov	edx, DWORD PTR _v$[esp+28]
	lea	ecx, DWORD PTR [eax+eax*2]
	xor	eax, eax
	mov	ax, WORD PTR _SL_VERTEX_INDEX
	mov	DWORD PTR _SL_VERTS[ecx*4+4], edi
	lea	ecx, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _SL_VERTS[ecx*4+8], edx
	lea	eax, DWORD PTR [ecx*4]
; Line 70
	lea	ecx, DWORD PTR _SL_ORIG_VERTS[ecx*4]
	mov	eax, DWORD PTR [esi]
	pop	edi
	mov	DWORD PTR [ecx], eax
	mov	edx, DWORD PTR [esi+4]
	mov	DWORD PTR [ecx+4], edx
	mov	esi, DWORD PTR [esi+8]
	inc	WORD PTR _SL_VERTEX_INDEX
	mov	DWORD PTR [ecx+8], esi
; Line 76
	pop	esi
	add	esp, 12					; 0000000cH
	ret	0
_put_vertex ENDP
_TEXT	ENDS
PUBLIC	_put_vert3f
;	COMDAT _put_vert3f
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_z$ = 16
_v$ = -12
_put_vert3f PROC NEAR					; COMDAT
; Line 79
	mov	eax, DWORD PTR _x$[esp-4]
	mov	ecx, DWORD PTR _y$[esp-4]
	mov	edx, DWORD PTR _z$[esp-4]
	sub	esp, 12					; 0000000cH
; Line 82
	mov	DWORD PTR _v$[esp+12], eax
	mov	DWORD PTR _v$[esp+16], ecx
; Line 84
	lea	eax, DWORD PTR _v$[esp+12]
	mov	DWORD PTR _v$[esp+20], edx
; Line 86
	push	eax
	call	_put_vertex
; Line 87
	add	esp, 16					; 00000010H
	ret	0
_put_vert3f ENDP
_TEXT	ENDS
PUBLIC	_put_triangles
;	COMDAT _put_triangles
_TEXT	SEGMENT
_tris$ = 8
_num_tris$ = 12
_vert_offset$ = 16
_color_override$ = 20
_put_triangles PROC NEAR				; COMDAT
; Line 96
	mov	ax, WORD PTR _num_tris$[esp-4]
	sub	esp, 4
	test	ax, ax
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 100
	je	$L481
	mov	esi, DWORD PTR _tris$[esp+16]
	mov	bl, BYTE PTR _color_override$[esp+16]
	movzx	eax, ax
	mov	DWORD PTR -4+[esp+20], eax
$L486:
; Line 101
	mov	cx, WORD PTR [esi]
; Line 102
	mov	dx, WORD PTR [esi+2]
	add	cx, WORD PTR _vert_offset$[esp+16]
; Line 103
	mov	bp, WORD PTR [esi+4]
	add	dx, WORD PTR _vert_offset$[esp+16]
	add	bp, WORD PTR _vert_offset$[esp+16]
; Line 105
	test	bl, bl
	je	SHORT $L568
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	lea	edi, DWORD PTR [eax+eax*2]
	mov	BYTE PTR _SL_TRIANGLES[edi*4+6], bl
	jmp	SHORT $L569
$L568:
	mov	al, BYTE PTR [esi+6]
	xor	edi, edi
	mov	di, WORD PTR _SL_TRIANGLE_INDEX
	lea	edi, DWORD PTR [edi+edi*2]
	mov	BYTE PTR _SL_TRIANGLES[edi*4+6], al
$L569:
	xor	eax, eax
	add	esi, 12					; 0000000cH
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	inc	WORD PTR _SL_TRIANGLE_INDEX
	lea	eax, DWORD PTR [eax+eax*2]
	mov	WORD PTR _SL_TRIANGLES[eax*4], cx
	lea	edi, DWORD PTR [eax*4]
; Line 107
	mov	WORD PTR _SL_TRIANGLES[edi+2], dx
	movzx	ecx, cx
; Line 108
	mov	WORD PTR _SL_TRIANGLES[edi+4], bp
	movzx	edx, dx
; Line 109
	movzx	ebp, bp
	lea	eax, DWORD PTR [ebp+ebp*2]
	lea	ebp, DWORD PTR [edx+edx*2]
	lea	edx, DWORD PTR [ecx+ecx*2]
	mov	eax, DWORD PTR _SL_VERTS[eax*4+8]
	add	eax, DWORD PTR _SL_VERTS[ebp*4+8]
	mov	ecx, 3
	add	eax, DWORD PTR _SL_VERTS[edx*4+8]
	cdq
	idiv	ecx
	mov	DWORD PTR _SL_TRIANGLES[edi+8], eax
	dec	DWORD PTR -4+[esp+20]
; Line 111
	jne	$L486
; Line 113
$L481:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 4
	ret	0
_put_triangles ENDP
_TEXT	ENDS
PUBLIC	_compare_tris
;	COMDAT _compare_tris
_TEXT	SEGMENT
_tri1$ = 8
_tri2$ = 12
_compare_tris PROC NEAR					; COMDAT
; Line 115
	mov	eax, DWORD PTR _tri2$[esp-4]
	mov	edx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR _tri1$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
; Line 116
	mov	eax, 1
	cmp	edx, ecx
	jg	SHORT $L574
	xor	eax, eax
$L574:
	cmp	edx, ecx
	mov	ecx, 1
	jl	SHORT $L575
	xor	ecx, ecx
$L575:
	sub	eax, ecx
; Line 117
	ret	0
_compare_tris ENDP
_TEXT	ENDS
PUBLIC	_polygon_zsort
EXTRN	_qsort:NEAR
;	COMDAT _polygon_zsort
_TEXT	SEGMENT
_polygon_zsort PROC NEAR				; COMDAT
; Line 127
	push	OFFSET FLAT:_compare_tris
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	12					; 0000000cH
	push	eax
	push	OFFSET FLAT:_SL_TRIANGLES
	call	_qsort
	add	esp, 16					; 00000010H
; Line 128
	ret	0
_polygon_zsort ENDP
_TEXT	ENDS
PUBLIC	_plotpoint_3d
EXTRN	_plot_pixel:NEAR
;	COMDAT _plotpoint_3d
_TEXT	SEGMENT
_pt$ = 8
_color$ = 20
_v$ = -12
_plotpoint_3d PROC NEAR					; COMDAT
; Line 137
	lea	eax, DWORD PTR _pt$[esp-4]
	sub	esp, 12					; 0000000cH
	push	esi
; Line 141
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	lea	eax, DWORD PTR _v$[esp+24]
	lea	ecx, DWORD PTR _pt$[esp+20]
	add	esp, 8
; Line 143
	push	eax
	push	ecx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 145
	cmp	DWORD PTR _v$[esp+24], 0
	jle	SHORT $L496
; Line 146
	mov	eax, DWORD PTR _v$[esp+24]
	mov	ecx, DWORD PTR _SL_FOV_X
	mov	edx, DWORD PTR _v$[esp+16]
	push	eax
	movsx	esi, WORD PTR _SL_CENTER_X
	push	ecx
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	add	esp, 12					; 0000000cH
	sub	esi, eax
	mov	ecx, DWORD PTR _SL_FOV_Y
	mov	eax, DWORD PTR _v$[esp+24]
	mov	edx, DWORD PTR _v$[esp+20]
	mov	DWORD PTR _v$[esp+16], esi
	push	eax
; Line 147
	movsx	esi, WORD PTR _SL_CENTER_Y
	push	ecx
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	mov	cl, BYTE PTR _color$[esp+24]
	add	esp, 12					; 0000000cH
	sub	esi, eax
	mov	eax, DWORD PTR _v$[esp+16]
	push	ecx
	mov	DWORD PTR _v$[esp+24], esi
	push	esi
; Line 148
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 151
$L496:
	pop	esi
	add	esp, 12					; 0000000cH
	ret	0
_plotpoint_3d ENDP
_TEXT	ENDS
PUBLIC	_set_fov_x
;	COMDAT _set_fov_x
_TEXT	SEGMENT
_fov$ = 8
_set_fov_x PROC NEAR					; COMDAT
; Line 161
	mov	eax, DWORD PTR _fov$[esp-4]
	mov	DWORD PTR _SL_FOV_X, eax
; Line 162
	ret	0
_set_fov_x ENDP
_TEXT	ENDS
PUBLIC	_set_fov_y
;	COMDAT _set_fov_y
_TEXT	SEGMENT
_fov$ = 8
_set_fov_y PROC NEAR					; COMDAT
; Line 172
	mov	eax, DWORD PTR _fov$[esp-4]
	mov	DWORD PTR _SL_FOV_Y, eax
; Line 173
	ret	0
_set_fov_y ENDP
_TEXT	ENDS
PUBLIC	_find_illumination
EXTRN	_int_abs:NEAR
EXTRN	_vec3_add:NEAR
EXTRN	_vec3_cross:NEAR
EXTRN	_vec3_normalize:NEAR
EXTRN	_vec3_dot:NEAR
;	COMDAT _find_illumination
_TEXT	SEGMENT
_x1$ = 8
_x2$ = 12
_x3$ = 16
_light$ = 20
_look$ = -48
_norm$ = -36
_v1$ = -12
_v2$ = -24
_find_illumination PROC NEAR				; COMDAT
; Line 191
	sub	esp, 48					; 00000030H
	lea	ecx, DWORD PTR _v1$[esp+48]
	push	ebx
	push	esi
	push	edi
; Line 194
	mov	esi, DWORD PTR _x2$[esp+56]
	mov	edi, DWORD PTR _x3$[esp+56]
	mov	eax, DWORD PTR [esi]
	mov	edx, DWORD PTR [esi+4]
	mov	ebx, DWORD PTR [esi+8]
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR [edi]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [edi+4]
	mov	DWORD PTR [ecx+8], ebx
; Line 195
	lea	ecx, DWORD PTR _v2$[esp+60]
	mov	ebx, DWORD PTR [edi+8]
	mov	DWORD PTR [ecx], eax
	lea	eax, DWORD PTR _v1$[esp+60]
	push	eax
	mov	DWORD PTR [ecx+4], edx
	mov	DWORD PTR [ecx+8], ebx
; Line 196
	mov	ebx, DWORD PTR _x1$[esp+60]
	push	ebx
	call	_vec3_subtract
	lea	ecx, DWORD PTR _v2$[esp+68]
	add	esp, 8
; Line 197
	push	ecx
	push	ebx
	call	_vec3_subtract
	lea	eax, DWORD PTR _norm$[esp+68]
	lea	ecx, DWORD PTR _v2$[esp+68]
	lea	edx, DWORD PTR _v1$[esp+68]
	add	esp, 8
; Line 198
	push	eax
	push	ecx
	push	edx
	call	_vec3_cross
	lea	ecx, DWORD PTR _norm$[esp+72]
	add	esp, 12					; 0000000cH
; Line 199
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	add	esp, 4
; Line 200
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	add	esp, 4
; Line 201
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	add	esp, 4
; Line 202
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 203
	mov	eax, DWORD PTR [ebx]
	mov	edx, DWORD PTR [ebx+4]
	mov	DWORD PTR [ecx], eax
	mov	DWORD PTR [ecx+4], edx
	mov	ebx, DWORD PTR [ebx+8]
	push	ecx
	mov	DWORD PTR [ecx+8], ebx
; Line 204
	push	esi
	call	_vec3_add
	lea	eax, DWORD PTR _look$[esp+68]
	add	esp, 8
; Line 205
	push	eax
	push	edi
	call	_vec3_add
	mov	eax, DWORD PTR _look$[esp+68]
	add	esp, 8
; Line 206
	cdq
	mov	ecx, 3
	idiv	ecx
	mov	DWORD PTR _look$[esp+60], eax
; Line 207
	mov	eax, DWORD PTR _look$[esp+64]
	cdq
	idiv	ecx
	mov	DWORD PTR _look$[esp+64], eax
; Line 208
	mov	eax, DWORD PTR _look$[esp+68]
	cdq
	idiv	ecx
	mov	ecx, DWORD PTR _light$[esp+56]
	mov	DWORD PTR _look$[esp+68], eax
; Line 209
	lea	eax, DWORD PTR _look$[esp+60]
	push	eax
	push	ecx
	call	_vec3_subtract
	lea	ecx, DWORD PTR _look$[esp+68]
	add	esp, 8
; Line 210
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 211
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 212
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 213
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	lea	edx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 214
	push	ecx
	push	edx
	call	_vec3_dot
	add	esp, 8
	push	eax
	call	_int_abs
	add	esp, 4
; Line 215
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 48					; 00000030H
	ret	0
_find_illumination ENDP
_TEXT	ENDS
PUBLIC	_clip_polygon
;	COMDAT _clip_polygon
_TEXT	SEGMENT
_tri$ = 8
_v0$ = -36
_v1$ = -24
_v2$ = -12
_clip_polygon PROC NEAR					; COMDAT
; Line 216
	mov	ecx, DWORD PTR _tri$[esp-4]
	sub	esp, 36					; 00000024H
	xor	edx, edx
	push	ebx
	mov	dx, WORD PTR [ecx]
	push	esi
	lea	esi, DWORD PTR _v0$[esp+44]
	push	edi
; Line 217
	lea	eax, DWORD PTR [edx+edx*2]
	mov	ebx, DWORD PTR _SL_VERTS[eax*4+4]
	lea	edx, DWORD PTR _SL_VERTS[eax*4]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR [esi], eax
	mov	DWORD PTR [esi+4], ebx
	mov	DWORD PTR [esi+8], edx
; Line 218
	xor	edx, edx
	mov	dx, WORD PTR [ecx+2]
	lea	esi, DWORD PTR _v1$[esp+48]
	lea	eax, DWORD PTR [edx+edx*2]
	mov	ebx, DWORD PTR _SL_VERTS[eax*4+4]
	lea	edx, DWORD PTR _SL_VERTS[eax*4]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR [esi], eax
	mov	DWORD PTR [esi+4], ebx
	mov	DWORD PTR [esi+8], edx
; Line 219
	xor	edx, edx
	mov	dx, WORD PTR [ecx+4]
	lea	ecx, DWORD PTR _v2$[esp+48]
	lea	eax, DWORD PTR [edx+edx*2]
	mov	ebx, DWORD PTR _SL_VERTS[eax*4+4]
	lea	edx, DWORD PTR _SL_VERTS[eax*4]
	cmp	DWORD PTR _v0$[esp+56], 2048		; 00000800H
	mov	eax, DWORD PTR [edx]
	mov	esi, DWORD PTR _v0$[esp+52]
	mov	edx, DWORD PTR [edx+8]
	mov	edi, DWORD PTR _v1$[esp+52]
	mov	DWORD PTR [ecx], eax
	mov	eax, DWORD PTR _v0$[esp+48]
	mov	DWORD PTR [ecx+4], ebx
	mov	DWORD PTR [ecx+8], edx
; Line 221
	mov	ecx, DWORD PTR _v1$[esp+48]
	mov	ebx, DWORD PTR _v2$[esp+52]
	mov	edx, DWORD PTR _v2$[esp+48]
	jle	SHORT $L519
	cmp	DWORD PTR _v1$[esp+56], 2048		; 00000800H
	jle	SHORT $L519
	cmp	DWORD PTR _v2$[esp+56], 2048		; 00000800H
	jle	SHORT $L519
; Line 225
	cmp	eax, 320				; 00000140H
	jl	SHORT $L522
	cmp	ecx, 320				; 00000140H
	jl	SHORT $L522
	cmp	edx, 320				; 00000140H
	jge	SHORT $L521
$L522:
	test	eax, eax
	jge	SHORT $L523
	test	ecx, ecx
	jge	SHORT $L523
	test	edx, edx
	jl	SHORT $L521
$L523:
	cmp	esi, 200				; 000000c8H
	jl	SHORT $L524
	cmp	edi, 200				; 000000c8H
	jl	SHORT $L524
	cmp	ebx, 200				; 000000c8H
	jge	SHORT $L521
$L524:
	test	esi, esi
	jge	SHORT $L520
	test	edi, edi
	jge	SHORT $L520
	test	ebx, ebx
	jge	SHORT $L520
$L521:
; Line 226
	xor	al, al
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 36					; 00000024H
	ret	0
; Line 229
$L520:
	mov	al, 1
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 36					; 00000024H
	ret	0
; Line 221
$L519:
; Line 222
	xor	al, al
	pop	edi
; Line 230
	pop	esi
	pop	ebx
	add	esp, 36					; 00000024H
	ret	0
_clip_polygon ENDP
_TEXT	ENDS
PUBLIC	_render_end
EXTRN	_draw_line:NEAR
EXTRN	_fill_tri:NEAR
;	COMDAT _render_end
_TEXT	SEGMENT
_shading$ = 8
_i$ = -4
_x1$ = -16
_y1$ = -20
_x2$ = -8
_y2$ = -12
_render_end PROC NEAR					; COMDAT
; Line 239
	sub	esp, 20					; 00000014H
	cmp	WORD PTR _SL_TRIANGLE_INDEX, 0
	mov	DWORD PTR _i$[esp+20], 0
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 245
	je	$L526
	mov	esi, OFFSET FLAT:_SL_TRIANGLES
$L539:
; Line 246
	push	esi
	call	_clip_polygon
	add	esp, 4
	test	al, al
	je	$L540
; Line 247
	mov	bl, BYTE PTR [esi+6]
	xor	eax, eax
	mov	ax, WORD PTR [esi]
	lea	edx, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _SL_VERTS[edx*4]
	lea	ecx, DWORD PTR [edx*4]
; Line 249
	mov	DWORD PTR _x1$[esp+36], eax
; Line 250
	mov	edx, DWORD PTR _SL_VERTS[ecx+4]
	xor	eax, eax
	mov	DWORD PTR _y1$[esp+36], edx
	mov	ax, WORD PTR [esi+2]
	lea	ebp, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _SL_VERTS[ebp*4]
	lea	edx, DWORD PTR [ebp*4]
; Line 251
	mov	DWORD PTR _x2$[esp+36], eax
; Line 252
	mov	ebp, DWORD PTR _SL_VERTS[edx+4]
	xor	eax, eax
	mov	DWORD PTR _y2$[esp+36], ebp
	mov	ax, WORD PTR [esi+4]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
; Line 253
	cmp	BYTE PTR _shading$[esp+32], 0
	mov	edi, DWORD PTR _SL_VERTS[eax]
	mov	ebp, DWORD PTR _SL_VERTS[eax+4]
; Line 256
	je	SHORT $L543
; Line 257
	push	OFFSET FLAT:_SL_CAMERA_POS
	add	eax, OFFSET FLAT:_SL_ORIG_VERTS
	push	eax
	add	edx, OFFSET FLAT:_SL_ORIG_VERTS
	push	edx
	add	ecx, OFFSET FLAT:_SL_ORIG_VERTS
	push	ecx
	call	_find_illumination
	mov	ecx, DWORD PTR _y2$[esp+52]
	mov	edx, DWORD PTR _x2$[esp+52]
	add	esp, 16					; 00000010H
	lea	eax, DWORD PTR [eax+eax*2]
	add	eax, 65536				; 00010000H
	sar	eax, 14					; 0000000eH
; Line 269
	or	al, bl
	push	eax
	push	ebp
	mov	eax, DWORD PTR _y1$[esp+44]
	push	edi
	push	ecx
	push	edx
	mov	ecx, DWORD PTR _x1$[esp+56]
	push	eax
	push	ecx
	call	_fill_tri
	add	esp, 28					; 0000001cH
; Line 271
	jmp	SHORT $L540
$L543:
	or	bl, 15					; 0000000fH
	mov	eax, DWORD PTR _y2$[esp+36]
; Line 274
	mov	ecx, DWORD PTR _x2$[esp+36]
	push	ebx
	mov	edx, DWORD PTR _y1$[esp+40]
	push	eax
	mov	eax, DWORD PTR _x1$[esp+44]
	push	ecx
	push	edx
	push	eax
	call	_draw_line
	mov	ecx, DWORD PTR _y1$[esp+56]
	mov	edx, DWORD PTR _x1$[esp+56]
	add	esp, 20					; 00000014H
; Line 275
	push	ebx
	push	ebp
	push	edi
	push	ecx
	push	edx
	call	_draw_line
	mov	ecx, DWORD PTR _y2$[esp+56]
	mov	edx, DWORD PTR _x2$[esp+56]
	add	esp, 20					; 00000014H
; Line 276
	push	ebx
	push	ebp
	push	edi
	push	ecx
	push	edx
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 245
$L540:
	add	esi, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	inc	DWORD PTR _i$[esp+36]
	cmp	eax, DWORD PTR _i$[esp+36]
	jg	$L539
; Line 280
$L526:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 20					; 00000014H
	ret	0
_render_end ENDP
_TEXT	ENDS
END
