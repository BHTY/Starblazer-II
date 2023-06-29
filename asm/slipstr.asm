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
_SL_CENTER_Y DW	064H
_SL_FOV_X DD	0640000H
_SL_FOV_Y DD	0640000H
_DATA	ENDS
PUBLIC	_render_begin
;	COMDAT _render_begin
_TEXT	SEGMENT
_render_begin PROC NEAR					; COMDAT
; File src\slipstr.c
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
	mov	eax, DWORD PTR _v$[esp-4]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _SL_CAMERA_POS, ecx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _SL_CAMERA_POS+4, edx
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _SL_CAMERA_POS+8, eax
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
	mov	edi, DWORD PTR _vec$[esp+16]
	push	edi
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
; Line 63
	lea	eax, DWORD PTR _v$[esp+28]
	push	eax
	push	edi
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
; Line 66
	mov	ecx, DWORD PTR _v$[esp+48]
	mov	edx, DWORD PTR _SL_FOV_X
	mov	eax, DWORD PTR _v$[esp+40]
	push	ecx
	push	edx
	push	eax
	call	_muldiv
	movsx	edx, WORD PTR _SL_CENTER_X
	mov	cx, WORD PTR _SL_VERTEX_INDEX
	sar	eax, 16					; 00000010H
	sub	edx, eax
	xor	eax, eax
	mov	ax, cx
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _SL_VERTS[eax*4], edx
; Line 67
	mov	edx, DWORD PTR _SL_FOV_Y
	xor	eax, eax
	mov	ax, cx
	mov	ecx, DWORD PTR _v$[esp+60]
	push	ecx
	push	edx
	lea	esi, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _v$[esp+64]
	push	eax
	shl	esi, 2
	call	_muldiv
	movsx	ecx, WORD PTR _SL_CENTER_Y
; Line 68
	mov	edx, DWORD PTR _v$[esp+72]
	add	esp, 44					; 0000002cH
	sar	eax, 16					; 00000010H
	sub	ecx, eax
; Line 70
	lea	eax, DWORD PTR _SL_ORIG_VERTS[esi]
	mov	DWORD PTR _SL_VERTS[esi+4], ecx
	mov	DWORD PTR _SL_VERTS[esi+8], edx
	mov	ecx, DWORD PTR [edi]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR [edi+4]
	mov	DWORD PTR [eax+4], edx
	mov	ecx, DWORD PTR [edi+8]
; Line 75
	inc	WORD PTR _SL_VERTEX_INDEX
	pop	edi
	mov	DWORD PTR [eax+8], ecx
	pop	esi
; Line 76
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
	sub	esp, 12					; 0000000cH
; Line 82
	mov	eax, DWORD PTR _x$[esp+8]
; Line 83
	mov	ecx, DWORD PTR _y$[esp+8]
; Line 84
	mov	edx, DWORD PTR _z$[esp+8]
	mov	DWORD PTR _v$[esp+12], eax
; Line 86
	lea	eax, DWORD PTR _v$[esp+12]
	mov	DWORD PTR _v$[esp+16], ecx
	push	eax
	mov	DWORD PTR _v$[esp+24], edx
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
	push	ebx
; Line 100
	mov	ebx, DWORD PTR _num_tris$[esp]
	and	ebx, 65535				; 0000ffffH
	jle	$L494
	mov	eax, DWORD PTR _tris$[esp]
	push	ebp
	push	esi
	push	edi
	lea	ebp, DWORD PTR [eax+4]
$L492:
; Line 101
	mov	ax, WORD PTR [ebp-4]
	mov	cx, WORD PTR _vert_offset$[esp+12]
; Line 102
	mov	si, WORD PTR [ebp-2]
; Line 103
	mov	di, WORD PTR [ebp]
; Line 105
	mov	edx, DWORD PTR _color_override$[esp+12]
	add	ax, cx
	add	si, cx
	add	di, cx
	test	dl, dl
	je	SHORT $L579
	and	edx, 255				; 000000ffH
	jmp	SHORT $L580
$L579:
	xor	edx, edx
	mov	dl, BYTE PTR [ebp+2]
