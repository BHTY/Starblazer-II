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
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
COMM	_FBPTR:DWORD
_DATA	ENDS
PUBLIC	_plot_pixel
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_color$ = 16
_plot_pixel PROC NEAR
; File src\graphics.c
; Line 14
	push	ebp
	mov	ebp, esp
; Line 15
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 320				; 00000140H
	jge	SHORT $L250
	mov	ecx, DWORD PTR _y$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, 200				; 000000c8H
	jge	SHORT $L250
; Line 17
	mov	edx, DWORD PTR _y$[ebp]
	and	edx, 65535				; 0000ffffH
	shl	edx, 8
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	shl	eax, 6
	add	edx, eax
	mov	ecx, DWORD PTR _x$[ebp]
	and	ecx, 65535				; 0000ffffH
	add	ecx, DWORD PTR _FBPTR
	mov	al, BYTE PTR _color$[ebp]
	mov	BYTE PTR [ecx+edx], al
$L250:
; Line 19
	pop	ebp
	ret	0
_plot_pixel ENDP
_TEXT	ENDS
PUBLIC	_bitset_pixel
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_c$ = 16
_bitset_pixel PROC NEAR
; Line 21
	push	ebp
	mov	ebp, esp
; Line 22
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 320				; 00000140H
	jge	SHORT $L255
	mov	ecx, DWORD PTR _y$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, 200				; 000000c8H
	jge	SHORT $L255
; Line 23
	mov	edx, DWORD PTR _y$[ebp]
	and	edx, 65535				; 0000ffffH
	imul	edx, 320				; 00000140H
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	add	eax, DWORD PTR _FBPTR
	mov	cl, BYTE PTR [eax+edx]
	or	cl, BYTE PTR _c$[ebp]
	mov	edx, DWORD PTR _x$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	imul	eax, 320				; 00000140H
	add	edx, DWORD PTR _FBPTR
	mov	BYTE PTR [edx+eax], cl
$L255:
; Line 25
	pop	ebp
	ret	0
_bitset_pixel ENDP
_TEXT	ENDS
PUBLIC	_draw_line
EXTRN	_abs:NEAR
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_j$ = -32
_decInc$ = -20
_i$ = -24
_address$ = -12
_addrInc$ = -40
_yLonger$ = -4
_incrementVal$ = -36
_endVal$ = -16
_shortLen$ = -8
_longLen$ = -28
_swap$285 = -44
_draw_line PROC NEAR
; Line 27
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	esi
; Line 33
	mov	DWORD PTR _yLonger$[ebp], 0
; Line 38
	cmp	DWORD PTR _x$[ebp], 0
	jl	SHORT $L273
	cmp	DWORD PTR _y$[ebp], 0
	jl	SHORT $L273
	cmp	DWORD PTR _x$[ebp], 319			; 0000013fH
	jg	SHORT $L273
	cmp	DWORD PTR _y$[ebp], 199			; 000000c7H
	jle	SHORT $L272
$L273:
	cmp	DWORD PTR _x2$[ebp], 0
	jl	SHORT $L274
	cmp	DWORD PTR _y2$[ebp], 0
	jl	SHORT $L274
	cmp	DWORD PTR _x2$[ebp], 319		; 0000013fH
	jg	SHORT $L274
	cmp	DWORD PTR _y2$[ebp], 199		; 000000c7H
	jle	SHORT $L272
$L274:
	jmp	$L297
$L272:
; Line 39
	cmp	DWORD PTR _x2$[ebp], 0
	jge	SHORT $L275
; Line 41
	mov	eax, DWORD PTR _y2$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	imul	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _x2$[ebp]
	sub	ecx, DWORD PTR _x$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _y$[ebp]
	sub	edx, eax
	mov	DWORD PTR _y2$[ebp], edx
; Line 42
	mov	DWORD PTR _x2$[ebp], 0
$L275:
; Line 44
	cmp	DWORD PTR _x$[ebp], 0
	jge	SHORT $L276
; Line 46
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, DWORD PTR _y2$[ebp]
	imul	eax, DWORD PTR _x2$[ebp]
	mov	ecx, DWORD PTR _x$[ebp]
	sub	ecx, DWORD PTR _x2$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _y2$[ebp]
	sub	edx, eax
	mov	DWORD PTR _y$[ebp], edx
; Line 47
	mov	DWORD PTR _x$[ebp], 0
$L276:
; Line 50
	cmp	DWORD PTR _x2$[ebp], 319		; 0000013fH
	jle	SHORT $L277
; Line 52
	mov	eax, DWORD PTR _y2$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	mov	ecx, 320				; 00000140H
	sub	ecx, DWORD PTR _x$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _x2$[ebp]
	sub	ecx, DWORD PTR _x$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _y$[ebp]
	add	edx, eax
	mov	DWORD PTR _y2$[ebp], edx
; Line 53
	mov	DWORD PTR _x2$[ebp], 319		; 0000013fH
