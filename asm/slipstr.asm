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
COMM	_SL_TRIANGLES:BYTE:07530H
COMM	_SL_VERTS:BYTE:07530H
COMM	_SL_ORIG_VERTS:BYTE:07530H
COMM	_SL_VERTEX_INDEX:WORD
COMM	_SL_TRIANGLE_INDEX:WORD
COMM	_SL_CAMERA_POS:BYTE:0cH
COMM	_SL_CAMERA_ORIENTATION:BYTE:024H
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
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	ecx, DWORD PTR _v$[esp+28]
	mov	edx, DWORD PTR _v$[esp+24]
	push	ecx
	mov	DWORD PTR _SL_VERTS[eax*4], edi
; Line 67
	mov	eax, DWORD PTR _SL_FOV_Y
	movsx	edi, WORD PTR _SL_CENTER_Y
	push	eax
	push	edx
	call	_muldiv
	sar	eax, 16					; 00000010H
	add	esp, 12					; 0000000cH
	sub	edi, eax
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	xor	edx, edx
	mov	dx, WORD PTR _SL_VERTEX_INDEX
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	ecx, DWORD PTR _v$[esp+28]
	mov	DWORD PTR _SL_VERTS[eax*4+4], edi
	lea	eax, DWORD PTR [edx+edx*2]
	shl	eax, 2
; Line 68
	mov	DWORD PTR _SL_VERTS[eax+8], ecx
; Line 70
	lea	ecx, DWORD PTR _SL_ORIG_VERTS[eax]
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
PUBLIC	_clip_polygon
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
	je	$L550
	mov	di, WORD PTR _vert_offset$[esp+16]
	mov	esi, DWORD PTR _tris$[esp+16]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR -4+[esp+20], eax
$L555:
; Line 101
	mov	cx, WORD PTR [esi]
	add	cx, di
; Line 102
	mov	dx, WORD PTR [esi+2]
	add	dx, di
; Line 103
	mov	bx, WORD PTR [esi+4]
	add	bx, di
; Line 105
	cmp	BYTE PTR _color_override$[esp+16], 0
	je	SHORT $L633
	xor	ebp, ebp
	mov	al, BYTE PTR _color_override$[esp+16]
	mov	bp, WORD PTR _SL_TRIANGLE_INDEX
	lea	ebp, DWORD PTR [ebp+ebp*2]
	jmp	SHORT $L637
$L633:
	mov	al, BYTE PTR [esi+6]
	xor	ebp, ebp
	mov	bp, WORD PTR _SL_TRIANGLE_INDEX
	lea	ebp, DWORD PTR [ebp+ebp*2]
$L637:
	mov	BYTE PTR _SL_TRIANGLES[ebp*4+6], al
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	lea	eax, DWORD PTR [eax+eax*2]
	lea	ebp, DWORD PTR [eax*4]
	lea	eax, DWORD PTR _SL_TRIANGLES[eax*4]
; Line 106
	mov	WORD PTR [eax], cx
	push	eax
; Line 107
	mov	WORD PTR _SL_TRIANGLES[ebp+2], dx
	and	ecx, 65535				; 0000ffffH
; Line 108
	mov	WORD PTR _SL_TRIANGLES[ebp+4], bx
	and	edx, 65535				; 0000ffffH
; Line 109
	and	ebx, 65535				; 0000ffffH
	lea	edx, DWORD PTR [edx+edx*2]
	lea	ebx, DWORD PTR [ebx+ebx*2]
	mov	ebx, DWORD PTR _SL_VERTS[ebx*4+8]
	add	ebx, DWORD PTR _SL_VERTS[edx*4+8]
	lea	edx, DWORD PTR [ecx+ecx*2]
	add	ebx, DWORD PTR _SL_VERTS[edx*4+8]
	mov	DWORD PTR _SL_TRIANGLES[ebp+8], ebx
; Line 111
	call	_clip_polygon
	add	esp, 4
	test	al, al
	je	SHORT $L556
; Line 112
	inc	WORD PTR _SL_TRIANGLE_INDEX
; Line 100
$L556:
	add	esi, 12					; 0000000cH
	dec	DWORD PTR -4+[esp+20]
	jne	$L555
