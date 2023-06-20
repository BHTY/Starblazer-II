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
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_current_glyph
_DATA	SEGMENT
COMM	_glyphs:DWORD:030H
_current_glyph DD 0270fH
_DATA	ENDS
PUBLIC	_unpack_glyphs
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
EXTRN	_malloc:NEAR
_DATA	SEGMENT
$SG334	DB	'r', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File src\font.c
_filename$ = 8
_fp$ = -24
_i$ = -12
_sz$ = -20
_cur_ptr$ = -4
_og_ptr$ = -16
_pointer$ = -8
_unpack_glyphs PROC NEAR
; Line 13
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 14
	push	OFFSET FLAT:$SG334
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 21
	push	2
	push	0
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 22
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_ftell
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax
; Line 24
	push	0
	push	0
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 26
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _pointer$[ebp], eax
; Line 27
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _pointer$[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 28
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 30
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	DWORD PTR _og_ptr$[ebp], eax
; Line 32
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L340
$L341:
	inc	DWORD PTR _i$[ebp]
$L340:
	cmp	DWORD PTR _i$[ebp], 48			; 00000030H
	jge	$L342
; Line 33
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	DWORD PTR _glyphs[ecx*4], eax
; Line 34
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	DWORD PTR _cur_ptr$[ebp], eax
; Line 38
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	eax, DWORD PTR [eax]
	shl	eax, 4
	add	eax, 4
	add	DWORD PTR _pointer$[ebp], eax
; Line 39
	jmp	$L341
$L342:
; Line 40
$L332:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_unpack_glyphs ENDP
_TEXT	ENDS
PUBLIC	__draw_glyph
EXTRN	_drawline:NEAR
_TEXT	SEGMENT
_glyph$ = 8
_centerX$ = 12
_centerY$ = 16
_color$ = 20
_scaleX$ = 24
_scaleY$ = 28
_i$ = -4
__draw_glyph PROC NEAR
; Line 44
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 46
	mov	eax, DWORD PTR _scaleY$[ebp]
	neg	eax
	mov	DWORD PTR _scaleY$[ebp], eax
; Line 48
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L352
$L353:
	inc	DWORD PTR _i$[ebp]
$L352:
	mov	eax, DWORD PTR _glyph$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax], ecx
	jle	$L354
; Line 49
	movsx	eax, BYTE PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _glyph$[ebp]
	mov	eax, DWORD PTR [eax+ecx+16]
	imul	eax, DWORD PTR _scaleY$[ebp]
	add	eax, DWORD PTR _centerY$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _glyph$[ebp]
	mov	eax, DWORD PTR [eax+ecx+12]
	imul	eax, DWORD PTR _scaleX$[ebp]
	add	eax, DWORD PTR _centerX$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _glyph$[ebp]
	mov	eax, DWORD PTR [eax+ecx+8]
	imul	eax, DWORD PTR _scaleY$[ebp]
	add	eax, DWORD PTR _centerY$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _glyph$[ebp]
	mov	eax, DWORD PTR [eax+ecx+4]
	imul	eax, DWORD PTR _scaleX$[ebp]
	add	eax, DWORD PTR _centerX$[ebp]
	push	eax
	call	_drawline
	add	esp, 20					; 00000014H
; Line 50
	jmp	$L353
$L354:
; Line 51
$L350:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
__draw_glyph ENDP
_TEXT	ENDS
PUBLIC	_draw_glyph
_TEXT	SEGMENT
_index$ = 8
_centerX$ = 12
_centerY$ = 16
_color$ = 20
_scaleX$ = 24
_scaleY$ = 28
_draw_glyph PROC NEAR
; Line 53
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 54
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _centerY$[ebp]
	push	eax
	mov	eax, DWORD PTR _centerX$[ebp]
	push	eax
	mov	eax, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR _glyphs[eax*4]
	push	eax
	call	__draw_glyph
	add	esp, 24					; 00000018H
; Line 55
$L362:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_glyph ENDP
_TEXT	ENDS
PUBLIC	_draw_string
_TEXT	SEGMENT
_str$ = 8
_upperRightX$ = 12
_upperRightY$ = 16
_scaleX$ = 20
_scaleY$ = 24
_color$ = 28
_spacing$ = 32
_c$ = -4
_draw_string PROC NEAR
; Line 57
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 60
$L373:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	test	eax, eax
	je	$L374
