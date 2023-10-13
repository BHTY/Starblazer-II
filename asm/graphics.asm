	TITLE	src\graphics.c
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
;	COMDAT _plot_pixel
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _bitset_pixel
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_line
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _drawline
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _swap_buffers
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_span
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _fill_tri
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
COMM	_FBPTR:DWORD
_DATA	ENDS
PUBLIC	_plot_pixel
;	COMDAT _plot_pixel
_TEXT	SEGMENT
; File src\graphics.c
_x$ = 8
_y$ = 12
_color$ = 16
_plot_pixel PROC NEAR					; COMDAT
; Line 15
	mov	ax, WORD PTR _x$[esp-4]
	cmp	ax, 320					; 00000140H
	jae	SHORT $L297
	mov	cx, WORD PTR _y$[esp-4]
	cmp	cx, 200					; 000000c8H
	jae	SHORT $L297
; Line 17
	movzx	ecx, cx
	movzx	eax, ax
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	dl, BYTE PTR _color$[esp-4]
	shl	ecx, 6
	add	ecx, eax
	mov	eax, DWORD PTR _FBPTR
	mov	BYTE PTR [ecx+eax], dl
; Line 19
$L297:
	ret	0
_plot_pixel ENDP
_TEXT	ENDS
PUBLIC	_bitset_pixel
;	COMDAT _bitset_pixel
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_c$ = 16
_bitset_pixel PROC NEAR					; COMDAT
; Line 22
	mov	ax, WORD PTR _x$[esp-4]
	cmp	ax, 320					; 00000140H
	jae	SHORT $L302
	mov	cx, WORD PTR _y$[esp-4]
	cmp	cx, 200					; 000000c8H
	jae	SHORT $L302
	movzx	ecx, cx
	movzx	eax, ax
	lea	ecx, DWORD PTR [ecx+ecx*4]
	mov	dl, BYTE PTR _c$[esp-4]
	shl	ecx, 6
	add	ecx, eax
	mov	eax, DWORD PTR _FBPTR
; Line 23
	or	BYTE PTR [ecx+eax], dl
; Line 25
$L302:
	ret	0
_bitset_pixel ENDP
_TEXT	ENDS
PUBLIC	_draw_line
;	COMDAT _draw_line
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_addrInc$ = -4
_yLonger$ = -8
_endVal$ = -12
_draw_line PROC NEAR					; COMDAT
; Line 27
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _yLonger$[esp+12], 0
	push	ebx
	push	esi
	mov	esi, DWORD PTR _x$[esp+16]
	push	edi
	mov	ebx, DWORD PTR _y$[esp+20]
	push	ebp
; Line 38
	test	esi, esi
	jl	SHORT $L453
	test	ebx, ebx
	jl	SHORT $L453
	cmp	esi, 319				; 0000013fH
	jg	SHORT $L453
	cmp	ebx, 199				; 000000c7H
	jle	SHORT $L454
$L453:
	mov	ecx, DWORD PTR _x2$[esp+24]
	test	ecx, ecx
	jl	$L309
	mov	ebp, DWORD PTR _y2$[esp+24]
	test	ebp, ebp
	jl	$L309
	cmp	ecx, 319				; 0000013fH
	jg	$L309
	cmp	ebp, 199				; 000000c7H
	jg	$L309
	jmp	SHORT $L320
$L454:
	mov	ecx, DWORD PTR _x2$[esp+24]
	mov	ebp, DWORD PTR _y2$[esp+24]
; Line 39
$L320:
	test	ecx, ecx
	jge	SHORT $L323
; Line 41
	mov	eax, ebx
	sub	ecx, esi
	sub	eax, ebp
	imul	eax, esi
	cdq
	idiv	ecx
	xor	ecx, ecx
	lea	ebp, DWORD PTR [ebx+eax]
; Line 44
$L323:
	test	esi, esi
	jge	SHORT $L324
; Line 46
	mov	eax, ebp
	sub	esi, ecx
	sub	eax, ebx
	imul	eax, ecx
	cdq
	idiv	esi
	xor	esi, esi
	lea	ebx, DWORD PTR [ebp+eax]
; Line 50
$L324:
	cmp	ecx, 319				; 0000013fH
	jle	SHORT $L325