; Line 115
$L550:
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
; Line 117
	mov	eax, DWORD PTR _tri2$[esp-4]
	mov	edx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR _tri1$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
; Line 118
	mov	eax, 1
	cmp	edx, ecx
	jg	SHORT $L640
	xor	eax, eax
$L640:
	cmp	edx, ecx
	mov	ecx, 1
	jl	SHORT $L641
	xor	ecx, ecx
$L641:
	sub	eax, ecx
; Line 119
	ret	0
_compare_tris ENDP
_TEXT	ENDS
PUBLIC	_polygon_zsort
EXTRN	_qsort:NEAR
;	COMDAT _polygon_zsort
_TEXT	SEGMENT
_polygon_zsort PROC NEAR				; COMDAT
; Line 129
	push	OFFSET FLAT:_compare_tris
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	push	12					; 0000000cH
	push	eax
	push	OFFSET FLAT:_SL_TRIANGLES
	call	_qsort
	add	esp, 16					; 00000010H
; Line 130
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
; Line 139
	lea	eax, DWORD PTR _pt$[esp-4]
	sub	esp, 12					; 0000000cH
	push	esi
; Line 143
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
	lea	eax, DWORD PTR _v$[esp+24]
	lea	ecx, DWORD PTR _pt$[esp+20]
	add	esp, 8
; Line 145
	push	eax
	push	ecx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 147
	cmp	DWORD PTR _v$[esp+24], 0
	jle	SHORT $L566
; Line 148
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
; Line 149
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
; Line 150
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 153
$L566:
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
; Line 163
	mov	eax, DWORD PTR _fov$[esp-4]
	mov	DWORD PTR _SL_FOV_X, eax
; Line 164
	ret	0
_set_fov_x ENDP
_TEXT	ENDS
PUBLIC	_set_fov_y
;	COMDAT _set_fov_y
_TEXT	SEGMENT
_fov$ = 8
_set_fov_y PROC NEAR					; COMDAT
; Line 174
	mov	eax, DWORD PTR _fov$[esp-4]
	mov	DWORD PTR _SL_FOV_Y, eax
; Line 175
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
_light$ = 20
_look$ = -48
_norm$ = -36
_v1$ = -24
_v2$ = -12
_x1$ = 8
_x2$ = 12
_x3$ = 16
_find_illumination PROC NEAR				; COMDAT
; Line 193
	sub	esp, 48					; 00000030H
	lea	ecx, DWORD PTR _v1$[esp+48]
	push	ebx
	push	esi
	push	edi
; Line 196
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
; Line 197
	lea	ecx, DWORD PTR _v2$[esp+60]
	mov	ebx, DWORD PTR [edi+8]
	mov	DWORD PTR [ecx], eax
	lea	eax, DWORD PTR _v1$[esp+60]
	push	eax
	mov	DWORD PTR [ecx+4], edx
	mov	DWORD PTR [ecx+8], ebx
; Line 198
	mov	ebx, DWORD PTR _x1$[esp+60]
	push	ebx
	call	_vec3_subtract
	lea	ecx, DWORD PTR _v2$[esp+68]
	add	esp, 8
; Line 199
	push	ecx
	push	ebx
	call	_vec3_subtract
	lea	eax, DWORD PTR _norm$[esp+68]
	lea	ecx, DWORD PTR _v2$[esp+68]
	lea	edx, DWORD PTR _v1$[esp+68]
	add	esp, 8
; Line 200
	push	eax
	push	ecx
	push	edx
	call	_vec3_cross
	lea	ecx, DWORD PTR _norm$[esp+72]
	add	esp, 12					; 0000000cH
; Line 201
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	add	esp, 4
; Line 202
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	add	esp, 4
; Line 203
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	add	esp, 4
; Line 204
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 205
	mov	eax, DWORD PTR [ebx]
	mov	edx, DWORD PTR [ebx+4]
	mov	DWORD PTR [ecx], eax
	mov	DWORD PTR [ecx+4], edx
	mov	ebx, DWORD PTR [ebx+8]
	push	ecx
	mov	DWORD PTR [ecx+8], ebx