; Line 62
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 93					; 0000005dH
	jne	$L375
; Line 63
	mov	eax, DWORD PTR _str$[ebp]
	mov	al, BYTE PTR [eax+1]
	mov	BYTE PTR _color$[ebp], al
; Line 64
	add	DWORD PTR _str$[ebp], 2
; Line 65
	jmp	$L373
; Line 68
$L375:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 47					; 0000002fH
	jne	$L376
; Line 69
	mov	BYTE PTR _c$[ebp], 47			; 0000002fH
; Line 70
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 73
$L376:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 39					; 00000027H
	jne	$L377
; Line 74
	mov	BYTE PTR _c$[ebp], 46			; 0000002eH
; Line 76
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 79
$L377:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 65					; 00000041H
	jl	$L378
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 90					; 0000005aH
	jg	$L378
; Line 80
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 65					; 00000041H
	mov	BYTE PTR _c$[ebp], al
; Line 82
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 85
$L378:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 48					; 00000030H
	jl	$L379
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 57					; 00000039H
	jg	$L379
; Line 86
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	sub	eax, 22					; 00000016H
	mov	BYTE PTR _c$[ebp], al
; Line 88
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 91
$L379:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 46					; 0000002eH
	jne	$L380
; Line 92
	mov	BYTE PTR _c$[ebp], 36			; 00000024H
; Line 94
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 97
$L380:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 44					; 0000002cH
	jne	$L381
; Line 98
	mov	BYTE PTR _c$[ebp], 37			; 00000025H
; Line 100
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 103
$L381:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 45					; 0000002dH
	jne	$L382
; Line 104
	mov	BYTE PTR _c$[ebp], 38			; 00000026H
; Line 106
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 109
$L382:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 63					; 0000003fH
	jne	$L383
; Line 110
	mov	BYTE PTR _c$[ebp], 39			; 00000027H
; Line 112
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 115
$L383:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 33					; 00000021H
	jne	$L384
; Line 116
	mov	BYTE PTR _c$[ebp], 40			; 00000028H
; Line 118
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 121
$L384:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 58					; 0000003aH
	jne	$L385
; Line 122
	mov	BYTE PTR _c$[ebp], 41			; 00000029H
; Line 124
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 127
$L385:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 59					; 0000003bH
	jne	$L386
; Line 128
	mov	BYTE PTR _c$[ebp], 42			; 0000002aH
; Line 130
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 133
$L386:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 116				; 00000074H
	jne	$L387
; Line 134
	mov	BYTE PTR _c$[ebp], 43			; 0000002bH
; Line 136
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 139
$L387:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 43					; 0000002bH
	jne	$L388
; Line 140
	mov	BYTE PTR _c$[ebp], 44			; 0000002cH
; Line 142
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 145
$L388:
	mov	eax, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [eax]
	cmp	eax, 120				; 00000078H
	jne	$L389
; Line 146
	mov	BYTE PTR _c$[ebp], 45			; 0000002dH
; Line 148
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleX$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	lea	eax, DWORD PTR [eax+eax*4]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightX$[ebp]
	add	ecx, eax
	push	ecx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
; Line 151
$L389:
	inc	DWORD PTR _str$[ebp]
; Line 152
	mov	eax, DWORD PTR _scaleX$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	add	eax, DWORD PTR _spacing$[ebp]
	add	DWORD PTR _upperRightX$[ebp], eax
; Line 153
	jmp	$L373
$L374:
; Line 154
$L370:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_string ENDP
_TEXT	ENDS
PUBLIC	_vputs
_TEXT	SEGMENT
_str$ = 8
_x$ = 12
_y$ = 16
_xscale$ = 20
_yscale$ = 24
_color$ = 28
_spacing$ = 32
_vputs	PROC NEAR
; Line 156
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 157
	movsx	eax, BYTE PTR _spacing$[ebp]
	push	eax
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _yscale$[ebp]
	push	eax
	mov	eax, DWORD PTR _xscale$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_draw_string
	add	esp, 28					; 0000001cH
; Line 158
$L397:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vputs	ENDP
_TEXT	ENDS
END
