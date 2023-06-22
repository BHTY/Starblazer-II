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
	jmp	$L551
$L552:
	inc	DWORD PTR _i$[ebp]
$L551:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L553
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
	jmp	$L552
$L553:
; Line 22
$L549:
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
$L556:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_options_button ENDP
_TEXT	ENDS
PUBLIC	_multiplayer_button
EXTRN	_destroy_hypercraft:NEAR
EXTRN	_multiplayer:BYTE
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
	mov	BYTE PTR _multiplayer, 1
; Line 30
	call	_destroy_hypercraft
; Line 31
	call	_blazer2_init
; Line 32
$L559:
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
; Line 34
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 35
	call	_destroy_hypercraft
; Line 36
	call	_blazer2_init
; Line 37
$L563:
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
$SG571	DB	'CAMPAIGN', 00H
	ORG $+3
$SG572	DB	'MULTIPLAYER', 00H
$SG573	DB	'OPTIONS', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id$ = -12
_buttonData$ = -4
_buttonData2$ = -8
_buttonData3$ = -16
_create_buttons PROC NEAR
; Line 39
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 41
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData$[ebp], eax
; Line 42
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData2$[ebp], eax
; Line 43
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData3$[ebp], eax
; Line 44
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG571
; Line 45
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax], 3
; Line 46
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+1], 2
; Line 47
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+2], 175			; 000000afH
; Line 48
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+3], 0
; Line 49
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+4], 100			; 00000064H
; Line 50
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+6], 12			; 0000000cH
; Line 51
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+8], 175			; 000000afH
; Line 52
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+9], 255			; 000000ffH
; Line 53
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+10], 255			; 000000ffH
; Line 55
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 56
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 58
	mov	eax, DWORD PTR _buttonData2$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG572
; Line 59
	mov	eax, DWORD PTR _buttonData3$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG573
; Line 61
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_campaign_button
; Line 62
	mov	eax, DWORD PTR _buttonData2$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_multiplayer_button
; Line 63
	mov	eax, DWORD PTR _buttonData3$[ebp]
	mov	DWORD PTR [eax+16], OFFSET FLAT:_options_button
; Line 65
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	push	120					; 00000078H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 66
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	push	140					; 0000008cH
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 67
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	push	160					; 000000a0H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 68
$L565:
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
$SG576	DB	'assets/star.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_title_init PROC NEAR
; Line 70
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 71
	mov	DWORD PTR _title_camera, 0
; Line 72
	mov	DWORD PTR _title_camera+4, 0
; Line 73
	mov	DWORD PTR _title_camera+8, 0
; Line 75
	push	OFFSET FLAT:_title_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 76
	push	OFFSET FLAT:_stars_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 78
	push	OFFSET FLAT:$SG576
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _logo, eax
; Line 79
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
; Line 81
	mov	WORD PTR _SL_CENTER_Y, 45		; 0000002dH
; Line 83
	call	_init_stars
; Line 84
	call	_create_buttons
; Line 86
	call	_init_hypercraft
; Line 87
$L575:
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
; Line 89
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 91
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	push	16					; 00000010H
	call	_quat_yaw
	add	esp, 8
; Line 93
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_pitch
	add	esp, 8
; Line 94
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_yaw
	add	esp, 8
; Line 95
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_roll
	add	esp, 8
; Line 97
	call	_ui_process_widgets
; Line 98
$L578:
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
; Line 100
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 101
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
; Line 102
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
; Line 103
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
; Line 104
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
; Line 105
$L583:
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
$SG589	DB	'STARBLAZER', 00H
	ORG $+1
$SG590	DB	'    II', 00H
	ORG $+1
$SG591	DB	'BY WILL KLEES AND JOSH PIETY', 00H
_DATA	ENDS
_TEXT	SEGMENT
_mouse$ = -8
_title_draw PROC NEAR
; Line 107
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 109
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 111
	xor	eax, eax
	mov	al, BYTE PTR _mouse$[ebp+4]
	test	eax, eax
	je	$L587
; Line 119
	jmp	$L588
$L587:
; Line 121
$L588:
; Line 123
	push	0
	push	-97					; ffffff9fH
	push	2
	push	3
	push	0
	push	0
	push	OFFSET FLAT:$SG589
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 124
	push	0
	push	-17					; ffffffefH
	push	2
	push	3
	push	10					; 0000000aH
	push	0
	push	OFFSET FLAT:$SG590
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 125
	push	0
	push	-1
	push	2
	push	3
	push	100					; 00000064H
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG591
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 127
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
; Line 133
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_stars_cam_ori
	call	_quat_tomat
	add	esp, 8
; Line 134
	call	_draw_stars
; Line 136
	call	_ui_display_widgets
; Line 139
$L585:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_title_draw ENDP
_TEXT	ENDS
END
