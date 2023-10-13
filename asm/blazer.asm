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
;	COMDAT ??_C@_0N@GJDG@starfont?4fnt?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08GIOM@09?306?329?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@IAK@Oct?513?52023?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _SG_PresentFrame
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_Tick
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_LoadConfig
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_SaveConfig
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_GameInit
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_InitPalette
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _SG_WelcomeMessage
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_BG_COLOR
PUBLIC	_LAST_TICK_TIME
PUBLIC	_LAST_FRAME_TIME
PUBLIC	_tick_counter
PUBLIC	_SLEEP_TIME
PUBLIC	_current_frame
PUBLIC	_time_at_which_last_frame_was_rendered
_DATA	SEGMENT
COMM	_SG_Draw:DWORD
COMM	_SG_Module:DWORD
COMM	_GAME_SETTINGS:BYTE:058H
COMM	_time_last_tick:DWORD
COMM	_start_time:DWORD
_SLEEP_TIME DD	00H
_current_frame DD 00H
_BG_COLOR DB	00H
	ORG $+3
_tick_counter DD 00H
_LAST_TICK_TIME DD 0eH
_LAST_FRAME_TIME DD 0eH
_time_at_which_last_frame_was_rendered DD 00H
_DATA	ENDS
PUBLIC	_SG_PresentFrame
EXTRN	_frontbuffer:DWORD
EXTRN	_SG_DrawFrame:NEAR
EXTRN	_swap_buffers:NEAR
;	COMDAT _SG_PresentFrame
_TEXT	SEGMENT
; File src\blazer.c
_SG_PresentFrame PROC NEAR				; COMDAT
; Line 28
	call	DWORD PTR _SG_Draw
; Line 29
	mov	al, BYTE PTR _BG_COLOR
	mov	ecx, DWORD PTR _frontbuffer
	push	eax
	push	ecx
	call	_swap_buffers
	add	esp, 8
; Line 30
	jmp	_SG_DrawFrame
_SG_PresentFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_Tick
EXTRN	_SG_GetTicks:NEAR
EXTRN	_SG_ProcessEvents:NEAR
EXTRN	_SG_Sleep:NEAR
;	COMDAT _SG_Tick
_TEXT	SEGMENT
_SG_Tick PROC NEAR					; COMDAT
; Line 36
	cmp	DWORD PTR _tick_counter, 0
	je	SHORT $L355
$L354:
; Line 37
	call	DWORD PTR _SG_Module
; Line 38
	dec	DWORD PTR _tick_counter
; Line 39
	jne	SHORT $L354
$L355:
; Line 43
	xor	ecx, ecx
	mov	eax, DWORD PTR _current_frame
	mov	cl, BYTE PTR _GAME_SETTINGS+4
	cmp	ecx, eax
	jne	SHORT $L356
; Line 44
	mov	DWORD PTR _current_frame, 0
; Line 45
	call	_SG_PresentFrame
; Line 46
	call	_SG_GetTicks
; Line 47
	mov	edx, eax
	sub	edx, DWORD PTR _time_at_which_last_frame_was_rendered
	mov	DWORD PTR _LAST_FRAME_TIME, edx
	mov	DWORD PTR _time_at_which_last_frame_was_rendered, eax
; Line 50
	jmp	SHORT $L357
$L356:
; Line 51
	inc	eax
	mov	DWORD PTR _current_frame, eax
; Line 52
$L357:
; Line 55
	call	_SG_ProcessEvents
; Line 57
	mov	eax, DWORD PTR _SLEEP_TIME
	test	eax, eax
	je	SHORT $L351
; Line 58
	push	eax
	call	_SG_Sleep
	add	esp, 4
; Line 61
$L351:
	ret	0
_SG_Tick ENDP
_TEXT	ENDS
PUBLIC	_SG_LoadConfig
;	COMDAT _SG_LoadConfig
_TEXT	SEGMENT
_SG_LoadConfig PROC NEAR				; COMDAT
; Line 65
	ret	0
_SG_LoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_SaveConfig
;	COMDAT _SG_SaveConfig
_TEXT	SEGMENT
_SG_SaveConfig PROC NEAR				; COMDAT
; Line 69
	ret	0
