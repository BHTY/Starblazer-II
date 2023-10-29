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
;	COMDAT ??_C@_08LDJG@02?334?346?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@PNPF@Oct?529?52023?$AA@
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
; Line 14
	push	esi
	mov	eax, DWORD PTR _current_ticks
; Line 16
	mov	DWORD PTR _last_ticks, eax
; Line 17
	call	_SG_GetTicks
	mov	edx, DWORD PTR _leftover_ticks
	mov	ecx, 14					; 0000000eH
	sub	edx, DWORD PTR _last_ticks
	mov	DWORD PTR _current_ticks, eax
; Line 18
	lea	esi, DWORD PTR [edx+eax]
; Line 20
	sub	edx, edx
	mov	eax, esi
	div	ecx
	mov	eax, esi
	mov	DWORD PTR _leftover_ticks, edx
; Line 21
	sub	edx, edx
	pop	esi
	div	ecx
; Line 22
	ret	0
_blazer_calcticks ENDP
_TEXT	ENDS
PUBLIC	_SG_PresentFrame
EXTRN	_SG_DrawFrame:NEAR
EXTRN	_swap_buffers:NEAR
EXTRN	_frontbuffer:DWORD
;	COMDAT _SG_PresentFrame
_TEXT	SEGMENT
_SG_PresentFrame PROC NEAR				; COMDAT
; Line 41
	call	DWORD PTR _SG_Draw
; Line 42
	mov	al, BYTE PTR _BG_COLOR
	mov	ecx, DWORD PTR _frontbuffer
	push	eax
	push	ecx
	call	_swap_buffers
	add	esp, 8
; Line 43
	jmp	_SG_DrawFrame
_SG_PresentFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_Tick
EXTRN	_SG_ProcessEvents:NEAR
EXTRN	_SG_Sleep:NEAR
;	COMDAT _SG_Tick
_TEXT	SEGMENT
_SG_Tick PROC NEAR					; COMDAT
; Line 49
	call	_blazer_calcticks
	mov	DWORD PTR _tick_counter, eax
	test	eax, eax
; Line 51
	je	SHORT $L426
$L425:
; Line 52
	call	DWORD PTR _SG_Module
; Line 53
	dec	DWORD PTR _tick_counter
; Line 54
	jne	SHORT $L425
$L426:
; Line 58
	xor	ecx, ecx
	mov	eax, DWORD PTR _current_frame
	mov	cl, BYTE PTR _GAME_SETTINGS+4
	cmp	ecx, eax
	jne	SHORT $L427
; Line 59
	mov	DWORD PTR _current_frame, 0
; Line 60
	call	_SG_PresentFrame
; Line 61
	call	_SG_GetTicks
; Line 62
	mov	edx, eax
	sub	edx, DWORD PTR _time_at_which_last_frame_was_rendered
	mov	DWORD PTR _LAST_FRAME_TIME, edx
	mov	DWORD PTR _time_at_which_last_frame_was_rendered, eax
; Line 65
	jmp	SHORT $L428
$L427:
; Line 66
	inc	eax
	mov	DWORD PTR _current_frame, eax
; Line 67
$L428:
; Line 69
	call	_SG_ProcessEvents
; Line 71
	cmp	DWORD PTR _GAME_SETTINGS+112, 0
	je	SHORT $L422
; Line 72
	mov	eax, DWORD PTR _GAME_SETTINGS+112
	push	eax
	call	_SG_Sleep
	add	esp, 4
; Line 74
$L422:
	ret	0
_SG_Tick ENDP
_TEXT	ENDS
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
PUBLIC	??_C@_0L@BGHG@config?4ini?$AA@			; `string'
PUBLIC	??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@		; `string'
EXTRN	_mplayer_addr:DWORD
EXTRN	_fscanf:NEAR
EXTRN	_laser_type:BYTE
EXTRN	_inet_addr@4:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
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
; Line 85
	sub	esp, 64					; 00000040H
	push	esi
	push	edi
; Line 89
	push	OFFSET FLAT:??_C@_01LHO@r?$AA@		; `string'
	push	OFFSET FLAT:??_C@_0L@BGHG@config?4ini?$AA@ ; `string'
	call	_fopen
	add	esp, 8
	mov	esi, eax
; Line 90
	lea	eax, DWORD PTR _taddr$[esp+72]
	push	eax
	push	OFFSET FLAT:??_C@_09KNMH@addr?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	mov	edi, DWORD PTR _cfg$[esp+80]
	add	esp, 12					; 0000000cH
; Line 91
	lea	eax, DWORD PTR [edi+8]
	push	eax
	push	OFFSET FLAT:??_C@_09KKBB@port?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+20]
; Line 92
	push	eax
	push	OFFSET FLAT:??_C@_09HALA@name?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+36]
