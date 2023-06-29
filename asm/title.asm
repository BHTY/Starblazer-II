	TITLE	src\title.c
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
;	COMDAT ??_C@_08KGCG@CAMPAIGN?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0M@MGOA@MULTIPLAYER?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_07MKIM@OPTIONS?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BA@KPAO@assets?1star?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0N@JEHG@sfx?1menu?4wav?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0L@OENN@STARBLAZER?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_06KIN@?5?5?5?5II?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT ??_C@_0BN@POOO@BY?5WILL?5KLEES?5AND?5JOSH?5PIETY?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _init_stars
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _options_button
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _multiplayer_button
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _campaign_button
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _create_buttons
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _title_init
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _title_module
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_cursor
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _title_draw
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_color
_BSS	SEGMENT
_color	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
COMM	_logo:DWORD
COMM	_title_camera:BYTE:0cH
COMM	_title_cam_ori:BYTE:010H
COMM	_stars_cam_ori:BYTE:010H
_DATA	ENDS
PUBLIC	_init_stars
EXTRN	_title_stars:BYTE
EXTRN	_init_star:NEAR
;	COMDAT _init_stars
_TEXT	SEGMENT
_init_stars PROC NEAR					; COMDAT
; File src\title.c
; Line 22
	push	esi
; Line 24
	mov	esi, OFFSET FLAT:_title_stars
$L754:
	push	esi
	call	_init_star
	add	esi, 12					; 0000000cH
	add	esp, 4
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jl	SHORT $L754
	pop	esi
; Line 25
	ret	0
_init_stars ENDP
_TEXT	ENDS
PUBLIC	_options_button
;	COMDAT _options_button
_TEXT	SEGMENT
_options_button PROC NEAR				; COMDAT
; Line 29
	ret	0
_options_button ENDP
_TEXT	ENDS
PUBLIC	_multiplayer_button
EXTRN	_mplayer_addr:DWORD
EXTRN	_destroy_hypercraft:NEAR
EXTRN	_multiplayer:BYTE
EXTRN	_net_connect:NEAR
EXTRN	_blazer2_init:NEAR
;	COMDAT _multiplayer_button
_TEXT	SEGMENT
_multiplayer_button PROC NEAR				; COMDAT
; Line 32
	mov	eax, DWORD PTR _mplayer_addr
	push	eax
	call	_net_connect
	add	esp, 4
	test	al, al
	jne	SHORT $L763
; Line 33
	mov	BYTE PTR _multiplayer, 1
; Line 34
	call	_destroy_hypercraft
; Line 35
	jmp	_blazer2_init
$L763:
; Line 37
	ret	0
_multiplayer_button ENDP
_TEXT	ENDS
PUBLIC	_campaign_button
;	COMDAT _campaign_button
_TEXT	SEGMENT
_campaign_button PROC NEAR				; COMDAT
; Line 40
	call	_destroy_hypercraft
; Line 41
	jmp	_blazer2_init
_campaign_button ENDP
_TEXT	ENDS
PUBLIC	_create_buttons
PUBLIC	??_C@_08KGCG@CAMPAIGN?$AA@			; `string'
PUBLIC	??_C@_0M@MGOA@MULTIPLAYER?$AA@			; `string'
PUBLIC	??_C@_07MKIM@OPTIONS?$AA@			; `string'
EXTRN	_ui_create_widget:NEAR
EXTRN	_malloc:NEAR
;	COMDAT ??_C@_08KGCG@CAMPAIGN?$AA@
; File src\title.c
_DATA	SEGMENT
??_C@_08KGCG@CAMPAIGN?$AA@ DB 'CAMPAIGN', 00H		; `string'
_DATA	ENDS
;	COMDAT ??_C@_0M@MGOA@MULTIPLAYER?$AA@
_DATA	SEGMENT
??_C@_0M@MGOA@MULTIPLAYER?$AA@ DB 'MULTIPLAYER', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_07MKIM@OPTIONS?$AA@
_DATA	SEGMENT
??_C@_07MKIM@OPTIONS?$AA@ DB 'OPTIONS', 00H		; `string'
_DATA	ENDS
;	COMDAT _create_buttons
_TEXT	SEGMENT
_buttonData3$ = -4
_create_buttons PROC NEAR				; COMDAT
; File src\title.c
; Line 44
	push	ecx
	push	ebx
	push	ebp
	push	esi
	push	edi
; Line 46
	push	20					; 00000014H
	call	_malloc
; Line 47
	push	20					; 00000014H
	mov	ebx, eax
	call	_malloc
; Line 48
	push	20					; 00000014H
	mov	ebp, eax
	call	_malloc
; Line 52
	mov	cl, 175					; 000000afH
; Line 60
	mov	esi, ebx
	mov	BYTE PTR [ebx+2], cl
	mov	BYTE PTR [ebx+8], cl
	mov	cl, 255					; 000000ffH
	mov	edi, ebp
	mov	BYTE PTR [ebx+9], cl
	mov	BYTE PTR [ebx+10], cl
	mov	ecx, 5
	mov	DWORD PTR [ebx+12], OFFSET FLAT:??_C@_08KGCG@CAMPAIGN?$AA@ ; `string'
	mov	BYTE PTR [ebx], 3
	mov	BYTE PTR [ebx+1], 2
	mov	BYTE PTR [ebx+3], 0
	mov	WORD PTR [ebx+4], 100			; 00000064H
	mov	WORD PTR [ebx+6], 12			; 0000000cH
