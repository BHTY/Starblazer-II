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
_DATA	SEGMENT
COMM	_logo:DWORD
COMM	_title_camera:BYTE:0cH
COMM	_title_cam_ori:BYTE:010H
COMM	_stars_cam_ori:BYTE:010H
_color	DB	00H
_DATA	ENDS
PUBLIC	_init_stars
EXTRN	_title_stars:BYTE
EXTRN	_init_star:NEAR
;	COMDAT _init_stars
_TEXT	SEGMENT
; File src\title.c
_init_stars PROC NEAR					; COMDAT
; Line 22
	push	esi
	mov	esi, OFFSET FLAT:_title_stars
; Line 24
$L753:
	push	esi
	call	_init_star
	add	esp, 4
	add	esi, 12					; 0000000cH
	cmp	esi, OFFSET FLAT:_title_stars+6000
	jb	SHORT $L753
; Line 25
	pop	esi
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
	jne	SHORT $L761
; Line 33
	mov	BYTE PTR _multiplayer, 1
; Line 34
	call	_destroy_hypercraft
; Line 35
	jmp	_blazer2_init
; Line 37
$L761:
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
; Line 44
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 46
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	ebx, eax
; Line 47
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	ebp, eax
; Line 48
	push	20					; 00000014H
	call	_malloc
	mov	DWORD PTR _buttonData3$[esp+24], eax
	add	esp, 4
; Line 49
	mov	DWORD PTR [ebx+12], OFFSET FLAT:??_C@_08KGCG@CAMPAIGN?$AA@ ; `string'
; Line 50
	mov	eax, 175				; 000000afH
	mov	BYTE PTR [ebx], 3
; Line 51
	mov	BYTE PTR [ebx+1], 2
; Line 52
	mov	BYTE PTR [ebx+2], al
; Line 53
	mov	BYTE PTR [ebx+3], 0
; Line 54
	mov	WORD PTR [ebx+4], 100			; 00000064H
; Line 55
	mov	edi, ebp
	mov	esi, ebx
	mov	WORD PTR [ebx+6], 12			; 0000000cH
; Line 56
	mov	ecx, 5
	mov	BYTE PTR [ebx+8], al
; Line 57
	mov	eax, 255				; 000000ffH
	mov	BYTE PTR [ebx+9], al
; Line 58
	mov	BYTE PTR [ebx+10], al
; Line 60
	rep	movsd
; Line 61
	mov	edi, DWORD PTR _buttonData3$[esp+20]
	mov	esi, ebx
	mov	ecx, 5
	rep	movsd
; Line 63
	mov	ecx, DWORD PTR _buttonData3$[esp+20]
	push	ebx
	mov	DWORD PTR [ebp+12], OFFSET FLAT:??_C@_0M@MGOA@MULTIPLAYER?$AA@ ; `string'
; Line 64
	mov	DWORD PTR [ecx+12], OFFSET FLAT:??_C@_07MKIM@OPTIONS?$AA@ ; `string'
; Line 66
	mov	DWORD PTR [ebx+16], OFFSET FLAT:_campaign_button
; Line 67
	mov	DWORD PTR [ebp+16], OFFSET FLAT:_multiplayer_button
; Line 68
	mov	DWORD PTR [ecx+16], OFFSET FLAT:_options_button
; Line 70
	push	120					; 00000078H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
; Line 71
	push	ebp
	push	140					; 0000008cH
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	mov	ecx, DWORD PTR _buttonData3$[esp+40]
	add	esp, 20					; 00000014H
; Line 72
	push	ecx
	push	160					; 000000a0H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
; Line 73
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 4
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
; Line 76
	mov	DWORD PTR _title_camera, 0
; Line 77
	mov	DWORD PTR _title_camera+4, 0
; Line 78
	mov	DWORD PTR _title_camera+8, 0
; Line 80
	push	OFFSET FLAT:_title_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 81
	push	OFFSET FLAT:_stars_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 83
	push	OFFSET FLAT:??_C@_0BA@KPAO@assets?1star?4obj?$AA@ ; `string'
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _logo, eax
; Line 84
	push	0
	push	128					; 00000080H
	push	0
	push	655360					; 000a0000H
	push	0
	push	0
	push	eax
	call	_spawn_entity
	mov	WORD PTR _SL_CENTER_Y, 45		; 0000002dH
	add	esp, 28					; 0000001cH
