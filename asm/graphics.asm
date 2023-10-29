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
;	COMDAT __draw_line
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _drawline
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_line
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
	jae	SHORT $L363
	mov	cx, WORD PTR _y$[esp-4]
	cmp	cx, 200					; 000000c8H
	jae	SHORT $L363
; Line 16
	and	ecx, 65535				; 0000ffffH
	and	eax, 65535				; 0000ffffH
	mov	dl, BYTE PTR _color$[esp-4]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	shl	ecx, 6
	add	ecx, eax
	mov	eax, DWORD PTR _FBPTR
	mov	BYTE PTR [ecx+eax], dl
; Line 18
$L363:
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
; Line 21
	mov	ax, WORD PTR _x$[esp-4]
	cmp	ax, 320					; 00000140H
	jae	SHORT $L369
	mov	cx, WORD PTR _y$[esp-4]
	cmp	cx, 200					; 000000c8H
	jae	SHORT $L369
	and	ecx, 65535				; 0000ffffH
	and	eax, 65535				; 0000ffffH
	mov	dl, BYTE PTR _c$[esp-4]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	shl	ecx, 6
	add	ecx, eax
	mov	eax, DWORD PTR _FBPTR
; Line 22
	or	BYTE PTR [ecx+eax], dl
; Line 24
$L369:
	ret	0
_bitset_pixel ENDP
_TEXT	ENDS
PUBLIC	__draw_line
;	COMDAT __draw_line
_TEXT	SEGMENT
_endVal$ = -12
_x$ = 8
_y$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_addrInc$ = -8
_yLonger$ = -4
__draw_line PROC NEAR					; COMDAT
; Line 26
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _yLonger$[esp+12], 0
	push	ebx
	push	esi
	mov	ebx, DWORD PTR _y$[esp+16]
	push	edi
	mov	edi, DWORD PTR _x$[esp+20]
	push	ebp
; Line 37
	test	edi, edi
	jl	SHORT $L528
	test	ebx, ebx
	jl	SHORT $L528
	cmp	edi, 319				; 0000013fH
	jg	SHORT $L528
	cmp	ebx, 199				; 000000c7H
	jle	SHORT $L529
$L528:
	mov	ecx, DWORD PTR _x2$[esp+24]
	test	ecx, ecx
	jl	$L377
	mov	ebp, DWORD PTR _y2$[esp+24]
	test	ebp, ebp
	jl	$L377
	cmp	ecx, 319				; 0000013fH
	jg	$L377
	cmp	ebp, 199				; 000000c7H
	jg	$L377
	jmp	SHORT $L388
$L529:
	mov	ecx, DWORD PTR _x2$[esp+24]
	mov	ebp, DWORD PTR _y2$[esp+24]
; Line 38
$L388:
	test	ecx, ecx
	jge	SHORT $L391
; Line 40
	mov	eax, ebx
	sub	ecx, edi
	sub	eax, ebp
	imul	eax, edi
	cdq
	idiv	ecx
	xor	ecx, ecx
	lea	ebp, DWORD PTR [ebx+eax]
; Line 43
$L391:
	test	edi, edi
	jge	SHORT $L392
; Line 45
	mov	eax, ebp
	sub	edi, ecx
	sub	eax, ebx
	imul	eax, ecx
	cdq
	idiv	edi
	xor	edi, edi
	lea	ebx, DWORD PTR [ebp+eax]
; Line 49
$L392:
	cmp	ecx, 319				; 0000013fH
	jle	SHORT $L393
; Line 51
	sub	ebp, ebx
	mov	eax, 320				; 00000140H
	sub	eax, edi
	sub	ecx, edi
	imul	ebp, eax
	mov	eax, ebp
	cdq
	idiv	ecx
	mov	ecx, 319				; 0000013fH
	lea	ebp, DWORD PTR [ebx+eax]
; Line 54
$L393:
	cmp	edi, 319				; 0000013fH
	jle	SHORT $L394