; Line 93
	push	eax
	push	OFFSET FLAT:??_C@_08FHDP@pin?$DN?5?$CFs?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 94
	push	edi
	push	OFFSET FLAT:??_C@_06NKHL@x?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+2]
; Line 95
	push	eax
	push	OFFSET FLAT:??_C@_06EPNL@y?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 96
	push	OFFSET FLAT:_laser_type
	push	OFFSET FLAT:??_C@_0L@LLEO@laser?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+4]
; Line 97
	push	eax
	push	OFFSET FLAT:??_C@_0P@JNCH@frameskip?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+72]
; Line 98
	push	eax
	push	OFFSET FLAT:??_C@_0L@FKAB@block?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 99
	lea	eax, DWORD PTR [edi+60]
	push	eax
	push	OFFSET FLAT:??_C@_08BODH@sfx?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+64]
; Line 100
	push	eax
	push	OFFSET FLAT:??_C@_0L@BIHH@music?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+68]
; Line 101
	push	eax
	push	OFFSET FLAT:??_C@_0L@JJPA@sound?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+112]
; Line 102
	push	eax
	push	OFFSET FLAT:??_C@_0L@FGFA@sleep?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+52]
; Line 104
	push	eax
	push	OFFSET FLAT:??_C@_0N@GOKH@sndport?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+56]
; Line 105
	push	eax
	push	OFFSET FLAT:??_C@_0M@ECAD@sndirq?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+12]
; Line 106
	push	eax
	push	OFFSET FLAT:??_C@_0N@KLFA@comport?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+16]
; Line 107
	push	eax
	push	OFFSET FLAT:??_C@_0M@LFDE@comirq?$DN?5?$CFx?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	eax, DWORD PTR [edi+84]
; Line 109
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
; Line 111
	lea	ecx, DWORD PTR [edi+92]
	push	ecx
	push	OFFSET FLAT:??_C@_0L@NHMH@pitch?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _pitchup$[esp+84]
	add	esp, 12					; 0000000cH
; Line 112
	push	ecx
	push	OFFSET FLAT:??_C@_0N@FAOK@pitchup?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _pitchdown$[esp+84]
	add	esp, 12					; 0000000cH
; Line 113
	push	ecx
	push	OFFSET FLAT:??_C@_0P@MGC@pitchdown?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+95]
; Line 115
	push	ecx
	push	OFFSET FLAT:??_C@_08EDJH@yaw?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _yawup$[esp+84]
	add	esp, 12					; 0000000cH
; Line 116
	push	ecx
	push	OFFSET FLAT:??_C@_0L@HEFE@yawup?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _yawdown$[esp+84]
	add	esp, 12					; 0000000cH
; Line 117
	push	ecx
	push	OFFSET FLAT:??_C@_0N@PGLF@yawdown?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+98]
; Line 119
	push	ecx
	push	OFFSET FLAT:??_C@_09KDAI@roll?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _rollup$[esp+84]
	add	esp, 12					; 0000000cH
; Line 120
	push	ecx
	push	OFFSET FLAT:??_C@_0M@OFNB@rollup?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _rolldown$[esp+84]
	add	esp, 12					; 0000000cH
; Line 121
	push	ecx
	push	OFFSET FLAT:??_C@_0O@IABO@rolldown?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+101]
; Line 123
	push	ecx
	push	OFFSET FLAT:??_C@_09HMGG@fire?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _fire$[esp+84]
	add	esp, 12					; 0000000cH
; Line 124
	push	ecx
	push	OFFSET FLAT:??_C@_0N@EGII@firekey?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [edi+103]
; Line 126
	push	ecx
	push	OFFSET FLAT:??_C@_0L@OKOA@boost?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _boost$[esp+84]
	add	esp, 12					; 0000000cH
; Line 127
	add	edi, 105				; 00000069H
	push	ecx
	push	OFFSET FLAT:??_C@_0O@IGAC@boostkey?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 129
	push	edi
	push	OFFSET FLAT:??_C@_0L@LEIN@brake?$DN?5?$CFd?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	lea	ecx, DWORD PTR _brake$[esp+84]
	add	esp, 12					; 0000000cH