$L580:
	xor	ecx, ecx
	add	ebp, 12					; 0000000cH
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	lea	ecx, DWORD PTR [ecx+ecx*2]
	shl	ecx, 2
	mov	BYTE PTR _SL_TRIANGLES[ecx+6], dl
; Line 106
	mov	WORD PTR _SL_TRIANGLES[ecx], ax
; Line 107
	mov	WORD PTR _SL_TRIANGLES[ecx+2], si
; Line 108
	mov	WORD PTR _SL_TRIANGLES[ecx+4], di
; Line 109
	and	edi, 65535				; 0000ffffH
	and	esi, 65535				; 0000ffffH
	and	eax, 65535				; 0000ffffH
	lea	edx, DWORD PTR [edi+edi*2]
	lea	esi, DWORD PTR [esi+esi*2]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	edx, DWORD PTR _SL_VERTS[edx*4+8]
	mov	edi, DWORD PTR _SL_VERTS[esi*4+8]
	mov	esi, DWORD PTR _SL_VERTS[eax*4+8]
	add	edx, edi
	add	edx, esi
	mov	eax, 1431655766				; 55555556H
	imul	edx
	mov	eax, edx
	shr	eax, 31					; 0000001fH
	add	edx, eax
; Line 111
	inc	WORD PTR _SL_TRIANGLE_INDEX
	dec	ebx
	mov	DWORD PTR _SL_TRIANGLES[ecx+8], edx
	jne	$L492
	pop	edi
	pop	esi
	pop	ebp
$L494:
	pop	ebx
; Line 113
	ret	0
_put_triangles ENDP
_TEXT	ENDS
PUBLIC	_compare_tris
;	COMDAT _compare_tris
_TEXT	SEGMENT
_tri1$ = 8
_tri2$ = 12
_compare_tris PROC NEAR					; COMDAT
; Line 116
	mov	eax, DWORD PTR _tri1$[esp-4]
	mov	ecx, DWORD PTR _tri2$[esp-4]
	push	esi
	xor	edx, edx
	mov	eax, DWORD PTR [eax+8]
	mov	esi, DWORD PTR [ecx+8]
	cmp	eax, esi
	setl	dl
	xor	ecx, ecx
	cmp	eax, esi
	setg	cl
	sub	edx, ecx
	pop	esi
	mov	eax, edx
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
	xor	eax, eax
	push	OFFSET FLAT:_compare_tris
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
	sub	esp, 12					; 0000000cH
; Line 141
	lea	eax, DWORD PTR _pt$[esp+8]
	push	eax
	push	OFFSET FLAT:_SL_CAMERA_POS
	call	_vec3_subtract
; Line 143
	lea	ecx, DWORD PTR _v$[esp+20]
	lea	edx, DWORD PTR _pt$[esp+16]
	push	ecx
	push	edx
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	call	_mat3_mul
; Line 145
	mov	eax, DWORD PTR _v$[esp+40]
	add	esp, 20					; 00000014H
	test	eax, eax
	jle	SHORT $L504
; Line 146
	mov	ecx, DWORD PTR _v$[esp+12]
	push	eax
	mov	eax, DWORD PTR _SL_FOV_X
	push	eax
	push	ecx
	call	_muldiv
	movsx	edx, WORD PTR _SL_CENTER_X
; Line 147
	mov	ecx, DWORD PTR _SL_FOV_Y
	sar	eax, 16					; 00000010H
	sub	edx, eax
	mov	eax, DWORD PTR _v$[esp+32]
	mov	DWORD PTR _v$[esp+24], edx
	mov	edx, DWORD PTR _v$[esp+28]
	push	eax
	push	ecx
	push	edx
	call	_muldiv
; Line 148
	mov	edx, DWORD PTR _color$[esp+32]
	mov	ecx, eax
	movsx	eax, WORD PTR _SL_CENTER_Y
	sar	ecx, 16					; 00000010H
	sub	eax, ecx
	push	edx
	mov	DWORD PTR _v$[esp+44], eax
	push	eax
	mov	eax, DWORD PTR _v$[esp+44]
	push	eax
	call	_plot_pixel
	add	esp, 36					; 00000024H