; Line 52
	sub	ebp, ebx
	mov	eax, 320				; 00000140H
	sub	eax, esi
	sub	ecx, esi
	imul	ebp, eax
	mov	eax, ebp
	cdq
	idiv	ecx
	mov	ecx, 319				; 0000013fH
	lea	ebp, DWORD PTR [ebx+eax]
; Line 55
$L325:
	cmp	esi, 319				; 0000013fH
	jle	SHORT $L326
; Line 57
	sub	ebx, ebp
	mov	eax, 320				; 00000140H
	sub	eax, ecx
	sub	esi, ecx
	imul	ebx, eax
	mov	eax, ebx
	cdq
	idiv	esi
	mov	esi, 319				; 0000013fH
	lea	ebx, DWORD PTR [ebp+eax]
; Line 61
$L326:
	test	ebp, ebp
	jge	SHORT $L327
; Line 63
	mov	eax, esi
	sub	ebp, ebx
	sub	eax, ecx
	imul	eax, ebx
	cdq
	idiv	ebp
	xor	ebp, ebp
	lea	ecx, DWORD PTR [esi+eax]
; Line 66
$L327:
	test	ebx, ebx
	jge	SHORT $L328
; Line 68
	mov	eax, ecx
	sub	ebx, ebp
	sub	eax, esi
	imul	eax, ebp
	cdq
	idiv	ebx
	xor	ebx, ebx
	lea	esi, DWORD PTR [ecx+eax]
; Line 72
$L328:
	cmp	ebp, 199				; 000000c7H
	jle	SHORT $L329
; Line 74
	mov	eax, ecx
	sub	ebp, ebx
	sub	eax, esi
	mov	ecx, 200				; 000000c8H
	sub	ecx, ebx
	imul	eax, ecx
	cdq
	idiv	ebp
	mov	ebp, 199				; 000000c7H
	lea	ecx, DWORD PTR [esi+eax]
; Line 77
$L329:
	cmp	ebx, 199				; 000000c7H
	jle	SHORT $L330
; Line 79
	mov	eax, esi
	mov	edx, 200				; 000000c8H
	sub	eax, ecx
	sub	edx, ebp
	imul	eax, edx
	cdq
	sub	ebx, ebp
	idiv	ebx
	mov	ebx, 199				; 000000c7H
	lea	esi, DWORD PTR [ecx+eax]
; Line 83
$L330:
	sub	ebp, ebx
	sub	ecx, esi
; Line 85
	mov	eax, ecx
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	edi, eax
	mov	eax, ebp
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	edi, eax
	jge	SHORT $L331
; Line 86
	mov	DWORD PTR _yLonger$[esp+28], 1
	mov	eax, ebp
; Line 87
	mov	ebp, ecx
; Line 88
	mov	ecx, eax
; Line 91
$L331:
	mov	DWORD PTR _endVal$[esp+28], ecx
	test	ecx, ecx
; Line 92
	jge	SHORT $L333
; Line 93
	neg	ecx
	mov	DWORD PTR _addrInc$[esp+28], -320	; fffffec0H
	mov	edi, -1
; Line 97
	jmp	SHORT $L334
$L333:
; Line 98
	mov	DWORD PTR _addrInc$[esp+28], 320	; 00000140H
	mov	edi, 1
; Line 100
$L334:
; Line 101
	mov	eax, 0
	test	ecx, ecx
	je	SHORT $L336
; Line 102
	mov	eax, ebp
	shl	eax, 16					; 00000010H
	cdq
	idiv	ecx
$L336:
; Line 103
	xor	ebp, ebp
	xor	ecx, ecx
; Line 104
	lea	ebx, DWORD PTR [ebx+ebx*4]
	shl	ebx, 6
	add	ebx, esi
	add	ebx, DWORD PTR _FBPTR
; Line 106
	cmp	DWORD PTR _yLonger$[esp+28], ebp
	je	SHORT $L337
; Line 108
	cmp	DWORD PTR _endVal$[esp+28], ebp
	je	SHORT $L309
	mov	dl, BYTE PTR _color$[esp+24]
$L338:
; Line 110
	mov	esi, ecx
	add	ebp, edi
	sar	esi, 16					; 00000010H
	add	ecx, eax
	mov	BYTE PTR [esi+ebx], dl
; Line 108
	add	ebx, DWORD PTR _addrInc$[esp+28]
	cmp	DWORD PTR _endVal$[esp+28], ebp
	jne	SHORT $L338
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 115
$L337:
; Line 116
	xor	esi, esi
	cmp	DWORD PTR _endVal$[esp+28], esi
	je	SHORT $L309
	mov	dl, BYTE PTR _color$[esp+24]
