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
; Line 16
	mov	ax, WORD PTR _x$[esp-4]
	cmp	ax, 320					; 00000140H
	jae	SHORT $L465
	mov	cx, WORD PTR _y$[esp-4]
	cmp	cx, 200					; 000000c8H
	jae	SHORT $L465
; Line 17
	and	ecx, 65535				; 0000ffffH
	and	eax, 65535				; 0000ffffH
	mov	dl, BYTE PTR _color$[esp-4]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	shl	ecx, 6
	add	ecx, eax
	mov	eax, DWORD PTR _FBPTR
	mov	BYTE PTR [ecx+eax], dl
; Line 19
$L465:
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
	jae	SHORT $L471
	mov	cx, WORD PTR _y$[esp-4]
	cmp	cx, 200					; 000000c8H
	jae	SHORT $L471
	and	ecx, 65535				; 0000ffffH
	and	eax, 65535				; 0000ffffH
	mov	dl, BYTE PTR _c$[esp-4]
	lea	ecx, DWORD PTR [ecx+ecx*4]
	shl	ecx, 6
	add	ecx, eax
	mov	eax, DWORD PTR _FBPTR
; Line 23
	or	BYTE PTR [ecx+eax], dl
; Line 25
$L471:
	ret	0
_bitset_pixel ENDP
_TEXT	ENDS
PUBLIC	__draw_line
;	COMDAT __draw_line
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_addrInc$ = -8
_yLonger$ = -4
_endVal$ = -12
__draw_line PROC NEAR					; COMDAT
; Line 27
	sub	esp, 12					; 0000000cH
	mov	DWORD PTR _yLonger$[esp+12], 0
	push	ebx
	push	esi
	mov	ebx, DWORD PTR _x$[esp+16]
	push	edi
	mov	edi, DWORD PTR _y$[esp+20]
	push	ebp
; Line 38
	test	ebx, ebx
	jl	SHORT $L629
	test	edi, edi
	jl	SHORT $L629
	cmp	ebx, 319				; 0000013fH
	jg	SHORT $L629
	cmp	edi, 199				; 000000c7H
	jle	SHORT $L630
$L629:
	mov	ecx, DWORD PTR _x2$[esp+24]
	test	ecx, ecx
	jl	$L479
	mov	ebp, DWORD PTR _y2$[esp+24]
	test	ebp, ebp
	jl	$L479
	cmp	ecx, 319				; 0000013fH
	jg	$L479
	cmp	ebp, 199				; 000000c7H
	jg	$L479
	jmp	SHORT $L490
$L630:
	mov	ecx, DWORD PTR _x2$[esp+24]
	mov	ebp, DWORD PTR _y2$[esp+24]
; Line 39
$L490:
	test	ecx, ecx
	jge	SHORT $L493
; Line 41
	mov	eax, edi
	sub	ecx, ebx
	sub	eax, ebp
	imul	eax, ebx
	cdq
	idiv	ecx
	xor	ecx, ecx
	lea	ebp, DWORD PTR [edi+eax]
; Line 44
$L493:
	test	ebx, ebx
	jge	SHORT $L494
; Line 46
	mov	eax, ebp
	sub	ebx, ecx
	sub	eax, edi
	imul	eax, ecx
	cdq
	idiv	ebx
	xor	ebx, ebx
	lea	edi, DWORD PTR [ebp+eax]
; Line 50
$L494:
	cmp	ecx, 319				; 0000013fH
	jle	SHORT $L495
; Line 52
	sub	ebp, edi
	mov	eax, 320				; 00000140H
	sub	eax, ebx
	sub	ecx, ebx
	imul	ebp, eax
	mov	eax, ebp
	cdq
	idiv	ecx
	mov	ecx, 319				; 0000013fH
	lea	ebp, DWORD PTR [edi+eax]
; Line 55
$L495:
	cmp	ebx, 319				; 0000013fH
	jle	SHORT $L496
; Line 57
	sub	edi, ebp
	mov	eax, 320				; 00000140H
	sub	eax, ecx
	sub	ebx, ecx
	imul	edi, eax
	mov	eax, edi
	cdq
	idiv	ebx
	mov	ebx, 319				; 0000013fH
	lea	edi, DWORD PTR [ebp+eax]
; Line 61
$L496:
	test	ebp, ebp
	jge	SHORT $L497
