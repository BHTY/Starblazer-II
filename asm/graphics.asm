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
_x$ = 8
_y$ = 12
_color$ = 16
_plot_pixel PROC NEAR					; COMDAT
; File src\graphics.c
; Line 15
	mov	ecx, DWORD PTR _x$[esp-4]
	cmp	cx, 320					; 00000140H
	jae	SHORT $L298
	mov	eax, DWORD PTR _y$[esp-4]
	cmp	ax, 200					; 000000c8H
	jae	SHORT $L298
; Line 17
	mov	edx, DWORD PTR _FBPTR
	and	eax, 65535				; 0000ffffH
	and	ecx, 65535				; 0000ffffH
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 6
	add	edx, eax
	mov	al, BYTE PTR _color$[esp-4]
	mov	BYTE PTR [ecx+edx], al
$L298:
; Line 19
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
	mov	ecx, DWORD PTR _x$[esp-4]
	cmp	cx, 320					; 00000140H
	jae	SHORT $L303
	mov	eax, DWORD PTR _y$[esp-4]
	cmp	ax, 200					; 000000c8H
	jae	SHORT $L303
; Line 23
	mov	edx, DWORD PTR _FBPTR
	and	eax, 65535				; 0000ffffH
	and	ecx, 65535				; 0000ffffH
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 6
	add	edx, eax
	lea	eax, DWORD PTR [ecx+edx]
	mov	cl, BYTE PTR _c$[esp-4]
	or	BYTE PTR [eax], cl
$L303:
; Line 25
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
_addrInc$ = 20
_yLonger$ = -4
_endVal$ = 8
_draw_line PROC NEAR					; COMDAT
; Line 27
	push	ecx
; Line 38
	mov	ecx, DWORD PTR _x2$[esp]
	push	ebx
	mov	ebx, DWORD PTR _x$[esp+4]
	push	ebp
	push	esi
	mov	esi, DWORD PTR _y2$[esp+12]
	push	edi
	mov	edi, DWORD PTR _y$[esp+16]
	test	ebx, ebx
	mov	DWORD PTR _yLonger$[esp+20], 0
	jl	SHORT $L321
	test	edi, edi
	jl	SHORT $L321
	cmp	ebx, 319				; 0000013fH
	jg	SHORT $L321
	cmp	edi, 199				; 000000c7H
	jle	SHORT $L320
$L321:
	test	ecx, ecx
	jl	$L322
	test	esi, esi
	jl	$L322
	cmp	ecx, 319				; 0000013fH
	jg	$L322
	cmp	esi, 199				; 000000c7H
	jg	$L322
$L320:
; Line 39
	test	ecx, ecx
	jge	SHORT $L323
; Line 41
	mov	eax, esi
	sub	ecx, ebx
	sub	eax, edi
	imul	eax, ebx
	cdq
	idiv	ecx
	mov	ecx, edi
	sub	ecx, eax
	mov	esi, ecx
; Line 42
	xor	ecx, ecx
$L323:
; Line 44
	test	ebx, ebx
	jge	SHORT $L324
; Line 46
	mov	eax, edi
	sub	ebx, ecx
	sub	eax, esi
	imul	eax, ecx
	cdq
	idiv	ebx
	mov	edx, esi
	sub	edx, eax
; Line 47
	xor	ebx, ebx
	mov	edi, edx
$L324:
; Line 50
	cmp	ecx, 319				; 0000013fH
	jle	SHORT $L325
; Line 52
	mov	eax, esi
	mov	edx, 320				; 00000140H
	sub	eax, edi
	sub	edx, ebx
	imul	eax, edx
	cdq
	sub	ecx, ebx
	idiv	ecx
; Line 53
	mov	ecx, 319				; 0000013fH
	add	eax, edi
	mov	esi, eax
$L325:
; Line 55
	cmp	ebx, 319				; 0000013fH
	jle	SHORT $L326