$L342:
; Line 117
	mov	ebp, ecx
	add	esi, edi
	sar	ebp, 16					; 00000010H
	add	ecx, eax
	lea	ebp, DWORD PTR [ebp+ebp*4]
	shl	ebp, 6
	mov	BYTE PTR [ebp+ebx], dl
; Line 116
	add	ebx, edi
	cmp	DWORD PTR _endVal$[esp+28], esi
	jne	SHORT $L342
; Line 125
$L309:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
_draw_line ENDP
_TEXT	ENDS
PUBLIC	_drawline
;	COMDAT _drawline
_TEXT	SEGMENT
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_i$ = -10
_sdx$ = -8
_sdy$ = -6
_dxabs$ = -4
_dyabs$ = -2
_y$ = -10
_drawline PROC NEAR					; COMDAT
; Line 129
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	mov	bx, WORD PTR _x2$[esp+16]
	push	edi
	mov	si, WORD PTR _x1$[esp+20]
	push	ebp
; Line 132
	sub	bx, si
; Line 133
	movsx	eax, bx
	mov	cx, WORD PTR _y2$[esp+24]
	cdq
	mov	di, WORD PTR _y1$[esp+24]
	xor	eax, edx
	sub	cx, di
	sub	eax, edx
; Line 134
	mov	WORD PTR _dxabs$[esp+28], ax
; Line 135
	movsx	eax, cx
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	WORD PTR _dyabs$[esp+28], ax
; Line 136
	test	bx, bx
	jl	SHORT $L457
	mov	ax, 1
	jg	SHORT $L465
	xor	ax, ax
$L465:
	mov	WORD PTR _sdx$[esp+28], ax
	jmp	SHORT $L458
$L457:
	mov	WORD PTR _sdx$[esp+28], -1
$L458:
; Line 137
	test	cx, cx
	jl	SHORT $L459
	mov	ax, 1
	jg	SHORT $L466
	xor	ax, ax
$L466:
	mov	WORD PTR _sdy$[esp+28], ax
	jmp	SHORT $L460
$L459:
	mov	WORD PTR _sdy$[esp+28], -1
$L460:
; Line 138
	mov	bx, WORD PTR _dyabs$[esp+28]
	sar	bx, 1
; Line 139
	mov	ax, WORD PTR _dxabs$[esp+28]
	sar	ax, 1
	mov	WORD PTR _y$[esp+28], ax
; Line 143
	test	si, si
	jl	$L351
	cmp	si, 319					; 0000013fH
	jg	$L351
	test	di, di
	jl	$L351
	cmp	di, 199					; 000000c7H
	jg	$L351
; Line 147
	mov	bp, di
	mov	eax, DWORD PTR _color$[esp+24]
	imul	bp, 320					; 00000140H
	add	bp, si
	push	eax
; Line 150
	push	edi
	push	esi
	call	_plot_pixel
	mov	ax, WORD PTR _dxabs$[esp+40]
	add	esp, 12					; 0000000cH
; Line 154
	cmp	WORD PTR _dyabs$[esp+28], ax
	jg	$L366
; Line 156
	xor	bx, bx
	cmp	ax, bx
	jle	$L351
$L367:
; Line 158
	mov	ax, WORD PTR _dyabs$[esp+28]
	add	WORD PTR _y$[esp+28], ax
; Line 159
	mov	cx, WORD PTR _y$[esp+28]
	cmp	cx, WORD PTR _dxabs$[esp+28]
	jl	SHORT $L370
; Line 161
	mov	ax, WORD PTR _dxabs$[esp+28]
	sub	WORD PTR _y$[esp+28], ax
; Line 163
	mov	ax, WORD PTR _sdy$[esp+28]
	add	di, WORD PTR _sdy$[esp+28]
	imul	ax, 320					; 00000140H
	add	bp, ax
; Line 165
$L370:
	add	si, WORD PTR _sdx$[esp+28]
; Line 167
	js	$L351
	cmp	si, 319					; 0000013fH
	jg	$L351
	test	di, di
	jl	$L351
	cmp	di, 199					; 000000c7H
	jg	$L351
; Line 171
	add	bp, WORD PTR _sdx$[esp+28]
	mov	eax, DWORD PTR _color$[esp+24]