; Line 63
	mov	eax, ebx
	sub	ebp, edi
	sub	eax, ecx
	imul	eax, edi
	cdq
	idiv	ebp
	xor	ebp, ebp
	lea	ecx, DWORD PTR [ebx+eax]
; Line 66
$L497:
	test	edi, edi
	jge	SHORT $L498
; Line 68
	mov	eax, ecx
	sub	edi, ebp
	sub	eax, ebx
	imul	eax, ebp
	cdq
	idiv	edi
	xor	edi, edi
	lea	ebx, DWORD PTR [ecx+eax]
; Line 72
$L498:
	cmp	ebp, 199				; 000000c7H
	jle	SHORT $L499
; Line 74
	mov	eax, ecx
	sub	ebp, edi
	sub	eax, ebx
	mov	ecx, 200				; 000000c8H
	sub	ecx, edi
	imul	eax, ecx
	cdq
	idiv	ebp
	mov	ebp, 199				; 000000c7H
	lea	ecx, DWORD PTR [ebx+eax]
; Line 77
$L499:
	cmp	edi, 199				; 000000c7H
	jle	SHORT $L500
; Line 79
	mov	eax, ebx
	mov	edx, 200				; 000000c8H
	sub	eax, ecx
	sub	edx, ebp
	imul	eax, edx
	cdq
	sub	edi, ebp
	idiv	edi
	mov	edi, 199				; 000000c7H
	lea	ebx, DWORD PTR [ecx+eax]
; Line 83
$L500:
	sub	ebp, edi
	sub	ecx, ebx
; Line 85
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
	jle	SHORT $L501
; Line 86
	mov	DWORD PTR _yLonger$[esp+28], 1
	mov	eax, ebp
; Line 87
	mov	ebp, ecx
; Line 88
	mov	ecx, eax
; Line 91
$L501:
	mov	DWORD PTR _endVal$[esp+28], ecx
	test	ecx, ecx
; Line 92
	jge	SHORT $L503
; Line 93
	neg	ecx
	mov	DWORD PTR _addrInc$[esp+28], -320	; fffffec0H
	mov	esi, -1
; Line 97
	jmp	SHORT $L504
$L503:
; Line 98
	mov	DWORD PTR _addrInc$[esp+28], 320	; 00000140H
	mov	esi, 1
; Line 100
$L504:
; Line 101
	mov	eax, 0
	test	ecx, ecx
	je	SHORT $L506
; Line 102
	mov	eax, ebp
	shl	eax, 16					; 00000010H
	cdq
	idiv	ecx
$L506:
; Line 103
	xor	edx, edx
	xor	ecx, ecx
; Line 104
	lea	edi, DWORD PTR [edi+edi*4]
	shl	edi, 6
	add	edi, ebx
	add	edi, DWORD PTR _FBPTR
; Line 106
	cmp	DWORD PTR _yLonger$[esp+28], edx
	je	SHORT $L507
; Line 108
	cmp	DWORD PTR _endVal$[esp+28], edx
	je	SHORT $L479
$L508:
; Line 110
	mov	ebp, ecx
	mov	bl, BYTE PTR _color$[esp+24]
	sar	ebp, 16					; 00000010H
	add	ecx, eax
	add	edx, esi
	mov	BYTE PTR [ebp+edi], bl
; Line 108
	add	edi, DWORD PTR _addrInc$[esp+28]
	cmp	DWORD PTR _endVal$[esp+28], edx
	jne	SHORT $L508
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 115
$L507:
; Line 116
	xor	ebx, ebx
	cmp	DWORD PTR _endVal$[esp+28], ebx
	je	SHORT $L479
$L512:
; Line 117
	mov	ebp, ecx
	mov	dl, BYTE PTR _color$[esp+24]
	sar	ebp, 16					; 00000010H
	add	ecx, eax
	add	ebx, esi
	lea	ebp, DWORD PTR [ebp+ebp*4]
	shl	ebp, 6
	mov	BYTE PTR [ebp+edi], dl
; Line 116
	add	edi, esi
	cmp	DWORD PTR _endVal$[esp+28], ebx
	jne	SHORT $L512
; Line 125
$L479:
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
; Line 129
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	mov	bx, WORD PTR _x2$[esp+16]
	push	edi
	mov	di, WORD PTR _x1$[esp+20]
	push	ebp
; Line 132
	sub	bx, di