$L277:
; Line 55
	cmp	DWORD PTR _x$[ebp], 319			; 0000013fH
	jle	SHORT $L278
; Line 57
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, DWORD PTR _y2$[ebp]
	mov	ecx, 320				; 00000140H
	sub	ecx, DWORD PTR _x2$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _x$[ebp]
	sub	ecx, DWORD PTR _x2$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _y2$[ebp]
	add	edx, eax
	mov	DWORD PTR _y$[ebp], edx
; Line 58
	mov	DWORD PTR _x$[ebp], 319			; 0000013fH
$L278:
; Line 61
	cmp	DWORD PTR _y2$[ebp], 0
	jge	SHORT $L279
; Line 63
	mov	eax, DWORD PTR _x2$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	imul	eax, DWORD PTR _y$[ebp]
	mov	ecx, DWORD PTR _y2$[ebp]
	sub	ecx, DWORD PTR _y$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _x$[ebp]
	sub	edx, eax
	mov	DWORD PTR _x2$[ebp], edx
; Line 64
	mov	DWORD PTR _y2$[ebp], 0
$L279:
; Line 66
	cmp	DWORD PTR _y$[ebp], 0
	jge	SHORT $L280
; Line 68
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR _x2$[ebp]
	imul	eax, DWORD PTR _y2$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	sub	ecx, DWORD PTR _y2$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _x2$[ebp]
	sub	edx, eax
	mov	DWORD PTR _x$[ebp], edx
; Line 69
	mov	DWORD PTR _y$[ebp], 0
$L280:
; Line 72
	cmp	DWORD PTR _y2$[ebp], 199		; 000000c7H
	jle	SHORT $L281
; Line 74
	mov	eax, DWORD PTR _x2$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	mov	ecx, 200				; 000000c8H
	sub	ecx, DWORD PTR _y$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _y2$[ebp]
	sub	ecx, DWORD PTR _y$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _x$[ebp]
	add	edx, eax
	mov	DWORD PTR _x2$[ebp], edx
; Line 75
	mov	DWORD PTR _y2$[ebp], 199		; 000000c7H
$L281:
; Line 77
	cmp	DWORD PTR _y$[ebp], 199			; 000000c7H
	jle	SHORT $L282
; Line 79
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR _x2$[ebp]
	mov	ecx, 200				; 000000c8H
	sub	ecx, DWORD PTR _y2$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _y$[ebp]
	sub	ecx, DWORD PTR _y2$[ebp]
	cdq
	idiv	ecx
	mov	edx, DWORD PTR _x2$[ebp]
	add	edx, eax
	mov	DWORD PTR _x$[ebp], edx
; Line 80
	mov	DWORD PTR _y$[ebp], 199			; 000000c7H
$L282:
; Line 83
	mov	eax, DWORD PTR _y2$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	mov	DWORD PTR _shortLen$[ebp], eax
; Line 84
	mov	ecx, DWORD PTR _x2$[ebp]
	sub	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR _longLen$[ebp], ecx
; Line 85
	mov	edx, DWORD PTR _shortLen$[ebp]
	push	edx
	call	_abs
	add	esp, 4
	mov	esi, eax
	mov	eax, DWORD PTR _longLen$[ebp]
	push	eax
	call	_abs
	add	esp, 4
	cmp	esi, eax
	jle	SHORT $L284
; Line 86
	mov	ecx, DWORD PTR _shortLen$[ebp]
	mov	DWORD PTR _swap$285[ebp], ecx
; Line 87
	mov	edx, DWORD PTR _longLen$[ebp]
	mov	DWORD PTR _shortLen$[ebp], edx
; Line 88
	mov	eax, DWORD PTR _swap$285[ebp]
	mov	DWORD PTR _longLen$[ebp], eax
; Line 89
	mov	DWORD PTR _yLonger$[ebp], 1
$L284:
; Line 91
	mov	ecx, DWORD PTR _longLen$[ebp]
	mov	DWORD PTR _endVal$[ebp], ecx
; Line 92
	cmp	DWORD PTR _longLen$[ebp], 0
	jge	SHORT $L286
; Line 93
	mov	DWORD PTR _incrementVal$[ebp], -1
; Line 94
	mov	DWORD PTR _addrInc$[ebp], -320		; fffffec0H
; Line 95
	mov	edx, DWORD PTR _longLen$[ebp]
	neg	edx
	mov	DWORD PTR _longLen$[ebp], edx
; Line 97
	jmp	SHORT $L287
$L286:
; Line 98
	mov	DWORD PTR _incrementVal$[ebp], 1
; Line 99
	mov	DWORD PTR _addrInc$[ebp], 320		; 00000140H
$L287:
; Line 101
	cmp	DWORD PTR _longLen$[ebp], 0
	jne	SHORT $L288
	mov	DWORD PTR _decInc$[ebp], 0