; Line 57
	mov	eax, edi
	mov	edx, 320				; 00000140H
	sub	eax, esi
	sub	edx, ecx
	imul	eax, edx
	cdq
	sub	ebx, ecx
	idiv	ebx
; Line 58
	mov	ebx, 319				; 0000013fH
	add	eax, esi
	mov	edi, eax
$L326:
; Line 61
	test	esi, esi
	jge	SHORT $L327
; Line 63
	mov	eax, ecx
	sub	esi, edi
	sub	eax, ebx
	mov	ecx, ebx
	imul	eax, edi
	cdq
	idiv	esi
	sub	ecx, eax
; Line 64
	xor	esi, esi
$L327:
; Line 66
	test	edi, edi
	jge	SHORT $L328
; Line 68
	mov	eax, ebx
	sub	edi, esi
	sub	eax, ecx
	imul	eax, esi
	cdq
	idiv	edi
	mov	edx, ecx
	sub	edx, eax
; Line 69
	xor	edi, edi
	mov	ebx, edx
$L328:
; Line 72
	cmp	esi, 199				; 000000c7H
	jle	SHORT $L329
; Line 74
	mov	eax, ecx
	mov	ecx, 200				; 000000c8H
	sub	eax, ebx
	sub	ecx, edi
	imul	eax, ecx
	cdq
	sub	esi, edi
	idiv	esi
; Line 75
	mov	esi, 199				; 000000c7H
	add	eax, ebx
	mov	ecx, eax
$L329:
; Line 77
	cmp	edi, 199				; 000000c7H
	jle	SHORT $L330
; Line 79
	mov	eax, ebx
	mov	edx, 200				; 000000c8H
	sub	eax, ecx
	sub	edx, esi
	imul	eax, edx
	cdq
	sub	edi, esi
	idiv	edi
; Line 80
	mov	edi, 199				; 000000c7H
	add	eax, ecx
	mov	ebx, eax
$L330:
; Line 84
	sub	ecx, ebx
	sub	esi, edi
; Line 85
	mov	eax, ecx
	cdq
	mov	ebp, eax
	mov	eax, esi
	xor	ebp, edx
	sub	ebp, edx
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	edx, ebp
	cmp	eax, edx
	mov	ebp, 1
	jle	SHORT $L331
; Line 86
	mov	eax, esi
; Line 87
	mov	esi, ecx
; Line 88
	mov	ecx, eax
; Line 89
	mov	DWORD PTR _yLonger$[esp+20], ebp
$L331:
; Line 92
	test	ecx, ecx
	mov	DWORD PTR _endVal$[esp+16], ecx
	jge	SHORT $L333
; Line 93
	or	ebp, -1
; Line 94
	mov	DWORD PTR _addrInc$[esp+16], -320	; fffffec0H
; Line 95
	neg	ecx
; Line 97
	jmp	SHORT $L334
$L333:
; Line 99
	mov	DWORD PTR _addrInc$[esp+16], 320	; 00000140H
$L334:
; Line 101
	test	ecx, ecx
	jne	SHORT $L335
	xor	eax, eax
; Line 102
	jmp	SHORT $L336
$L335:
	mov	eax, esi
	shl	eax, 16					; 00000010H
	cdq
	idiv	ecx
$L336:
; Line 104
	mov	edx, DWORD PTR _FBPTR
	lea	ecx, DWORD PTR [edi+edi*4]
	shl	ecx, 6
	add	ecx, edx
; Line 106
	mov	edx, DWORD PTR _yLonger$[esp+20]
	xor	esi, esi
	add	ecx, ebx
	test	edx, edx
	je	SHORT $L337
; Line 108
	mov	edi, DWORD PTR _endVal$[esp+16]
	xor	edx, edx
	test	edi, edi
	je	SHORT $L322
	mov	bl, BYTE PTR _color$[esp+16]