; Line 133
	movsx	eax, bx
	mov	cx, WORD PTR _y2$[esp+24]
	cdq
	mov	si, WORD PTR _y1$[esp+24]
	xor	eax, edx
	sub	cx, si
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
	jl	SHORT $L633
	mov	ax, 1
	jg	SHORT $L641
	xor	ax, ax
$L641:
	mov	WORD PTR _sdx$[esp+28], ax
	jmp	SHORT $L634
$L633:
	mov	WORD PTR _sdx$[esp+28], -1
$L634:
; Line 137
	test	cx, cx
	jl	SHORT $L635
	mov	ax, 1
	jg	SHORT $L642
	xor	ax, ax
$L642:
	mov	WORD PTR _sdy$[esp+28], ax
	jmp	SHORT $L636
$L635:
	mov	WORD PTR _sdy$[esp+28], -1
$L636:
; Line 138
	mov	bp, WORD PTR _dyabs$[esp+28]
	sar	bp, 1
; Line 139
	mov	ax, WORD PTR _dxabs$[esp+28]
	sar	ax, 1
	mov	WORD PTR _y$[esp+28], ax
; Line 143
	test	di, di
	jl	$L520
	cmp	di, 319					; 0000013fH
	jg	$L520
	test	si, si
	jl	$L520
	cmp	si, 199					; 000000c7H
	jg	$L520
; Line 147
	mov	ax, si
	mov	cl, BYTE PTR _color$[esp+24]
	imul	ax, 320					; 00000140H
	push	ecx
	push	esi
	lea	ebx, DWORD PTR [eax+edi]
	push	edi
; Line 150
	call	_plot_pixel
	mov	ax, WORD PTR _dxabs$[esp+40]
	add	esp, 12					; 0000000cH
; Line 154
	cmp	WORD PTR _dyabs$[esp+28], ax
	jg	$L535
; Line 156
	xor	bp, bp
	cmp	ax, bp
	jle	$L520
$L536:
; Line 158
	mov	ax, WORD PTR _dyabs$[esp+28]
	add	WORD PTR _y$[esp+28], ax
; Line 159
	mov	cx, WORD PTR _y$[esp+28]
	cmp	WORD PTR _dxabs$[esp+28], cx
	jg	SHORT $L539
; Line 161
	mov	ax, WORD PTR _dxabs$[esp+28]
	sub	WORD PTR _y$[esp+28], ax
; Line 163
	mov	ax, WORD PTR _sdy$[esp+28]
	add	si, WORD PTR _sdy$[esp+28]
	imul	ax, 320					; 00000140H
	add	bx, ax
; Line 165
$L539:
	add	di, WORD PTR _sdx$[esp+28]
; Line 167
	js	$L520
	cmp	di, 319					; 0000013fH
	jg	$L520
	test	si, si
	jl	$L520
	cmp	si, 199					; 000000c7H
	jg	$L520
; Line 171
	add	bx, WORD PTR _sdx$[esp+28]
	mov	al, BYTE PTR _color$[esp+24]
; Line 172
	inc	bp
	push	eax
	push	esi
	push	edi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 156
	cmp	WORD PTR _dxabs$[esp+28], bp
	jg	SHORT $L536
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 175
$L535:
; Line 177
	mov	WORD PTR _i$[esp+28], 0
	cmp	WORD PTR _dyabs$[esp+28], 0
	jle	SHORT $L520
$L543:
; Line 179
	add	bp, WORD PTR _dxabs$[esp+28]
; Line 180
	cmp	WORD PTR _dyabs$[esp+28], bp
	jg	SHORT $L546
; Line 182
	sub	bp, WORD PTR _dyabs$[esp+28]
; Line 183
	add	di, WORD PTR _sdx$[esp+28]
; Line 184
	add	bx, WORD PTR _sdx$[esp+28]
; Line 186
$L546:
	add	si, WORD PTR _sdy$[esp+28]
; Line 188
	test	di, di
	jl	SHORT $L520
	cmp	di, 319					; 0000013fH
	jg	SHORT $L520
	test	si, si
	jl	SHORT $L520
	cmp	si, 199					; 000000c7H
	jg	SHORT $L520
; Line 192
	mov	ax, WORD PTR _sdy$[esp+28]
	mov	cl, BYTE PTR _color$[esp+24]
	imul	ax, 320					; 00000140H
	add	bx, ax
	push	ecx