; Line 206
	push	esi
	call	_vec3_add
	lea	eax, DWORD PTR _look$[esp+68]
	add	esp, 8
; Line 207
	push	eax
	push	edi
	call	_vec3_add
	mov	eax, DWORD PTR _look$[esp+68]
	add	esp, 8
; Line 208
	cdq
	mov	ecx, 3
	idiv	ecx
	mov	DWORD PTR _look$[esp+60], eax
; Line 209
	mov	eax, DWORD PTR _look$[esp+64]
	cdq
	idiv	ecx
	mov	DWORD PTR _look$[esp+64], eax
; Line 210
	mov	eax, DWORD PTR _look$[esp+68]
	cdq
	idiv	ecx
	mov	ecx, DWORD PTR _light$[esp+56]
	mov	DWORD PTR _look$[esp+68], eax
; Line 211
	lea	eax, DWORD PTR _look$[esp+60]
	push	eax
	push	ecx
	call	_vec3_subtract
	lea	ecx, DWORD PTR _look$[esp+68]
	add	esp, 8
; Line 212
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 213
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 214
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 215
	push	ecx
	call	_vec3_normalize
	lea	ecx, DWORD PTR _norm$[esp+64]
	lea	edx, DWORD PTR _look$[esp+64]
	add	esp, 4
; Line 216
	push	ecx
	push	edx
	call	_vec3_dot
	add	esp, 8
	push	eax
	call	_int_abs
	add	esp, 4
; Line 217
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 48					; 00000030H
	ret	0
_find_illumination ENDP
_TEXT	ENDS
;	COMDAT _clip_polygon
_TEXT	SEGMENT
_tri$ = 8
_v0$ = -12
_v1$ = -24
_v2$ = -36
_clip_polygon PROC NEAR					; COMDAT
; Line 218
	mov	ecx, DWORD PTR _tri$[esp-4]
	sub	esp, 36					; 00000024H
	xor	edx, edx
	push	ebx
	mov	dx, WORD PTR [ecx]
	push	esi
	lea	esi, DWORD PTR _v0$[esp+44]
	push	edi
; Line 219
	lea	eax, DWORD PTR [edx+edx*2]
	mov	ebx, DWORD PTR _SL_VERTS[eax*4+4]
	lea	edx, DWORD PTR _SL_VERTS[eax*4]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR [esi], eax
	xor	eax, eax
	mov	ax, WORD PTR [ecx+2]
	mov	DWORD PTR [esi+4], ebx
	mov	DWORD PTR [esi+8], edx
; Line 220
	lea	ebx, DWORD PTR [eax+eax*2]
	lea	esi, DWORD PTR _v1$[esp+48]
	lea	edx, DWORD PTR _SL_VERTS[ebx*4]
	mov	cx, WORD PTR [ecx+4]
	mov	eax, DWORD PTR [edx]
	mov	ebx, DWORD PTR [edx+4]
	and	ecx, 65535				; 0000ffffH
	mov	edx, DWORD PTR [edx+8]
	mov	DWORD PTR [esi], eax
	lea	eax, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR [esi+4], ebx
	mov	DWORD PTR [esi+8], edx
; Line 221
	mov	ebx, DWORD PTR _SL_VERTS[eax*4+4]
	lea	ecx, DWORD PTR _SL_VERTS[eax*4]
	lea	edx, DWORD PTR _v2$[esp+48]
	cmp	DWORD PTR _v0$[esp+56], 2048		; 00000800H
	mov	eax, DWORD PTR [ecx]
	mov	esi, DWORD PTR _v0$[esp+52]
	mov	ecx, DWORD PTR [ecx+8]
	mov	edi, DWORD PTR _v1$[esp+52]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR _v0$[esp+48]
	mov	DWORD PTR [edx+4], ebx
	mov	DWORD PTR [edx+8], ecx
; Line 223
	mov	ecx, DWORD PTR _v1$[esp+48]
	mov	ebx, DWORD PTR _v2$[esp+52]
	mov	edx, DWORD PTR _v2$[esp+48]
	jle	SHORT $L588
	cmp	DWORD PTR _v1$[esp+56], 2048		; 00000800H
	jle	SHORT $L588
	cmp	DWORD PTR _v2$[esp+56], 2048		; 00000800H
	jle	SHORT $L588
