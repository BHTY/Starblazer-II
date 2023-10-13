	TITLE	src\font.c
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
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _unpack_glyphs
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT __draw_glyph
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_glyph
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_string
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _vputs
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_current_glyph
_DATA	SEGMENT
COMM	_glyphs:DWORD:030H
_current_glyph DD 0270fH
_DATA	ENDS
PUBLIC	??_C@_01LHO@r?$AA@				; `string'
PUBLIC	_unpack_glyphs
EXTRN	_malloc:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
EXTRN	_fclose:NEAR
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT
??_C@_01LHO@r?$AA@ DB 'r', 00H				; `string'
_DATA	ENDS
;	COMDAT _unpack_glyphs
_TEXT	SEGMENT
; File src\font.c
_filename$ = 8
_unpack_glyphs PROC NEAR				; COMDAT
; Line 13
	mov	eax, DWORD PTR _filename$[esp-4]
	push	ebx
	push	esi
	push	edi
; Line 14
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	eax
	call	_fopen
	add	esp, 8
	mov	ebx, eax
; Line 21
	push	2
	push	0
	push	ebx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 22
	push	ebx
	call	_ftell
	add	esp, 4
	mov	esi, eax
; Line 24
	push	0
	push	0
	push	ebx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 26
	push	esi
	call	_malloc
	add	esp, 4
	mov	edi, eax
; Line 27
	push	ebx
	push	esi
	push	1
	push	edi
	call	_fread
	add	esp, 16					; 00000010H
; Line 28
	push	ebx
	call	_fclose
	add	esp, 4
	mov	eax, OFFSET FLAT:_glyphs
; Line 32
$L454:
; Line 33
	mov	DWORD PTR [eax], edi
	add	eax, 4
; Line 38
	mov	ecx, DWORD PTR [edi]
	shl	ecx, 4
	add	ecx, 4
	add	edi, ecx
	cmp	eax, OFFSET FLAT:_glyphs+192
	jb	SHORT $L454
; Line 40
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_unpack_glyphs ENDP
_TEXT	ENDS
PUBLIC	__draw_glyph
EXTRN	_drawline:NEAR
;	COMDAT __draw_glyph
_TEXT	SEGMENT
_glyph$ = 8
_centerX$ = 12
_centerY$ = 16
_color$ = 20
_scaleX$ = 24
_scaleY$ = 28
__draw_glyph PROC NEAR					; COMDAT
; Line 44
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
	xor	ebx, ebx
	mov	edi, DWORD PTR _scaleY$[esp+12]
	push	ebp
; Line 48
	mov	esi, DWORD PTR _glyph$[esp+16]
	neg	edi
	cmp	DWORD PTR [esi], ebx
	jle	SHORT $L464
	movsx	eax, BYTE PTR _color$[esp+16]
	lea	ebp, DWORD PTR [esi+16]
	mov	DWORD PTR -4+[esp+20], eax
$L466:
; Line 49
	mov	eax, DWORD PTR -4+[esp+20]
	add	ebp, 16					; 00000010H
	push	eax
	inc	ebx
	mov	eax, DWORD PTR [ebp-16]
	imul	eax, edi
	add	eax, DWORD PTR _centerY$[esp+20]
	push	eax
	mov	eax, DWORD PTR [ebp-20]
	imul	eax, DWORD PTR _scaleX$[esp+24]
	add	eax, DWORD PTR _centerX$[esp+24]
	push	eax
	mov	eax, DWORD PTR [ebp-24]
	imul	eax, edi
	add	eax, DWORD PTR _centerY$[esp+28]
	push	eax
	mov	eax, DWORD PTR [ebp-28]
	imul	eax, DWORD PTR _scaleX$[esp+32]
	add	eax, DWORD PTR _centerX$[esp+32]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 48
	cmp	DWORD PTR [esi], ebx
	jg	SHORT $L466
; Line 51
$L464:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 4
	ret	0
__draw_glyph ENDP
_TEXT	ENDS
PUBLIC	_draw_glyph
;	COMDAT _draw_glyph
_TEXT	SEGMENT
_index$ = 8
_centerX$ = 12
_centerY$ = 16
_color$ = 20
_scaleX$ = 24
_scaleY$ = 28
_draw_glyph PROC NEAR					; COMDAT
; Line 54
	mov	eax, DWORD PTR _scaleY$[esp-4]
	mov	ecx, DWORD PTR _scaleX$[esp-4]
	mov	dl, BYTE PTR _color$[esp-4]
	push	eax
	mov	eax, DWORD PTR _centerY$[esp]
	push	ecx
	mov	ecx, DWORD PTR _centerX$[esp+4]
	push	edx
	mov	edx, DWORD PTR _index$[esp+8]
	push	eax
	push	ecx
	mov	eax, DWORD PTR _glyphs[edx*4]
	push	eax
	call	__draw_glyph
	add	esp, 24					; 00000018H
; Line 55
	ret	0
_draw_glyph ENDP
_TEXT	ENDS
PUBLIC	_draw_string
;	COMDAT _draw_string
_TEXT	SEGMENT
_str$ = 8
_upperRightX$ = 12
_upperRightY$ = 16
_scaleX$ = 20
_scaleY$ = 24
_color$ = 28
_spacing$ = 32
_original$ = -4
_draw_string PROC NEAR					; COMDAT
; Line 57
	sub	esp, 4
	push	ebx
	push	esi
	mov	ebx, DWORD PTR _str$[esp+8]
	push	edi
	push	ebp