; Line 193
	push	esi
	push	edi
	call	_plot_pixel
	mov	ax, WORD PTR _dyabs$[esp+40]
	add	esp, 12					; 0000000cH
; Line 177
	inc	WORD PTR _i$[esp+28]
	cmp	ax, WORD PTR _i$[esp+28]
	jg	SHORT $L543
; Line 197
$L520:
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
; Line 201
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
; Line 202
	ret	0
_draw_line ENDP
_TEXT	ENDS
PUBLIC	_swap_buffers
;	COMDAT _swap_buffers
_TEXT	SEGMENT
_front_buffer$ = 8
_clear_color$ = 12
_swap_buffers PROC NEAR					; COMDAT
; Line 204
	push	esi
	mov	edx, DWORD PTR _FBPTR
	push	edi
	mov	esi, edx
; Line 205
	mov	edi, DWORD PTR _front_buffer$[esp+4]
	mov	ecx, 16000				; 00003e80H
	rep	movsd
; Line 206
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
; Line 207
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
; Line 209
	push	ebx
	push	esi
	mov	esi, DWORD PTR _y$[esp+4]
	push	edi
; Line 211
	test	esi, esi
	jl	SHORT $L562
	cmp	esi, 200				; 000000c8H
	jge	SHORT $L562
; Line 212
	mov	ecx, DWORD PTR _x1$[esp+8]
	test	ecx, ecx
	jge	SHORT $L566
	xor	ecx, ecx
; Line 213
$L566:
	cmp	ecx, 320				; 00000140H
	jl	SHORT $L567
	mov	ecx, 319				; 0000013fH
; Line 214
$L567:
	mov	edx, DWORD PTR _x2$[esp+8]
	test	edx, edx
	jge	SHORT $L568
	xor	edx, edx
; Line 215
$L568:
	cmp	edx, 320				; 00000140H
	jl	SHORT $L569
	mov	edx, 319				; 0000013fH
; Line 216
$L569:
	cmp	edx, ecx
	jge	SHORT $L570
; Line 217
	mov	eax, ecx
	mov	ecx, edx
	mov	edx, eax
; Line 219
$L570:
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
; Line 220
$L562:
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
_y3$ = 28
_color$ = 32
_s1$ = -4
_s3$ = -16
_ss$ = -4
_se$ = -12
_xmid$ = -8
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_x3$ = 24
_fill_tri PROC NEAR					; COMDAT
; Line 223
	sub	esp, 16					; 00000010H
	mov	eax, -320				; fffffec0H
	cmp	DWORD PTR _x1$[esp+12], eax
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 231
	jl	$L578
	mov	ecx, 640				; 00000280H
	cmp	DWORD PTR _x1$[esp+28], ecx
	jg	$L578
	cmp	DWORD PTR _x2$[esp+28], eax
	jl	$L578
	cmp	DWORD PTR _x2$[esp+28], ecx
	jg	$L578
	mov	ebp, DWORD PTR _x3$[esp+28]
	cmp	ebp, eax
	jl	$L578
	cmp	ebp, ecx
	jg	$L578
	mov	eax, -200				; ffffff38H
	cmp	DWORD PTR _y1$[esp+28], eax
	jl	$L578
	mov	ecx, 400				; 00000190H
	cmp	DWORD PTR _y1$[esp+28], ecx
	jg	$L578
	cmp	DWORD PTR _y2$[esp+28], eax
	jl	$L578
	cmp	DWORD PTR _y2$[esp+28], ecx
	jg	$L578
	cmp	DWORD PTR _y3$[esp+28], eax
	jl	$L578
	cmp	DWORD PTR _y3$[esp+28], ecx
	jg	$L578
; Line 240
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L593
; Line 241
	mov	eax, DWORD PTR _x1$[esp+28]
	mov	ecx, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y1$[esp+28]
	mov	DWORD PTR _x1$[esp+28], ecx
	mov	DWORD PTR _x2$[esp+28], eax
; Line 242
	mov	eax, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _y1$[esp+28], eax
	mov	DWORD PTR _y2$[esp+28], edx
; Line 244
$L593:
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jge	SHORT $L594
; Line 245
	mov	eax, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _x2$[esp+28], ebp
	mov	DWORD PTR _y2$[esp+28], ecx
	mov	ebp, eax
	mov	DWORD PTR _y3$[esp+28], edx
