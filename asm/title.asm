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
_TEXT	SEGMENT
; File src\title.c
_i$ = -4
_init_stars PROC NEAR
; Line 22
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 24
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L699
$L700:
	inc	DWORD PTR _i$[ebp]
$L699:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L701
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
	jmp	$L700
$L701:
; Line 25
$L697:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_stars ENDP
_TEXT	ENDS
PUBLIC	_options_button
_TEXT	SEGMENT
_options_button PROC NEAR
; Line 27
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 29
$L704:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_options_button ENDP
_TEXT	ENDS
PUBLIC	_multiplayer_button
EXTRN	_mplayer_addr:DWORD
EXTRN	_destroy_hypercraft:NEAR
EXTRN	_multiplayer:BYTE
EXTRN	_net_connect:NEAR
EXTRN	_blazer2_init:NEAR
_TEXT	SEGMENT
_multiplayer_button PROC NEAR
; Line 31
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 32
	mov	eax, DWORD PTR _mplayer_addr
	push	eax
	call	_net_connect
	add	esp, 4
	xor	ecx, ecx
	mov	cl, al
	test	ecx, ecx
	jne	$L708
; Line 33
	mov	BYTE PTR _multiplayer, 1
; Line 34
	call	_destroy_hypercraft
; Line 35
	call	_blazer2_init
; Line 37
$L708:
$L707:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_multiplayer_button ENDP
_TEXT	ENDS
PUBLIC	_campaign_button
_TEXT	SEGMENT
_campaign_button PROC NEAR
; Line 39
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 40
	call	_destroy_hypercraft
; Line 41
	call	_blazer2_init
; Line 42
$L712:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_campaign_button ENDP
_TEXT	ENDS
PUBLIC	_create_buttons
EXTRN	_ui_create_widget:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG719	DB	'CAMPAIGN', 00H
	ORG $+3
$SG720	DB	'MULTIPLAYER', 00H
$SG721	DB	'OPTIONS', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id$ = -12
_buttonData$ = -4
_buttonData2$ = -8
_buttonData3$ = -16
_create_buttons PROC NEAR
; Line 44
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 46
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData$[ebp], eax
; Line 47
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData2$[ebp], eax
; Line 48
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData3$[ebp], eax
; Line 49
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG719
; Line 50
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax], 3
; Line 51
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+1], 2
; Line 52
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+2], 175			; 000000afH
; Line 53
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+3], 0
; Line 54
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+4], 100			; 00000064H
; Line 55
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+6], 12			; 0000000cH
; Line 56
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+8], 175			; 000000afH
; Line 57
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+9], 255			; 000000ffH
; Line 58
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+10], 255			; 000000ffH
; Line 60
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 61
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 63
	mov	eax, DWORD PTR _buttonData2$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG720
; Line 64
	mov	eax, DWORD PTR _buttonData3$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG721
; Line 66
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_campaign_button
; Line 67
	mov	eax, DWORD PTR _buttonData2$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_multiplayer_button
; Line 68
	mov	eax, DWORD PTR _buttonData3$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_options_button
; Line 70
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	push	120					; 00000078H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 71
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	push	140					; 0000008cH
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 72
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	push	160					; 000000a0H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 73
$L714:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_create_buttons ENDP
_TEXT	ENDS
PUBLIC	_title_init
EXTRN	_quat_create:NEAR
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_spawn_entity:NEAR
EXTRN	_load_model:NEAR
EXTRN	_init_hypercraft:NEAR
EXTRN	_play_music:NEAR
_DATA	SEGMENT
$SG724	DB	'assets/star.obj', 00H
$SG726	DB	'sfx/menu.wav', 00H
_DATA	ENDS
_TEXT	SEGMENT
_title_init PROC NEAR
; Line 75
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
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
	push	OFFSET FLAT:$SG724
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
	mov	eax, DWORD PTR _logo
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
; Line 86
	mov	WORD PTR _SL_CENTER_Y, 45		; 0000002dH
; Line 88
	call	_init_stars
; Line 89
	call	_create_buttons
; Line 91
	call	_init_hypercraft
; Line 92
	push	OFFSET FLAT:$SG726
	call	_play_music
	add	esp, 4
; Line 93
$L723:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_title_init ENDP
_TEXT	ENDS
PUBLIC	_title_module
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
EXTRN	_StarblazerEntities:BYTE
EXTRN	_ui_process_widgets:NEAR
_TEXT	SEGMENT
_title_module PROC NEAR
; Line 95
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
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
	call	_ui_process_widgets
; Line 104
$L728:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_title_module ENDP
_TEXT	ENDS
PUBLIC	_draw_cursor
EXTRN	_draw_line:NEAR
_TEXT	SEGMENT
_x$ = 8
_y$ = 12
_clr$ = 16
_draw_cursor PROC NEAR
; Line 106
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 107
	mov	eax, DWORD PTR _clr$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	add	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, 5
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, 5
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 108
	mov	eax, DWORD PTR _clr$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	add	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 5
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	add	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, 5
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 109
	mov	eax, DWORD PTR _clr$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 5
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	add	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 5
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 110
	mov	eax, DWORD PTR _clr$[ebp]
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	sub	eax, 5
	push	eax
	mov	eax, DWORD PTR _y$[ebp]
	sub	eax, 5
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	add	eax, 5
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 111
$L733:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_cursor ENDP
_TEXT	ENDS
PUBLIC	_title_draw
EXTRN	_quat_tomat:NEAR
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_draw_scene:NEAR
EXTRN	_vputs:NEAR
EXTRN	_SG_ReadMouse:NEAR
EXTRN	_ui_display_widgets:NEAR
EXTRN	_draw_stars:NEAR
_DATA	SEGMENT
	ORG $+3
$SG739	DB	'STARBLAZER', 00H
	ORG $+1
$SG740	DB	'    II', 00H
	ORG $+1
$SG741	DB	'BY WILL KLEES AND JOSH PIETY', 00H
_DATA	ENDS
_TEXT	SEGMENT
_mouse$ = -8
_title_draw PROC NEAR
; Line 113
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 115
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 117
	xor	eax, eax
	mov	al, BYTE PTR _mouse$[ebp+4]
	test	eax, eax
	je	$L737
; Line 125
	jmp	$L738
$L737:
; Line 127
$L738:
; Line 129
	push	0
	push	-97					; ffffff9fH
	push	2
	push	3
	push	0
	push	0
	push	OFFSET FLAT:$SG739
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 130
	push	0
	push	-17					; ffffffefH
	push	2
	push	3
	push	10					; 0000000aH
	push	0
	push	OFFSET FLAT:$SG740
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 131
	push	0
	push	-1
	push	2
	push	3
	push	100					; 00000064H
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG741
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 133
	push	0
	push	0
	push	0
	mov	eax, DWORD PTR _title_cam_ori+12
	push	eax
	mov	eax, DWORD PTR _title_cam_ori+8
	push	eax
	mov	eax, DWORD PTR _title_cam_ori+4
	push	eax
	mov	eax, DWORD PTR _title_cam_ori
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
$L735:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_title_draw ENDP
_TEXT	ENDS
END