; Line 59
	cmp	BYTE PTR [ebx], 0
	mov	ebp, DWORD PTR _upperRightX$[esp+16]
	mov	DWORD PTR _original$[esp+20], ebp
; Line 61
	je	$L489
	mov	esi, DWORD PTR _scaleX$[esp+16]
	mov	edi, DWORD PTR _scaleY$[esp+16]
$L488:
	mov	al, BYTE PTR [ebx]
; Line 63
	cmp	al, 93					; 0000005dH
	jne	SHORT $L490
; Line 64
	mov	al, BYTE PTR [ebx+1]
	add	ebx, 2
	mov	BYTE PTR _color$[esp+16], al
; Line 66
	jmp	$L532
; Line 69
$L490:
	cmp	al, 47					; 0000002fH
	jne	SHORT $L491
; Line 71
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	47					; 0000002fH
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 74
$L491:
	cmp	BYTE PTR [ebx], 39			; 00000027H
	jne	SHORT $L492
; Line 77
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	46					; 0000002eH
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 80
$L492:
	mov	cl, BYTE PTR [ebx]
	cmp	cl, 65					; 00000041H
	jl	SHORT $L493
	cmp	cl, 90					; 0000005aH
	jg	SHORT $L493
; Line 81
	sub	cl, 65					; 00000041H
	push	edi
; Line 83
	mov	al, BYTE PTR _color$[esp+20]
	push	esi
	movsx	ecx, cl
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	mov	edx, DWORD PTR _upperRightY$[esp+28]
	sar	eax, 1
	add	edx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	push	edx
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	ecx
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 86
$L493:
	mov	cl, BYTE PTR [ebx]
	cmp	cl, 48					; 00000030H
	jl	SHORT $L494
	cmp	cl, 57					; 00000039H
	jg	SHORT $L494
; Line 87
	sub	cl, 22					; 00000016H
	push	edi
; Line 89
	mov	al, BYTE PTR _color$[esp+20]
	push	esi
	movsx	ecx, cl
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	mov	edx, DWORD PTR _upperRightY$[esp+28]
	sar	eax, 1
	add	edx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	push	edx
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	ecx
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 92
$L494:
	cmp	BYTE PTR [ebx], 46			; 0000002eH
	jne	SHORT $L495
; Line 95
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	36					; 00000024H
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 98
$L495:
	cmp	BYTE PTR [ebx], 44			; 0000002cH
	jne	SHORT $L496
; Line 101
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	37					; 00000025H
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 104
$L496:
	cmp	BYTE PTR [ebx], 45			; 0000002dH
	jne	SHORT $L497
; Line 107
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	38					; 00000026H
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 110
$L497:
	cmp	BYTE PTR [ebx], 63			; 0000003fH
	jne	SHORT $L498
; Line 113
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	39					; 00000027H
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 116
$L498:
	cmp	BYTE PTR [ebx], 33			; 00000021H
	jne	SHORT $L499
; Line 119
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	40					; 00000028H
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 122
$L499:
	cmp	BYTE PTR [ebx], 58			; 0000003aH
	jne	SHORT $L500
; Line 125
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	41					; 00000029H
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 128
$L500:
	cmp	BYTE PTR [ebx], 59			; 0000003bH
	jne	SHORT $L501
; Line 131
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	42					; 0000002aH
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 134
$L501:
	cmp	BYTE PTR [ebx], 116			; 00000074H
	jne	SHORT $L502
; Line 137
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	43					; 0000002bH
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 140
$L502:
	cmp	BYTE PTR [ebx], 43			; 0000002bH
	jne	SHORT $L503
; Line 143
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	44					; 0000002cH
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 146
$L503:
	cmp	BYTE PTR [ebx], 120			; 00000078H
	jne	SHORT $L504
; Line 149
	mov	al, BYTE PTR _color$[esp+16]
	push	edi
	mov	ecx, DWORD PTR _upperRightY$[esp+20]
	push	esi
	push	eax
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	ecx, eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	push	ecx
	sub	eax, edx
	sar	eax, 1
	add	eax, ebp
	push	eax
	push	45					; 0000002dH
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 152
$L504:
	inc	ebx
	lea	eax, DWORD PTR [esi+esi*2]
; Line 153
	add	eax, DWORD PTR _spacing$[esp+16]
	add	ebp, eax
$L532:
; Line 154
	cmp	BYTE PTR [ebx], 0
	jne	$L488
$L489:
; Line 156
	sub	ebp, DWORD PTR _original$[esp+20]
	mov	eax, ebp
; Line 157
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 4
	ret	0
_draw_string ENDP
_TEXT	ENDS
PUBLIC	_vputs
;	COMDAT _vputs
_TEXT	SEGMENT
_str$ = 8
_x$ = 12
_y$ = 16
_xscale$ = 20
_yscale$ = 24
_color$ = 28
_spacing$ = 32
_vputs	PROC NEAR					; COMDAT
; Line 160
	mov	cl, BYTE PTR _color$[esp-4]
	mov	edx, DWORD PTR _yscale$[esp-4]
	movsx	eax, BYTE PTR _spacing$[esp-4]
	push	eax
	push	ecx
	mov	eax, DWORD PTR _xscale$[esp+4]
	push	edx
	mov	ecx, DWORD PTR _y$[esp+8]
	push	eax
	mov	edx, DWORD PTR _x$[esp+12]
	push	ecx
	mov	eax, DWORD PTR _str$[esp+16]
	push	edx
	push	eax
	call	_draw_string
	add	esp, 28					; 0000001cH
; Line 161
	ret	0
_vputs	ENDP
_TEXT	ENDS
END