; Line 172
	inc	bx
	push	eax
	push	edi
	push	esi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 156
	cmp	bx, WORD PTR _dxabs$[esp+28]
	jl	SHORT $L367
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 175
$L366:
; Line 177
	mov	WORD PTR _i$[esp+28], 0
	cmp	WORD PTR _dyabs$[esp+28], 0
	jle	SHORT $L351
$L374:
; Line 179
	add	bx, WORD PTR _dxabs$[esp+28]
; Line 180
	cmp	bx, WORD PTR _dyabs$[esp+28]
	jl	SHORT $L377
; Line 182
	sub	bx, WORD PTR _dyabs$[esp+28]
; Line 183
	add	si, WORD PTR _sdx$[esp+28]
; Line 184
	add	bp, WORD PTR _sdx$[esp+28]
; Line 186
$L377:
	add	di, WORD PTR _sdy$[esp+28]
; Line 188
	test	si, si
	jl	SHORT $L351
	cmp	si, 319					; 0000013fH
	jg	SHORT $L351
	test	di, di
	jl	SHORT $L351
	cmp	di, 199					; 000000c7H
	jg	SHORT $L351
; Line 192
	mov	ax, WORD PTR _sdy$[esp+28]
	mov	ecx, DWORD PTR _color$[esp+24]
	imul	ax, 320					; 00000140H
	add	bp, ax
	push	ecx
; Line 193
	push	edi
	push	esi
	call	_plot_pixel
	mov	ax, WORD PTR _dyabs$[esp+40]
	add	esp, 12					; 0000000cH
; Line 177
	inc	WORD PTR _i$[esp+28]
	cmp	WORD PTR _i$[esp+28], ax
	jl	SHORT $L374
; Line 197
$L351:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
_drawline ENDP
_TEXT	ENDS
PUBLIC	_swap_buffers
;	COMDAT _swap_buffers
_TEXT	SEGMENT
_front_buffer$ = 8
_clear_color$ = 12
_swap_buffers PROC NEAR					; COMDAT
; Line 200
	push	esi
	mov	edx, DWORD PTR _FBPTR
	push	edi
	mov	esi, edx
; Line 201
	mov	edi, DWORD PTR _front_buffer$[esp+4]
	mov	ecx, 16000				; 00003e80H
	rep	movsd
; Line 202
	xor	eax, eax
	mov	al, BYTE PTR _clear_color$[esp+4]
	mov	edi, edx
	mov	cl, al
	mov	ch, cl
	mov	cl, al
	mov	eax, ecx
	shl	eax, 16					; 00000010H
	mov	ax, cx
	mov	ecx, 16000				; 00003e80H
	rep	stosd
; Line 203
	pop	edi
	pop	esi
	ret	0
_swap_buffers ENDP
_TEXT	ENDS
PUBLIC	_draw_span
;	COMDAT _draw_span
_TEXT	SEGMENT
_x1$ = 8
_x2$ = 12
_y$ = 16
_color$ = 20
_draw_span PROC NEAR					; COMDAT
; Line 205
	push	ebx
	push	esi
	mov	esi, DWORD PTR _y$[esp+4]
	push	edi
; Line 207
	test	esi, esi
	jl	SHORT $L387
	cmp	esi, 200				; 000000c8H
	jge	SHORT $L387
; Line 208
	mov	ecx, DWORD PTR _x1$[esp+8]
	test	ecx, ecx
	jge	SHORT $L391
	xor	ecx, ecx
; Line 209
$L391:
	cmp	ecx, 320				; 00000140H
	jl	SHORT $L392
	mov	ecx, 319				; 0000013fH
; Line 210
$L392:
	mov	edx, DWORD PTR _x2$[esp+8]
	test	edx, edx
	jge	SHORT $L393
	xor	edx, edx
; Line 211
$L393:
	cmp	edx, 320				; 00000140H
	jl	SHORT $L394
	mov	edx, 319				; 0000013fH
; Line 212
$L394:
	cmp	edx, ecx
	jge	SHORT $L395
; Line 213
	mov	eax, ecx
	mov	ecx, edx
	mov	edx, eax
