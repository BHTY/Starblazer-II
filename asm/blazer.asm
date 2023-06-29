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
;	COMDAT ??_C@_03HMFC@?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@GJDG@starfont?4fnt?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08IELG@00?327?300?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@NDLP@Jun?529?52023?$AA@
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
PUBLIC	_current_frame
PUBLIC	_time_at_which_last_frame_was_rendered
_DATA	SEGMENT
COMM	_SG_Draw:DWORD
COMM	_SG_Module:DWORD
COMM	_GAME_SETTINGS:BYTE:068H
_DATA	ENDS
_BSS	SEGMENT
_BG_COLOR DB	01H DUP (?)
	ALIGN	4

_current_frame DD 01H DUP (?)
_time_at_which_last_frame_was_rendered DD 01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_time_last_tick:DWORD
_LAST_TICK_TIME DD 0eH
_LAST_FRAME_TIME DD 0eH
_DATA	ENDS
PUBLIC	_SG_PresentFrame
EXTRN	_frontbuffer:DWORD
EXTRN	_SG_DrawFrame:NEAR
EXTRN	_swap_buffers:NEAR
;	COMDAT _SG_PresentFrame
_TEXT	SEGMENT
_SG_PresentFrame PROC NEAR				; COMDAT
; File src\blazer.c
; Line 25
	call	DWORD PTR _SG_Draw
; Line 26
	mov	al, BYTE PTR _BG_COLOR
	mov	ecx, DWORD PTR _frontbuffer
	push	eax
	push	ecx
	call	_swap_buffers
	add	esp, 8
; Line 27
	jmp	_SG_DrawFrame
_SG_PresentFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_Tick
PUBLIC	??_C@_03HMFC@?$CFd?6?$AA@			; `string'
EXTRN	_SG_GetTicks:NEAR
EXTRN	_SG_WaitBlank:NEAR
EXTRN	_printf:NEAR
;	COMDAT ??_C@_03HMFC@?$CFd?6?$AA@
; File src\blazer.c
_DATA	SEGMENT
??_C@_03HMFC@?$CFd?6?$AA@ DB '%d', 0aH, 00H		; `string'
_DATA	ENDS
;	COMDAT _SG_Tick
_TEXT	SEGMENT
_SG_Tick PROC NEAR					; COMDAT
; File src\blazer.c
; Line 33
	call	_SG_GetTicks
; Line 34
	mov	edx, DWORD PTR _time_last_tick
	mov	ecx, eax
	sub	ecx, edx
; Line 35
	mov	DWORD PTR _time_last_tick, eax
; Line 36
	push	ecx
	push	OFFSET FLAT:??_C@_03HMFC@?$CFd?6?$AA@	; `string'
	mov	DWORD PTR _LAST_TICK_TIME, ecx
	call	_printf
	add	esp, 8
; Line 38
	call	DWORD PTR _SG_Module
; Line 42
	mov	eax, DWORD PTR _GAME_SETTINGS+4
	mov	ecx, DWORD PTR _current_frame
	and	eax, 255				; 000000ffH
	cmp	ecx, eax
	jne	SHORT $L349
; Line 43
	mov	DWORD PTR _current_frame, 0
; Line 44
	call	_SG_PresentFrame
; Line 45
	call	_SG_GetTicks
; Line 46
	mov	edx, DWORD PTR _time_at_which_last_frame_was_rendered
	mov	ecx, eax
	sub	ecx, edx
; Line 47
	mov	DWORD PTR _time_at_which_last_frame_was_rendered, eax
	mov	DWORD PTR _LAST_FRAME_TIME, ecx
; Line 49
	jmp	SHORT $L350
$L349:
; Line 50
	inc	DWORD PTR _current_frame
$L350:
; Line 53
	jmp	_SG_WaitBlank
_SG_Tick ENDP
_TEXT	ENDS
PUBLIC	_SG_LoadConfig
;	COMDAT _SG_LoadConfig
_TEXT	SEGMENT
_SG_LoadConfig PROC NEAR				; COMDAT
; Line 58
	ret	0
_SG_LoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_SaveConfig
;	COMDAT _SG_SaveConfig
_TEXT	SEGMENT
_SG_SaveConfig PROC NEAR				; COMDAT
; Line 62
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
; File src\blazer.c
_DATA	SEGMENT
??_C@_0N@GJDG@starfont?4fnt?$AA@ DB 'starfont.fnt', 00H	; `string'
_DATA	ENDS
;	COMDAT _SG_GameInit
_TEXT	SEGMENT
_SG_GameInit PROC NEAR					; COMDAT
; File src\blazer.c
; Line 65
	push	OFFSET FLAT:_GAME_SETTINGS
	call	_SG_LoadConfig