; Line 248
$L594:
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L595
; Line 249
	mov	eax, DWORD PTR _x1$[esp+28]
	mov	ecx, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y1$[esp+28]
	mov	DWORD PTR _x1$[esp+28], ecx
	mov	DWORD PTR _x2$[esp+28], eax
; Line 250
	mov	eax, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _y1$[esp+28], eax
	mov	DWORD PTR _y2$[esp+28], edx
; Line 252
$L595:
	mov	ebx, DWORD PTR _y1$[esp+28]
	mov	edi, DWORD PTR _x1$[esp+28]
	shl	edi, 16					; 00000010H
; Line 253
	cmp	DWORD PTR _y3$[esp+28], ebx
	mov	esi, edi
; Line 257
	je	$L578
; Line 258
	cmp	DWORD PTR _y2$[esp+28], ebx
	jne	SHORT $L651
	mov	DWORD PTR _s1$[esp+32], 0
	jmp	SHORT $L652
$L651:
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
$L652:
; Line 259
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
; Line 260
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jne	SHORT $L653
	xor	ebp, ebp
	jmp	SHORT $L654
$L653:
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
$L654:
; Line 262
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jne	SHORT $L663
; Line 264
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jle	SHORT $L598
; Line 265
	mov	esi, edi
; Line 266
	mov	edi, ecx
	shl	edi, 16					; 00000010H
; Line 267
	jmp	SHORT $L659
$L598:
; Line 268
	mov	esi, DWORD PTR _x2$[esp+28]
	shl	esi, 16					; 00000010H
; Line 269
$L659:
; Line 271
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jle	SHORT $L663
$L601:
; Line 272
	mov	edx, esi
	mov	ecx, edi
	sar	edx, 16					; 00000010H
	mov	al, BYTE PTR _color$[esp+28]
; Line 273
	sar	ecx, 16					; 00000010H
	push	eax
; Line 277
	push	ebx
	push	ecx
	push	edx
	call	_draw_span
	mov	ecx, DWORD PTR _x2$[esp+44]
	add	esp, 16					; 00000010H
; Line 278
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L655
	add	esi, ebp
	jmp	SHORT $L656
$L655:
	add	esi, DWORD PTR _s3$[esp+32]
$L656:
; Line 279
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L657
	add	edi, DWORD PTR _s3$[esp+32]
	jmp	SHORT $L658
$L657:
	add	edi, ebp
$L658:
; Line 280
	inc	ebx
; Line 281
	cmp	DWORD PTR _y3$[esp+28], ebx
	jg	SHORT $L601
$L663:
; Line 284
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
; Line 288
	jle	SHORT $L603
; Line 289
	mov	eax, DWORD PTR _s1$[esp+32]
	mov	ecx, DWORD PTR _s3$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 290
	jmp	SHORT $L665
; Line 291
$L603:
; Line 292
	mov	eax, DWORD PTR _s3$[esp+32]
	mov	ecx, DWORD PTR _s1$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 293
$L665:
	mov	DWORD PTR _ss$[esp+32], ecx
	cmp	DWORD PTR _y3$[esp+28], ebx
; Line 299
	jle	SHORT $L578
$L606:
; Line 300
	cmp	DWORD PTR _y2$[esp+28], ebx
	jne	SHORT $L608
; Line 301
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _xmid$[esp+32]
	jle	SHORT $L609
; Line 302
	mov	DWORD PTR _se$[esp+32], ebp
; Line 303
	jmp	SHORT $L608
$L609:
; Line 304
	mov	DWORD PTR _ss$[esp+32], ebp
; Line 309
$L608:
	mov	ecx, esi
	mov	edx, edi
	sar	ecx, 16					; 00000010H
	mov	al, BYTE PTR _color$[esp+28]
; Line 310
	sar	edx, 16					; 00000010H
	push	eax
; Line 311
	push	ebx
	push	edx
	push	ecx
	inc	ebx
	call	_draw_span
	add	esi, DWORD PTR _ss$[esp+48]
	add	edi, DWORD PTR _se$[esp+48]
	add	esp, 16					; 00000010H
; Line 315
	cmp	DWORD PTR _y3$[esp+28], ebx
	jg	SHORT $L606
; Line 319
$L578:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_fill_tri ENDP
_TEXT	ENDS
END
