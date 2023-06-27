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
$SG340	DB	'r', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_fp$ = -24
_i$ = -12
_sz$ = -20
_cur_ptr$ = -4
_og_ptr$ = -16
_pointer$ = -8
_unpack_glyphs PROC NEAR
; File src\font.c
; Line 13
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
; Line 14
	push	OFFSET FLAT:$SG340
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 21
	push	2
	push	0
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 22
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
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
	mov	ecx, DWORD PTR _sz$[ebp]
	push	ecx
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _pointer$[ebp], eax
; Line 27
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _pointer$[ebp]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
; Line 28
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	call	_fclose
	add	esp, 4
; Line 30
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	DWORD PTR _og_ptr$[ebp], eax
; Line 32
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L346
$L347:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L346:
	cmp	DWORD PTR _i$[ebp], 48			; 00000030H
	jge	SHORT $L348
; Line 33
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _pointer$[ebp]
	mov	DWORD PTR _glyphs[edx*4], eax
; Line 34
	mov	ecx, DWORD PTR _pointer$[ebp]
	mov	DWORD PTR _cur_ptr$[ebp], ecx
; Line 38
	mov	edx, DWORD PTR _pointer$[ebp]
	mov	eax, DWORD PTR [edx]
	shl	eax, 4
	mov	ecx, DWORD PTR _pointer$[ebp]
	lea	edx, DWORD PTR [ecx+eax+4]
	mov	DWORD PTR _pointer$[ebp], edx
; Line 39
	jmp	SHORT $L347
$L348:
; Line 40
	mov	esp, ebp
	pop	ebp
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
	push	ecx
; Line 46
	mov	eax, DWORD PTR _scaleY$[ebp]
	neg	eax
	mov	DWORD PTR _scaleY$[ebp], eax
; Line 48
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L358
$L359:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L358:
	mov	edx, DWORD PTR _glyph$[ebp]
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR [edx]
	jge	SHORT $L360
; Line 49
	movsx	ecx, BYTE PTR _color$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _glyph$[ebp]
	mov	ecx, DWORD PTR _scaleY$[ebp]
	imul	ecx, DWORD PTR [eax+edx+16]
	mov	edx, DWORD PTR _centerY$[ebp]
	add	edx, ecx
	push	edx
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	ecx, DWORD PTR _glyph$[ebp]
	mov	edx, DWORD PTR _scaleX$[ebp]
	imul	edx, DWORD PTR [ecx+eax+12]
	mov	eax, DWORD PTR _centerX$[ebp]
	add	eax, edx
	push	eax
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _glyph$[ebp]
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, DWORD PTR [edx+ecx+8]
	mov	ecx, DWORD PTR _centerY$[ebp]
	add	ecx, eax
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _glyph$[ebp]
	mov	ecx, DWORD PTR [eax+edx+4]
	imul	ecx, DWORD PTR _scaleX$[ebp]
	mov	edx, DWORD PTR _centerX$[ebp]
	add	edx, ecx
	push	edx
	call	_drawline
	add	esp, 20					; 00000014H
; Line 50
	jmp	SHORT $L359
$L360:
; Line 51
	mov	esp, ebp
	pop	ebp
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
; Line 54
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _centerY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _centerX$[ebp]
	push	ecx
	mov	edx, DWORD PTR _index$[ebp]
	mov	eax, DWORD PTR _glyphs[edx*4]
	push	eax
	call	__draw_glyph
	add	esp, 24					; 00000018H
; Line 55
	pop	ebp
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
	push	ecx
$L379:
; Line 60
	mov	eax, DWORD PTR _str$[ebp]
	movsx	ecx, BYTE PTR [eax]
	test	ecx, ecx
	je	$L380
; Line 62
	mov	edx, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [edx]
	cmp	eax, 93					; 0000005dH
	jne	SHORT $L381
; Line 63
	mov	ecx, DWORD PTR _str$[ebp]
	mov	dl, BYTE PTR [ecx+1]
	mov	BYTE PTR _color$[ebp], dl
; Line 64
	mov	eax, DWORD PTR _str$[ebp]
	add	eax, 2
	mov	DWORD PTR _str$[ebp], eax
; Line 65
	jmp	SHORT $L379
$L381:
; Line 68
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 47					; 0000002fH
	jne	SHORT $L382
; Line 69
	mov	BYTE PTR _c$[ebp], 47			; 0000002fH
; Line 70
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L382:
; Line 73
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 39					; 00000027H
	jne	SHORT $L383
; Line 74
	mov	BYTE PTR _c$[ebp], 46			; 0000002eH
; Line 76
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L383:
; Line 79
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 65					; 00000041H
	jl	SHORT $L384
	mov	eax, DWORD PTR _str$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 90					; 0000005aH
	jg	SHORT $L384
; Line 80
	mov	edx, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [edx]
	sub	eax, 65					; 00000041H
	mov	BYTE PTR _c$[ebp], al