; Line 56
	sub	ebx, ebp
	mov	eax, 320				; 00000140H
	sub	eax, ecx
	sub	edi, ecx
	imul	ebx, eax
	mov	eax, ebx
	cdq
	idiv	edi
	mov	edi, 319				; 0000013fH
	lea	ebx, DWORD PTR [ebp+eax]
; Line 60
$L394:
	test	ebp, ebp
	jge	SHORT $L395
; Line 62
	mov	eax, edi
	sub	ebp, ebx
	sub	eax, ecx
	imul	eax, ebx
	cdq
	idiv	ebp
	xor	ebp, ebp
	lea	ecx, DWORD PTR [edi+eax]
; Line 65
$L395:
	test	ebx, ebx
	jge	SHORT $L396
; Line 67
	mov	eax, ecx
	sub	ebx, ebp
	sub	eax, edi
	imul	eax, ebp
	cdq
	idiv	ebx
	xor	ebx, ebx
	lea	edi, DWORD PTR [ecx+eax]
; Line 71
$L396:
	cmp	ebp, 199				; 000000c7H
	jle	SHORT $L397
; Line 73
	mov	eax, ecx
	sub	ebp, ebx
	sub	eax, edi
	mov	ecx, 200				; 000000c8H
	sub	ecx, ebx
	imul	eax, ecx
	cdq
	idiv	ebp
	mov	ebp, 199				; 000000c7H
	lea	ecx, DWORD PTR [edi+eax]
; Line 76
$L397:
	cmp	ebx, 199				; 000000c7H
	jle	SHORT $L398
; Line 78
	mov	eax, edi
	mov	edx, 200				; 000000c8H
	sub	eax, ecx
	sub	edx, ebp
	imul	eax, edx
	cdq
	sub	ebx, ebp
	idiv	ebx
	mov	ebx, 199				; 000000c7H
	lea	edi, DWORD PTR [ecx+eax]
; Line 82
$L398:
	sub	ebp, ebx
	sub	ecx, edi
; Line 84
	mov	eax, ebp
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	esi, eax
	mov	eax, ecx
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	esi, eax
	jle	SHORT $L399
; Line 85
	mov	DWORD PTR _yLonger$[esp+28], 1
	mov	eax, ebp
; Line 86
	mov	ebp, ecx
; Line 87
	mov	ecx, eax
; Line 90
$L399:
	mov	DWORD PTR _endVal$[esp+28], ecx
	test	ecx, ecx
; Line 91
	jge	SHORT $L401
; Line 92
	neg	ecx
	mov	DWORD PTR _addrInc$[esp+28], -320	; fffffec0H
	mov	esi, -1
; Line 96
	jmp	SHORT $L402
$L401:
; Line 97
	mov	DWORD PTR _addrInc$[esp+28], 320	; 00000140H
	mov	esi, 1
; Line 99
$L402:
; Line 100
	mov	eax, 0
	test	ecx, ecx
	je	SHORT $L404
; Line 101
	mov	eax, ebp
	shl	eax, 16					; 00000010H
	cdq
	idiv	ecx
$L404:
; Line 102
	xor	ebp, ebp
	xor	ecx, ecx
; Line 103
	lea	ebx, DWORD PTR [ebx+ebx*4]
	shl	ebx, 6
	add	ebx, edi
	add	ebx, DWORD PTR _FBPTR
; Line 105
	cmp	DWORD PTR _yLonger$[esp+28], ebp
	je	SHORT $L405
; Line 107
	cmp	DWORD PTR _endVal$[esp+28], ebp
	je	SHORT $L377
$L406:
; Line 109
	mov	edi, ecx
	mov	dl, BYTE PTR _color$[esp+24]
	sar	edi, 16					; 00000010H
	add	ecx, eax
	add	ebp, esi
	mov	BYTE PTR [edi+ebx], dl
; Line 107
	add	ebx, DWORD PTR _addrInc$[esp+28]
	cmp	DWORD PTR _endVal$[esp+28], ebp
	jne	SHORT $L406
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 114
$L405:
; Line 115
	xor	edi, edi
	cmp	DWORD PTR _endVal$[esp+28], edi
	je	SHORT $L377