; Line 130
	push	ecx
	push	OFFSET FLAT:??_C@_0O@KCBM@brakekey?$DN?5?$CFc?6?$AA@ ; `string'
	push	esi
	call	_fscanf
	add	esp, 12					; 0000000cH
; Line 132
	push	esi
	call	_fclose
	lea	eax, DWORD PTR _taddr$[esp+76]
	add	esp, 4
; Line 134
	push	eax
	call	_inet_addr@4
	pop	edi
	mov	DWORD PTR _mplayer_addr, eax
; Line 135
	pop	esi
	add	esp, 64					; 00000040H
	ret	0
_SG_LoadConfig ENDP
_TEXT	ENDS
PUBLIC	_SG_SaveConfig
;	COMDAT _SG_SaveConfig
_TEXT	SEGMENT
_SG_SaveConfig PROC NEAR				; COMDAT
; Line 139
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
; Line 142
	push	OFFSET FLAT:_GAME_SETTINGS
	call	_SG_LoadConfig
	mov	DWORD PTR _SG_Draw, OFFSET FLAT:_title_draw
	add	esp, 4
	mov	DWORD PTR _SG_Module, OFFSET FLAT:_title_module
; Line 146
	push	OFFSET FLAT:??_C@_0N@GJDG@starfont?4fnt?$AA@ ; `string'
	call	_unpack_glyphs
	add	esp, 4
; Line 147
	push	0
	call	_time
	add	esp, 4
	push	eax
	call	_srand
	add	esp, 4
; Line 149
	call	_SG_GetTicks
	mov	DWORD PTR _leftover_ticks, 0
	mov	DWORD PTR _current_ticks, eax
; Line 151
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
; Line 153
	sub	esp, 8
	push	ebx
	push	esi
; Line 173
	xor	esi, esi
$L494:
; Line 174
	test	esi, 4
	je	SHORT $L572
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _r$[esp+16], al
	jmp	SHORT $L573
$L572:
	mov	BYTE PTR _r$[esp+16], 0
$L573:
; Line 175
	test	esi, 2
	je	SHORT $L574
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _g$[esp+16], al
	jmp	SHORT $L575
$L574:
	mov	BYTE PTR _g$[esp+16], 0
$L575:
; Line 176
	test	esi, 1
	je	SHORT $L576
	mov	eax, esi
	and	eax, 8
	cmp	eax, 1
	sbb	al, al
	and	al, -8					; fffffff8H
	add	al, 16					; 00000010H
	mov	BYTE PTR _b$[esp+16], al
	jmp	SHORT $L577
$L576:
	mov	BYTE PTR _b$[esp+16], 0
$L577:
; Line 179
	cmp	esi, 7
	jne	SHORT $L497
; Line 180
	mov	BYTE PTR _r$[esp+16], 16		; 00000010H
; Line 181
	mov	BYTE PTR _g$[esp+16], 8
; Line 182
	mov	BYTE PTR _b$[esp+16], 0
; Line 185
$L497:
	xor	ebx, ebx
	mov	eax, esi
	shl	al, 4
	mov	BYTE PTR -4+[esp+16], al
$L498:
; Line 186
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
; Line 185
	cmp	ebx, 16					; 00000010H
	jl	SHORT $L498
; Line 173
	inc	esi
	cmp	esi, 16					; 00000010H
	jl	$L494
; Line 189
	pop	esi
	pop	ebx
	add	esp, 8
	ret	0
_SG_InitPalette ENDP
_TEXT	ENDS
PUBLIC	_SG_WelcomeMessage
PUBLIC	??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
PUBLIC	??_C@_08LDJG@02?334?346?$AA@			; `string'
PUBLIC	??_C@_0M@PNPF@Oct?529?52023?$AA@		; `string'
PUBLIC	??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
PUBLIC	??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
EXTRN	_printf:NEAR
;	COMDAT ??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@
_DATA	SEGMENT
??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ DB 'Starblazer II Bet'
	DB	'a Version', 0aH, 00H			; `string'
_DATA	ENDS
;	COMDAT ??_C@_08LDJG@02?334?346?$AA@
_DATA	SEGMENT
??_C@_08LDJG@02?334?346?$AA@ DB '02:34:46', 00H		; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@PNPF@Oct?529?52023?$AA@
_DATA	SEGMENT
??_C@_0M@PNPF@Oct?529?52023?$AA@ DB 'Oct 29 2023', 00H	; `string'
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
; Line 192
	push	OFFSET FLAT:??_C@_0BM@ILLE@Starblazer?5II?5Beta?5Version?6?$AA@ ; `string'
	call	_printf
	add	esp, 4
; Line 193
	push	OFFSET FLAT:??_C@_08LDJG@02?334?346?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0M@PNPF@Oct?529?52023?$AA@ ; `string'
	push	OFFSET FLAT:??_C@_0BD@MCLM@Build?5Time?3?5?$CFs?5?$CFs?6?$AA@ ; `string'
	call	_printf
	add	esp, 12					; 0000000cH
; Line 194
	push	OFFSET FLAT:??_C@_0EA@GNDN@By?5Will?5Klees?5?$CICaptain?5Will?5Star@ ; `string'
	call	_printf
	add	esp, 4
; Line 195
	ret	0
_SG_WelcomeMessage ENDP
_TEXT	ENDS
END
