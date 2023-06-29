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
PUBLIC	_unpack_glyphs
PUBLIC	??_C@_01LHO@r?$AA@				; `string'
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
EXTRN	_malloc:NEAR
;	COMDAT ??_C@_01LHO@r?$AA@
; File src\font.c
_DATA	SEGMENT
??_C@_01LHO@r?$AA@ DB 'r', 00H				; `string'
_DATA	ENDS
;	COMDAT _unpack_glyphs
_TEXT	SEGMENT
_filename$ = 8
_unpack_glyphs PROC NEAR				; COMDAT
; File src\font.c
; Line 14
	mov	eax, DWORD PTR _filename$[esp-4]
	push	ebx
	push	esi
	push	edi
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	eax
	call	_fopen
	mov	edi, eax
; Line 21
	push	2
	push	0
	push	edi
	call	_fseek
; Line 22
	push	edi
	call	_ftell
; Line 24
	push	0
	push	0
	push	edi
	mov	ebx, eax
	call	_fseek
; Line 26
	push	ebx
	call	_malloc
; Line 27
	push	edi
	mov	esi, eax
	push	ebx
	push	1
	push	esi
	call	_fread
; Line 28
	push	edi
	call	_fclose
	add	esp, 60					; 0000003cH
	mov	eax, OFFSET FLAT:_glyphs
$L397:
; Line 33
	mov	DWORD PTR [eax], esi
; Line 38
	mov	ecx, DWORD PTR [esi]
	shl	ecx, 4
	add	eax, 4
	cmp	eax, OFFSET FLAT:_glyphs+192
	lea	esi, DWORD PTR [esi+ecx+4]
	jl	SHORT $L397
	pop	edi
	pop	esi
	pop	ebx
; Line 40
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
	push	ebx
	push	esi
; Line 48
	mov	esi, DWORD PTR _glyph$[esp+4]
	push	edi
	mov	edi, DWORD PTR _scaleY$[esp+8]
	xor	ebx, ebx
	mov	eax, DWORD PTR [esi]
	neg	edi
	test	eax, eax
	jle	SHORT $L411
	push	ebp
	mov	ebp, DWORD PTR _scaleX$[esp+12]
	add	esi, 12					; 0000000cH
$L409:
; Line 49
	mov	ecx, DWORD PTR [esi+4]
	mov	edx, ebp
	movsx	eax, BYTE PTR _color$[esp+12]
	imul	edx, DWORD PTR [esi]
	imul	ecx, edi
	push	eax
	mov	eax, DWORD PTR _centerY$[esp+16]
	add	ecx, eax
	push	ecx
	mov	ecx, DWORD PTR _centerX$[esp+20]
	add	edx, ecx
	push	edx
	mov	edx, DWORD PTR [esi-4]
	imul	edx, edi
	add	edx, eax
	mov	eax, DWORD PTR [esi-8]
	imul	eax, ebp
	add	eax, ecx
	push	edx
	push	eax
	call	_drawline
	mov	ecx, DWORD PTR _glyph$[esp+32]
	add	esp, 20					; 00000014H
	inc	ebx
	add	esi, 16					; 00000010H
	cmp	ebx, DWORD PTR [ecx]
	jl	SHORT $L409
	pop	ebp
$L411:
	pop	edi
	pop	esi
	pop	ebx
; Line 51
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
	mov	edx, DWORD PTR _color$[esp-4]
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
_original$ = 12
_draw_string PROC NEAR					; COMDAT
; Line 61
	mov	eax, DWORD PTR _str$[esp-4]
	push	ebx
	mov	ebx, DWORD PTR _upperRightX$[esp]
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR _original$[esp], ebx
	test	cl, cl
	je	$L432
	push	ebp
	mov	ebp, DWORD PTR _color$[esp+4]
	push	esi
	mov	esi, DWORD PTR _scaleX$[esp+8]
	push	edi
	mov	edi, DWORD PTR _scaleY$[esp+12]
$L431:
; Line 63
	cmp	cl, 93					; 0000005dH
	jne	SHORT $L433
; Line 64
	mov	cl, BYTE PTR [eax+1]
; Line 65
	add	eax, 2
	mov	BYTE PTR _color$[esp+12], cl
	mov	DWORD PTR _str$[esp+12], eax
; Line 66
	mov	ebp, DWORD PTR _color$[esp+12]
	jmp	$L479
$L433:
; Line 69
	cmp	cl, 47					; 0000002fH
	jne	SHORT $L434
; Line 71
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	47					; 0000002fH
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L434:
; Line 74
	cmp	BYTE PTR [eax], 39			; 00000027H
	jne	SHORT $L435
; Line 77
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	46					; 0000002eH
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L435:
; Line 80
	mov	cl, BYTE PTR [eax]
	cmp	cl, 65					; 00000041H
	jl	SHORT $L436
	cmp	cl, 90					; 0000005aH
	jg	SHORT $L436
