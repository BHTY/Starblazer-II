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
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@BGHG@config?4ini?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09HALA@name?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@GOKH@sndport?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@ECAD@sndirq?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@KLFA@comport?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@LFDE@comirq?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BL@BEKN@joycal?$DN?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@NHMH@pitch?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@FAOK@pitchup?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0P@MGC@pitchdown?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08EDJH@yaw?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@HEFE@yawup?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@PGLF@yawdown?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09KDAI@roll?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@OFNB@rollup?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0O@IABO@rolldown?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_09HMGG@fire?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@EGII@firekey?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@OKOA@boost?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0O@IGAC@boostkey?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@LEIN@brake?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0O@KCBM@brakekey?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@GJDG@starfont?4fnt?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_08NICL@15?331?303?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@IKB@Nov?5?54?52023?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _blazer_calcticks
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
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
PUBLIC	_current_frame
PUBLIC	_tick_counter
PUBLIC	_time_at_which_last_frame_was_rendered
PUBLIC	_BG_COLOR
PUBLIC	_LAST_TICK_TIME
PUBLIC	_LAST_FRAME_TIME
_DATA	SEGMENT
COMM	_last_ticks:DWORD
COMM	_current_ticks:DWORD
COMM	_leftover_ticks:DWORD
COMM	_time_last_tick:DWORD
COMM	_start_time:DWORD
COMM	_SG_Draw:DWORD
COMM	_SG_Module:DWORD
COMM	_GAME_SETTINGS:BYTE:074H
_current_frame DD 00H
_BG_COLOR DB	00H
	ORG $+3
_tick_counter DD 00H
_LAST_TICK_TIME DD 0eH
_LAST_FRAME_TIME DD 0eH
_time_at_which_last_frame_was_rendered DD 00H
_DATA	ENDS
PUBLIC	_blazer_calcticks
EXTRN	_SG_GetTicks:NEAR
;	COMDAT _blazer_calcticks
_TEXT	SEGMENT
; File src\blazer.c
_blazer_calcticks PROC NEAR				; COMDAT
; Line 16
	push	esi
	mov	eax, DWORD PTR _current_ticks
; Line 18
	mov	DWORD PTR _last_ticks, eax
; Line 19
	call	_SG_GetTicks
	mov	edx, DWORD PTR _leftover_ticks
	mov	ecx, 14					; 0000000eH
	sub	edx, DWORD PTR _last_ticks
	mov	DWORD PTR _current_ticks, eax
; Line 20
	lea	esi, DWORD PTR [edx+eax]
; Line 22
	sub	edx, edx
	mov	eax, esi
	div	ecx
	mov	eax, esi
	mov	DWORD PTR _leftover_ticks, edx
; Line 23
	sub	edx, edx
	pop	esi
	div	ecx
; Line 24
	ret	0
_blazer_calcticks ENDP
_TEXT	ENDS
PUBLIC	_SG_PresentFrame
EXTRN	_swap_buffers:NEAR
EXTRN	_SG_DrawFrame:NEAR
EXTRN	_frontbuffer:DWORD
;	COMDAT _SG_PresentFrame
_TEXT	SEGMENT
_SG_PresentFrame PROC NEAR				; COMDAT
; Line 43
	call	DWORD PTR _SG_Draw
; Line 44
	mov	al, BYTE PTR _BG_COLOR
	mov	ecx, DWORD PTR _frontbuffer
	push	eax
	push	ecx
	call	_swap_buffers
	add	esp, 8
; Line 45
	jmp	_SG_DrawFrame
_SG_PresentFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_Tick
EXTRN	_SG_ProcessEvents:NEAR
EXTRN	_SG_Sleep:NEAR
;	COMDAT _SG_Tick
_TEXT	SEGMENT
_SG_Tick PROC NEAR					; COMDAT
; Line 51
	call	_blazer_calcticks
	mov	DWORD PTR _tick_counter, eax
	test	eax, eax
; Line 53
	je	SHORT $L556
$L555:
; Line 54
	call	DWORD PTR _SG_Module
; Line 55
	dec	DWORD PTR _tick_counter
; Line 56
	jne	SHORT $L555
$L556:
; Line 60
	xor	ecx, ecx
	mov	eax, DWORD PTR _current_frame
	mov	cl, BYTE PTR _GAME_SETTINGS+4
	cmp	ecx, eax
	jne	SHORT $L557
