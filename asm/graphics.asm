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
; File src\graphics.c
_x$ = 8
_y$ = 12
_color$ = 16
_plot_pixel PROC NEAR
; Line 14
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 15
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 320				; 00000140H
	jge	$L241
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 200				; 000000c8H
	jge	$L241
; Line 16
	mov	al, BYTE PTR _color$[ebp]
	mov	ecx, DWORD PTR _y$[ebp]
	and	ecx, 65535				; 0000ffffH
	lea	ecx, DWORD PTR [ecx+ecx*4]
	shl	ecx, 6
	mov	edx, DWORD PTR _x$[ebp]
	and	edx, 65535				; 0000ffffH
	add	ecx, edx
	mov	edx, DWORD PTR _FBPTR
	mov	BYTE PTR [ecx+edx], al
; Line 18
$L241:
$L240:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_plot_pixel ENDP
_TEXT	ENDS
PUBLIC	_bitset_pixel
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_c$ = 16
_bitset_pixel PROC NEAR
; Line 20
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 21
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 320				; 00000140H
	jge	$L246
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, 200				; 000000c8H
	jge	$L246
; Line 22
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 6
	mov	ecx, DWORD PTR _x$[ebp]
	and	ecx, 65535				; 0000ffffH
	add	eax, ecx
	mov	ecx, DWORD PTR _FBPTR
	xor	edx, edx
	mov	dl, BYTE PTR [eax+ecx]
	or	dl, BYTE PTR _c$[ebp]
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 6
	mov	ecx, DWORD PTR _x$[ebp]
	and	ecx, 65535				; 0000ffffH
	add	eax, ecx
	mov	ecx, DWORD PTR _FBPTR
	mov	BYTE PTR [eax+ecx], dl
; Line 24
$L246:
$L245:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
_swap$276 = -44
_draw_line PROC NEAR
; Line 26
	push	ebp
	mov	ebp, esp
	sub	esp, 44					; 0000002cH
	push	ebx
	push	esi
	push	edi
; Line 32
	mov	DWORD PTR _yLonger$[ebp], 0
; Line 37
	cmp	DWORD PTR _x$[ebp], 0
	jl	$L264
	cmp	DWORD PTR _y$[ebp], 0
	jl	$L264
	cmp	DWORD PTR _x$[ebp], 319			; 0000013fH
	jg	$L264
	cmp	DWORD PTR _y$[ebp], 199			; 000000c7H
	jle	$L263
$L264:
	cmp	DWORD PTR _x2$[ebp], 0
	jl	$L265
	cmp	DWORD PTR _y2$[ebp], 0
	jl	$L265
	cmp	DWORD PTR _x2$[ebp], 319		; 0000013fH
	jg	$L265
	cmp	DWORD PTR _y2$[ebp], 199		; 000000c7H
	jle	$L263
$L265:
	jmp	$L252
; Line 38
$L263:
	cmp	DWORD PTR _x2$[ebp], 0
	jge	$L266
; Line 40
	mov	ecx, DWORD PTR _y$[ebp]
	mov	eax, DWORD PTR _y2$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	imul	eax, DWORD PTR _x$[ebp]
	mov	ebx, DWORD PTR _x2$[ebp]
	sub	ebx, DWORD PTR _x$[ebp]
	cdq
	idiv	ebx
	sub	ecx, eax
	mov	DWORD PTR _y2$[ebp], ecx
; Line 41
	mov	DWORD PTR _x2$[ebp], 0
; Line 43
$L266:
	cmp	DWORD PTR _x$[ebp], 0
	jge	$L267
; Line 45
	mov	ecx, DWORD PTR _y2$[ebp]
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, DWORD PTR _y2$[ebp]
	imul	eax, DWORD PTR _x2$[ebp]
	mov	ebx, DWORD PTR _x$[ebp]
	sub	ebx, DWORD PTR _x2$[ebp]
	cdq
	idiv	ebx
	sub	ecx, eax
	mov	DWORD PTR _y$[ebp], ecx
; Line 46
	mov	DWORD PTR _x$[ebp], 0
; Line 49
$L267:
	cmp	DWORD PTR _x2$[ebp], 319		; 0000013fH
	jle	$L268