$L410:
; Line 116
	mov	ebp, ecx
	mov	dl, BYTE PTR _color$[esp+24]
	sar	ebp, 16					; 00000010H
	add	ecx, eax
	add	edi, esi
	lea	ebp, DWORD PTR [ebp+ebp*4]
	shl	ebp, 6
	mov	BYTE PTR [ebp+ebx], dl
; Line 115
	add	ebx, esi
	cmp	DWORD PTR _endVal$[esp+28], edi
	jne	SHORT $L410
; Line 124
$L377:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
__draw_line ENDP
_TEXT	ENDS
PUBLIC	_drawline
;	COMDAT _drawline
_TEXT	SEGMENT
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_i$ = -2
_sdx$ = -4
_sdy$ = -6
_dxabs$ = -8
_dyabs$ = -10
_y$ = -2
_drawline PROC NEAR					; COMDAT
; Line 128
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	mov	bx, WORD PTR _x2$[esp+16]
	push	edi
	mov	si, WORD PTR _x1$[esp+20]
	push	ebp
; Line 131
	sub	bx, si
; Line 132
	movsx	eax, bx
	mov	cx, WORD PTR _y2$[esp+24]
	cdq
	mov	di, WORD PTR _y1$[esp+24]
	xor	eax, edx
	sub	cx, di
	sub	eax, edx
; Line 133
	mov	WORD PTR _dxabs$[esp+28], ax
; Line 134
	movsx	eax, cx
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	WORD PTR _dyabs$[esp+28], ax
; Line 135
	test	bx, bx
	jl	SHORT $L532
	mov	ax, 1
	jg	SHORT $L540
	xor	ax, ax
$L540:
	mov	WORD PTR _sdx$[esp+28], ax
	jmp	SHORT $L533
$L532:
	mov	WORD PTR _sdx$[esp+28], -1
$L533:
; Line 136
	test	cx, cx
	jl	SHORT $L534
	mov	ax, 1
	jg	SHORT $L541
	xor	ax, ax
$L541:
	mov	WORD PTR _sdy$[esp+28], ax
	jmp	SHORT $L535
$L534:
	mov	WORD PTR _sdy$[esp+28], -1
$L535:
; Line 137
	mov	bp, WORD PTR _dyabs$[esp+28]
	sar	bp, 1
; Line 138
	mov	ax, WORD PTR _dxabs$[esp+28]
	sar	ax, 1
	mov	WORD PTR _y$[esp+28], ax
; Line 142
	test	si, si
	jl	$L419
	cmp	si, 319					; 0000013fH
	jg	$L419
	test	di, di
	jl	$L419
	cmp	di, 199					; 000000c7H
	jg	$L419
; Line 146
	mov	ax, di
	mov	cl, BYTE PTR _color$[esp+24]
	imul	ax, 320					; 00000140H
	push	ecx
	push	edi
	lea	ebx, DWORD PTR [eax+esi]
	push	esi
; Line 149
	call	_plot_pixel
	mov	ax, WORD PTR _dxabs$[esp+40]
	add	esp, 12					; 0000000cH
; Line 153
	cmp	WORD PTR _dyabs$[esp+28], ax
	jg	$L434
; Line 155
	xor	bp, bp
	cmp	ax, bp
	jle	$L419
$L435:
; Line 157
	mov	ax, WORD PTR _dyabs$[esp+28]
	add	WORD PTR _y$[esp+28], ax
; Line 158
	mov	cx, WORD PTR _y$[esp+28]
	cmp	cx, WORD PTR _dxabs$[esp+28]
	jl	SHORT $L438
; Line 160
	mov	ax, WORD PTR _dxabs$[esp+28]
	sub	WORD PTR _y$[esp+28], ax
; Line 162
	mov	ax, WORD PTR _sdy$[esp+28]
	add	di, WORD PTR _sdy$[esp+28]
	imul	ax, 320					; 00000140H
	add	bx, ax
; Line 164
$L438:
	add	si, WORD PTR _sdx$[esp+28]
; Line 166
	js	$L419
	cmp	si, 319					; 0000013fH
	jg	$L419
	test	di, di
	jl	$L419
	cmp	di, 199					; 000000c7H
	jg	$L419