; Line 102
	jmp	SHORT $L289
$L288:
	mov	eax, DWORD PTR _shortLen$[ebp]
	shl	eax, 16					; 00000010H
	cdq
	idiv	DWORD PTR _longLen$[ebp]
	mov	DWORD PTR _decInc$[ebp], eax
$L289:
; Line 103
	mov	DWORD PTR _j$[ebp], 0
; Line 104
	mov	eax, DWORD PTR _FBPTR
	add	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	imul	ecx, 320				; 00000140H
	add	eax, ecx
	mov	DWORD PTR _address$[ebp], eax
; Line 106
	cmp	DWORD PTR _yLonger$[ebp], 0
	je	SHORT $L290
; Line 108
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L291
$L292:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, DWORD PTR _incrementVal$[ebp]
	mov	DWORD PTR _i$[ebp], edx
	mov	eax, DWORD PTR _address$[ebp]
	add	eax, DWORD PTR _addrInc$[ebp]
	mov	DWORD PTR _address$[ebp], eax
$L291:
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	ecx, DWORD PTR _endVal$[ebp]
	je	SHORT $L293
; Line 110
	mov	edx, DWORD PTR _j$[ebp]
	sar	edx, 16					; 00000010H
	mov	eax, DWORD PTR _address$[ebp]
	mov	cl, BYTE PTR _color$[ebp]
	mov	BYTE PTR [eax+edx], cl
; Line 112
	mov	edx, DWORD PTR _j$[ebp]
	add	edx, DWORD PTR _decInc$[ebp]
	mov	DWORD PTR _j$[ebp], edx
; Line 113
	jmp	SHORT $L292
$L293:
; Line 115
	jmp	SHORT $L297
$L290:
; Line 116
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L295
$L296:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, DWORD PTR _incrementVal$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	mov	ecx, DWORD PTR _address$[ebp]
	add	ecx, DWORD PTR _incrementVal$[ebp]
	mov	DWORD PTR _address$[ebp], ecx
$L295:
	mov	edx, DWORD PTR _i$[ebp]
	cmp	edx, DWORD PTR _endVal$[ebp]
	je	SHORT $L297
; Line 117
	mov	eax, DWORD PTR _j$[ebp]
	sar	eax, 16					; 00000010H
	imul	eax, 320				; 00000140H
	mov	ecx, DWORD PTR _address$[ebp]
	mov	dl, BYTE PTR _color$[ebp]
	mov	BYTE PTR [ecx+eax], dl
; Line 120
	mov	eax, DWORD PTR _j$[ebp]
	add	eax, DWORD PTR _decInc$[ebp]
	mov	DWORD PTR _j$[ebp], eax
; Line 121
	jmp	SHORT $L296
$L297:
; Line 125
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_draw_line ENDP
_TEXT	ENDS
PUBLIC	_drawline
_TEXT	SEGMENT
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_i$ = -36
_dx$ = -40
_dy$ = -48
_sdx$ = -20
_sdy$ = -28
_dxabs$ = -12
_dyabs$ = -16
_x$ = -24
_y$ = -32
_px$ = -44
_py$ = -4
_address$ = -8
_drawline PROC NEAR
; Line 129
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
; Line 132
	movsx	eax, WORD PTR _x2$[ebp]
	movsx	ecx, WORD PTR _x1$[ebp]
	sub	eax, ecx
	mov	WORD PTR _dx$[ebp], ax
; Line 133
	movsx	edx, WORD PTR _y2$[ebp]
	movsx	eax, WORD PTR _y1$[ebp]
	sub	edx, eax
	mov	WORD PTR _dy$[ebp], dx
; Line 134
	movsx	ecx, WORD PTR _dx$[ebp]
	push	ecx
	call	_abs
	add	esp, 4
	mov	WORD PTR _dxabs$[ebp], ax
; Line 135
	movsx	edx, WORD PTR _dy$[ebp]
	push	edx
	call	_abs
	add	esp, 4
	mov	WORD PTR _dyabs$[ebp], ax
; Line 136
	movsx	eax, WORD PTR _dx$[ebp]
	test	eax, eax
	jge	SHORT $L395
	mov	DWORD PTR -52+[ebp], -1
	jmp	SHORT $L396
$L395:
	movsx	ecx, WORD PTR _dx$[ebp]
	xor	edx, edx
	test	ecx, ecx
	setg	dl
	mov	DWORD PTR -52+[ebp], edx
$L396:
	mov	ax, WORD PTR -52+[ebp]
	mov	WORD PTR _sdx$[ebp], ax
; Line 137
	movsx	ecx, WORD PTR _dy$[ebp]
	test	ecx, ecx
	jge	SHORT $L397
	mov	DWORD PTR -56+[ebp], -1
	jmp	SHORT $L398
$L397:
	movsx	edx, WORD PTR _dy$[ebp]
	xor	eax, eax
	test	edx, edx
	setg	al
	mov	DWORD PTR -56+[ebp], eax