_SG_SaveConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_GameInit
PUBLIC	??_C@_0N@GJDG@starfont?4fnt?$AA@		; `string'
EXTRN	_unpack_glyphs:NEAR
EXTRN	_title_draw:NEAR
EXTRN	_title_module:NEAR
EXTRN	_srand:NEAR
EXTRN	_time:NEAR
;	COMDAT ??_C@_0N@GJDG@starfont?4fnt?$AA@
_DATA	SEGMENT
??_C@_0N@GJDG@starfont?4fnt?$AA@ DB 'starfont.fnt', 00H	; `string'
_DATA	ENDS
;	COMDAT _SG_GameInit
_TEXT	SEGMENT
_SG_GameInit PROC NEAR					; COMDAT
; Line 72
	push	OFFSET FLAT:_GAME_SETTINGS
	call	_SG_LoadConfig
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_title_draw
	add	esp, 4
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_title_module
; Line 76
	push	OFFSET FLAT:??_C@_0N@GJDG@starfont?4fnt?$AA@ ; `string'
	call	_unpack_glyphs
	add	esp, 4
; Line 77
	push	0
	call	_time
	add	esp, 4
	push	eax
	call	_srand
	add	esp, 4
; Line 78
	ret	0
_SG_GameInit ENDP
_TEXT	ENDS
PUBLIC	_SG_InitPalette
EXTRN	_SG_SetPaletteIndex:NEAR
;	COMDAT _SG_InitPalette
_TEXT	SEGMENT
_r$ = -5
_g$ = -6
_b$ = -7
_SG_InitPalette PROC NEAR				; COMDAT
; Line 80
	sub	esp, 8
	push	ebx
	push	esi
; Line 100
	xor	esi, esi
$L375:
; Line 101
	test	esi, 4
	je	SHORT $L415
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _r$[esp+16], al
	jmp	SHORT $L416
$L415:
	mov	BYTE PTR _r$[esp+16], 0
$L416:
; Line 102
	test	esi, 2
	je	SHORT $L417
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _g$[esp+16], al
	jmp	SHORT $L418
$L417:
	mov	BYTE PTR _g$[esp+16], 0
$L418:
; Line 103
	test	esi, 1
	je	SHORT $L419
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _b$[esp+16], al
	jmp	SHORT $L420
$L419:
	mov	BYTE PTR _b$[esp+16], 0
$L420:
; Line 106
	cmp	esi, 7
	jne	SHORT $L378
; Line 107
	mov	BYTE PTR _r$[esp+16], 16		; 00000010H
; Line 108
	mov	BYTE PTR _g$[esp+16], 8
; Line 109
	mov	BYTE PTR _b$[esp+16], 0
; Line 112
$L378:
	xor	ebx, ebx
	mov	eax, esi
	shl	al, 4
	mov	BYTE PTR -4+[esp+16], al
$L379:
; Line 113
	mov	al, bl
	imul	BYTE PTR _b$[esp+16]
	push	eax
	mov	al, BYTE PTR _g$[esp+20]
	imul	bl
	push	eax
	mov	al, BYTE PTR _r$[esp+24]
	imul	bl
	push	eax
	mov	al, BYTE PTR -4+[esp+28]
	add	al, bl
	inc	ebx
	push	eax
	call	_SG_SetPaletteIndex
	add	esp, 16					; 00000010H
; Line 112
	cmp	ebx, 16					; 00000010H
	jl	SHORT $L379
; Line 100
	inc	esi
	cmp	esi, 16					; 00000010H
	jl	$L375
; Line 116
	pop	esi
	pop	ebx
	add	esp, 8
	ret	0
_SG_InitPalette ENDP
_TEXT	ENDS
PUBLIC	_SG_WelcomeMessage
PUBLIC	??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
PUBLIC	??_C@_08GIOM@09?306?329?$AA@			; `string'
PUBLIC	??_C@_0M@IAK@Oct?513?52023?$AA@			; `string'
PUBLIC	??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
PUBLIC	??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
EXTRN	_printf:NEAR
;	COMDAT ??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@
_DATA	SEGMENT
??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ DB 'Starblazer II Bet'
	DB	'a Version', 0aH, 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_08GIOM@09?306?329?$AA@
_DATA	SEGMENT
??_C@_08GIOM@09?306?329?$AA@ DB '09:06:29', 00H		; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@IAK@Oct?513?52023?$AA@
_DATA	SEGMENT
??_C@_0M@IAK@Oct?513?52023?$AA@ DB 'Oct 13 2023', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@
_DATA	SEGMENT
??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ DB 'Build Time: %s %s', 0aH
	DB	00H						; `string'
_DATA	ENDS
;	COMDAT ??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@
_DATA	SEGMENT
??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ DB 'By Will Klee'
	DB	's (Captain Will Starblazer) and Josh "Fixer" Piety', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT _SG_WelcomeMessage
_TEXT	SEGMENT
_SG_WelcomeMessage PROC NEAR				; COMDAT
; Line 119
	push	OFFSET FLAT:??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 120
	push	OFFSET FLAT:??_C@_08GIOM@09?306?329?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0M@IAK@Oct?513?52023?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
	call	_printf
	add	esp, 12					; 0000000cH
; Line 121
	push	OFFSET FLAT:??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
	call	_printf
	add	esp, 4
; Line 122
	ret	0
_SG_WelcomeMessage ENDP
_TEXT	ENDS
END