; Line 215
$L395:
	sub	edx, ecx
	xor	eax, eax
	mov	al, BYTE PTR _color$[esp+8]
	lea	esi, DWORD PTR [esi+esi*4]
	shl	esi, 6
	mov	bl, al
	mov	bh, bl
	add	esi, ecx
	mov	bl, al
	mov	edi, DWORD PTR _FBPTR
	mov	eax, ebx
	add	edi, esi
	shl	eax, 16					; 00000010H
	mov	ecx, edx
	shr	ecx, 2
	mov	ax, bx
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 216
$L387:
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_draw_span ENDP
_TEXT	ENDS
PUBLIC	_fill_tri
EXTRN	_fixed_mul:NEAR
EXTRN	_fixed_div:NEAR
;	COMDAT _fill_tri
_TEXT	SEGMENT
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_x3$ = 24
_y3$ = 28
_color$ = 32
_s1$ = -16
_s3$ = -12
_ss$ = -16
_se$ = -8
_xmid$ = -4
_fill_tri PROC NEAR					; COMDAT
; Line 217
	sub	esp, 16					; 00000010H
	mov	eax, -320				; fffffec0H
	cmp	DWORD PTR _x1$[esp+12], eax
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 225
	jl	$L403
	mov	ecx, 640				; 00000280H
	cmp	DWORD PTR _x1$[esp+28], ecx
	jg	$L403
	cmp	DWORD PTR _x2$[esp+28], eax
	jl	$L403
	cmp	DWORD PTR _x2$[esp+28], ecx
	jg	$L403
	mov	esi, DWORD PTR _x3$[esp+28]
	cmp	esi, eax
	jl	$L403
	cmp	esi, ecx
	jg	$L403
	mov	eax, -200				; ffffff38H
	cmp	DWORD PTR _y1$[esp+28], eax
	jl	$L403
	mov	ecx, 400				; 00000190H
	cmp	DWORD PTR _y1$[esp+28], ecx
	jg	$L403
	cmp	DWORD PTR _y2$[esp+28], eax
	jl	$L403
	cmp	DWORD PTR _y2$[esp+28], ecx
	jg	$L403
	cmp	DWORD PTR _y3$[esp+28], eax
	jl	$L403
	cmp	DWORD PTR _y3$[esp+28], ecx
	jg	$L403
; Line 234
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L418
; Line 235
	mov	eax, DWORD PTR _x1$[esp+28]
	mov	ecx, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y1$[esp+28]
	mov	DWORD PTR _x1$[esp+28], ecx
	mov	DWORD PTR _x2$[esp+28], eax
; Line 236
	mov	eax, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _y1$[esp+28], eax
	mov	DWORD PTR _y2$[esp+28], edx
; Line 238
$L418:
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jge	SHORT $L419
; Line 239
	mov	eax, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _x2$[esp+28], esi
	mov	DWORD PTR _y2$[esp+28], ecx
	mov	esi, eax
	mov	DWORD PTR _y3$[esp+28], edx
; Line 242
$L419:
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L420
; Line 243
	mov	eax, DWORD PTR _x1$[esp+28]
	mov	ecx, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y1$[esp+28]
	mov	DWORD PTR _x1$[esp+28], ecx
	mov	DWORD PTR _x2$[esp+28], eax
; Line 244
	mov	eax, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _y1$[esp+28], eax
	mov	DWORD PTR _y2$[esp+28], edx
; Line 246
$L420:
	mov	ebp, DWORD PTR _y1$[esp+28]
	mov	ebx, DWORD PTR _x1$[esp+28]
	shl	ebx, 16					; 00000010H
; Line 247
	cmp	DWORD PTR _y3$[esp+28], ebp
	mov	edi, ebx
; Line 251
	je	$L403
; Line 252
	cmp	DWORD PTR _y2$[esp+28], ebp
	jne	SHORT $L473
	mov	DWORD PTR _s1$[esp+32], 0
	jmp	SHORT $L474
$L473:
	mov	eax, DWORD PTR _y2$[esp+28]
	sub	eax, DWORD PTR _y1$[esp+28]
	shl	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _x2$[esp+32]
	sub	eax, DWORD PTR _x1$[esp+32]
	shl	eax, 16					; 00000010H
	push	eax
	call	_fixed_div
	mov	DWORD PTR _s1$[esp+40], eax
	add	esp, 8
$L474:
; Line 253
	mov	eax, DWORD PTR _y3$[esp+28]
	sub	eax, DWORD PTR _y1$[esp+28]
	shl	eax, 16					; 00000010H
	push	eax
	mov	eax, esi
	sub	eax, DWORD PTR _x1$[esp+32]
	shl	eax, 16					; 00000010H
	push	eax
	call	_fixed_div
	mov	ecx, DWORD PTR _y3$[esp+36]
	mov	DWORD PTR _s3$[esp+40], eax
	add	esp, 8