$L504:
; Line 151
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
	push	ebx
	push	esi
; Line 195
	mov	ebx, DWORD PTR _x3$[esp+52]
	push	edi
	mov	edi, DWORD PTR _x2$[esp+56]
; Line 196
	mov	esi, DWORD PTR _x1$[esp+56]
	mov	eax, edi
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _v1$[esp+60], ecx
	mov	ecx, ebx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR _v1$[esp+64], edx
	mov	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _v2$[esp+60], edx
	mov	DWORD PTR _v1$[esp+68], eax
	mov	eax, DWORD PTR [ecx+4]
	lea	edx, DWORD PTR _v1$[esp+60]
	mov	DWORD PTR _v2$[esp+64], eax
	mov	ecx, DWORD PTR [ecx+8]
	push	edx
	push	esi
	mov	DWORD PTR _v2$[esp+76], ecx
	call	_vec3_subtract
; Line 197
	lea	eax, DWORD PTR _v2$[esp+68]
	push	eax
	push	esi
	call	_vec3_subtract
; Line 198
	lea	ecx, DWORD PTR _norm$[esp+76]
	lea	edx, DWORD PTR _v2$[esp+76]
	push	ecx
	lea	eax, DWORD PTR _v1$[esp+80]
	push	edx
	push	eax
	call	_vec3_cross
; Line 199
	lea	ecx, DWORD PTR _norm$[esp+88]
	push	ecx
	call	_vec3_normalize
; Line 200
	lea	edx, DWORD PTR _norm$[esp+92]
	push	edx
	call	_vec3_normalize
; Line 201
	lea	eax, DWORD PTR _norm$[esp+96]
	push	eax
	call	_vec3_normalize
; Line 202
	lea	ecx, DWORD PTR _norm$[esp+100]
	push	ecx
	call	_vec3_normalize
; Line 203
	mov	edx, DWORD PTR [esi]
	mov	eax, DWORD PTR [esi+4]
	mov	ecx, DWORD PTR [esi+8]
	mov	DWORD PTR _look$[esp+104], edx
; Line 204
	lea	edx, DWORD PTR _look$[esp+104]
	mov	DWORD PTR _look$[esp+108], eax
	push	edx
	push	edi
	mov	DWORD PTR _look$[esp+120], ecx
	call	_vec3_add
; Line 205
	lea	eax, DWORD PTR _look$[esp+112]
	push	eax
	push	ebx
	call	_vec3_add
; Line 206
	mov	ecx, DWORD PTR _look$[esp+120]
	mov	eax, 1431655766				; 55555556H
	imul	ecx
	mov	ecx, edx
; Line 207
	mov	eax, 1431655766				; 55555556H
	shr	ecx, 31					; 0000001fH
	add	edx, ecx
	mov	ecx, DWORD PTR _look$[esp+124]
	mov	DWORD PTR _look$[esp+120], edx
	imul	ecx
; Line 208
	mov	ecx, DWORD PTR _look$[esp+128]
	mov	eax, edx
	shr	eax, 31					; 0000001fH
	add	edx, eax
	mov	eax, 1431655766				; 55555556H
	mov	DWORD PTR _look$[esp+124], edx
	imul	ecx
	mov	ecx, edx
	shr	ecx, 31					; 0000001fH
	add	edx, ecx
; Line 209
	mov	eax, DWORD PTR _light$[esp+116]
	mov	DWORD PTR _look$[esp+128], edx
	lea	edx, DWORD PTR _look$[esp+120]
	push	edx
	push	eax
	call	_vec3_subtract
	add	esp, 68					; 00000044H
; Line 210
	lea	ecx, DWORD PTR _look$[esp+60]
	push	ecx
	call	_vec3_normalize
; Line 211
	lea	edx, DWORD PTR _look$[esp+64]
	push	edx
	call	_vec3_normalize
; Line 212
	lea	eax, DWORD PTR _look$[esp+68]
	push	eax
	call	_vec3_normalize
; Line 213
	lea	ecx, DWORD PTR _look$[esp+72]
	push	ecx
	call	_vec3_normalize