$L338:
; Line 110
	mov	edi, esi
	add	edx, ebp
	sar	edi, 16					; 00000010H
; Line 112
	add	esi, eax
	mov	BYTE PTR [edi+ecx], bl
	mov	edi, DWORD PTR _addrInc$[esp+16]
	add	ecx, edi
	mov	edi, DWORD PTR _endVal$[esp+16]
	cmp	edx, edi
	jne	SHORT $L338
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 125
	pop	ecx
	ret	0
$L337:
; Line 116
	mov	edx, DWORD PTR _endVal$[esp+16]
	xor	edi, edi
	test	edx, edx
	je	SHORT $L322
	mov	bl, BYTE PTR _color$[esp+16]
$L342:
; Line 117
	mov	edx, esi
	add	edi, ebp
	sar	edx, 16					; 00000010H
; Line 120
	add	esi, eax
	lea	edx, DWORD PTR [edx+edx*4]
	shl	edx, 6
	mov	BYTE PTR [edx+ecx], bl
	mov	edx, DWORD PTR _endVal$[esp+16]
	add	ecx, ebp
	cmp	edi, edx
	jne	SHORT $L342
$L322:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 125
	pop	ecx
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
_i$ = 16
_sdx$ = -8
_sdy$ = -4
_x$ = 20
_y$ = 8
_py$ = 12
_drawline PROC NEAR					; COMDAT
; Line 132
	mov	ecx, DWORD PTR _x1$[esp-4]
	sub	esp, 8
; Line 133
	mov	edx, DWORD PTR _y1$[esp+4]
	push	ebx
	push	ebp
	mov	ebp, DWORD PTR _x2$[esp+12]
	push	esi
	mov	esi, DWORD PTR _y2$[esp+16]
	sub	ebp, ecx
; Line 134
	movsx	eax, bp
	sub	esi, edx
	push	edi
	cdq
	mov	edi, eax
; Line 135
	movsx	eax, si
	xor	edi, edx
	sub	edi, edx
	cdq
	mov	ebx, eax
; Line 136
	or	eax, -1
	xor	ebx, edx
	sub	ebx, edx
	test	bp, bp
	jge	SHORT $L460
	mov	DWORD PTR _sdx$[esp+24], eax
	jmp	SHORT $L461
$L460:
	xor	edx, edx
	test	bp, bp
	setg	dl
	mov	DWORD PTR _sdx$[esp+24], edx
$L461:
; Line 137
	test	si, si
	jl	SHORT $L473
	xor	eax, eax
	test	si, si
	setg	al
$L473:
	mov	DWORD PTR _sdy$[esp+24], eax
; Line 138
	mov	ax, bx
	sar	ax, 1
	mov	DWORD PTR _x$[esp+20], eax
; Line 139
	mov	ax, di
	sar	ax, 1
	mov	DWORD PTR _y$[esp+20], eax
; Line 141
	mov	eax, DWORD PTR _y1$[esp+20]
; Line 143
	test	cx, cx
	mov	esi, ecx
	mov	DWORD PTR _py$[esp+20], eax
	jl	$L467
	cmp	cx, 319					; 0000013fH
	jg	$L467
	test	ax, ax
	jl	$L467
	cmp	ax, 199					; 000000c7H
	jg	$L467
; Line 150
	mov	edx, DWORD PTR _color$[esp+20]
	lea	ebp, DWORD PTR [eax+eax*4]
	push	edx
	push	eax
	shl	ebp, 6
	push	ecx
	add	ebp, ecx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 154
	cmp	di, bx
; Line 156
	mov	DWORD PTR _i$[esp+20], 0
	jl	$L366
	test	di, di
	jle	$L467
$L367:
; Line 158
	mov	eax, DWORD PTR _y$[esp+20]
	add	eax, ebx
; Line 159
	cmp	ax, di
	mov	DWORD PTR _y$[esp+20], eax
	jl	SHORT $L471