; Line 69
	push	OFFSET FLAT:??_C@_0N@GJDG@starfont?4fnt?$AA@ ; `string'
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_title_draw
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_title_module
	call	_unpack_glyphs
; Line 70
	push	0
	call	_time
	push	eax
	call	_srand
	add	esp, 16					; 00000010H
; Line 71
	ret	0
_SG_GameInit ENDP
_TEXT	ENDS
PUBLIC	_SG_InitPalette
EXTRN	_SG_SetPaletteIndex:NEAR
;	COMDAT _SG_InitPalette
_TEXT	SEGMENT
_i$ = -4
_r$ = -6
_g$ = -8
_b$ = -7
_SG_InitPalette PROC NEAR				; COMDAT
; Line 73
	sub	esp, 8
; Line 93
	xor	eax, eax
	push	ebx
	mov	DWORD PTR _i$[esp+12], eax
	jmp	SHORT $L367
$L422:
	mov	eax, DWORD PTR _i$[esp+12]
$L367:
; Line 94
	test	al, 4
	je	SHORT $L412
	mov	ecx, eax
	and	cl, 8
	neg	cl
	sbb	cl, cl
	and	cl, 8
	add	cl, 8
	mov	BYTE PTR _r$[esp+12], cl
	jmp	SHORT $L413
$L412:
	mov	BYTE PTR _r$[esp+12], 0
$L413:
; Line 95
	test	al, 2
	je	SHORT $L414
	mov	edx, eax
	and	dl, 8
	neg	dl
	sbb	dl, dl
	and	dl, 8
	add	dl, 8
	mov	BYTE PTR _g$[esp+12], dl
	jmp	SHORT $L415
$L414:
	mov	BYTE PTR _g$[esp+12], 0
	mov	dl, BYTE PTR _g$[esp+12]
$L415:
; Line 96
	test	al, 1
	je	SHORT $L416
	mov	ecx, eax
	and	cl, 8
	neg	cl
	sbb	cl, cl
	and	cl, 8
	add	cl, 8
	mov	BYTE PTR _b$[esp+12], cl
	jmp	SHORT $L417
$L416:
	mov	BYTE PTR _b$[esp+12], 0
	mov	cl, BYTE PTR _b$[esp+12]
$L417:
; Line 99
	cmp	eax, 7
	jne	SHORT $L370
; Line 101
	mov	BYTE PTR _g$[esp+12], 8
; Line 102
	mov	BYTE PTR _b$[esp+12], 0
	mov	dl, BYTE PTR _g$[esp+12]
	mov	cl, BYTE PTR _b$[esp+12]
	mov	BYTE PTR _r$[esp+12], 16		; 00000010H
$L370:
; Line 105
	xor	ebx, ebx
; Line 106
	shl	al, 4
	mov	BYTE PTR -5+[esp+12], al
	jmp	SHORT $L371
$L423:
	mov	dl, BYTE PTR _g$[esp+12]
	mov	cl, BYTE PTR _b$[esp+12]
$L371:
	mov	al, bl
	imul	cl
	push	eax
	mov	al, bl
	imul	dl
	push	eax
	mov	al, bl
	imul	BYTE PTR _r$[esp+20]
	mov	dl, BYTE PTR -5+[esp+20]
	push	eax
	mov	al, bl
	add	al, dl
	push	eax
	call	_SG_SetPaletteIndex
	add	esp, 16					; 00000010H
	inc	ebx
	cmp	ebx, 16					; 00000010H
	jl	SHORT $L423
	mov	eax, DWORD PTR _i$[esp+12]
	inc	eax
	cmp	eax, 16					; 00000010H
	mov	DWORD PTR _i$[esp+12], eax
	jl	$L422
	pop	ebx
; Line 109
	add	esp, 8
	ret	0
_SG_InitPalette ENDP
_TEXT	ENDS
PUBLIC	_SG_WelcomeMessage
PUBLIC	??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
PUBLIC	??_C@_08IELG@00?327?300?$AA@			; `string'
PUBLIC	??_C@_0M@NDLP@Jun?529?52023?$AA@		; `string'
PUBLIC	??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
PUBLIC	??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
;	COMDAT ??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@
; File src\blazer.c
_DATA	SEGMENT
??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ DB 'Starblazer II Bet'
	DB	'a Version', 0aH, 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_08IELG@00?327?300?$AA@
_DATA	SEGMENT
??_C@_08IELG@00?327?300?$AA@ DB '00:27:00', 00H		; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@NDLP@Jun?529?52023?$AA@
_DATA	SEGMENT
??_C@_0M@NDLP@Jun?529?52023?$AA@ DB 'Jun 29 2023', 00H	; `string'
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
; File src\blazer.c
; Line 112
	push	OFFSET FLAT:??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
	call	_printf
; Line 113
	push	OFFSET FLAT:??_C@_08IELG@00?327?300?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0M@NDLP@Jun?529?52023?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
	call	_printf
; Line 114
	push	OFFSET FLAT:??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
	call	_printf
	add	esp, 20					; 00000014H
; Line 115
	ret	0
_SG_WelcomeMessage ENDP
_TEXT	ENDS
END