; Line 61
	mov	DWORD PTR _current_frame, 0
; Line 62
	call	_SG_PresentFrame
; Line 63
	call	_SG_GetTicks
; Line 64
	mov	edx, eax
	sub	edx, DWORD PTR _time_at_which_last_frame_was_rendered
	mov	DWORD PTR _LAST_FRAME_TIME, edx
	mov	DWORD PTR _time_at_which_last_frame_was_rendered, eax
; Line 67
	jmp	SHORT $L558
$L557:
; Line 68
	inc	eax
	mov	DWORD PTR _current_frame, eax
; Line 69
$L558:
; Line 71
	call	_SG_ProcessEvents
; Line 73
	cmp	DWORD PTR _GAME_SETTINGS+112, 0
	je	SHORT $L552
; Line 74
	mov	eax, DWORD PTR _GAME_SETTINGS+112
	push	eax
	call	_SG_Sleep
	add	esp, 4
; Line 76
$L552:
	ret	0
_SG_Tick ENDP
_TEXT	ENDS
PUBLIC	??_C@_0L@BGHG@config?4ini?$AA@			; `string'
PUBLIC	??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@		; `string'
PUBLIC	??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_09HALA@name?$DN?5?$CFs?6?$AA@		; `string'
PUBLIC	??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@		; `string'
PUBLIC	??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@	; `string'
PUBLIC	??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0N@GOKH@sndport?$DN?5?$CFx?6?$AA@		; `string'
PUBLIC	??_C@_0M@ECAD@sndirq?$DN?5?$CFx?6?$AA@		; `string'
PUBLIC	??_C@_0N@KLFA@comport?$DN?5?$CFx?6?$AA@		; `string'
PUBLIC	??_C@_0M@LFDE@comirq?$DN?5?$CFx?6?$AA@		; `string'
PUBLIC	??_C@_0BL@BEKN@joycal?$DN?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?6?$AA@ ; `string'
PUBLIC	??_C@_0L@NHMH@pitch?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0N@FAOK@pitchup?$DN?5?$CFc?6?$AA@		; `string'
PUBLIC	??_C@_0P@MGC@pitchdown?$DN?5?$CFc?6?$AA@	; `string'
PUBLIC	??_C@_08EDJH@yaw?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0L@HEFE@yawup?$DN?5?$CFc?6?$AA@		; `string'
PUBLIC	??_C@_0N@PGLF@yawdown?$DN?5?$CFc?6?$AA@		; `string'
PUBLIC	??_C@_09KDAI@roll?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0M@OFNB@rollup?$DN?5?$CFc?6?$AA@		; `string'
PUBLIC	??_C@_0O@IABO@rolldown?$DN?5?$CFc?6?$AA@	; `string'
PUBLIC	??_C@_09HMGG@fire?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0N@EGII@firekey?$DN?5?$CFc?6?$AA@		; `string'
PUBLIC	??_C@_0L@OKOA@boost?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0O@IGAC@boostkey?$DN?5?$CFc?6?$AA@	; `string'
PUBLIC	??_C@_0L@LEIN@brake?$DN?5?$CFd?6?$AA@		; `string'
PUBLIC	??_C@_0O@KCBM@brakekey?$DN?5?$CFc?6?$AA@	; `string'
PUBLIC	_SG_LoadConfig
PUBLIC	??_C@_01LHO@r?$AA@				; `string'
EXTRN	_mplayer_addr:DWORD
EXTRN	_fopen:NEAR
EXTRN	_fscanf:NEAR
EXTRN	_laser_type:BYTE
EXTRN	_inet_addr@4:NEAR
EXTRN	_fclose:NEAR
;	COMDAT ??_C@_01LHO@r?$AA@
_DATA	SEGMENT
??_C@_01LHO@r?$AA@ DB 'r', 00H				; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@BGHG@config?4ini?$AA@
_DATA	SEGMENT
??_C@_0L@BGHG@config?4ini?$AA@ DB 'config.ini', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT
??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@ DB 'addr= %s', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@ DB 'port= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_09HALA@name?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT
??_C@_09HALA@name?$DN?5?$CFs?6?$AA@ DB 'name= %s', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@
_DATA	SEGMENT
??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@ DB 'pin= %s', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@ DB 'x= %d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@ DB 'y= %d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@ DB 'laser= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@ DB 'frameskip= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@ DB 'block= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@ DB 'sfx= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@ DB 'music= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@ DB 'sound= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@ DB 'sleep= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0N@GOKH@sndport?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT
??_C@_0N@GOKH@sndport?$DN?5?$CFx?6?$AA@ DB 'sndport= %x', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@ECAD@sndirq?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT
??_C@_0M@ECAD@sndirq?$DN?5?$CFx?6?$AA@ DB 'sndirq= %x', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0N@KLFA@comport?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT
??_C@_0N@KLFA@comport?$DN?5?$CFx?6?$AA@ DB 'comport= %x', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@LFDE@comirq?$DN?5?$CFx?6?$AA@
_DATA	SEGMENT
??_C@_0M@LFDE@comirq?$DN?5?$CFx?6?$AA@ DB 'comirq= %x', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BL@BEKN@joycal?$DN?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0BL@BEKN@joycal?$DN?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?6?$AA@ DB 
	DB	'joycal= %d %d %d %d %d %d', 0aH, 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@NHMH@pitch?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@NHMH@pitch?$DN?5?$CFd?6?$AA@ DB 'pitch= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0N@FAOK@pitchup?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0N@FAOK@pitchup?$DN?5?$CFc?6?$AA@ DB 'pitchup= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0P@MGC@pitchdown?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0P@MGC@pitchdown?$DN?5?$CFc?6?$AA@ DB 'pitchdown= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_08EDJH@yaw?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_08EDJH@yaw?$DN?5?$CFd?6?$AA@ DB 'yaw= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@HEFE@yawup?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0L@HEFE@yawup?$DN?5?$CFc?6?$AA@ DB 'yawup= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0N@PGLF@yawdown?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0N@PGLF@yawdown?$DN?5?$CFc?6?$AA@ DB 'yawdown= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_09KDAI@roll?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_09KDAI@roll?$DN?5?$CFd?6?$AA@ DB 'roll= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@OFNB@rollup?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0M@OFNB@rollup?$DN?5?$CFc?6?$AA@ DB 'rollup= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0O@IABO@rolldown?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0O@IABO@rolldown?$DN?5?$CFc?6?$AA@ DB 'rolldown= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_09HMGG@fire?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_09HMGG@fire?$DN?5?$CFd?6?$AA@ DB 'fire= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0N@EGII@firekey?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0N@EGII@firekey?$DN?5?$CFc?6?$AA@ DB 'firekey= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@OKOA@boost?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@OKOA@boost?$DN?5?$CFd?6?$AA@ DB 'boost= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0O@IGAC@boostkey?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0O@IGAC@boostkey?$DN?5?$CFc?6?$AA@ DB 'boostkey= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0L@LEIN@brake?$DN?5?$CFd?6?$AA@
_DATA	SEGMENT
??_C@_0L@LEIN@brake?$DN?5?$CFd?6?$AA@ DB 'brake= %d', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0O@KCBM@brakekey?$DN?5?$CFc?6?$AA@
_DATA	SEGMENT
??_C@_0O@KCBM@brakekey?$DN?5?$CFc?6?$AA@ DB 'brakekey= %c', 0aH, 00H ; `string'
_DATA	ENDS
;	COMDAT _SG_LoadConfig
_TEXT	SEGMENT
_cfg$ = 8
_taddr$ = -52
_pitchup$ = -61
_pitchdown$ = -60
_yawup$ = -59
_yawdown$ = -58
_rollup$ = -57
_rolldown$ = -56
_fire$ = -55
_boost$ = -54
_brake$ = -53
_SG_LoadConfig PROC NEAR				; COMDAT
; Line 87
	sub	esp, 64					; 00000040H
	push	esi
	push	edi