; Line 162
	mov	ecx, DWORD PTR _py$[esp+20]
	sub	eax, edi
	mov	DWORD PTR _y$[esp+20], eax
	mov	eax, DWORD PTR _sdy$[esp+24]
	add	ecx, eax
; Line 163
	lea	eax, DWORD PTR [eax+eax*4]
	mov	DWORD PTR _py$[esp+20], ecx
	shl	eax, 6
	add	ebp, eax
	jmp	SHORT $L370
$L471:
	mov	ecx, DWORD PTR _py$[esp+20]
$L370:
; Line 165
	mov	eax, DWORD PTR _sdx$[esp+24]
	add	esi, eax
; Line 167
	test	si, si
	jl	$L467
	cmp	si, 319					; 0000013fH
	jg	$L467
	test	cx, cx
	jl	$L467
	cmp	cx, 199					; 000000c7H
	jg	$L467
; Line 172
	mov	edx, DWORD PTR _color$[esp+20]
	add	ebp, eax
	push	edx
	push	ecx
	push	esi
	call	_plot_pixel
	mov	eax, DWORD PTR _i$[esp+32]
	add	esp, 12					; 0000000cH
	inc	eax
	cmp	ax, di
	mov	DWORD PTR _i$[esp+20], eax
	jl	SHORT $L367
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 197
	add	esp, 8
	ret	0
$L366:
; Line 177
	test	bx, bx
	jle	SHORT $L467
$L374:
; Line 179
	mov	eax, DWORD PTR _x$[esp+20]
	add	eax, edi
; Line 180
	cmp	ax, bx
	mov	DWORD PTR _x$[esp+20], eax
	jl	SHORT $L377
; Line 182
	sub	eax, ebx
	mov	DWORD PTR _x$[esp+20], eax
; Line 183
	mov	eax, DWORD PTR _sdx$[esp+24]
	add	esi, eax
; Line 184
	add	ebp, eax
$L377:
; Line 186
	mov	ecx, DWORD PTR _py$[esp+20]
	mov	eax, DWORD PTR _sdy$[esp+24]
	add	ecx, eax
; Line 188
	test	si, si
	mov	DWORD PTR _py$[esp+20], ecx
	jl	SHORT $L467
	cmp	si, 319					; 0000013fH
	jg	SHORT $L467
	test	cx, cx
	jl	SHORT $L467
	cmp	cx, 199					; 000000c7H
	jg	SHORT $L467
; Line 193
	mov	edx, DWORD PTR _color$[esp+20]
	lea	eax, DWORD PTR [eax+eax*4]
	push	edx
	push	ecx
	shl	eax, 6
	push	esi
	add	ebp, eax
	call	_plot_pixel
	mov	eax, DWORD PTR _i$[esp+32]
	add	esp, 12					; 0000000cH
	inc	eax
	cmp	ax, bx
	mov	DWORD PTR _i$[esp+20], eax
	jl	SHORT $L374
$L467:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 197
	add	esp, 8
	ret	0
_drawline ENDP
_TEXT	ENDS
PUBLIC	_swap_buffers
;	COMDAT _swap_buffers
_TEXT	SEGMENT
_front_buffer$ = 8
_clear_color$ = 12
_swap_buffers PROC NEAR					; COMDAT
; Line 202
	mov	eax, DWORD PTR _clear_color$[esp-4]
	push	esi
	mov	esi, DWORD PTR _FBPTR
	and	eax, 255				; 000000ffH
	mov	dl, al
	push	edi
	mov	edi, DWORD PTR _front_buffer$[esp+4]
	mov	dh, dl
	mov	ecx, 16000				; 00003e80H
	mov	eax, edx
	rep movsd
	mov	edi, DWORD PTR _FBPTR
	mov	ecx, 16000				; 00003e80H
	shl	eax, 16					; 00000010H
	mov	ax, dx
	rep stosd
	pop	edi
	pop	esi
