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
	jae	SHORT $L363
	mov	cx, WORD PTR _y$[esp-4]
	cmp	cx, 200					; 000000c8H
	jae	SHORT $L363
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
; Line 22
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
; Line 23
	or	BYTE PTR [ecx+eax], dl
; Line 25
$L369:
	ret	0
_bitset_pixel ENDP
_TEXT	ENDS
PUBLIC	_draw_line
;	COMDAT _draw_line
_TEXT	SEGMENT
_endVal$ = -12
_x$ = 8
_y$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_addrInc$ = -8
_yLonger$ = -4
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
	jl	SHORT $L520
	test	ebx, ebx
	jl	SHORT $L520
	cmp	esi, 319				; 0000013fH
	jg	SHORT $L520
	cmp	ebx, 199				; 000000c7H
	jle	SHORT $L521
$L520:
	mov	ecx, DWORD PTR _x2$[esp+24]
	test	ecx, ecx
	jl	$L376
	mov	ebp, DWORD PTR _y2$[esp+24]
	test	ebp, ebp
	jl	$L376
	cmp	ecx, 319				; 0000013fH
	jg	$L376
	cmp	ebp, 199				; 000000c7H
	jg	$L376
	jmp	SHORT $L387
$L521:
	mov	ecx, DWORD PTR _x2$[esp+24]
	mov	ebp, DWORD PTR _y2$[esp+24]
; Line 39
$L387:
	test	ecx, ecx
	jge	SHORT $L390
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
$L390:
	test	esi, esi
	jge	SHORT $L391
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
$L391:
	cmp	ecx, 319				; 0000013fH
	jle	SHORT $L392
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
$L392:
	cmp	esi, 319				; 0000013fH
	jle	SHORT $L393
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
$L393:
	test	ebp, ebp
	jge	SHORT $L394
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
$L394:
	test	ebx, ebx
	jge	SHORT $L395
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
$L395:
	cmp	ebp, 199				; 000000c7H
	jle	SHORT $L396
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
$L396:
	cmp	ebx, 199				; 000000c7H
	jle	SHORT $L397
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
$L397:
	sub	ebp, ebx
	sub	ecx, esi
; Line 85
	mov	eax, ebp
	cdq
	xor	eax, edx
	sub	eax, edx
	mov	edi, eax
	mov	eax, ecx
	cdq
	xor	eax, edx
	sub	eax, edx
	cmp	edi, eax
	jle	SHORT $L398
; Line 86
	mov	DWORD PTR _yLonger$[esp+28], 1
	mov	eax, ebp
; Line 87
	mov	ebp, ecx
; Line 88
	mov	ecx, eax
; Line 91
$L398:
	mov	DWORD PTR _endVal$[esp+28], ecx
	test	ecx, ecx
; Line 92
	jge	SHORT $L400
; Line 93
	neg	ecx
	mov	DWORD PTR _addrInc$[esp+28], -320	; fffffec0H
	mov	edi, -1
; Line 97
	jmp	SHORT $L401
$L400:
; Line 98
	mov	DWORD PTR _addrInc$[esp+28], 320	; 00000140H
	mov	edi, 1
; Line 100
$L401:
; Line 101
	mov	eax, 0
	test	ecx, ecx
	je	SHORT $L403
; Line 102
	mov	eax, ebp
	shl	eax, 16					; 00000010H
	cdq
	idiv	ecx
$L403:
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
	je	SHORT $L404
; Line 108
	cmp	DWORD PTR _endVal$[esp+28], ebp
	je	SHORT $L376
	mov	dl, BYTE PTR _color$[esp+24]
$L405:
; Line 110
	mov	esi, ecx
	add	ebp, edi
	sar	esi, 16					; 00000010H
	add	ecx, eax
	mov	BYTE PTR [esi+ebx], dl
; Line 108
	add	ebx, DWORD PTR _addrInc$[esp+28]
	cmp	DWORD PTR _endVal$[esp+28], ebp
	jne	SHORT $L405
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 115
$L404:
; Line 116
	xor	esi, esi
	cmp	DWORD PTR _endVal$[esp+28], esi
	je	SHORT $L376
	mov	dl, BYTE PTR _color$[esp+24]