; Line 91
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	OFFSET FLAT:??_C@_0L@BGHG@config?4ini?$AA@ ; `string'
	call	_fopen
	add	esp, 8
	mov	esi, eax
; Line 92
	lea	eax, DWORD PTR _taddr$[esp+72]
	push	eax
	push	OFFSET FLAT:??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	mov	edi, DWORD PTR _cfg$[esp+80]
	add	esp, 12					; 0000000cH
; Line 93
	lea	eax, DWORD PTR [edi+8]
	push	eax
	push	OFFSET FLAT:??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+20]
; Line 94
	push	eax
	push	OFFSET FLAT:??_C@_09HALA@name?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+36]
; Line 95
	push	eax
	push	OFFSET FLAT:??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 96
	push	edi
	push	OFFSET FLAT:??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+2]
; Line 97
	push	eax
	push	OFFSET FLAT:??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 98
	push	OFFSET FLAT:_laser_type
	push	OFFSET FLAT:??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+4]
; Line 99
	push	eax
	push	OFFSET FLAT:??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+72]
; Line 100
	push	eax
	push	OFFSET FLAT:??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 101
	lea	eax, DWORD PTR [edi+60]
	push	eax
	push	OFFSET FLAT:??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+64]
; Line 102
	push	eax
	push	OFFSET FLAT:??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+68]
; Line 103
	push	eax
	push	OFFSET FLAT:??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+112]
; Line 104
	push	eax
	push	OFFSET FLAT:??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+52]
; Line 106
	push	eax
	push	OFFSET FLAT:??_C@_0N@GOKH@sndport?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+56]
; Line 107
	push	eax
	push	OFFSET FLAT:??_C@_0M@ECAD@sndirq?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+12]
; Line 108
	push	eax
	push	OFFSET FLAT:??_C@_0N@KLFA@comport?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+16]
; Line 109
	push	eax
	push	OFFSET FLAT:??_C@_0M@LFDE@comirq?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+84]
; Line 111
	lea	ecx, DWORD PTR [edi+88]
	lea	edx, DWORD PTR [edi+76]
	push	eax
	push	ecx
	push	edx
	lea	eax, DWORD PTR [edi+80]
	push	eax
	push	OFFSET FLAT:??_C@_0BL@BEKN@joycal?$DN?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 24					; 00000018H
; Line 113
	lea	ecx, DWORD PTR [edi+92]
	push	ecx
	push	OFFSET FLAT:??_C@_0L@NHMH@pitch?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _pitchup$[esp+84]
	add	esp, 12					; 0000000cH
; Line 114
	push	ecx
	push	OFFSET FLAT:??_C@_0N@FAOK@pitchup?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _pitchdown$[esp+84]
	add	esp, 12					; 0000000cH
; Line 115
	push	ecx
	push	OFFSET FLAT:??_C@_0P@MGC@pitchdown?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+95]
; Line 117
	push	ecx
	push	OFFSET FLAT:??_C@_08EDJH@yaw?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _yawup$[esp+84]
	add	esp, 12					; 0000000cH
; Line 118
	push	ecx
	push	OFFSET FLAT:??_C@_0L@HEFE@yawup?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _yawdown$[esp+84]
	add	esp, 12					; 0000000cH
; Line 119
	push	ecx
	push	OFFSET FLAT:??_C@_0N@PGLF@yawdown?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+98]
; Line 121
	push	ecx
	push	OFFSET FLAT:??_C@_09KDAI@roll?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _rollup$[esp+84]
	add	esp, 12					; 0000000cH
; Line 122
	push	ecx
	push	OFFSET FLAT:??_C@_0M@OFNB@rollup?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _rolldown$[esp+84]
	add	esp, 12					; 0000000cH
; Line 123
	push	ecx
	push	OFFSET FLAT:??_C@_0O@IABO@rolldown?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+101]
; Line 125
	push	ecx
	push	OFFSET FLAT:??_C@_09HMGG@fire?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _fire$[esp+84]
	add	esp, 12					; 0000000cH
; Line 126
	push	ecx
	push	OFFSET FLAT:??_C@_0N@EGII@firekey?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+103]
; Line 128
	push	ecx
	push	OFFSET FLAT:??_C@_0L@OKOA@boost?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _boost$[esp+84]
	add	esp, 12					; 0000000cH
; Line 129
	add	edi, 105				; 00000069H
	push	ecx
	push	OFFSET FLAT:??_C@_0O@IGAC@boostkey?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 131
	push	edi
	push	OFFSET FLAT:??_C@_0L@LEIN@brake?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _brake$[esp+84]
	add	esp, 12					; 0000000cH
; Line 132
	push	ecx
	push	OFFSET FLAT:??_C@_0O@KCBM@brakekey?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 134
	push	esi
	call	_fclose
	lea	eax, DWORD PTR _taddr$[esp+76]
	add	esp, 4
; Line 136
	push	eax
	call	_inet_addr@4
	pop	edi
	mov	DWORD PTR _mplayer_addr, eax
; Line 137
	pop	esi
	add	esp, 64					; 00000040H
	ret	0
_SG_LoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_SaveConfig
;	COMDAT _SG_SaveConfig
_TEXT	SEGMENT
_SG_SaveConfig PROC NEAR				; COMDAT
; Line 141
	ret	0
_SG_SaveConfig ENDP
_TEXT	ENDS
PUBLIC	??_C@_0N@GJDG@starfont?4fnt?$AA@		; `string'
PUBLIC	_SG_GameInit
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
; Line 144
	push	OFFSET FLAT:_GAME_SETTINGS
	call	_SG_LoadConfig
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_title_draw
	add	esp, 4
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_title_module
; Line 148
	push	OFFSET FLAT:??_C@_0N@GJDG@starfont?4fnt?$AA@ ; `string'
	call	_unpack_glyphs
	add	esp, 4
; Line 149
	push	0
	call	_time
	add	esp, 4
	push	eax
	call	_srand
	add	esp, 4
; Line 151
	call	_SG_GetTicks
	mov	DWORD PTR _leftover_ticks, 0
	mov	DWORD PTR _current_ticks, eax
; Line 153
	ret	0
_SG_GameInit ENDP
_TEXT	ENDS
PUBLIC	_SG_InitPalette
EXTRN	_SG_SetPaletteIndex:NEAR
;	COMDAT _SG_InitPalette
_TEXT	SEGMENT
_r$ = -7
_g$ = -6
_b$ = -5
_SG_InitPalette PROC NEAR				; COMDAT
; Line 155
	sub	esp, 8
	push	ebx
	push	esi
; Line 175
	xor	esi, esi
$L621:
; Line 176
	test	esi, 4
	je	SHORT $L699
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _r$[esp+16], al
	jmp	SHORT $L700
$L699:
	mov	BYTE PTR _r$[esp+16], 0
$L700:
; Line 177
	test	esi, 2
	je	SHORT $L701
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _g$[esp+16], al
	jmp	SHORT $L702
$L701:
	mov	BYTE PTR _g$[esp+16], 0
$L702:
; Line 178
	test	esi, 1
	je	SHORT $L703
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _b$[esp+16], al
	jmp	SHORT $L704
$L703:
	mov	BYTE PTR _b$[esp+16], 0
$L704:
; Line 181
	cmp	esi, 7
	jne	SHORT $L624
; Line 182
	mov	BYTE PTR _r$[esp+16], 16		; 00000010H
; Line 183
	mov	BYTE PTR _g$[esp+16], 8
; Line 184
	mov	BYTE PTR _b$[esp+16], 0
; Line 187
$L624:
	xor	ebx, ebx
	mov	eax, esi
	shl	al, 4
	mov	BYTE PTR -4+[esp+16], al
$L625:
; Line 188
	mov	al, BYTE PTR _b$[esp+16]
	imul	bl
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
; Line 187
	cmp	ebx, 16					; 00000010H
	jl	SHORT $L625
; Line 175
	inc	esi
	cmp	esi, 16					; 00000010H
	jl	$L621
; Line 191
	pop	esi
	pop	ebx
	add	esp, 8
	ret	0
_SG_InitPalette ENDP
_TEXT	ENDS
PUBLIC	??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
PUBLIC	_SG_WelcomeMessage
PUBLIC	??_C@_08NICL@15?331?303?$AA@			; `string'
PUBLIC	??_C@_0M@IKB@Nov?5?54?52023?$AA@		; `string'
PUBLIC	??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
PUBLIC	??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
EXTRN	_printf:NEAR
;	COMDAT ??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@
_DATA	SEGMENT
??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ DB 'Starblazer II Bet'
	DB	'a Version', 0aH, 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_08NICL@15?331?303?$AA@
_DATA	SEGMENT
??_C@_08NICL@15?331?303?$AA@ DB '15:31:03', 00H		; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@IKB@Nov?5?54?52023?$AA@
_DATA	SEGMENT
??_C@_0M@IKB@Nov?5?54?52023?$AA@ DB 'Nov  4 2023', 00H	; `string'
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
; Line 194
	push	OFFSET FLAT:??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 195
	push	OFFSET FLAT:??_C@_08NICL@15?331?303?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0M@IKB@Nov?5?54?52023?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
	call	_printf
	add	esp, 12					; 0000000cH
; Line 196
	push	OFFSET FLAT:??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
	call	_printf
	add	esp, 4
; Line 197
	ret	0
_SG_WelcomeMessage ENDP
_TEXT	ENDS
END