; Line 203
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
	push	esi
; Line 207
	mov	esi, DWORD PTR _y$[esp]
	test	esi, esi
	jl	SHORT $L390
	cmp	esi, 200				; 000000c8H
	jge	SHORT $L390
; Line 208
	mov	edx, DWORD PTR _x1$[esp]
	test	edx, edx
	jge	SHORT $L391
	xor	edx, edx
; Line 209
	jmp	SHORT $L392
$L391:
	cmp	edx, 320				; 00000140H
	jl	SHORT $L392
	mov	edx, 319				; 0000013fH
$L392:
; Line 210
	mov	ecx, DWORD PTR _x2$[esp]
	test	ecx, ecx
	jge	SHORT $L393
	xor	ecx, ecx
; Line 211
	jmp	SHORT $L394
$L393:
	cmp	ecx, 320				; 00000140H
	jl	SHORT $L394
	mov	ecx, 319				; 0000013fH
$L394:
; Line 212
	cmp	edx, ecx
	jle	SHORT $L395
; Line 213
	mov	eax, edx
	mov	edx, ecx
	mov	ecx, eax
$L395:
; Line 215
	mov	eax, DWORD PTR _color$[esp]
	push	ebx
	push	edi
	and	eax, 255				; 000000ffH
	lea	edi, DWORD PTR [esi+esi*4]
	mov	esi, DWORD PTR _FBPTR
	mov	bl, al
	sub	ecx, edx
	shl	edi, 6
	mov	bh, bl
	add	edi, esi
	mov	eax, ebx
	add	edi, edx
	mov	edx, ecx
	shl	eax, 16					; 00000010H
	mov	ax, bx
	shr	ecx, 2
	rep stosd
	mov	ecx, edx
	and	ecx, 3
	rep stosb
	pop	edi
	pop	ebx
$L390:
	pop	esi
; Line 216
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
_s1$ = -12
_s2$ = 24
_s3$ = 16
_ss$ = 12
_se$ = -8
_end$ = 8
_xmid$ = -4
_fill_tri PROC NEAR					; COMDAT
; Line 217
	sub	esp, 12					; 0000000cH
	push	ebx
	push	ebp
; Line 225
	mov	ebp, DWORD PTR _x1$[esp+16]
	push	esi
	cmp	ebp, -320				; fffffec0H
	push	edi
	jl	$L417
	cmp	ebp, 640				; 00000280H
	jg	$L417
	mov	edi, DWORD PTR _x2$[esp+24]
	cmp	edi, -320				; fffffec0H
	jl	$L417
	cmp	edi, 640				; 00000280H
	jg	$L417
	mov	edx, DWORD PTR _x3$[esp+24]
	cmp	edx, -320				; fffffec0H
	jl	$L417
	cmp	edx, 640				; 00000280H
	jg	$L417
	mov	eax, DWORD PTR _y1$[esp+24]
	cmp	eax, -200				; ffffff38H
	jl	$L417
	cmp	eax, 400				; 00000190H
	jg	$L417
	mov	ecx, DWORD PTR _y2$[esp+24]
	cmp	ecx, -200				; ffffff38H
	jl	$L417
	cmp	ecx, 400				; 00000190H
	jg	$L417
	mov	ebx, DWORD PTR _y3$[esp+24]
	cmp	ebx, -200				; ffffff38H
	jl	$L417
	cmp	ebx, 400				; 00000190H
	jg	$L417
; Line 234
	cmp	eax, ecx
	jle	SHORT $L418
; Line 235
	mov	esi, ebp
; Line 236
	mov	DWORD PTR _y1$[esp+24], ecx
	mov	ebp, edi
	mov	DWORD PTR _y2$[esp+24], eax
	mov	ecx, eax
	mov	eax, DWORD PTR _y1$[esp+24]
	mov	edi, esi
$L418:
; Line 238
	cmp	ecx, ebx
	jle	SHORT $L419