$L409:
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
	jne	SHORT $L409
; Line 125
$L376:
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
	jl	SHORT $L524
	mov	ax, 1
	jg	SHORT $L532
	xor	ax, ax
$L532:
	mov	WORD PTR _sdx$[esp+28], ax
	jmp	SHORT $L525
$L524:
	mov	WORD PTR _sdx$[esp+28], -1
$L525:
; Line 137
	test	cx, cx
	jl	SHORT $L526
	mov	ax, 1
	jg	SHORT $L533
	xor	ax, ax
$L533:
	mov	WORD PTR _sdy$[esp+28], ax
	jmp	SHORT $L527
$L526:
	mov	WORD PTR _sdy$[esp+28], -1
$L527:
; Line 138
	mov	bp, WORD PTR _dyabs$[esp+28]
	sar	bp, 1
; Line 139
	mov	ax, WORD PTR _dxabs$[esp+28]
	sar	ax, 1
	mov	WORD PTR _y$[esp+28], ax
; Line 143
	test	si, si
	jl	$L418
	cmp	si, 319					; 0000013fH
	jg	$L418
	test	di, di
	jl	$L418
	cmp	di, 199					; 000000c7H
	jg	$L418
; Line 147
	mov	ax, di
	mov	cl, BYTE PTR _color$[esp+24]
	imul	ax, 320					; 00000140H
	push	ecx
	push	edi
	lea	ebx, DWORD PTR [eax+esi]
	push	esi
; Line 150
	call	_plot_pixel
	mov	ax, WORD PTR _dxabs$[esp+40]
	add	esp, 12					; 0000000cH
; Line 154
	cmp	ax, WORD PTR _dyabs$[esp+28]
	jl	$L433
; Line 156
	xor	bp, bp
	cmp	ax, bp
	jle	$L418
$L434:
; Line 158
	mov	ax, WORD PTR _dyabs$[esp+28]
	add	WORD PTR _y$[esp+28], ax
; Line 159
	mov	cx, WORD PTR _y$[esp+28]
	cmp	WORD PTR _dxabs$[esp+28], cx
	jg	SHORT $L437
; Line 161
	mov	ax, WORD PTR _dxabs$[esp+28]
	sub	WORD PTR _y$[esp+28], ax
; Line 163
	mov	ax, WORD PTR _sdy$[esp+28]
	add	di, WORD PTR _sdy$[esp+28]
	imul	ax, 320					; 00000140H
	add	bx, ax
; Line 165
$L437:
	add	si, WORD PTR _sdx$[esp+28]
; Line 167
	js	$L418
	cmp	si, 319					; 0000013fH
	jg	$L418
	test	di, di
	jl	$L418
	cmp	di, 199					; 000000c7H
	jg	$L418
; Line 171
	add	bx, WORD PTR _sdx$[esp+28]
	mov	al, BYTE PTR _color$[esp+24]
; Line 172
	inc	bp
	push	eax
	push	edi
	push	esi
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 156
	cmp	WORD PTR _dxabs$[esp+28], bp
	jg	SHORT $L434
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 12					; 0000000cH
	ret	0
; Line 175
$L433:
; Line 177
	mov	WORD PTR _i$[esp+28], 0
	cmp	WORD PTR _dyabs$[esp+28], 0
	jle	SHORT $L418
$L441:
; Line 179
	add	bp, WORD PTR _dxabs$[esp+28]
; Line 180
	cmp	bp, WORD PTR _dyabs$[esp+28]
	jl	SHORT $L444
; Line 182
	sub	bp, WORD PTR _dyabs$[esp+28]
; Line 183
	add	si, WORD PTR _sdx$[esp+28]
; Line 184
	add	bx, WORD PTR _sdx$[esp+28]
; Line 186
$L444:
	add	di, WORD PTR _sdy$[esp+28]
; Line 188
	test	si, si
	jl	SHORT $L418
	cmp	si, 319					; 0000013fH
	jg	SHORT $L418
	test	di, di
	jl	SHORT $L418
	cmp	di, 199					; 000000c7H
	jg	SHORT $L418