; Line 227
	cmp	eax, 320				; 00000140H
	jl	SHORT $L591
	cmp	ecx, 320				; 00000140H
	jl	SHORT $L591
	cmp	edx, 320				; 00000140H
	jge	SHORT $L590
$L591:
	test	eax, eax
	jge	SHORT $L592
	test	ecx, ecx
	jge	SHORT $L592
	test	edx, edx
	jl	SHORT $L590
$L592:
	cmp	esi, 200				; 000000c8H
	jl	SHORT $L593
	cmp	edi, 200				; 000000c8H
	jl	SHORT $L593
	cmp	ebx, 200				; 000000c8H
	jge	SHORT $L590
$L593:
	test	esi, esi
	jge	SHORT $L589
	test	edi, edi
	jge	SHORT $L589
	test	ebx, ebx
	jge	SHORT $L589
$L590:
; Line 228
	xor	al, al
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 36					; 00000024H
	ret	0
; Line 231
$L589:
	mov	al, 1
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 36					; 00000024H
	ret	0
; Line 223
$L588:
; Line 224
	xor	al, al
	pop	edi
; Line 232
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
_x1$ = -12
_y1$ = -8
_x2$ = -20
_y2$ = -16
_render_end PROC NEAR					; COMDAT
; Line 241
	sub	esp, 20					; 00000014H
	cmp	WORD PTR _SL_TRIANGLE_INDEX, 0
	mov	DWORD PTR _i$[esp+20], 0
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 247
	je	$L595
	mov	esi, OFFSET FLAT:_SL_TRIANGLES
$L605:
; Line 248
	mov	bl, BYTE PTR [esi+6]
	xor	eax, eax
	mov	ax, WORD PTR [esi]
	xor	ebp, ebp
	mov	bp, WORD PTR [esi+2]
	xor	edi, edi
	mov	di, WORD PTR [esi+4]
	lea	edx, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _SL_VERTS[edx*4]
	lea	ecx, DWORD PTR [edx*4]
; Line 250
	mov	DWORD PTR _x1$[esp+36], eax
; Line 251
	mov	edx, DWORD PTR _SL_VERTS[ecx+4]
	lea	eax, DWORD PTR [ebp+ebp*2]
	mov	DWORD PTR _y1$[esp+36], edx
	mov	ebp, DWORD PTR _SL_VERTS[eax*4]
	lea	edx, DWORD PTR [eax*4]
; Line 252
	mov	DWORD PTR _x2$[esp+36], ebp
; Line 253
	mov	eax, DWORD PTR _SL_VERTS[edx+4]
	mov	DWORD PTR _y2$[esp+36], eax
	lea	eax, DWORD PTR [edi+edi*2]
	shl	eax, 2
; Line 254
	cmp	BYTE PTR _shading$[esp+32], 0
	mov	edi, DWORD PTR _SL_VERTS[eax]
	mov	ebp, DWORD PTR _SL_VERTS[eax+4]
; Line 257
	je	SHORT $L608
; Line 258
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
; Line 271
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
; Line 273
	jmp	SHORT $L606
$L608:
	or	bl, 15					; 0000000fH
	mov	eax, DWORD PTR _y2$[esp+36]
; Line 276
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
; Line 277
	push	ebx
	push	ebp
	push	edi
	push	ecx
	push	edx
	call	_draw_line
	mov	ecx, DWORD PTR _y2$[esp+56]
	mov	edx, DWORD PTR _x2$[esp+56]
	add	esp, 20					; 00000014H
; Line 278
	push	ebx
	push	ebp
	push	edi
	push	ecx
	push	edx
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 247
$L606:
	add	esi, 12					; 0000000cH
	xor	eax, eax
	mov	ax, WORD PTR _SL_TRIANGLE_INDEX
	inc	DWORD PTR _i$[esp+36]
	cmp	eax, DWORD PTR _i$[esp+36]
	jg	$L605
; Line 282
$L595:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 20					; 00000014H
	ret	0
_render_end ENDP
_TEXT	ENDS
END