; Line 170
	add	bx, WORD PTR _sdx$[esp+28]
	mov	al, BYTE PTR _color$[esp+24]
; Line 171
	inc	bp
	push	eax
	push	edi
	push	esi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 155
	cmp	bp, WORD PTR _dxabs$[esp+28]
	jl	SHORT $L435
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 174
$L434:
; Line 176
	mov	WORD PTR _i$[esp+28], 0
	cmp	WORD PTR _dyabs$[esp+28], 0
	jle	SHORT $L419
$L442:
; Line 178
	add	bp, WORD PTR _dxabs$[esp+28]
; Line 179
	cmp	bp, WORD PTR _dyabs$[esp+28]
	jl	SHORT $L445
; Line 181
	sub	bp, WORD PTR _dyabs$[esp+28]
; Line 182
	add	si, WORD PTR _sdx$[esp+28]
; Line 183
	add	bx, WORD PTR _sdx$[esp+28]
; Line 185
$L445:
	add	di, WORD PTR _sdy$[esp+28]
; Line 187
	test	si, si
	jl	SHORT $L419
	cmp	si, 319					; 0000013fH
	jg	SHORT $L419
	test	di, di
	jl	SHORT $L419
	cmp	di, 199					; 000000c7H
	jg	SHORT $L419
; Line 191
	mov	ax, WORD PTR _sdy$[esp+28]
	mov	cl, BYTE PTR _color$[esp+24]
	imul	ax, 320					; 00000140H
	add	bx, ax
	push	ecx
; Line 192
	push	edi
	push	esi
	call	_plot_pixel
	mov	ax, WORD PTR _dyabs$[esp+40]
	add	esp, 12					; 0000000cH
; Line 176
	inc	WORD PTR _i$[esp+28]
	cmp	WORD PTR _i$[esp+28], ax
	jl	SHORT $L442
; Line 196
$L419:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
_drawline ENDP
_TEXT	ENDS
PUBLIC	_draw_line
;	COMDAT _draw_line
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_draw_line PROC NEAR					; COMDAT
; Line 200
	mov	al, BYTE PTR _color$[esp-4]
	mov	ecx, DWORD PTR _y2$[esp-4]
	mov	edx, DWORD PTR _x2$[esp-4]
	push	eax
	mov	eax, DWORD PTR _y$[esp]
	push	ecx
	mov	ecx, DWORD PTR _x$[esp+4]
	push	edx
	push	eax
	push	ecx
	call	_drawline
	add	esp, 20					; 00000014H
; Line 201
	ret	0
_draw_line ENDP
_TEXT	ENDS
PUBLIC	_swap_buffers
;	COMDAT _swap_buffers
_TEXT	SEGMENT
_front_buffer$ = 8
_clear_color$ = 12
_swap_buffers PROC NEAR					; COMDAT
; Line 203
	push	esi
	mov	edx, DWORD PTR _FBPTR
	push	edi
	mov	esi, edx
; Line 204
	mov	edi, DWORD PTR _front_buffer$[esp+4]
	mov	ecx, 16000				; 00003e80H
	rep	movsd
; Line 205
	xor	eax, eax
	mov	edi, edx
	mov	al, BYTE PTR _clear_color$[esp+4]
	mov	ch, al
	mov	cl, al
	mov	eax, ecx
	shl	eax, 16					; 00000010H
	mov	ax, cx
	mov	ecx, 16000				; 00003e80H
	rep	stosd
; Line 206
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
; Line 208
	push	ebx
	push	esi
	mov	esi, DWORD PTR _y$[esp+4]
	push	edi
; Line 210
	test	esi, esi
	jl	SHORT $L461
	cmp	esi, 200				; 000000c8H
	jge	SHORT $L461
; Line 211
	mov	ecx, DWORD PTR _x1$[esp+8]
	test	ecx, ecx
	jge	SHORT $L465
	xor	ecx, ecx
; Line 212
$L465:
	cmp	ecx, 320				; 00000140H
	jl	SHORT $L466
	mov	ecx, 319				; 0000013fH