; Line 88
	call	_init_stars
; Line 89
	call	_create_buttons
; Line 91
	call	_init_hypercraft
; Line 92
	push	OFFSET FLAT:??_C@_0N@JEHG@sfx?1menu?4wav?$AA@ ; `string'
	call	_play_music
	add	esp, 4
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
	add	esp, 8
; Line 99
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_pitch
	add	esp, 8
; Line 100
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_yaw
	add	esp, 8
; Line 101
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_roll
	add	esp, 8
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
; Line 106
	push	ebx
	push	esi
	mov	esi, DWORD PTR _x$[esp+4]
	push	edi
	mov	edi, DWORD PTR _y$[esp+8]
	push	ebp
; Line 107
	mov	bl, BYTE PTR _clr$[esp+12]
	lea	ecx, DWORD PTR [esi-5]
	push	ebx
	lea	eax, DWORD PTR [edi+5]
	push	eax
	lea	edx, DWORD PTR [edi-5]
	push	ecx
	lea	ebp, DWORD PTR [esi+5]
	push	edx
	push	ecx
	call	_draw_line
	add	esp, 20					; 00000014H
	lea	ecx, DWORD PTR [edi+5]
; Line 108
	lea	edx, DWORD PTR [esi-5]
	push	ebx
	push	ecx
	push	ebp
	push	ecx
	push	edx
	call	_draw_line
	add	esp, 20					; 00000014H
	lea	ecx, DWORD PTR [edi-5]
; Line 109
	lea	edx, DWORD PTR [edi+5]
	push	ebx
	push	ecx
	push	ebp
	push	edx
	push	ebp
	sub	esi, 5
	call	_draw_line
	lea	ecx, DWORD PTR [edi-5]
	add	esp, 20					; 00000014H
; Line 110
	sub	edi, 5
	push	ebx
	push	ecx
	push	esi
	push	edi
	push	ebp
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 111
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
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
; Line 113
	sub	esp, 8
; Line 115
	lea	eax, DWORD PTR _mouse$[esp+8]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 129
	push	0
	push	-97					; ffffff9fH
	push	2
	push	3
	push	0
	push	0
	push	OFFSET FLAT:??_C@_0L@OENN@STARBLAZER?$AA@ ; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 130
	push	0
	push	-17					; ffffffefH
	push	2
	push	3
	push	10					; 0000000aH
	push	0
	push	OFFSET FLAT:??_C@_06KIN@?5?5?5?5II?$AA@	; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 131
	push	0
	push	-1
	push	2
	push	3
	push	100					; 00000064H
	push	30					; 0000001eH
	push	OFFSET FLAT:??_C@_0BN@POOO@BY?5WILL?5KLEES?5AND?5JOSH?5PIETY?$AA@ ; `string'
	call	_vputs
	add	esp, 28					; 0000001cH
	mov	eax, DWORD PTR _title_cam_ori+12
; Line 133
	mov	ecx, DWORD PTR _title_cam_ori+8
	mov	edx, DWORD PTR _title_cam_ori+4
	push	0
	push	0
	push	0
	push	eax
	push	ecx
	mov	eax, DWORD PTR _title_cam_ori
	push	edx
	push	eax
	push	OFFSET FLAT:_title_camera
	call	_draw_scene
	add	esp, 32					; 00000020H
; Line 139
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_stars_cam_ori
	call	_quat_tomat
	add	esp, 8
; Line 140
	call	_draw_stars
; Line 142
	call	_ui_display_widgets
; Line 145
	add	esp, 8
	ret	0
_title_draw ENDP
_TEXT	ENDS
END