; Line 239
	mov	esi, edi
	mov	edi, edx
; Line 240
	mov	DWORD PTR _y3$[esp+24], ecx
	mov	DWORD PTR _x3$[esp+24], esi
	mov	DWORD PTR _y2$[esp+24], ebx
	mov	edx, esi
	mov	ecx, ebx
$L419:
; Line 242
	cmp	eax, ecx
	jle	SHORT $L420
; Line 243
	mov	esi, ebp
; Line 244
	mov	DWORD PTR _y1$[esp+24], ecx
	mov	ebp, edi
	mov	DWORD PTR _y2$[esp+24], eax
	mov	ecx, eax
	mov	eax, DWORD PTR _y1$[esp+24]
	mov	edi, esi
$L420:
; Line 247
	mov	ebx, ebp
	mov	esi, eax
	shl	ebx, 16					; 00000010H
; Line 251
	cmp	eax, DWORD PTR _y3$[esp+24]
	mov	DWORD PTR -8+[esp+28], ebx
	mov	DWORD PTR _end$[esp+24], ebx
	je	$L417
; Line 252
	cmp	eax, ecx
	jne	SHORT $L483
	mov	DWORD PTR _s1$[esp+28], 0
	jmp	SHORT $L484
$L483:
	sub	ecx, eax
	mov	eax, edi
	sub	eax, ebp
	shl	ecx, 16					; 00000010H
	shl	eax, 16					; 00000010H
	push	ecx
	push	eax
	call	_fixed_div
	mov	edx, DWORD PTR _x3$[esp+32]
	mov	DWORD PTR _s1$[esp+36], eax
	mov	eax, DWORD PTR _y1$[esp+32]
	add	esp, 8
$L484:
; Line 253
	mov	ecx, DWORD PTR _y3$[esp+24]
	sub	edx, ebp
	sub	ecx, eax
	shl	ecx, 16					; 00000010H
	shl	edx, 16					; 00000010H
	push	ecx
	push	edx
	call	_fixed_div
; Line 254
	mov	edx, DWORD PTR _y3$[esp+32]
	mov	ecx, DWORD PTR _y2$[esp+32]
	add	esp, 8
	cmp	edx, ecx
	mov	DWORD PTR _s3$[esp+24], eax
	jne	SHORT $L485
	mov	DWORD PTR _s2$[esp+24], 0
	jmp	SHORT $L486
$L485:
	mov	eax, DWORD PTR _x3$[esp+24]
	sub	edx, ecx
	sub	eax, edi
	shl	edx, 16					; 00000010H
	shl	eax, 16					; 00000010H
	push	edx
	push	eax
	call	_fixed_div
	mov	edx, DWORD PTR _y3$[esp+32]
	mov	ecx, DWORD PTR _y2$[esp+32]
	add	esp, 8
	mov	DWORD PTR _s2$[esp+24], eax
$L486:
; Line 256
	cmp	DWORD PTR _y1$[esp+24], ecx
	jne	SHORT $L427
; Line 258
	cmp	ebp, edi
	jge	SHORT $L423
; Line 259
	mov	ebx, DWORD PTR -8+[esp+28]
; Line 260
	mov	eax, edi
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _end$[esp+24], eax
; Line 261
	jmp	SHORT $L491
$L423:
; Line 263
	mov	eax, DWORD PTR -8+[esp+28]
	mov	ebx, edi
	shl	ebx, 16					; 00000010H
	mov	DWORD PTR _end$[esp+24], eax
$L491:
; Line 265
	cmp	DWORD PTR _y1$[esp+24], edx
	jge	SHORT $L427
	jmp	SHORT $L426
$L495:
	mov	eax, DWORD PTR _end$[esp+24]
$L426:
; Line 271
	mov	ecx, DWORD PTR _color$[esp+24]
	mov	edx, ebx
	push	ecx
	push	esi
	sar	eax, 16					; 00000010H
	sar	edx, 16					; 00000010H
	push	eax
	push	edx
	call	_draw_span