$L398:
	mov	cx, WORD PTR -56+[ebp]
	mov	WORD PTR _sdy$[ebp], cx
; Line 138
	movsx	edx, WORD PTR _dyabs$[ebp]
	sar	edx, 1
	mov	WORD PTR _x$[ebp], dx
; Line 139
	movsx	eax, WORD PTR _dxabs$[ebp]
	sar	eax, 1
	mov	WORD PTR _y$[ebp], ax
; Line 140
	mov	cx, WORD PTR _x1$[ebp]
	mov	WORD PTR _px$[ebp], cx
; Line 141
	mov	dx, WORD PTR _y1$[ebp]
	mov	WORD PTR _py$[ebp], dx
; Line 143
	movsx	eax, WORD PTR _px$[ebp]
	test	eax, eax
	jl	SHORT $L318
	movsx	ecx, WORD PTR _px$[ebp]
	cmp	ecx, 319				; 0000013fH
	jg	SHORT $L318
	movsx	edx, WORD PTR _py$[ebp]
	test	edx, edx
	jl	SHORT $L318
	movsx	eax, WORD PTR _py$[ebp]
	cmp	eax, 199				; 000000c7H
	jle	SHORT $L317
$L318:
; Line 144
	jmp	$L329
$L317:
; Line 147
	movsx	ecx, WORD PTR _py$[ebp]
	shl	ecx, 8
	movsx	edx, WORD PTR _py$[ebp]
	shl	edx, 6
	add	ecx, edx
	movsx	eax, WORD PTR _px$[ebp]
	add	ecx, eax
	mov	WORD PTR _address$[ebp], cx
; Line 150
	mov	cl, BYTE PTR _color$[ebp]
	push	ecx
	mov	dx, WORD PTR _py$[ebp]
	push	edx
	mov	ax, WORD PTR _px$[ebp]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 154
	movsx	ecx, WORD PTR _dxabs$[ebp]
	movsx	edx, WORD PTR _dyabs$[ebp]
	cmp	ecx, edx
	jl	$L319
; Line 156
	mov	WORD PTR _i$[ebp], 0
	jmp	SHORT $L320
$L321:
	mov	ax, WORD PTR _i$[ebp]
	add	ax, 1
	mov	WORD PTR _i$[ebp], ax
$L320:
	movsx	ecx, WORD PTR _i$[ebp]
	movsx	edx, WORD PTR _dxabs$[ebp]
	cmp	ecx, edx
	jge	$L322
; Line 158
	mov	ax, WORD PTR _y$[ebp]
	add	ax, WORD PTR _dyabs$[ebp]
	mov	WORD PTR _y$[ebp], ax
; Line 159
	movsx	ecx, WORD PTR _y$[ebp]
	movsx	edx, WORD PTR _dxabs$[ebp]
	cmp	ecx, edx
	jl	SHORT $L323
; Line 161
	mov	ax, WORD PTR _y$[ebp]
	sub	ax, WORD PTR _dxabs$[ebp]
	mov	WORD PTR _y$[ebp], ax
; Line 162
	mov	cx, WORD PTR _py$[ebp]
	add	cx, WORD PTR _sdy$[ebp]
	mov	WORD PTR _py$[ebp], cx
; Line 163
	movsx	edx, WORD PTR _sdy$[ebp]
	imul	edx, 320				; 00000140H
	mov	ax, WORD PTR _address$[ebp]
	add	ax, dx
	mov	WORD PTR _address$[ebp], ax
$L323:
; Line 165
	mov	cx, WORD PTR _px$[ebp]
	add	cx, WORD PTR _sdx$[ebp]
	mov	WORD PTR _px$[ebp], cx
; Line 167
	movsx	edx, WORD PTR _px$[ebp]
	test	edx, edx
	jl	SHORT $L325
	movsx	eax, WORD PTR _px$[ebp]
	cmp	eax, 319				; 0000013fH
	jg	SHORT $L325
	movsx	ecx, WORD PTR _py$[ebp]
	test	ecx, ecx
	jl	SHORT $L325
	movsx	edx, WORD PTR _py$[ebp]
	cmp	edx, 199				; 000000c7H
	jle	SHORT $L324
$L325:
; Line 168
	jmp	$L329
$L324:
; Line 171
	mov	ax, WORD PTR _address$[ebp]
	add	ax, WORD PTR _sdx$[ebp]
	mov	WORD PTR _address$[ebp], ax
; Line 172
	mov	cl, BYTE PTR _color$[ebp]
	push	ecx
	mov	dx, WORD PTR _py$[ebp]
	push	edx
	mov	ax, WORD PTR _px$[ebp]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 173
	jmp	$L321
$L322:
; Line 175
	jmp	$L329
$L319:
; Line 177
	mov	WORD PTR _i$[ebp], 0
	jmp	SHORT $L327