; Line 83
	lea	eax, DWORD PTR [edi+edi*4]
	push	edi
	cdq
	sub	eax, edx
	mov	edx, DWORD PTR _upperRightY$[esp+16]
	sar	eax, 1
	push	esi
	add	eax, edx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	sub	cl, 65					; 00000041H
	cdq
	sub	eax, edx
	sar	eax, 1
	movsx	edx, cl
	add	eax, ebx
	push	eax
	push	edx
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L436:
; Line 86
	mov	cl, BYTE PTR [eax]
	cmp	cl, 48					; 00000030H
	jl	SHORT $L437
	cmp	cl, 57					; 00000039H
	jg	SHORT $L437
; Line 89
	lea	eax, DWORD PTR [edi+edi*4]
	push	edi
	cdq
	sub	eax, edx
	mov	edx, DWORD PTR _upperRightY$[esp+16]
	sar	eax, 1
	push	esi
	add	eax, edx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	sub	cl, 22					; 00000016H
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	movsx	eax, cl
	push	eax
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L437:
; Line 92
	cmp	BYTE PTR [eax], 46			; 0000002eH
	jne	SHORT $L438
; Line 95
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	36					; 00000024H
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L438:
; Line 98
	cmp	BYTE PTR [eax], 44			; 0000002cH
	jne	SHORT $L439
; Line 101
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	37					; 00000025H
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L439:
; Line 104
	cmp	BYTE PTR [eax], 45			; 0000002dH
	jne	SHORT $L440
; Line 107
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	38					; 00000026H
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L440:
; Line 110
	cmp	BYTE PTR [eax], 63			; 0000003fH
	jne	SHORT $L441
; Line 113
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	39					; 00000027H
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L441:
; Line 116
	cmp	BYTE PTR [eax], 33			; 00000021H
	jne	SHORT $L442
; Line 119
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	40					; 00000028H
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L442:
; Line 122
	cmp	BYTE PTR [eax], 58			; 0000003aH
	jne	SHORT $L443
; Line 125
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	41					; 00000029H
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L443:
; Line 128
	cmp	BYTE PTR [eax], 59			; 0000003bH
	jne	SHORT $L444
; Line 131
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	42					; 0000002aH
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L444:
; Line 134
	cmp	BYTE PTR [eax], 116			; 00000074H
	jne	SHORT $L445
; Line 137
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	43					; 0000002bH
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L445:
; Line 140
	cmp	BYTE PTR [eax], 43			; 0000002bH
	jne	SHORT $L446
; Line 143
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	44					; 0000002cH
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L446:
; Line 146
	cmp	BYTE PTR [eax], 120			; 00000078H
	jne	SHORT $L447
; Line 149
	mov	ecx, DWORD PTR _upperRightY$[esp+12]
	lea	eax, DWORD PTR [edi+edi*4]
	cdq
	sub	eax, edx
	push	edi
	sar	eax, 1
	push	esi
	add	eax, ecx
	push	ebp
	push	eax
	lea	eax, DWORD PTR [esi+esi*2]
	cdq
	sub	eax, edx
	sar	eax, 1
	add	eax, ebx
	push	eax
	push	45					; 0000002dH
	call	_draw_glyph
	mov	eax, DWORD PTR _str$[esp+36]
	add	esp, 24					; 00000018H
$L447:
; Line 153
	mov	ecx, DWORD PTR _spacing$[esp+12]
	inc	eax
	mov	DWORD PTR _str$[esp+12], eax
	lea	edx, DWORD PTR [ecx+esi*2]
	mov	ecx, esi
	add	ecx, edx
	add	ebx, ecx
$L479:
	mov	cl, BYTE PTR [eax]
	test	cl, cl
	jne	$L431
	pop	edi
	pop	esi
	pop	ebp
$L432:
; Line 156
	mov	ecx, DWORD PTR _original$[esp]
	mov	eax, ebx
	sub	eax, ecx
	pop	ebx
; Line 157
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
	movsx	eax, BYTE PTR _spacing$[esp-4]
	mov	ecx, DWORD PTR _color$[esp-4]
	mov	edx, DWORD PTR _yscale$[esp-4]
	push	eax
	mov	eax, DWORD PTR _xscale$[esp]
	push	ecx
	mov	ecx, DWORD PTR _y$[esp+4]
	push	edx
	mov	edx, DWORD PTR _x$[esp+8]
	push	eax
	mov	eax, DWORD PTR _str$[esp+12]
	push	ecx
	push	edx
	push	eax
	call	_draw_string
	add	esp, 28					; 0000001cH
; Line 161
	ret	0
_vputs	ENDP
_TEXT	ENDS
END