; Line 51
	mov	eax, DWORD PTR _y2$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	mov	ecx, 320				; 00000140H
	sub	ecx, DWORD PTR _x$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _x2$[ebp]
	sub	ecx, DWORD PTR _x$[ebp]
	cdq
	idiv	ecx
	mov	ecx, DWORD PTR _y$[ebp]
	add	ecx, eax
	mov	DWORD PTR _y2$[ebp], ecx
; Line 52
	mov	DWORD PTR _x2$[ebp], 319		; 0000013fH
; Line 54
$L268:
	cmp	DWORD PTR _x$[ebp], 319			; 0000013fH
	jle	$L269
; Line 56
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, DWORD PTR _y2$[ebp]
	mov	ecx, 320				; 00000140H
	sub	ecx, DWORD PTR _x2$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _x$[ebp]
	sub	ecx, DWORD PTR _x2$[ebp]
	cdq
	idiv	ecx
	mov	ecx, DWORD PTR _y2$[ebp]
	add	ecx, eax
	mov	DWORD PTR _y$[ebp], ecx
; Line 57
	mov	DWORD PTR _x$[ebp], 319			; 0000013fH
; Line 60
$L269:
	cmp	DWORD PTR _y2$[ebp], 0
	jge	$L270
; Line 62
	mov	ecx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR _x2$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	imul	eax, DWORD PTR _y$[ebp]
	mov	ebx, DWORD PTR _y2$[ebp]
	sub	ebx, DWORD PTR _y$[ebp]
	cdq
	idiv	ebx
	sub	ecx, eax
	mov	DWORD PTR _x2$[ebp], ecx
; Line 63
	mov	DWORD PTR _y2$[ebp], 0
; Line 65
$L270:
	cmp	DWORD PTR _y$[ebp], 0
	jge	$L271
; Line 67
	mov	ecx, DWORD PTR _x2$[ebp]
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR _x2$[ebp]
	imul	eax, DWORD PTR _y2$[ebp]
	mov	ebx, DWORD PTR _y$[ebp]
	sub	ebx, DWORD PTR _y2$[ebp]
	cdq
	idiv	ebx
	sub	ecx, eax
	mov	DWORD PTR _x$[ebp], ecx
; Line 68
	mov	DWORD PTR _y$[ebp], 0
; Line 71
$L271:
	cmp	DWORD PTR _y2$[ebp], 199		; 000000c7H
	jle	$L272
; Line 73
	mov	eax, DWORD PTR _x2$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	mov	ecx, 200				; 000000c8H
	sub	ecx, DWORD PTR _y$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _y2$[ebp]
	sub	ecx, DWORD PTR _y$[ebp]
	cdq
	idiv	ecx
	mov	ecx, DWORD PTR _x$[ebp]
	add	ecx, eax
	mov	DWORD PTR _x2$[ebp], ecx
; Line 74
	mov	DWORD PTR _y2$[ebp], 199		; 000000c7H
; Line 76
$L272:
	cmp	DWORD PTR _y$[ebp], 199			; 000000c7H
	jle	$L273
; Line 78
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR _x2$[ebp]
	mov	ecx, 200				; 000000c8H
	sub	ecx, DWORD PTR _y2$[ebp]
	imul	eax, ecx
	mov	ecx, DWORD PTR _y$[ebp]
	sub	ecx, DWORD PTR _y2$[ebp]
	cdq
	idiv	ecx
	mov	ecx, DWORD PTR _x2$[ebp]
	add	ecx, eax
	mov	DWORD PTR _x$[ebp], ecx
; Line 79
	mov	DWORD PTR _y$[ebp], 199			; 000000c7H
; Line 82
$L273:
	mov	eax, DWORD PTR _y2$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	mov	DWORD PTR _shortLen$[ebp], eax
; Line 83
	mov	eax, DWORD PTR _x2$[ebp]
	sub	eax, DWORD PTR _x$[ebp]
	mov	DWORD PTR _longLen$[ebp], eax
; Line 84
	mov	eax, DWORD PTR _longLen$[ebp]
	push	eax
	call	_abs
	add	esp, 4
	mov	ebx, eax
	mov	eax, DWORD PTR _shortLen$[ebp]
	push	eax
	call	_abs
	add	esp, 4
	cmp	ebx, eax
	jge	$L275
; Line 85
	mov	eax, DWORD PTR _shortLen$[ebp]
	mov	DWORD PTR _swap$276[ebp], eax
; Line 86
	mov	eax, DWORD PTR _longLen$[ebp]
	mov	DWORD PTR _shortLen$[ebp], eax
