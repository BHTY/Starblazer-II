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
_current_frame DD 00H
_BG_COLOR DB	00H
	ORG $+3
_LAST_TICK_TIME DD 0eH
_LAST_FRAME_TIME DD 0eH
_time_at_which_last_frame_was_rendered DD 00H
_DATA	ENDS
PUBLIC	_SG_PresentFrame
EXTRN	_frontbuffer:DWORD
EXTRN	_SG_DrawFrame:NEAR
EXTRN	_swap_buffers:NEAR
_TEXT	SEGMENT
; File src\blazer.c
_SG_PresentFrame PROC NEAR
; Line 23
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 24
	call	DWORD PTR _SG_Draw
; Line 25
	mov	al, BYTE PTR _BG_COLOR
	push	eax
	mov	eax, DWORD PTR _frontbuffer
	push	eax
	call	_swap_buffers
	add	esp, 8
; Line 26
	call	_SG_DrawFrame
; Line 27
$L285:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 32
	call	DWORD PTR _SG_Module
; Line 34
	mov	BYTE PTR _GAME_SETTINGS+4, 0
; Line 36
	xor	eax, eax
	mov	al, BYTE PTR _GAME_SETTINGS+4
	cmp	eax, DWORD PTR _current_frame
	jne	$L288
; Line 37
	mov	DWORD PTR _current_frame, 0
; Line 38
	call	_SG_PresentFrame
; Line 39
	call	_SG_GetTicks
	mov	DWORD PTR _current_time$[ebp], eax
; Line 40
	mov	eax, DWORD PTR _current_time$[ebp]
	sub	eax, DWORD PTR _time_at_which_last_frame_was_rendered
	mov	DWORD PTR _LAST_FRAME_TIME, eax
; Line 41
	mov	eax, DWORD PTR _current_time$[ebp]
	mov	DWORD PTR _time_at_which_last_frame_was_rendered, eax
; Line 43
	jmp	$L289
$L288:
; Line 44
	inc	DWORD PTR _current_frame
; Line 45
$L289:
; Line 47
	call	_SG_WaitBlank
; Line 48
$L286:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_Tick ENDP
_TEXT	ENDS
PUBLIC	_SG_LoadConfig
_TEXT	SEGMENT
_SG_LoadConfig PROC NEAR
; Line 50
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 52
$L291:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_LoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_SaveConfig
_TEXT	SEGMENT
_SG_SaveConfig PROC NEAR
; Line 54
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 56
$L293:
	pop	edi
	pop	esi
	pop	ebx
	leave
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
$SG295	DB	'starfont.fnt', 00H
_DATA	ENDS
_TEXT	SEGMENT
_SG_GameInit PROC NEAR
; Line 58
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 59
	push	OFFSET FLAT:_GAME_SETTINGS
	call	_SG_LoadConfig
	add	esp, 4
; Line 60
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_title_draw
; Line 61
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_title_module
; Line 63
	push	OFFSET FLAT:$SG295
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
$L294:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_GameInit ENDP
_TEXT	ENDS
PUBLIC	_SG_InitPalette
EXTRN	_SG_SetPaletteIndex:NEAR
_TEXT	SEGMENT
_i$ = -20
_n$ = -24
_p$ = -4
_SG_InitPalette PROC NEAR
; Line 67
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 79
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L306
$L307:
	inc	DWORD PTR _i$[ebp]
$L306:
	cmp	DWORD PTR _i$[ebp], 6
	jge	$L308
; Line 80
	mov	DWORD PTR _n$[ebp], 0
	jmp	$L309
$L310:
	inc	DWORD PTR _n$[ebp]
$L309:
	cmp	DWORD PTR _n$[ebp], 6
	jge	$L311
; Line 81
	mov	DWORD PTR _p$[ebp], 0
	jmp	$L312
$L313:
	inc	DWORD PTR _p$[ebp]
$L312:
	cmp	DWORD PTR _p$[ebp], 6
	jge	$L314
; Line 82
	mov	eax, DWORD PTR _p$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, eax
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [eax+eax*4]
	lea	eax, DWORD PTR [ecx+eax*2]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 2
	lea	eax, DWORD PTR [eax+eax*8]
	mov	ecx, DWORD PTR _n$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR [eax+ecx*2]
	add	eax, DWORD PTR _p$[ebp]
	push	eax
	call	_SG_SetPaletteIndex
	add	esp, 16					; 00000010H
; Line 83
	jmp	$L313
$L314:
; Line 84
	jmp	$L310
$L311:
; Line 85
	jmp	$L307
$L308:
; Line 86
$L299:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_InitPalette ENDP
_TEXT	ENDS
PUBLIC	_SG_WelcomeMessage
EXTRN	_printf:NEAR
_DATA	SEGMENT
	ORG $+3
$SG316	DB	'Starblazer II Beta Version', 0aH, 00H
$SG317	DB	'14:25:15', 00H
	ORG $+3
$SG318	DB	'Jun 20 2023', 00H
$SG319	DB	'Build Time: %s %s', 0aH, 00H
	ORG $+1
$SG320	DB	'By Will Klees (Captain Will Starblazer) and Josh "Fixer"'
	DB	' Piety', 0aH, 00H
_DATA	ENDS
_TEXT	SEGMENT
_SG_WelcomeMessage PROC NEAR
; Line 88
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 89
	push	OFFSET FLAT:$SG316
	call	_printf
	add	esp, 4
; Line 90
	push	OFFSET FLAT:$SG317
	push	OFFSET FLAT:$SG318
	push	OFFSET FLAT:$SG319
	call	_printf
	add	esp, 12					; 0000000cH
; Line 91
	push	OFFSET FLAT:$SG320
	call	_printf
	add	esp, 4
; Line 92
$L315:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_WelcomeMessage ENDP
_TEXT	ENDS
END
