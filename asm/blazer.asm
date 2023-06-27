	TITLE	src\blazer.c
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
PUBLIC	_BG_COLOR
PUBLIC	_LAST_TICK_TIME
PUBLIC	_LAST_FRAME_TIME
PUBLIC	_current_frame
PUBLIC	_time_at_which_last_frame_was_rendered
_DATA	SEGMENT
COMM	_SG_Draw:DWORD
COMM	_SG_Module:DWORD
COMM	_GAME_SETTINGS:BYTE:058H
_DATA	ENDS
_BSS	SEGMENT
_BG_COLOR DB	01H DUP (?)
	ALIGN	4

_current_frame DD 01H DUP (?)
_time_at_which_last_frame_was_rendered DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
_LAST_TICK_TIME DD 0eH
_LAST_FRAME_TIME DD 0eH
_DATA	ENDS
PUBLIC	_SG_PresentFrame
EXTRN	_frontbuffer:DWORD
EXTRN	_SG_DrawFrame:NEAR
EXTRN	_swap_buffers:NEAR
_TEXT	SEGMENT
_SG_PresentFrame PROC NEAR
; File src\blazer.c
; Line 23
	push	ebp
	mov	ebp, esp
; Line 24
	call	DWORD PTR _SG_Draw
; Line 25
	mov	al, BYTE PTR _BG_COLOR
	push	eax
	mov	ecx, DWORD PTR _frontbuffer
	push	ecx
	call	_swap_buffers
	add	esp, 8
; Line 26
	call	_SG_DrawFrame
; Line 27
	pop	ebp
	ret	0
_SG_PresentFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_Tick
EXTRN	_SG_GetTicks:NEAR
EXTRN	_SG_WaitBlank:NEAR
_TEXT	SEGMENT
_current_time$ = -4
_SG_Tick PROC NEAR
; Line 29
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 32
	call	DWORD PTR _SG_Module
; Line 34
	mov	BYTE PTR _GAME_SETTINGS+4, 0
; Line 36
	xor	eax, eax
	mov	al, BYTE PTR _GAME_SETTINGS+4
	cmp	DWORD PTR _current_frame, eax
	jne	SHORT $L289
; Line 37
	mov	DWORD PTR _current_frame, 0
; Line 38
	call	_SG_PresentFrame
; Line 39
	call	_SG_GetTicks
	mov	DWORD PTR _current_time$[ebp], eax
; Line 40
	mov	ecx, DWORD PTR _current_time$[ebp]
	sub	ecx, DWORD PTR _time_at_which_last_frame_was_rendered
	mov	DWORD PTR _LAST_FRAME_TIME, ecx
; Line 41
	mov	edx, DWORD PTR _current_time$[ebp]
	mov	DWORD PTR _time_at_which_last_frame_was_rendered, edx
; Line 43
	jmp	SHORT $L290
$L289:
; Line 44
	mov	eax, DWORD PTR _current_frame
	add	eax, 1
	mov	DWORD PTR _current_frame, eax
$L290:
; Line 47
	call	_SG_WaitBlank
; Line 48
	mov	esp, ebp
	pop	ebp
	ret	0
_SG_Tick ENDP
_TEXT	ENDS
PUBLIC	_SG_LoadConfig
_TEXT	SEGMENT
_SG_LoadConfig PROC NEAR
; Line 50
	push	ebp
	mov	ebp, esp
; Line 52
	pop	ebp
	ret	0
_SG_LoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_SaveConfig
_TEXT	SEGMENT
_SG_SaveConfig PROC NEAR
; Line 54
	push	ebp
	mov	ebp, esp
; Line 56
	pop	ebp
	ret	0
_SG_SaveConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_GameInit
EXTRN	_unpack_glyphs:NEAR
EXTRN	_title_draw:NEAR
EXTRN	_title_module:NEAR
EXTRN	_srand:NEAR
EXTRN	_time:NEAR
_DATA	SEGMENT
$SG296	DB	'starfont.fnt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_SG_GameInit PROC NEAR
; Line 58
	push	ebp
	mov	ebp, esp
; Line 59
	push	OFFSET FLAT:_GAME_SETTINGS
	call	_SG_LoadConfig
	add	esp, 4
; Line 60
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_title_draw
; Line 61
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_title_module
; Line 63
	push	OFFSET FLAT:$SG296
	call	_unpack_glyphs
	add	esp, 4
; Line 64
	push	0
	call	_time
	add	esp, 4
	push	eax
	call	_srand
	add	esp, 4
; Line 65
	pop	ebp
	ret	0