; Line 214
	lea	edx, DWORD PTR _norm$[esp+76]
	lea	eax, DWORD PTR _look$[esp+76]
	push	edx
	push	eax
	call	_vec3_dot
	push	eax
	call	_int_abs
	add	esp, 28					; 0000001cH
	pop	edi
	pop	esi
	pop	ebx
; Line 215
	add	esp, 48					; 00000030H
	ret	0
_find_illumination ENDP
_TEXT	ENDS
PUBLIC	_clip_polygon
;	COMDAT _clip_polygon
_TEXT	SEGMENT
_tri$ = 8
_v0$ = -12
_v1$ = -24
_clip_polygon PROC NEAR					; COMDAT
; Line 216
	sub	esp, 24					; 00000018H
; Line 217
	mov	ecx, DWORD PTR _tri$[esp+20]
	xor	eax, eax
	push	ebx
	push	ebp
	mov	ax, WORD PTR [ecx]
	push	esi
	push	edi
	lea	eax, DWORD PTR [eax+eax*2]
	lea	edx, DWORD PTR _SL_VERTS[eax*4]
	mov	edi, DWORD PTR _SL_VERTS[eax*4]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _v0$[esp+44], eax
; Line 218
	xor	eax, eax
	mov	ax, WORD PTR [ecx+2]
	mov	edx, DWORD PTR [edx+8]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _SL_VERTS[eax*4]
	mov	ebx, DWORD PTR [eax]
	mov	esi, DWORD PTR [eax+4]
	mov	DWORD PTR _v1$[esp+44], esi
	mov	esi, DWORD PTR [eax+8]
; Line 219
	xor	eax, eax
	mov	ax, WORD PTR [ecx+4]
; Line 221
	cmp	edx, 2048				; 00000800H
	lea	ecx, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _SL_VERTS[ecx*4]
	mov	ecx, DWORD PTR _SL_VERTS[ecx*4]
	mov	ebp, DWORD PTR [eax+4]
	mov	eax, DWORD PTR [eax+8]
	jle	SHORT $L527
	cmp	esi, 2048				; 00000800H
	jle	SHORT $L527
	cmp	eax, 2048				; 00000800H
	jle	SHORT $L527
; Line 225
	cmp	edi, 320				; 00000140H
	jl	SHORT $L528
	cmp	ebx, 320				; 00000140H
	jl	SHORT $L528
	cmp	ecx, 320				; 00000140H
	jge	SHORT $L527
$L528:
	test	edi, edi
	jge	SHORT $L529
	test	ebx, ebx
	jge	SHORT $L529
	test	ecx, ecx
	jl	SHORT $L527
$L529:
	mov	eax, DWORD PTR _v0$[esp+44]
	cmp	eax, 200				; 000000c8H
	jl	SHORT $L530
	cmp	DWORD PTR _v1$[esp+44], 200		; 000000c8H
	jl	SHORT $L530
	cmp	ebp, 200				; 000000c8H
	jge	SHORT $L527
$L530:
	test	eax, eax
	jge	SHORT $L526
	mov	eax, DWORD PTR _v1$[esp+44]
	test	eax, eax
	jge	SHORT $L526
	test	ebp, ebp
; Line 226
	jl	SHORT $L527
$L526:
	pop	edi
	pop	esi
	pop	ebp
; Line 229
	mov	al, 1
	pop	ebx
; Line 230
	add	esp, 24					; 00000018H
	ret	0
$L527:
	pop	edi
	pop	esi
	pop	ebp
; Line 222
	xor	al, al
	pop	ebx
; Line 230
	add	esp, 24					; 00000018H
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
_c$ = -25
_y2$ = -12
_x3$ = -20
_y3$ = -24
_render_end PROC NEAR					; COMDAT
; Line 239
	sub	esp, 28					; 0000001cH
; Line 245
	cmp	WORD PTR _SL_TRIANGLE_INDEX, 0
	mov	DWORD PTR _i$[esp+28], 0
	jbe	$L547
	push	ebx
	push	ebp
	push	esi
	mov	esi, OFFSET FLAT:_SL_TRIANGLES+4
	push	edi
	mov	DWORD PTR -16+[esp+44], esi