; Line 213
$L466:
	mov	edx, DWORD PTR _x2$[esp+8]
	test	edx, edx
	jge	SHORT $L467
	xor	edx, edx
; Line 214
$L467:
	cmp	edx, 320				; 00000140H
	jl	SHORT $L468
	mov	edx, 319				; 0000013fH
; Line 215
$L468:
	cmp	edx, ecx
	jge	SHORT $L469
; Line 216
	mov	eax, ecx
	mov	ecx, edx
	mov	edx, eax
; Line 218
$L469:
	sub	edx, ecx
	xor	eax, eax
	mov	al, BYTE PTR _color$[esp+8]
	lea	esi, DWORD PTR [esi+esi*4]
	shl	esi, 6
	mov	bh, al
	mov	bl, al
	add	esi, ecx
	mov	eax, ebx
	mov	edi, DWORD PTR _FBPTR
	shl	eax, 16					; 00000010H
	add	edi, esi
	mov	ax, bx
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 219
$L461:
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
_s1$ = -4
_s3$ = -16
_ss$ = -4
_se$ = -12
_xmid$ = -8
_fill_tri PROC NEAR					; COMDAT
; Line 222
	sub	esp, 16					; 00000010H
	mov	eax, -320				; fffffec0H
	cmp	DWORD PTR _x1$[esp+12], eax
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 230
	jl	$L477
	mov	ecx, 640				; 00000280H
	cmp	DWORD PTR _x1$[esp+28], ecx
	jg	$L477
	cmp	DWORD PTR _x2$[esp+28], eax
	jl	$L477
	cmp	DWORD PTR _x2$[esp+28], ecx
	jg	$L477
	mov	ebp, DWORD PTR _x3$[esp+28]
	cmp	ebp, eax
	jl	$L477
	cmp	ebp, ecx
	jg	$L477
	mov	eax, -200				; ffffff38H
	cmp	DWORD PTR _y1$[esp+28], eax
	jl	$L477
	mov	ecx, 400				; 00000190H
	cmp	DWORD PTR _y1$[esp+28], ecx
	jg	$L477
	cmp	DWORD PTR _y2$[esp+28], eax
	jl	$L477
	cmp	DWORD PTR _y2$[esp+28], ecx
	jg	$L477
	cmp	DWORD PTR _y3$[esp+28], eax
	jl	$L477
	cmp	DWORD PTR _y3$[esp+28], ecx
	jg	$L477
; Line 239
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L492
; Line 240
	mov	eax, DWORD PTR _x1$[esp+28]
	mov	ecx, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y1$[esp+28]
	mov	DWORD PTR _x1$[esp+28], ecx
	mov	DWORD PTR _x2$[esp+28], eax
; Line 241
	mov	eax, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _y1$[esp+28], eax
	mov	DWORD PTR _y2$[esp+28], edx
; Line 243
$L492:
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jge	SHORT $L493
; Line 244
	mov	eax, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _x2$[esp+28], ebp
	mov	DWORD PTR _y2$[esp+28], ecx
	mov	ebp, eax
	mov	DWORD PTR _y3$[esp+28], edx
; Line 247
$L493:
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L494
; Line 248
	mov	eax, DWORD PTR _x1$[esp+28]
	mov	ecx, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y1$[esp+28]
	mov	DWORD PTR _x1$[esp+28], ecx
	mov	DWORD PTR _x2$[esp+28], eax
; Line 249
	mov	eax, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _y1$[esp+28], eax
	mov	DWORD PTR _y2$[esp+28], edx
; Line 251
$L494:
	mov	ebx, DWORD PTR _y1$[esp+28]
	mov	edi, DWORD PTR _x1$[esp+28]
	shl	edi, 16					; 00000010H
; Line 252
	cmp	DWORD PTR _y3$[esp+28], ebx
	mov	esi, edi
; Line 256
	je	$L477
; Line 257
	cmp	DWORD PTR _y2$[esp+28], ebx
	jne	SHORT $L550
	mov	DWORD PTR _s1$[esp+32], 0
	jmp	SHORT $L551