; Line 87
	mov	eax, DWORD PTR _swap$276[ebp]
	mov	DWORD PTR _longLen$[ebp], eax
; Line 88
	mov	DWORD PTR _yLonger$[ebp], 1
; Line 90
$L275:
	mov	eax, DWORD PTR _longLen$[ebp]
	mov	DWORD PTR _endVal$[ebp], eax
; Line 91
	cmp	DWORD PTR _longLen$[ebp], 0
	jge	$L277
; Line 92
	mov	DWORD PTR _incrementVal$[ebp], -1
; Line 93
	mov	DWORD PTR _addrInc$[ebp], -320		; fffffec0H
; Line 94
	mov	eax, DWORD PTR _longLen$[ebp]
	neg	eax
	mov	DWORD PTR _longLen$[ebp], eax
; Line 96
	jmp	$L278
$L277:
; Line 97
	mov	DWORD PTR _incrementVal$[ebp], 1
; Line 98
	mov	DWORD PTR _addrInc$[ebp], 320		; 00000140H
; Line 99
$L278:
; Line 100
	cmp	DWORD PTR _longLen$[ebp], 0
	jne	$L279
	mov	DWORD PTR _decInc$[ebp], 0
; Line 101
	jmp	$L280
$L279:
	mov	eax, DWORD PTR _shortLen$[ebp]
	shl	eax, 16					; 00000010H
	cdq
	idiv	DWORD PTR _longLen$[ebp]
	mov	DWORD PTR _decInc$[ebp], eax
$L280:
; Line 102
	mov	DWORD PTR _j$[ebp], 0
; Line 103
	mov	eax, DWORD PTR _y$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 6
	add	eax, DWORD PTR _x$[ebp]
	add	eax, DWORD PTR _FBPTR
	mov	DWORD PTR _address$[ebp], eax
; Line 105
	cmp	DWORD PTR _yLonger$[ebp], 0
	je	$L281
; Line 107
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L282
$L283:
	mov	eax, DWORD PTR _incrementVal$[ebp]
	add	DWORD PTR _i$[ebp], eax
	mov	eax, DWORD PTR _addrInc$[ebp]
	add	DWORD PTR _address$[ebp], eax
$L282:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _endVal$[ebp], eax
	je	$L284
; Line 109
	mov	al, BYTE PTR _color$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	sar	ecx, 16					; 00000010H
	mov	edx, DWORD PTR _address$[ebp]
	mov	BYTE PTR [ecx+edx], al
; Line 111
	mov	eax, DWORD PTR _decInc$[ebp]
	add	DWORD PTR _j$[ebp], eax
; Line 112
	jmp	$L283
$L284:
; Line 114
	jmp	$L285
$L281:
; Line 115
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L286
$L287:
	mov	eax, DWORD PTR _incrementVal$[ebp]
	add	DWORD PTR _i$[ebp], eax
	mov	eax, DWORD PTR _incrementVal$[ebp]
	add	DWORD PTR _address$[ebp], eax
$L286:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _endVal$[ebp], eax
	je	$L288
; Line 116
	mov	al, BYTE PTR _color$[ebp]
	mov	ecx, DWORD PTR _j$[ebp]
	sar	ecx, 16					; 00000010H
	lea	ecx, DWORD PTR [ecx+ecx*4]
	shl	ecx, 6
	mov	edx, DWORD PTR _address$[ebp]
	mov	BYTE PTR [ecx+edx], al
; Line 119
	mov	eax, DWORD PTR _decInc$[ebp]
	add	DWORD PTR _j$[ebp], eax
; Line 120
	jmp	$L287
$L288:
; Line 121
$L285:
; Line 124
$L252:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
; Line 128
	push	ebp
	mov	ebp, esp
	sub	esp, 48					; 00000030H
	push	ebx
	push	esi
	push	edi
; Line 131
	movsx	eax, WORD PTR _x2$[ebp]
	movsx	ecx, WORD PTR _x1$[ebp]
	sub	eax, ecx
	mov	WORD PTR _dx$[ebp], ax
; Line 132
	movsx	eax, WORD PTR _y2$[ebp]
	movsx	ecx, WORD PTR _y1$[ebp]
	sub	eax, ecx
	mov	WORD PTR _dy$[ebp], ax
