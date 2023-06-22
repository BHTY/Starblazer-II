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
; Line 19
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 21
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L559
$L560:
	inc	DWORD PTR _i$[ebp]
$L559:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L561
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
	jmp	$L560
$L561:
; Line 22
$L557:
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
; Line 24
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 26
$L564:
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
; Line 28
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 29
	mov	eax, DWORD PTR _mplayer_addr
	push	eax
	call	_net_connect
	add	esp, 4
	test	eax, eax
	jne	$L569
; Line 30
	mov	BYTE PTR _multiplayer, 1
; Line 31
	call	_destroy_hypercraft
; Line 32
	call	_blazer2_init
; Line 34
$L569:
$L567:
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
; Line 36
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 37
	call	_destroy_hypercraft
; Line 38
	call	_blazer2_init
; Line 39
$L573:
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
$SG581	DB	'CAMPAIGN', 00H
	ORG $+3
$SG582	DB	'MULTIPLAYER', 00H
$SG583	DB	'OPTIONS', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id$ = -12
_buttonData$ = -4
_buttonData2$ = -8
_buttonData3$ = -16
_create_buttons PROC NEAR
; Line 41
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 43
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData$[ebp], eax
; Line 44
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData2$[ebp], eax
; Line 45
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData3$[ebp], eax
; Line 46
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG581
; Line 47
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax], 3
; Line 48
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+1], 2
; Line 49
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+2], 175			; 000000afH
; Line 50
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+3], 0
; Line 51
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+4], 100			; 00000064H
; Line 52
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+6], 12			; 0000000cH
; Line 53
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+8], 175			; 000000afH
; Line 54
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+9], 255			; 000000ffH
; Line 55
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+10], 255			; 000000ffH
; Line 57
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 58
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 60
	mov	eax, DWORD PTR _buttonData2$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG582
; Line 61
	mov	eax, DWORD PTR _buttonData3$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG583
; Line 63
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_campaign_button
; Line 64
	mov	eax, DWORD PTR _buttonData2$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_multiplayer_button
; Line 65
	mov	eax, DWORD PTR _buttonData3$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_options_button
; Line 67
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	push	120					; 00000078H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 68
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	push	140					; 0000008cH
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 69
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	push	160					; 000000a0H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 70
$L575:
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
_DATA	SEGMENT
$SG586	DB	'assets/star.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_title_init PROC NEAR
; Line 72
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 73
	mov	DWORD PTR _title_camera, 0
; Line 74
	mov	DWORD PTR _title_camera+4, 0
; Line 75
	mov	DWORD PTR _title_camera+8, 0
; Line 77
	push	OFFSET FLAT:_title_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 78
	push	OFFSET FLAT:_stars_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 80
	push	OFFSET FLAT:$SG586
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _logo, eax
; Line 81
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
; Line 83
	mov	WORD PTR _SL_CENTER_Y, 45		; 0000002dH
; Line 85
	call	_init_stars
; Line 86
	call	_create_buttons
; Line 88
	call	_init_hypercraft
; Line 89
$L585:
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
; Line 91
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 93
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	push	16					; 00000010H
	call	_quat_yaw
	add	esp, 8
; Line 95
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_pitch
	add	esp, 8
; Line 96
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_yaw
	add	esp, 8
; Line 97
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_roll
	add	esp, 8
; Line 99
	call	_ui_process_widgets
; Line 100
$L588:
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
; Line 102
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 103
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
; Line 104
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
; Line 105
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
; Line 106
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
; Line 107
$L593:
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
$SG599	DB	'STARBLAZER', 00H
	ORG $+1
$SG600	DB	'    II', 00H
	ORG $+1
$SG601	DB	'BY WILL KLEES AND JOSH PIETY', 00H
_DATA	ENDS
_TEXT	SEGMENT
_mouse$ = -8
_title_draw PROC NEAR
; Line 109
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 111
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 113
	xor	eax, eax
	mov	al, BYTE PTR _mouse$[ebp+4]
	test	eax, eax
	je	$L597
; Line 121
	jmp	$L598
$L597:
; Line 123
$L598:
; Line 125
	push	0
	push	-97					; ffffff9fH
	push	2
	push	3
	push	0
	push	0
	push	OFFSET FLAT:$SG599
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 126
	push	0
	push	-17					; ffffffefH
	push	2
	push	3
	push	10					; 0000000aH
	push	0
	push	OFFSET FLAT:$SG600
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 127
	push	0
	push	-1
	push	2
	push	3
	push	100					; 00000064H
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG601
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 129
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
; Line 135
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_stars_cam_ori
	call	_quat_tomat
	add	esp, 8
; Line 136
	call	_draw_stars
; Line 138
	call	_ui_display_widgets
; Line 141
$L595:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_title_draw ENDP
_TEXT	ENDS
END