; Line 272
	mov	eax, DWORD PTR _s3$[esp+40]
	add	esp, 16					; 00000010H
	cmp	ebp, edi
	jl	SHORT $L488
	mov	eax, DWORD PTR _s2$[esp+24]
$L488:
	add	ebx, eax
; Line 273
	mov	eax, DWORD PTR _s2$[esp+24]
	cmp	ebp, edi
	jl	SHORT $L490
	mov	eax, DWORD PTR _s3$[esp+24]
$L490:
	mov	edx, DWORD PTR _end$[esp+24]
	add	edx, eax
	mov	eax, DWORD PTR _y3$[esp+24]
; Line 274
	inc	esi
	mov	DWORD PTR _end$[esp+24], edx
	cmp	esi, eax
	jl	SHORT $L495
; Line 265
	mov	ecx, DWORD PTR _y2$[esp+24]
$L427:
; Line 278
	mov	edx, DWORD PTR _y1$[esp+24]
	mov	eax, DWORD PTR _s3$[esp+24]
	sub	ecx, edx
	shl	ecx, 16					; 00000010H
	push	ecx
	push	eax
	call	_fixed_mul
	sar	eax, 16					; 00000010H
	add	eax, ebp
	add	esp, 8
; Line 282
	cmp	eax, edi
	mov	DWORD PTR _xmid$[esp+28], eax
	jge	SHORT $L428
; Line 283
	mov	ecx, DWORD PTR _s1$[esp+28]
; Line 284
	mov	edx, DWORD PTR _s3$[esp+24]
	mov	DWORD PTR _se$[esp+28], ecx
; Line 285
	jmp	SHORT $L499
$L428:
; Line 286
	mov	ecx, DWORD PTR _s3$[esp+24]
; Line 287
	mov	edx, DWORD PTR _s1$[esp+28]
	mov	DWORD PTR _se$[esp+28], ecx
$L499:
; Line 293
	mov	ecx, DWORD PTR _y3$[esp+24]
	mov	DWORD PTR _ss$[esp+24], edx
	cmp	esi, ecx
	jge	SHORT $L417
	jmp	SHORT $L431
$L496:
	mov	eax, DWORD PTR _xmid$[esp+28]
$L431:
; Line 294
	cmp	esi, DWORD PTR _y2$[esp+24]
	jne	SHORT $L435
; Line 295
	cmp	eax, edi
	jge	SHORT $L434
; Line 296
	mov	eax, DWORD PTR _s2$[esp+24]
	mov	DWORD PTR _se$[esp+28], eax
; Line 297
	jmp	SHORT $L435
$L434:
; Line 298
	mov	ecx, DWORD PTR _s2$[esp+24]
	mov	DWORD PTR _ss$[esp+24], ecx
$L435:
; Line 304
	mov	ebp, DWORD PTR _end$[esp+24]
; Line 305
	mov	edx, DWORD PTR _color$[esp+24]
	mov	eax, ebp
	mov	ecx, ebx
	push	edx
	push	esi
	sar	eax, 16					; 00000010H
	sar	ecx, 16					; 00000010H
	push	eax
	push	ecx
	call	_draw_span
; Line 306
	mov	eax, DWORD PTR _ss$[esp+40]
; Line 307
	mov	edx, DWORD PTR _se$[esp+44]
	add	esp, 16					; 00000010H
	add	ebx, eax
	mov	eax, DWORD PTR _y3$[esp+24]
	add	ebp, edx
; Line 308
	inc	esi
	mov	DWORD PTR _end$[esp+24], ebp
	cmp	esi, eax
	jl	SHORT $L496
$L417:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 313
	add	esp, 12					; 0000000cH
	ret	0
_fill_tri ENDP
_TEXT	ENDS
END