; Line 133
	movsx	eax, WORD PTR _dx$[ebp]
	push	eax
	call	_abs
	add	esp, 4
	mov	WORD PTR _dxabs$[ebp], ax
; Line 134
	movsx	eax, WORD PTR _dy$[ebp]
	push	eax
	call	_abs
	add	esp, 4
	mov	WORD PTR _dyabs$[ebp], ax
; Line 135
	movsx	eax, WORD PTR _dx$[ebp]
	test	eax, eax
	jl	$L329
	movsx	eax, WORD PTR _dx$[ebp]
	test	eax, eax
	jle	$L331
	mov	WORD PTR _sdx$[ebp], 1
	jmp	$L332
$L331:
	mov	WORD PTR _sdx$[ebp], 0
$L332:
	jmp	$L330
$L329:
	mov	WORD PTR _sdx$[ebp], -1
$L330:
; Line 136
	movsx	eax, WORD PTR _dy$[ebp]
	test	eax, eax
	jl	$L333
	movsx	eax, WORD PTR _dy$[ebp]
	test	eax, eax
	jle	$L335
	mov	WORD PTR _sdy$[ebp], 1
	jmp	$L336
$L335:
	mov	WORD PTR _sdy$[ebp], 0
$L336:
	jmp	$L334
$L333:
	mov	WORD PTR _sdy$[ebp], -1
$L334:
; Line 137
	movsx	eax, WORD PTR _dyabs$[ebp]
	sar	eax, 1
	mov	WORD PTR _x$[ebp], ax
; Line 138
	movsx	eax, WORD PTR _dxabs$[ebp]
	sar	eax, 1
	mov	WORD PTR _y$[ebp], ax
; Line 139
	mov	ax, WORD PTR _x1$[ebp]
	mov	WORD PTR _px$[ebp], ax
; Line 140
	mov	ax, WORD PTR _y1$[ebp]
	mov	WORD PTR _py$[ebp], ax
; Line 142
	movsx	eax, WORD PTR _px$[ebp]
	test	eax, eax
	jl	$L309
	movsx	eax, WORD PTR _px$[ebp]
	cmp	eax, 319				; 0000013fH
	jg	$L309
	movsx	eax, WORD PTR _py$[ebp]
	test	eax, eax
	jl	$L309
	movsx	eax, WORD PTR _py$[ebp]
	cmp	eax, 199				; 000000c7H
	jle	$L308
$L309:
; Line 143
	jmp	$L295
; Line 146
$L308:
	movsx	eax, WORD PTR _py$[ebp]
	shl	eax, 8
	movsx	ecx, WORD PTR _py$[ebp]
	shl	ecx, 6
	add	eax, ecx
	movsx	ecx, WORD PTR _px$[ebp]
	add	eax, ecx
	mov	WORD PTR _address$[ebp], ax
; Line 149
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _py$[ebp]
	push	eax
	mov	eax, DWORD PTR _px$[ebp]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 153
	movsx	eax, WORD PTR _dyabs$[ebp]
	movsx	ecx, WORD PTR _dxabs$[ebp]
	cmp	eax, ecx
	jg	$L310
; Line 155
	mov	WORD PTR _i$[ebp], 0
	jmp	$L311
$L312:
	inc	WORD PTR _i$[ebp]
$L311:
	movsx	eax, WORD PTR _dxabs$[ebp]
	movsx	ecx, WORD PTR _i$[ebp]
	cmp	eax, ecx
	jle	$L313
; Line 157
	movsx	eax, WORD PTR _y$[ebp]
	movsx	ecx, WORD PTR _dyabs$[ebp]
	add	eax, ecx
	mov	WORD PTR _y$[ebp], ax
; Line 158
	movsx	eax, WORD PTR _y$[ebp]
	movsx	ecx, WORD PTR _dxabs$[ebp]
	cmp	eax, ecx
	jl	$L314
; Line 160
	movsx	eax, WORD PTR _y$[ebp]
	movsx	ecx, WORD PTR _dxabs$[ebp]
	sub	eax, ecx
	mov	WORD PTR _y$[ebp], ax
; Line 161
	movsx	eax, WORD PTR _py$[ebp]
	movsx	ecx, WORD PTR _sdy$[ebp]
	add	eax, ecx
	mov	WORD PTR _py$[ebp], ax
; Line 162
	movsx	eax, WORD PTR _sdy$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 6
	movsx	ecx, WORD PTR _address$[ebp]
	add	eax, ecx
	mov	WORD PTR _address$[ebp], ax