; Line 82
	mov	ecx, DWORD PTR _scaleY$[ebp]
	push	ecx
	mov	edx, DWORD PTR _scaleX$[ebp]
	push	edx
	mov	al, BYTE PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L384:
; Line 85
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 48					; 00000030H
	jl	SHORT $L385
	mov	eax, DWORD PTR _str$[ebp]
	movsx	ecx, BYTE PTR [eax]
	cmp	ecx, 57					; 00000039H
	jg	SHORT $L385
; Line 86
	mov	edx, DWORD PTR _str$[ebp]
	movsx	eax, BYTE PTR [edx]
	sub	eax, 22					; 00000016H
	mov	BYTE PTR _c$[ebp], al
; Line 88
	mov	ecx, DWORD PTR _scaleY$[ebp]
	push	ecx
	mov	edx, DWORD PTR _scaleX$[ebp]
	push	edx
	mov	al, BYTE PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L385:
; Line 91
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 46					; 0000002eH
	jne	SHORT $L386
; Line 92
	mov	BYTE PTR _c$[ebp], 36			; 00000024H
; Line 94
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L386:
; Line 97
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 44					; 0000002cH
	jne	SHORT $L387
; Line 98
	mov	BYTE PTR _c$[ebp], 37			; 00000025H
; Line 100
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L387:
; Line 103
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 45					; 0000002dH
	jne	SHORT $L388
; Line 104
	mov	BYTE PTR _c$[ebp], 38			; 00000026H
; Line 106
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L388:
; Line 109
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 63					; 0000003fH
	jne	SHORT $L389
; Line 110
	mov	BYTE PTR _c$[ebp], 39			; 00000027H
; Line 112
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L389:
; Line 115
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 33					; 00000021H
	jne	SHORT $L390
; Line 116
	mov	BYTE PTR _c$[ebp], 40			; 00000028H
; Line 118
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L390:
; Line 121
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 58					; 0000003aH
	jne	SHORT $L391
; Line 122
	mov	BYTE PTR _c$[ebp], 41			; 00000029H
; Line 124
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L391:
; Line 127
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 59					; 0000003bH
	jne	SHORT $L392
; Line 128
	mov	BYTE PTR _c$[ebp], 42			; 0000002aH
; Line 130
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L392:
; Line 133
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 116				; 00000074H
	jne	SHORT $L393
; Line 134
	mov	BYTE PTR _c$[ebp], 43			; 0000002bH
; Line 136
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L393:
; Line 139
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 43					; 0000002bH
	jne	SHORT $L394
; Line 140
	mov	BYTE PTR _c$[ebp], 44			; 0000002cH
; Line 142
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L394:
; Line 145
	mov	ecx, DWORD PTR _str$[ebp]
	movsx	edx, BYTE PTR [ecx]
	cmp	edx, 120				; 00000078H
	jne	SHORT $L395
; Line 146
	mov	BYTE PTR _c$[ebp], 45			; 0000002dH
; Line 148
	mov	eax, DWORD PTR _scaleY$[ebp]
	push	eax
	mov	ecx, DWORD PTR _scaleX$[ebp]
	push	ecx
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _scaleY$[ebp]
	imul	eax, 5
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _upperRightY$[ebp]
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _scaleX$[ebp]
	imul	eax, 3
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _upperRightX$[ebp]
	add	edx, eax
	push	edx
	movsx	eax, BYTE PTR _c$[ebp]
	push	eax
	call	_draw_glyph
	add	esp, 24					; 00000018H
$L395:
; Line 151
	mov	ecx, DWORD PTR _str$[ebp]
	add	ecx, 1
	mov	DWORD PTR _str$[ebp], ecx
; Line 152
	mov	edx, DWORD PTR _scaleX$[ebp]
	imul	edx, 3
	add	edx, DWORD PTR _spacing$[ebp]
	mov	eax, DWORD PTR _upperRightX$[ebp]
	add	eax, edx
	mov	DWORD PTR _upperRightX$[ebp], eax
; Line 153
	jmp	$L379
$L380:
; Line 154
	mov	esp, ebp
	pop	ebp
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
; Line 157
	movsx	eax, BYTE PTR _spacing$[ebp]
	push	eax
	mov	cl, BYTE PTR _color$[ebp]
	push	ecx
	mov	edx, DWORD PTR _yscale$[ebp]
	push	edx
	mov	eax, DWORD PTR _xscale$[ebp]
	push	eax
	mov	ecx, DWORD PTR _y$[ebp]
	push	ecx
	mov	edx, DWORD PTR _x$[ebp]
	push	edx
	mov	eax, DWORD PTR _str$[ebp]
	push	eax
	call	_draw_string
	add	esp, 28					; 0000001cH
; Line 158
	pop	ebp
	ret	0
_vputs	ENDP
_TEXT	ENDS
END