; Line 254
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jne	SHORT $L475
	xor	esi, esi
	jmp	SHORT $L476
$L475:
	mov	eax, DWORD PTR _y3$[esp+28]
	sub	esi, DWORD PTR _x2$[esp+28]
	shl	esi, 16					; 00000010H
	sub	eax, DWORD PTR _y2$[esp+28]
	shl	eax, 16					; 00000010H
	push	eax
	push	esi
	call	_fixed_div
	add	esp, 8
	mov	esi, eax
$L476:
; Line 256
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jne	SHORT $L485
; Line 258
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jle	SHORT $L423
; Line 259
	mov	edi, ebx
; Line 260
	mov	ebx, ecx
	shl	ebx, 16					; 00000010H
; Line 261
	jmp	SHORT $L481
$L423:
; Line 262
	mov	edi, DWORD PTR _x2$[esp+28]
	shl	edi, 16					; 00000010H
; Line 263
$L481:
; Line 265
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jle	SHORT $L485
$L426:
; Line 266
	mov	edx, edi
	mov	eax, ebx
	sar	edx, 16					; 00000010H
	mov	ecx, DWORD PTR _color$[esp+28]
; Line 267
	sar	eax, 16					; 00000010H
	push	ecx
; Line 271
	push	ebp
	push	eax
	push	edx
	call	_draw_span
	mov	ecx, DWORD PTR _x2$[esp+44]
	add	esp, 16					; 00000010H
; Line 272
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L477
	add	edi, esi
	jmp	SHORT $L478
$L477:
	add	edi, DWORD PTR _s3$[esp+32]
$L478:
; Line 273
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L479
	add	ebx, DWORD PTR _s3$[esp+32]
	jmp	SHORT $L480
$L479:
	add	ebx, esi
$L480:
; Line 274
	inc	ebp
; Line 275
	cmp	DWORD PTR _y3$[esp+28], ebp
	jg	SHORT $L426
$L485:
; Line 278
	mov	eax, DWORD PTR _y2$[esp+28]
	mov	ecx, DWORD PTR _s3$[esp+32]
	sub	eax, DWORD PTR _y1$[esp+28]
	shl	eax, 16					; 00000010H
	push	eax
	push	ecx
	call	_fixed_mul
	sar	eax, 16					; 00000010H
	add	eax, DWORD PTR _x1$[esp+36]
	add	esp, 8
	mov	DWORD PTR _xmid$[esp+32], eax
	cmp	DWORD PTR _x2$[esp+28], eax
; Line 282
	jle	SHORT $L428
; Line 283
	mov	eax, DWORD PTR _s1$[esp+32]
	mov	ecx, DWORD PTR _s3$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 284
	jmp	SHORT $L487
; Line 285
$L428:
; Line 286
	mov	eax, DWORD PTR _s3$[esp+32]
	mov	ecx, DWORD PTR _s1$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 287
$L487:
	mov	DWORD PTR _ss$[esp+32], ecx
	cmp	DWORD PTR _y3$[esp+28], ebp
; Line 293
	jle	SHORT $L403
$L431:
; Line 294
	cmp	DWORD PTR _y2$[esp+28], ebp
	jne	SHORT $L433
; Line 295
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _xmid$[esp+32]
	jle	SHORT $L434
; Line 296
	mov	DWORD PTR _se$[esp+32], esi
; Line 297
	jmp	SHORT $L433
$L434:
; Line 298
	mov	DWORD PTR _ss$[esp+32], esi
; Line 303
$L433:
	mov	eax, edi
	mov	edx, ebx
	sar	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _color$[esp+28]
; Line 304
	sar	edx, 16					; 00000010H
	push	ecx
; Line 305
	push	ebp
	push	edx
	push	eax
	inc	ebp
	call	_draw_span
	add	edi, DWORD PTR _ss$[esp+48]
	add	ebx, DWORD PTR _se$[esp+48]
	add	esp, 16					; 00000010H
; Line 309
	cmp	DWORD PTR _y3$[esp+28], ebp
	jg	SHORT $L431
; Line 313
$L403:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_fill_tri ENDP
_TEXT	ENDS
END