; Line 192
	mov	ax, WORD PTR _sdy$[esp+28]
	mov	cl, BYTE PTR _color$[esp+24]
	imul	ax, 320					; 00000140H
	add	bx, ax
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
	jl	SHORT $L441
; Line 197
$L418:
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
_clear_color$ = 12
_front_buffer$ = 8
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
	mov	edi, edx
	mov	al, BYTE PTR _clear_color$[esp+4]
	mov	ch, al
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
	mov	edx, DWORD PTR _y$[esp-4]
	push	esi
	push	edi
	test	edx, edx
; Line 207
	jl	SHORT $L454
	cmp	edx, 200				; 000000c8H
	jge	SHORT $L454
; Line 208
	mov	edi, DWORD PTR _x1$[esp+4]
	test	edi, edi
	jge	SHORT $L458
	xor	edi, edi
; Line 209
$L458:
	cmp	edi, 320				; 00000140H
	jl	SHORT $L459
	mov	edi, 319				; 0000013fH
; Line 210
$L459:
	mov	esi, DWORD PTR _x2$[esp+4]
	test	esi, esi
	jge	SHORT $L460
	xor	esi, esi
; Line 211
$L460:
	cmp	esi, 320				; 00000140H
	jl	SHORT $L461
	mov	esi, 319				; 0000013fH
; Line 212
$L461:
	cmp	esi, edi
	jge	SHORT $L462
; Line 213
	mov	eax, edi
	mov	edi, esi
	mov	esi, eax
; Line 215
$L462:
	sub	esi, edi
	xor	eax, eax
	mov	al, BYTE PTR _color$[esp+4]
	lea	edx, DWORD PTR [edx+edx*4]
	shl	edx, 6
	mov	ch, al
	mov	cl, al
	add	edx, DWORD PTR _FBPTR
	mov	eax, ecx
	add	edi, edx
	shl	eax, 16					; 00000010H
	mov	ax, cx
	mov	ecx, esi
	shr	ecx, 2
	rep	stosd
	mov	ecx, esi
	and	ecx, 3
	rep	stosb
; Line 216
$L454:
	pop	edi
	pop	esi
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
; Line 217
	sub	esp, 16					; 00000010H
	mov	eax, -320				; fffffec0H
	cmp	DWORD PTR _x1$[esp+12], eax
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 225
	jl	$L470
	mov	ecx, 640				; 00000280H
	cmp	DWORD PTR _x1$[esp+28], ecx
	jg	$L470
	cmp	DWORD PTR _x2$[esp+28], eax
	jl	$L470
	cmp	DWORD PTR _x2$[esp+28], ecx
	jg	$L470
	mov	ebp, DWORD PTR _x3$[esp+28]
	cmp	ebp, eax
	jl	$L470
	cmp	ebp, ecx
	jg	$L470
	mov	eax, -200				; ffffff38H
	cmp	DWORD PTR _y1$[esp+28], eax
	jl	$L470
	mov	ecx, 400				; 00000190H
	cmp	DWORD PTR _y1$[esp+28], ecx
	jg	$L470
	cmp	DWORD PTR _y2$[esp+28], eax
	jl	$L470
	cmp	DWORD PTR _y2$[esp+28], ecx
	jg	$L470
	cmp	DWORD PTR _y3$[esp+28], eax
	jl	$L470
	cmp	DWORD PTR _y3$[esp+28], ecx
	jg	$L470
; Line 234
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L485
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
$L485:
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jge	SHORT $L486
; Line 239
	mov	eax, DWORD PTR _x2$[esp+28]
	mov	edx, DWORD PTR _y2$[esp+28]
	mov	DWORD PTR _x2$[esp+28], ebp
	mov	DWORD PTR _y2$[esp+28], ecx
	mov	ebp, eax
	mov	DWORD PTR _y3$[esp+28], edx
; Line 242
$L486:
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jge	SHORT $L487
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
$L487:
	mov	esi, DWORD PTR _y1$[esp+28]
	mov	ebx, DWORD PTR _x1$[esp+28]
	shl	ebx, 16					; 00000010H