$L328:
	mov	cx, WORD PTR _i$[ebp]
	add	cx, 1
	mov	WORD PTR _i$[ebp], cx
$L327:
	movsx	edx, WORD PTR _i$[ebp]
	movsx	eax, WORD PTR _dyabs$[ebp]
	cmp	edx, eax
	jge	$L329
; Line 179
	mov	cx, WORD PTR _x$[ebp]
	add	cx, WORD PTR _dxabs$[ebp]
	mov	WORD PTR _x$[ebp], cx
; Line 180
	movsx	edx, WORD PTR _x$[ebp]
	movsx	eax, WORD PTR _dyabs$[ebp]
	cmp	edx, eax
	jl	SHORT $L330
; Line 182
	mov	cx, WORD PTR _x$[ebp]
	sub	cx, WORD PTR _dyabs$[ebp]
	mov	WORD PTR _x$[ebp], cx
; Line 183
	mov	dx, WORD PTR _px$[ebp]
	add	dx, WORD PTR _sdx$[ebp]
	mov	WORD PTR _px$[ebp], dx
; Line 184
	mov	ax, WORD PTR _address$[ebp]
	add	ax, WORD PTR _sdx$[ebp]
	mov	WORD PTR _address$[ebp], ax
$L330:
; Line 186
	mov	cx, WORD PTR _py$[ebp]
	add	cx, WORD PTR _sdy$[ebp]
	mov	WORD PTR _py$[ebp], cx
; Line 188
	movsx	edx, WORD PTR _px$[ebp]
	test	edx, edx
	jl	SHORT $L332
	movsx	eax, WORD PTR _px$[ebp]
	cmp	eax, 319				; 0000013fH
	jg	SHORT $L332
	movsx	ecx, WORD PTR _py$[ebp]
	test	ecx, ecx
	jl	SHORT $L332
	movsx	edx, WORD PTR _py$[ebp]
	cmp	edx, 199				; 000000c7H
	jle	SHORT $L331
$L332:
; Line 189
	jmp	SHORT $L329
$L331:
; Line 192
	movsx	eax, WORD PTR _sdy$[ebp]
	imul	eax, 320				; 00000140H
	mov	cx, WORD PTR _address$[ebp]
	add	cx, ax
	mov	WORD PTR _address$[ebp], cx
; Line 193
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	ax, WORD PTR _py$[ebp]
	push	eax
	mov	cx, WORD PTR _px$[ebp]
	push	ecx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 195
	jmp	$L328
$L329:
; Line 197
	mov	esp, ebp
	pop	ebp
	ret	0
_drawline ENDP
_TEXT	ENDS
PUBLIC	_swap_buffers
EXTRN	_memcpy:NEAR
EXTRN	_memset:NEAR
_TEXT	SEGMENT
_front_buffer$ = 8
_clear_color$ = 12
_swap_buffers PROC NEAR
; Line 200
	push	ebp
	mov	ebp, esp
; Line 201
	push	64000					; 0000fa00H
	mov	eax, DWORD PTR _FBPTR
	push	eax
	mov	ecx, DWORD PTR _front_buffer$[ebp]
	push	ecx
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 202
	push	64000					; 0000fa00H
	mov	edx, DWORD PTR _clear_color$[ebp]
	and	edx, 255				; 000000ffH
	push	edx
	mov	eax, DWORD PTR _FBPTR
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 203
	pop	ebp
	ret	0
_swap_buffers ENDP
_TEXT	ENDS
PUBLIC	_draw_span
_TEXT	SEGMENT
_x1$ = 8
_x2$ = 12
_y$ = 16
_color$ = 20
_t$ = -4
_draw_span PROC NEAR
; Line 205
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 207
	cmp	DWORD PTR _y$[ebp], 0
	jl	SHORT $L343
	cmp	DWORD PTR _y$[ebp], 200			; 000000c8H
	jl	SHORT $L342
$L343:
	jmp	$L340
$L342:
; Line 208
	cmp	DWORD PTR _x1$[ebp], 0
	jge	SHORT $L344
	mov	DWORD PTR _x1$[ebp], 0
$L344:
; Line 209
	cmp	DWORD PTR _x1$[ebp], 320		; 00000140H
	jl	SHORT $L345
	mov	DWORD PTR _x1$[ebp], 319		; 0000013fH
$L345:
; Line 210
	cmp	DWORD PTR _x2$[ebp], 0
	jge	SHORT $L346
	mov	DWORD PTR _x2$[ebp], 0
$L346:
; Line 211
	cmp	DWORD PTR _x2$[ebp], 320		; 00000140H
	jl	SHORT $L347
	mov	DWORD PTR _x2$[ebp], 319		; 0000013fH
$L347:
; Line 212
	mov	eax, DWORD PTR _x1$[ebp]
	cmp	eax, DWORD PTR _x2$[ebp]
	jle	SHORT $L348