; Line 164
$L314:
	movsx	eax, WORD PTR _px$[ebp]
	movsx	ecx, WORD PTR _sdx$[ebp]
	add	eax, ecx
	mov	WORD PTR _px$[ebp], ax
; Line 166
	movsx	eax, WORD PTR _px$[ebp]
	test	eax, eax
	jl	$L316
	movsx	eax, WORD PTR _px$[ebp]
	cmp	eax, 319				; 0000013fH
	jg	$L316
	movsx	eax, WORD PTR _py$[ebp]
	test	eax, eax
	jl	$L316
	movsx	eax, WORD PTR _py$[ebp]
	cmp	eax, 199				; 000000c7H
	jle	$L315
$L316:
; Line 167
	jmp	$L295
; Line 170
$L315:
	movsx	eax, WORD PTR _sdx$[ebp]
	movsx	ecx, WORD PTR _address$[ebp]
	add	eax, ecx
	mov	WORD PTR _address$[ebp], ax
; Line 171
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _py$[ebp]
	push	eax
	mov	eax, DWORD PTR _px$[ebp]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 172
	jmp	$L312
$L313:
; Line 174
	jmp	$L317
$L310:
; Line 176
	mov	WORD PTR _i$[ebp], 0
	jmp	$L318
$L319:
	inc	WORD PTR _i$[ebp]
$L318:
	movsx	eax, WORD PTR _dyabs$[ebp]
	movsx	ecx, WORD PTR _i$[ebp]
	cmp	eax, ecx
	jle	$L320
; Line 178
	movsx	eax, WORD PTR _x$[ebp]
	movsx	ecx, WORD PTR _dxabs$[ebp]
	add	eax, ecx
	mov	WORD PTR _x$[ebp], ax
; Line 179
	movsx	eax, WORD PTR _x$[ebp]
	movsx	ecx, WORD PTR _dyabs$[ebp]
	cmp	eax, ecx
	jl	$L321
; Line 181
	movsx	eax, WORD PTR _x$[ebp]
	movsx	ecx, WORD PTR _dyabs$[ebp]
	sub	eax, ecx
	mov	WORD PTR _x$[ebp], ax
; Line 182
	movsx	eax, WORD PTR _px$[ebp]
	movsx	ecx, WORD PTR _sdx$[ebp]
	add	eax, ecx
	mov	WORD PTR _px$[ebp], ax
; Line 183
	movsx	eax, WORD PTR _sdx$[ebp]
	movsx	ecx, WORD PTR _address$[ebp]
	add	eax, ecx
	mov	WORD PTR _address$[ebp], ax
; Line 185
$L321:
	movsx	eax, WORD PTR _py$[ebp]
	movsx	ecx, WORD PTR _sdy$[ebp]
	add	eax, ecx
	mov	WORD PTR _py$[ebp], ax
; Line 187
	movsx	eax, WORD PTR _px$[ebp]
	test	eax, eax
	jl	$L323
	movsx	eax, WORD PTR _px$[ebp]
	cmp	eax, 319				; 0000013fH
	jg	$L323
	movsx	eax, WORD PTR _py$[ebp]
	test	eax, eax
	jl	$L323
	movsx	eax, WORD PTR _py$[ebp]
	cmp	eax, 199				; 000000c7H
	jle	$L322
$L323:
; Line 188
	jmp	$L295
; Line 191
$L322:
	movsx	eax, WORD PTR _sdy$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	shl	eax, 6
	movsx	ecx, WORD PTR _address$[ebp]
	add	eax, ecx
	mov	WORD PTR _address$[ebp], ax
; Line 192
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _py$[ebp]
	push	eax
	mov	eax, DWORD PTR _px$[ebp]
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 194
	jmp	$L319
$L320:
; Line 195
$L317:
; Line 196
$L295:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
; Line 199
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 200
	push	64000					; 0000fa00H
	mov	eax, DWORD PTR _FBPTR
	push	eax
	mov	eax, DWORD PTR _front_buffer$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 201
	push	64000					; 0000fa00H
	xor	eax, eax
	mov	al, BYTE PTR _clear_color$[ebp]
	push	eax
	mov	eax, DWORD PTR _FBPTR
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 202
$L326:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_swap_buffers ENDP
_TEXT	ENDS
END