; Line 247
	cmp	DWORD PTR _y3$[esp+28], esi
	mov	edi, ebx
; Line 251
	je	$L470
; Line 252
	cmp	DWORD PTR _y2$[esp+28], esi
	jne	SHORT $L540
	mov	DWORD PTR _s1$[esp+32], 0
	jmp	SHORT $L541
$L540:
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
$L541:
; Line 253
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
; Line 254
	cmp	ecx, DWORD PTR _y2$[esp+28]
	jne	SHORT $L542
	xor	ebp, ebp
	jmp	SHORT $L543
$L542:
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
$L543:
; Line 256
	mov	ecx, DWORD PTR _y2$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jne	SHORT $L552
; Line 258
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jle	SHORT $L490
; Line 259
	mov	edi, ebx
; Line 260
	mov	ebx, ecx
	shl	ebx, 16					; 00000010H
; Line 261
	jmp	SHORT $L548
$L490:
; Line 262
	mov	edi, DWORD PTR _x2$[esp+28]
	shl	edi, 16					; 00000010H
; Line 263
$L548:
; Line 265
	mov	ecx, DWORD PTR _y3$[esp+28]
	cmp	ecx, DWORD PTR _y1$[esp+28]
	jle	SHORT $L552
$L493:
; Line 266
	mov	edx, edi
	mov	ecx, ebx
	sar	edx, 16					; 00000010H
	mov	al, BYTE PTR _color$[esp+28]
; Line 267
	sar	ecx, 16					; 00000010H
	push	eax
; Line 271
	push	esi
	push	ecx
	push	edx
	call	_draw_span
	mov	ecx, DWORD PTR _x2$[esp+44]
	add	esp, 16					; 00000010H
; Line 272
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L544
	add	edi, ebp
	jmp	SHORT $L545
$L544:
	add	edi, DWORD PTR _s3$[esp+32]
$L545:
; Line 273
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _x1$[esp+28]
	jg	SHORT $L546
	add	ebx, DWORD PTR _s3$[esp+32]
	jmp	SHORT $L547
$L546:
	add	ebx, ebp
$L547:
; Line 274
	inc	esi
; Line 275
	cmp	DWORD PTR _y3$[esp+28], esi
	jg	SHORT $L493
$L552:
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
	jle	SHORT $L495
; Line 283
	mov	eax, DWORD PTR _s1$[esp+32]
	mov	ecx, DWORD PTR _s3$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 284
	jmp	SHORT $L554
; Line 285
$L495:
; Line 286
	mov	eax, DWORD PTR _s3$[esp+32]
	mov	ecx, DWORD PTR _s1$[esp+32]
	mov	DWORD PTR _se$[esp+32], eax
; Line 287
$L554:
	mov	DWORD PTR _ss$[esp+32], ecx
	cmp	DWORD PTR _y3$[esp+28], esi
; Line 293
	jle	SHORT $L470
$L498:
; Line 294
	cmp	DWORD PTR _y2$[esp+28], esi
	jne	SHORT $L500
; Line 295
	mov	ecx, DWORD PTR _x2$[esp+28]
	cmp	ecx, DWORD PTR _xmid$[esp+32]
	jle	SHORT $L501
; Line 296
	mov	DWORD PTR _se$[esp+32], ebp
; Line 297
	jmp	SHORT $L500
$L501:
; Line 298
	mov	DWORD PTR _ss$[esp+32], ebp
; Line 303
$L500:
	mov	ecx, edi
	mov	edx, ebx
	sar	ecx, 16					; 00000010H
	mov	al, BYTE PTR _color$[esp+28]
; Line 304
	sar	edx, 16					; 00000010H
	push	eax
; Line 305
	push	esi
	push	edx
	push	ecx
	inc	esi
	call	_draw_span
	add	edi, DWORD PTR _ss$[esp+48]
	add	ebx, DWORD PTR _se$[esp+48]
	add	esp, 16					; 00000010H
; Line 309
	cmp	DWORD PTR _y3$[esp+28], esi
	jg	SHORT $L498
; Line 313
$L470:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_fill_tri ENDP
_TEXT	ENDS
END