; Line 213
	mov	ecx, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _t$[ebp], ecx
	mov	edx, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _x1$[ebp], edx
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _x2$[ebp], eax
$L348:
; Line 215
	mov	ecx, DWORD PTR _x2$[ebp]
	sub	ecx, DWORD PTR _x1$[ebp]
	push	ecx
	mov	edx, DWORD PTR _color$[ebp]
	and	edx, 255				; 000000ffH
	push	edx
	mov	eax, DWORD PTR _y$[ebp]
	imul	eax, 320				; 00000140H
	add	eax, DWORD PTR _x1$[ebp]
	mov	ecx, DWORD PTR _FBPTR
	add	ecx, eax
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
$L340:
; Line 216
	mov	esp, ebp
	pop	ebp
	ret	0
_draw_span ENDP
_TEXT	ENDS
PUBLIC	_fill_tri
EXTRN	_fixed_mul:NEAR
EXTRN	_fixed_div:NEAR
_TEXT	SEGMENT
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_x3$ = 24
_y3$ = 28
_color$ = 32
_t$ = -12
_s1$ = -8
_s2$ = -16
_s3$ = -24
_ss$ = -20
_se$ = -32
_start$ = -48
_end$ = -4
_xmid$ = -44
_xa$ = -28
_xb$ = -40
_y$ = -36
_fill_tri PROC NEAR
; Line 217
	push	ebp
	mov	ebp, esp
	sub	esp, 64					; 00000040H
; Line 225
	cmp	DWORD PTR _x1$[ebp], -320		; fffffec0H
	jl	SHORT $L370
	cmp	DWORD PTR _x1$[ebp], 640		; 00000280H
	jg	SHORT $L370
	cmp	DWORD PTR _x2$[ebp], -320		; fffffec0H
	jl	SHORT $L370
	cmp	DWORD PTR _x2$[ebp], 640		; 00000280H
	jg	SHORT $L370
	cmp	DWORD PTR _x3$[ebp], -320		; fffffec0H
	jl	SHORT $L370
	cmp	DWORD PTR _x3$[ebp], 640		; 00000280H
	jg	SHORT $L370
	cmp	DWORD PTR _y1$[ebp], -200		; ffffff38H
	jl	SHORT $L370
	cmp	DWORD PTR _y1$[ebp], 400		; 00000190H
	jg	SHORT $L370
	cmp	DWORD PTR _y2$[ebp], -200		; ffffff38H
	jl	SHORT $L370
	cmp	DWORD PTR _y2$[ebp], 400		; 00000190H
	jg	SHORT $L370
	cmp	DWORD PTR _y3$[ebp], -200		; ffffff38H
	jl	SHORT $L370
	cmp	DWORD PTR _y3$[ebp], 400		; 00000190H
	jle	SHORT $L369
$L370:
; Line 228
	jmp	$L385
$L369:
; Line 234
	mov	eax, DWORD PTR _y1$[ebp]
	cmp	eax, DWORD PTR _y2$[ebp]
	jle	SHORT $L371
; Line 235
	mov	ecx, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _t$[ebp], ecx
	mov	edx, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _x1$[ebp], edx
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _x2$[ebp], eax
; Line 236
	mov	ecx, DWORD PTR _y1$[ebp]
	mov	DWORD PTR _t$[ebp], ecx
	mov	edx, DWORD PTR _y2$[ebp]
	mov	DWORD PTR _y1$[ebp], edx
	mov	eax, DWORD PTR _t$[ebp]
	mov	DWORD PTR _y2$[ebp], eax
$L371:
; Line 238
	mov	ecx, DWORD PTR _y2$[ebp]
	cmp	ecx, DWORD PTR _y3$[ebp]
	jle	SHORT $L372
; Line 239
	mov	edx, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _t$[ebp], edx
	mov	eax, DWORD PTR _x3$[ebp]
	mov	DWORD PTR _x2$[ebp], eax
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR _x3$[ebp], ecx
; Line 240
	mov	edx, DWORD PTR _y2$[ebp]
	mov	DWORD PTR _t$[ebp], edx
	mov	eax, DWORD PTR _y3$[ebp]
	mov	DWORD PTR _y2$[ebp], eax
	mov	ecx, DWORD PTR _t$[ebp]
	mov	DWORD PTR _y3$[ebp], ecx
$L372:
; Line 242
	mov	edx, DWORD PTR _y1$[ebp]
	cmp	edx, DWORD PTR _y2$[ebp]
	jle	SHORT $L373
; Line 243
	mov	eax, DWORD PTR _x1$[ebp]
	mov	DWORD PTR _t$[ebp], eax
	mov	ecx, DWORD PTR _x2$[ebp]
	mov	DWORD PTR _x1$[ebp], ecx
	mov	edx, DWORD PTR _t$[ebp]
	mov	DWORD PTR _x2$[ebp], edx