_SG_GameInit ENDP
_TEXT	ENDS
PUBLIC	_SG_InitPalette
EXTRN	_SG_SetPaletteIndex:NEAR
_TEXT	SEGMENT
_i$ = -20
_p$ = -4
_r$ = -12
_g$ = -16
_b$ = -8
_SG_InitPalette PROC NEAR
; Line 67
	push	ebp
	mov	ebp, esp
	sub	esp, 36					; 00000024H
; Line 87
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L307
$L308:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L307:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L309
; Line 88
	mov	ecx, DWORD PTR _i$[ebp]
	and	ecx, 4
	test	ecx, ecx
	je	SHORT $L328
	mov	edx, DWORD PTR _i$[ebp]
	and	edx, 8
	neg	edx
	sbb	edx, edx
	and	edx, 8
	add	edx, 8
	mov	DWORD PTR -28+[ebp], edx
	jmp	SHORT $L329
$L328:
	mov	DWORD PTR -28+[ebp], 0
$L329:
	mov	al, BYTE PTR -28+[ebp]
	mov	BYTE PTR _r$[ebp], al
; Line 89
	mov	ecx, DWORD PTR _i$[ebp]
	and	ecx, 2
	test	ecx, ecx
	je	SHORT $L330
	mov	edx, DWORD PTR _i$[ebp]
	and	edx, 8
	neg	edx
	sbb	edx, edx
	and	edx, 8
	add	edx, 8
	mov	DWORD PTR -32+[ebp], edx
	jmp	SHORT $L331
$L330:
	mov	DWORD PTR -32+[ebp], 0
$L331:
	mov	al, BYTE PTR -32+[ebp]
	mov	BYTE PTR _g$[ebp], al
; Line 90
	mov	ecx, DWORD PTR _i$[ebp]
	and	ecx, 1
	test	ecx, ecx
	je	SHORT $L332
	mov	edx, DWORD PTR _i$[ebp]
	and	edx, 8
	neg	edx
	sbb	edx, edx
	and	edx, 8
	add	edx, 8
	mov	DWORD PTR -36+[ebp], edx
	jmp	SHORT $L333
$L332:
	mov	DWORD PTR -36+[ebp], 0
$L333:
	mov	al, BYTE PTR -36+[ebp]
	mov	BYTE PTR _b$[ebp], al
; Line 93
	cmp	DWORD PTR _i$[ebp], 7
	jne	SHORT $L310
; Line 94
	mov	BYTE PTR _r$[ebp], 16			; 00000010H
; Line 95
	mov	BYTE PTR _g$[ebp], 8
; Line 96
	mov	BYTE PTR _b$[ebp], 0
$L310:
; Line 99
	mov	DWORD PTR _p$[ebp], 0
	jmp	SHORT $L311
$L312:
	mov	ecx, DWORD PTR _p$[ebp]
	add	ecx, 1
	mov	DWORD PTR _p$[ebp], ecx
$L311:
	cmp	DWORD PTR _p$[ebp], 16			; 00000010H
	jge	SHORT $L313
; Line 100
	mov	edx, DWORD PTR _b$[ebp]
	and	edx, 255				; 000000ffH
	imul	edx, DWORD PTR _p$[ebp]
	push	edx
	mov	eax, DWORD PTR _g$[ebp]
	and	eax, 255				; 000000ffH
	imul	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	ecx, DWORD PTR _r$[ebp]
	and	ecx, 255				; 000000ffH
	imul	ecx, DWORD PTR _p$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	add	edx, DWORD PTR _p$[ebp]
	push	edx
	call	_SG_SetPaletteIndex
	add	esp, 16					; 00000010H
; Line 101
	jmp	SHORT $L312
$L313:
; Line 102
	jmp	$L308
$L309:
; Line 103
	mov	esp, ebp
	pop	ebp
	ret	0
_SG_InitPalette ENDP
_TEXT	ENDS
PUBLIC	_SG_WelcomeMessage
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG315	DB	'Starblazer II Beta Version', 0aH, 00H
$SG316	DB	'12:30:15', 00H
	ORG $+3
$SG317	DB	'Jun 27 2023', 00H
$SG318	DB	'Build Time: %s %s', 0aH, 00H
	ORG $+1
$SG319	DB	'By Will Klees (Captain Will Starblazer) and Josh "Fixer"'
	DB	' Piety', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_SG_WelcomeMessage PROC NEAR
; Line 105
	push	ebp
	mov	ebp, esp
; Line 106
	push	OFFSET FLAT:$SG315
	call	_printf
	add	esp, 4
; Line 107
	push	OFFSET FLAT:$SG316
	push	OFFSET FLAT:$SG317
	push	OFFSET FLAT:$SG318
	call	_printf
	add	esp, 12					; 0000000cH
; Line 108
	push	OFFSET FLAT:$SG319
	call	_printf
	add	esp, 4
; Line 109
	pop	ebp
	ret	0
_SG_WelcomeMessage ENDP
_TEXT	ENDS
END