; Line 70
	push	ebx
	rep movsd
	mov	ecx, 5
	mov	esi, ebx
	mov	edi, eax
	push	120					; 00000078H
	rep movsd
	mov	DWORD PTR [ebp+12], OFFSET FLAT:??_C@_0M@MGOA@MULTIPLAYER?$AA@ ; `string'
	mov	DWORD PTR [eax+12], OFFSET FLAT:??_C@_07MKIM@OPTIONS?$AA@ ; `string'
	push	110					; 0000006eH
	mov	DWORD PTR [ebx+16], OFFSET FLAT:_campaign_button
	push	0
	mov	DWORD PTR [ebp+16], OFFSET FLAT:_multiplayer_button
	push	6
	mov	DWORD PTR _buttonData3$[esp+52], eax
	mov	DWORD PTR [eax+16], OFFSET FLAT:_options_button
	call	_ui_create_widget
; Line 71
	push	ebp
	push	140					; 0000008cH
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
; Line 72
	mov	eax, DWORD PTR _buttonData3$[esp+72]
	push	eax
	push	160					; 000000a0H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 72					; 00000048H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 73
	pop	ecx
	ret	0
_create_buttons ENDP
_TEXT	ENDS
PUBLIC	_title_init
PUBLIC	??_C@_0BA@KPAO@assets?1star?4obj?$AA@		; `string'
PUBLIC	??_C@_0N@JEHG@sfx?1menu?4wav?$AA@		; `string'
EXTRN	_quat_create:NEAR
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_spawn_entity:NEAR
EXTRN	_load_model:NEAR
EXTRN	_init_hypercraft:NEAR
EXTRN	_play_music:NEAR
;	COMDAT ??_C@_0BA@KPAO@assets?1star?4obj?$AA@
; File src\title.c
_DATA	SEGMENT
??_C@_0BA@KPAO@assets?1star?4obj?$AA@ DB 'assets/star.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT ??_C@_0N@JEHG@sfx?1menu?4wav?$AA@
_DATA	SEGMENT
??_C@_0N@JEHG@sfx?1menu?4wav?$AA@ DB 'sfx/menu.wav', 00H ; `string'
_DATA	ENDS
;	COMDAT _title_init
_TEXT	SEGMENT
_title_init PROC NEAR					; COMDAT
; File src\title.c
; Line 80
	push	OFFSET FLAT:_title_cam_ori
	push	0
	push	0
	push	0
	mov	DWORD PTR _title_camera, 0
	mov	DWORD PTR _title_camera+4, 0
	mov	DWORD PTR _title_camera+8, 0
	call	_quat_create
; Line 81
	push	OFFSET FLAT:_stars_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
; Line 83
	push	OFFSET FLAT:??_C@_0BA@KPAO@assets?1star?4obj?$AA@ ; `string'
	call	_load_model
; Line 84
	push	0
	push	128					; 00000080H
	push	0
	push	655360					; 000a0000H
	push	0
	push	0
	push	eax
	mov	DWORD PTR _logo, eax
	call	_spawn_entity
	add	esp, 64					; 00000040H
; Line 86
	mov	WORD PTR _SL_CENTER_Y, 45		; 0000002dH
; Line 88
	call	_init_stars
; Line 89
	call	_create_buttons
; Line 91
	call	_init_hypercraft