; Line 244
	mov	eax, DWORD PTR _y1$[ebp]
	mov	DWORD PTR _t$[ebp], eax
	mov	ecx, DWORD PTR _y2$[ebp]
	mov	DWORD PTR _y1$[ebp], ecx
	mov	edx, DWORD PTR _t$[ebp]
	mov	DWORD PTR _y2$[ebp], edx
$L373:
; Line 246
	mov	eax, DWORD PTR _y1$[ebp]
	mov	DWORD PTR _y$[ebp], eax
; Line 247
	mov	ecx, DWORD PTR _x1$[ebp]
	shl	ecx, 16					; 00000010H
	mov	DWORD PTR _start$[ebp], ecx
; Line 248
	mov	edx, DWORD PTR _start$[ebp]
	mov	DWORD PTR _end$[ebp], edx
; Line 251
	mov	eax, DWORD PTR _y1$[ebp]
	cmp	eax, DWORD PTR _y3$[ebp]
	jne	SHORT $L374
	jmp	$L385
$L374:
; Line 252
	mov	ecx, DWORD PTR _y1$[ebp]
	cmp	ecx, DWORD PTR _y2$[ebp]
	jne	SHORT $L402
	mov	DWORD PTR -52+[ebp], 0
	jmp	SHORT $L403
$L402:
	mov	edx, DWORD PTR _y2$[ebp]
	sub	edx, DWORD PTR _y1$[ebp]
	shl	edx, 16					; 00000010H
	push	edx
	mov	eax, DWORD PTR _x2$[ebp]
	sub	eax, DWORD PTR _x1$[ebp]
	shl	eax, 16					; 00000010H
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR -52+[ebp], eax
$L403:
	mov	ecx, DWORD PTR -52+[ebp]
	mov	DWORD PTR _s1$[ebp], ecx
; Line 253
	mov	edx, DWORD PTR _y3$[ebp]
	sub	edx, DWORD PTR _y1$[ebp]
	shl	edx, 16					; 00000010H
	push	edx
	mov	eax, DWORD PTR _x3$[ebp]
	sub	eax, DWORD PTR _x1$[ebp]
	shl	eax, 16					; 00000010H
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR _s3$[ebp], eax
; Line 254
	mov	ecx, DWORD PTR _y3$[ebp]
	cmp	ecx, DWORD PTR _y2$[ebp]
	jne	SHORT $L404
	mov	DWORD PTR -56+[ebp], 0
	jmp	SHORT $L405
$L404:
	mov	edx, DWORD PTR _y3$[ebp]
	sub	edx, DWORD PTR _y2$[ebp]
	shl	edx, 16					; 00000010H
	push	edx
	mov	eax, DWORD PTR _x3$[ebp]
	sub	eax, DWORD PTR _x2$[ebp]
	shl	eax, 16					; 00000010H
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR -56+[ebp], eax
$L405:
	mov	ecx, DWORD PTR -56+[ebp]
	mov	DWORD PTR _s2$[ebp], ecx
; Line 256
	mov	edx, DWORD PTR _y1$[ebp]
	cmp	edx, DWORD PTR _y2$[ebp]
	jne	$L380
; Line 258
	mov	eax, DWORD PTR _x1$[ebp]
	cmp	eax, DWORD PTR _x2$[ebp]
	jge	SHORT $L376
; Line 259
	mov	ecx, DWORD PTR _x1$[ebp]
	shl	ecx, 16					; 00000010H
	mov	DWORD PTR _start$[ebp], ecx
; Line 260
	mov	edx, DWORD PTR _x2$[ebp]
	shl	edx, 16					; 00000010H
	mov	DWORD PTR _end$[ebp], edx
; Line 261
	jmp	SHORT $L377
$L376:
; Line 262
	mov	eax, DWORD PTR _x2$[ebp]
	shl	eax, 16					; 00000010H
	mov	DWORD PTR _start$[ebp], eax
; Line 263
	mov	ecx, DWORD PTR _x1$[ebp]
	shl	ecx, 16					; 00000010H
	mov	DWORD PTR _end$[ebp], ecx
$L377:
; Line 265
	mov	edx, DWORD PTR _y$[ebp]
	cmp	edx, DWORD PTR _y3$[ebp]
	jge	SHORT $L380
; Line 266
	mov	eax, DWORD PTR _start$[ebp]
	sar	eax, 16					; 00000010H
	mov	DWORD PTR _xa$[ebp], eax
; Line 267
	mov	ecx, DWORD PTR _end$[ebp]
	sar	ecx, 16					; 00000010H
	mov	DWORD PTR _xb$[ebp], ecx
; Line 271
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	ecx, DWORD PTR _xb$[ebp]
	push	ecx
	mov	edx, DWORD PTR _xa$[ebp]
	push	edx
	call	_draw_span
	add	esp, 16					; 00000010H