$L550:
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
$L551:
; Line 258
	mov	eax, DWORD PTR _y3$[esp+28]
	sub	eax, DWORD PTR _y1$[esp+28]
	shl	eax, 16					; 00000010H
	push	eax
	mov	eax, ebp
	sub	eax, DWORD PTR _x1$[esp+32]
	shl	eax, 16					; 00000010H
	push	eax
	call	_fixed_div
	mov	ecx, DWORD PTR _y3$[esp+36]
	mov	DWORD PTR _s3$[esp+40], eax
	add	esp, 8
; Line 259
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jne	SHORT $L552
	xor	ebp, ebp
	jmp	SHORT $L553
$L552:
	mov	eax, DWORD PTR _y3$[esp+28]
	sub	ebp, DWORD PTR _x2$[esp+28]
	shl	ebp, 16					; 00000010H
	sub	eax, DWORD PTR _y2$[esp+28]
	shl	eax, 16					; 00000010H
	push	eax
	push	ebp
	call	_fixed_div
	add	esp, 8
	mov	ebp, eax
$L553:
; Line 261
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jne	SHORT $L562
; Line 263
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jle	SHORT $L497
; Line 264
	mov	esi, edi
; Line 265
	mov	edi, ecx
	shl	edi, 16					; 00000010H
; Line 266
	jmp	SHORT $L558
$L497:
; Line 267
	mov	esi, DWORD PTR _x2$[esp+28]
	shl	esi, 16					; 00000010H
; Line 268
$L558:
; Line 270
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jle	SHORT $L562
$L500:
; Line 271
	mov	edx, esi
	mov	ecx, edi
	sar	edx, 16					; 00000010H
	mov	al, BYTE PTR _color$[esp+28]
; Line 272
	sar	ecx, 16					; 00000010H
	push	eax
; Line 276
	push	ebx
	push	ecx
	push	edx
	call	_draw_span
	mov	ecx, DWORD PTR _x2$[esp+44]
	add	esp, 16					; 00000010H
; Line 277
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L554
	add	esi, ebp
	jmp	SHORT $L555
$L554:
	add	esi, DWORD PTR _s3$[esp+32]
$L555:
; Line 278
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L556
	add	edi, DWORD PTR _s3$[esp+32]
	jmp	SHORT $L557
$L556:
	add	edi, ebp
$L557:
; Line 279
	inc	ebx
; Line 280
	cmp	DWORD PTR _y3$[esp+28], ebx
	jg	SHORT $L500
$L562:
; Line 283
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
; Line 287
	jle	SHORT $L502
; Line 288
	mov	eax, DWORD PTR _s1$[esp+32]
	mov	ecx, DWORD PTR _s3$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 289
	jmp	SHORT $L564
; Line 290
$L502:
; Line 291
	mov	eax, DWORD PTR _s3$[esp+32]
	mov	ecx, DWORD PTR _s1$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 292
$L564:
	mov	DWORD PTR _ss$[esp+32], ecx
	cmp	DWORD PTR _y3$[esp+28], ebx
; Line 298
	jle	SHORT $L477
$L505:
; Line 299
	cmp	DWORD PTR _y2$[esp+28], ebx
	jne	SHORT $L507
; Line 300
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _xmid$[esp+32]
	jle	SHORT $L508
; Line 301
	mov	DWORD PTR _se$[esp+32], ebp
; Line 302
	jmp	SHORT $L507
$L508:
; Line 303
	mov	DWORD PTR _ss$[esp+32], ebp
; Line 308
$L507:
	mov	ecx, esi
	mov	edx, edi
	sar	ecx, 16					; 00000010H
	mov	al, BYTE PTR _color$[esp+28]
; Line 309
	sar	edx, 16					; 00000010H
	push	eax
; Line 310
	push	ebx
	push	edx
	push	ecx
	inc	ebx
	call	_draw_span
	add	esi, DWORD PTR _ss$[esp+48]
	add	edi, DWORD PTR _se$[esp+48]
	add	esp, 16					; 00000010H
; Line 314
	cmp	DWORD PTR _y3$[esp+28], ebx
	jg	SHORT $L505
; Line 318
$L477:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_fill_tri ENDP
_TEXT	ENDS
END