; Line 92
	push	OFFSET FLAT:??_C@_0N@JEHG@sfx?1menu?4wav?$AA@ ; `string'
	call	_play_music
	pop	ecx
; Line 93
	ret	0
_title_init ENDP
_TEXT	ENDS
PUBLIC	_title_module
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
EXTRN	_StarblazerEntities:BYTE
EXTRN	_ui_process_widgets:NEAR
;	COMDAT _title_module
_TEXT	SEGMENT
_title_module PROC NEAR					; COMDAT
; Line 97
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	push	16					; 00000010H
	call	_quat_yaw
; Line 99
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_pitch
; Line 100
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_yaw
; Line 101
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_roll
	add	esp, 32					; 00000020H
; Line 103
	jmp	_ui_process_widgets
_title_module ENDP
_TEXT	ENDS
PUBLIC	_draw_cursor
EXTRN	_draw_line:NEAR
;	COMDAT _draw_cursor
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_clr$ = 16
_draw_cursor PROC NEAR					; COMDAT
; Line 107
	mov	eax, DWORD PTR _y$[esp-4]
	push	ebx
	push	ebp
	mov	ebp, DWORD PTR _x$[esp+4]
	push	esi
	lea	esi, DWORD PTR [eax+5]
	lea	ebx, DWORD PTR [eax-5]
	mov	eax, DWORD PTR _clr$[esp+8]
	push	edi
	lea	edi, DWORD PTR [ebp-5]
	push	eax
	push	esi
	push	edi
	push	ebx
	push	edi
	call	_draw_line
; Line 108
	mov	ecx, DWORD PTR _clr$[esp+32]
	add	ebp, 5
	push	ecx
	push	esi
	push	ebp
	push	esi
	push	edi
	call	_draw_line
; Line 109
	mov	edx, DWORD PTR _clr$[esp+52]
	push	edx
	push	ebx
	push	ebp
	push	esi
	push	ebp
	call	_draw_line
; Line 110
	mov	eax, DWORD PTR _clr$[esp+72]
	push	eax
	push	ebx
	push	edi
	push	ebx
	push	ebp
	call	_draw_line
	add	esp, 80					; 00000050H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 111
	ret	0
_draw_cursor ENDP
_TEXT	ENDS
PUBLIC	_title_draw
PUBLIC	??_C@_0L@OENN@STARBLAZER?$AA@			; `string'
PUBLIC	??_C@_06KIN@?5?5?5?5II?$AA@			; `string'
PUBLIC	??_C@_0BN@POOO@BY?5WILL?5KLEES?5AND?5JOSH?5PIETY?$AA@ ; `string'
EXTRN	_quat_tomat:NEAR
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_draw_scene:NEAR
EXTRN	_vputs:NEAR
EXTRN	_SG_ReadMouse:NEAR
EXTRN	_ui_display_widgets:NEAR
EXTRN	_draw_stars:NEAR
;	COMDAT ??_C@_0L@OENN@STARBLAZER?$AA@
; File src\title.c
_DATA	SEGMENT
??_C@_0L@OENN@STARBLAZER?$AA@ DB 'STARBLAZER', 00H	; `string'
_DATA	ENDS
;	COMDAT ??_C@_06KIN@?5?5?5?5II?$AA@
_DATA	SEGMENT
??_C@_06KIN@?5?5?5?5II?$AA@ DB '    II', 00H		; `string'
_DATA	ENDS
;	COMDAT ??_C@_0BN@POOO@BY?5WILL?5KLEES?5AND?5JOSH?5PIETY?$AA@
_DATA	SEGMENT
??_C@_0BN@POOO@BY?5WILL?5KLEES?5AND?5JOSH?5PIETY?$AA@ DB 'BY WILL KLEES A'
	DB	'ND JOSH PIETY', 00H				; `string'
_DATA	ENDS
;	COMDAT _title_draw
_TEXT	SEGMENT
_mouse$ = -8
_title_draw PROC NEAR					; COMDAT
; File src\title.c
; Line 113
	sub	esp, 8
; Line 115
	lea	eax, DWORD PTR _mouse$[esp+8]
	push	eax
	call	_SG_ReadMouse
; Line 129
	push	0
	push	-97					; ffffff9fH
	push	2
	push	3
	push	0
	push	0
	push	OFFSET FLAT:??_C@_0L@OENN@STARBLAZER?$AA@ ; `string'
	call	_vputs
; Line 130
	push	0
	push	-17					; ffffffefH
	push	2
	push	3
	push	10					; 0000000aH
	push	0
	push	OFFSET FLAT:??_C@_06KIN@?5?5?5?5II?$AA@	; `string'
	call	_vputs
; Line 131
	push	0
	push	-1
	push	2
	push	3
	push	100					; 00000064H
	push	30					; 0000001eH
	push	OFFSET FLAT:??_C@_0BN@POOO@BY?5WILL?5KLEES?5AND?5JOSH?5PIETY?$AA@ ; `string'
	call	_vputs
	add	esp, 88					; 00000058H
; Line 133
	mov	edx, DWORD PTR _title_cam_ori
	mov	eax, DWORD PTR _title_cam_ori+4
	push	0
	push	0
	push	0
	sub	esp, 16					; 00000010H
	mov	ecx, esp
	push	OFFSET FLAT:_title_camera
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR _title_cam_ori+8
	mov	DWORD PTR [ecx+4], eax
	mov	eax, DWORD PTR _title_cam_ori+12
	mov	DWORD PTR [ecx+8], edx
	mov	DWORD PTR [ecx+12], eax
	call	_draw_scene
; Line 139
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_stars_cam_ori
	call	_quat_tomat
; Line 140
	call	_draw_stars
; Line 142
	call	_ui_display_widgets
; Line 145
	add	esp, 48					; 00000030H
	ret	0
_title_draw ENDP
_TEXT	ENDS
END