$L545:
; Line 246
	lea	edi, DWORD PTR [esi-4]
	push	edi
	call	_clip_polygon
	add	esp, 4
	test	al, al
	je	$L546
; Line 251
	xor	ecx, ecx
	mov	al, BYTE PTR [esi+2]
	mov	cx, WORD PTR [esi-2]
	mov	BYTE PTR _c$[esp+44], al
	xor	eax, eax
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	ax, WORD PTR [edi]
	shl	ecx, 2
	lea	eax, DWORD PTR [eax+eax*2]
; Line 252
	mov	edx, DWORD PTR _SL_VERTS[ecx+4]
	mov	ebx, DWORD PTR _SL_VERTS[ecx]
	mov	DWORD PTR _y2$[esp+44], edx
; Line 253
	xor	edx, edx
	mov	dx, WORD PTR [esi]
	shl	eax, 2
	lea	esi, DWORD PTR [edx+edx*2]
	shl	esi, 2
	mov	edi, DWORD PTR _SL_VERTS[eax]
	mov	ebp, DWORD PTR _SL_VERTS[eax+4]
	mov	edx, DWORD PTR _SL_VERTS[esi]
	mov	DWORD PTR _x3$[esp+44], edx
; Line 254
	mov	edx, DWORD PTR _SL_VERTS[esi+4]
	mov	DWORD PTR _y3$[esp+44], edx
; Line 256
	mov	dl, BYTE PTR _shading$[esp+40]
	test	dl, dl
	je	SHORT $L549
; Line 257
	lea	edx, DWORD PTR _SL_ORIG_VERTS[esi]
	push	OFFSET FLAT:_SL_CAMERA_POS
	push	edx
	lea	ecx, DWORD PTR _SL_ORIG_VERTS[ecx]
	lea	edx, DWORD PTR _SL_ORIG_VERTS[eax]
	push	ecx
	push	edx
	call	_find_illumination
; Line 269
	mov	dl, BYTE PTR _c$[esp+60]
	lea	eax, DWORD PTR [eax+eax*2+65536]
	mov	ecx, DWORD PTR _x3$[esp+60]
	sar	eax, 14					; 0000000eH
	or	al, dl
	mov	edx, DWORD PTR _y2$[esp+60]
	push	eax
	mov	eax, DWORD PTR _y3$[esp+64]
	push	eax
	push	ecx
	push	edx
	push	ebx
	push	ebp
	push	edi
	call	_fill_tri
	add	esp, 44					; 0000002cH
; Line 271
	jmp	SHORT $L610
$L549:
; Line 274
	mov	al, BYTE PTR _c$[esp+44]
	mov	esi, DWORD PTR _y2$[esp+44]
	or	al, 15					; 0000000fH
	push	eax
	push	esi
	push	ebx
	push	ebp
	push	edi
	mov	BYTE PTR -8+[esp+64], al
	call	_draw_line
; Line 275
	mov	eax, DWORD PTR -8+[esp+64]
	mov	ecx, DWORD PTR _y3$[esp+64]
	mov	edx, DWORD PTR _x3$[esp+64]
	push	eax
	push	ecx
	push	edx
	push	ebp
	push	edi
	call	_draw_line
; Line 276
	mov	eax, DWORD PTR -8+[esp+84]
	mov	ecx, DWORD PTR _y3$[esp+84]
	mov	edx, DWORD PTR _x3$[esp+84]
	push	eax
	push	ecx
	push	edx
	push	esi
	push	ebx
	call	_draw_line
	add	esp, 60					; 0000003cH
$L610:
	mov	esi, DWORD PTR -16+[esp+44]
$L546:
; Line 245
	mov	eax, DWORD PTR _i$[esp+44]
	xor	ecx, ecx
	mov	cx, WORD PTR _SL_TRIANGLE_INDEX
	inc	eax
	add	esi, 12					; 0000000cH
	cmp	eax, ecx
	mov	DWORD PTR _i$[esp+44], eax
	mov	DWORD PTR -16+[esp+44], esi
	jl	$L545
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
$L547:
; Line 280
	add	esp, 28					; 0000001cH
	ret	0
_render_end ENDP
_TEXT	ENDS
END