; Line 272
	mov	eax, DWORD PTR _x1$[ebp]
	cmp	eax, DWORD PTR _x2$[ebp]
	jge	SHORT $L406
	mov	ecx, DWORD PTR _s3$[ebp]
	mov	DWORD PTR -60+[ebp], ecx
	jmp	SHORT $L407
$L406:
	mov	edx, DWORD PTR _s2$[ebp]
	mov	DWORD PTR -60+[ebp], edx
$L407:
	mov	eax, DWORD PTR _start$[ebp]
	add	eax, DWORD PTR -60+[ebp]
	mov	DWORD PTR _start$[ebp], eax
; Line 273
	mov	ecx, DWORD PTR _x1$[ebp]
	cmp	ecx, DWORD PTR _x2$[ebp]
	jge	SHORT $L408
	mov	edx, DWORD PTR _s2$[ebp]
	mov	DWORD PTR -64+[ebp], edx
	jmp	SHORT $L409
$L408:
	mov	eax, DWORD PTR _s3$[ebp]
	mov	DWORD PTR -64+[ebp], eax
$L409:
	mov	ecx, DWORD PTR _end$[ebp]
	add	ecx, DWORD PTR -64+[ebp]
	mov	DWORD PTR _end$[ebp], ecx
; Line 274
	mov	edx, DWORD PTR _y$[ebp]
	add	edx, 1
	mov	DWORD PTR _y$[ebp], edx
; Line 275
	jmp	SHORT $L377
$L380:
; Line 278
	mov	eax, DWORD PTR _y2$[ebp]
	sub	eax, DWORD PTR _y1$[ebp]
	shl	eax, 16					; 00000010H
	push	eax
	mov	ecx, DWORD PTR _s3$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	sar	eax, 16					; 00000010H
	mov	edx, DWORD PTR _x1$[ebp]
	add	edx, eax
	mov	DWORD PTR _xmid$[ebp], edx
; Line 282
	mov	eax, DWORD PTR _xmid$[ebp]
	cmp	eax, DWORD PTR _x2$[ebp]
	jge	SHORT $L381
; Line 283
	mov	ecx, DWORD PTR _s1$[ebp]
	mov	DWORD PTR _se$[ebp], ecx
; Line 284
	mov	edx, DWORD PTR _s3$[ebp]
	mov	DWORD PTR _ss$[ebp], edx
; Line 285
	jmp	SHORT $L382
$L381:
; Line 286
	mov	eax, DWORD PTR _s3$[ebp]
	mov	DWORD PTR _se$[ebp], eax
; Line 287
	mov	ecx, DWORD PTR _s1$[ebp]
	mov	DWORD PTR _ss$[ebp], ecx
$L382:
; Line 293
	mov	edx, DWORD PTR _y$[ebp]
	cmp	edx, DWORD PTR _y3$[ebp]
	jge	SHORT $L385
; Line 294
	mov	eax, DWORD PTR _y$[ebp]
	cmp	eax, DWORD PTR _y2$[ebp]
	jne	SHORT $L388
; Line 295
	mov	ecx, DWORD PTR _xmid$[ebp]
	cmp	ecx, DWORD PTR _x2$[ebp]
	jge	SHORT $L387
; Line 296
	mov	edx, DWORD PTR _s2$[ebp]
	mov	DWORD PTR _se$[ebp], edx
; Line 297
	jmp	SHORT $L388
$L387:
; Line 298
	mov	eax, DWORD PTR _s2$[ebp]
	mov	DWORD PTR _ss$[ebp], eax
$L388:
; Line 303
	mov	ecx, DWORD PTR _start$[ebp]
	sar	ecx, 16					; 00000010H
	mov	DWORD PTR _xa$[ebp], ecx
; Line 304
	mov	edx, DWORD PTR _end$[ebp]
	sar	edx, 16					; 00000010H
	mov	DWORD PTR _xb$[ebp], edx
; Line 305
	mov	al, BYTE PTR _color$[ebp]
	push	eax
	mov	ecx, DWORD PTR _y$[ebp]
	push	ecx
	mov	edx, DWORD PTR _xb$[ebp]
	push	edx
	mov	eax, DWORD PTR _xa$[ebp]
	push	eax
	call	_draw_span
	add	esp, 16					; 00000010H
; Line 306
	mov	ecx, DWORD PTR _start$[ebp]
	add	ecx, DWORD PTR _ss$[ebp]
	mov	DWORD PTR _start$[ebp], ecx
; Line 307
	mov	edx, DWORD PTR _end$[ebp]
	add	edx, DWORD PTR _se$[ebp]
	mov	DWORD PTR _end$[ebp], edx
; Line 308
	mov	eax, DWORD PTR _y$[ebp]
	add	eax, 1
	mov	DWORD PTR _y$[ebp], eax
; Line 309
	jmp	SHORT $L382
$L385:
; Line 313
	mov	esp, ebp
	pop	ebp
	ret	0
_fill_tri ENDP
_TEXT	ENDS
END
