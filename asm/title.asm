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
	jmp	$L534
$L535:
	inc	DWORD PTR _i$[ebp]
$L534:
	cmp	DWORD PTR _i$[ebp], 500			; 000001f4H
	jge	$L536
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	lea	eax, DWORD PTR _title_stars[eax*4]
	push	eax
	call	_init_star
	add	esp, 4
	jmp	$L535
$L536:
; Line 22
$L532:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_stars ENDP
_TEXT	ENDS
PUBLIC	_create_textbox
EXTRN	_ui_create_widget:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_malloc:NEAR
_DATA	SEGMENT
	ORG $+3
$SG544	DB	'CAMPAIGN', 00H
	ORG $+3
$SG545	DB	'MULTIPLAYER', 00H
$SG546	DB	'OPTIONS', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id$ = -12
_buttonData$ = -4
_buttonData2$ = -8
_buttonData3$ = -16
_create_textbox PROC NEAR
; Line 24
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 26
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData$[ebp], eax
; Line 27
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData2$[ebp], eax
; Line 28
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buttonData3$[ebp], eax
; Line 29
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG544
; Line 30
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax], 3
; Line 31
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+1], 2
; Line 32
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+2], 28			; 0000001cH
; Line 33
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+3], 0
; Line 34
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+4], 100			; 00000064H
; Line 35
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	WORD PTR [eax+6], 12			; 0000000cH
; Line 36
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+8], 28			; 0000001cH
; Line 37
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+9], 255			; 000000ffH
; Line 38
	mov	eax, DWORD PTR _buttonData$[ebp]
	mov	BYTE PTR [eax+10], 255			; 000000ffH
; Line 40
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 41
	push	20					; 00000014H
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	call	_memcpy
	add	esp, 12					; 0000000cH
; Line 43
	mov	eax, DWORD PTR _buttonData2$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG545
; Line 44
	mov	eax, DWORD PTR _buttonData3$[ebp]
	mov	DWORD PTR [eax+12], OFFSET FLAT:$SG546
; Line 46
	mov	eax, DWORD PTR _buttonData$[ebp]
	push	eax
	push	120					; 00000078H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 47
	mov	eax, DWORD PTR _buttonData2$[ebp]
	push	eax
	push	140					; 0000008cH
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 48
	mov	eax, DWORD PTR _buttonData3$[ebp]
	push	eax
	push	160					; 000000a0H
	push	110					; 0000006eH
	push	0
	push	6
	call	_ui_create_widget
	add	esp, 20					; 00000014H
	mov	DWORD PTR _id$[ebp], eax
; Line 49
$L538:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_create_textbox ENDP
_TEXT	ENDS
PUBLIC	_title_init
EXTRN	_quat_create:NEAR
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_spawn_entity:NEAR
EXTRN	_load_model:NEAR
EXTRN	_init_hypercraft:NEAR
_DATA	SEGMENT
$SG549	DB	'assets/star.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_title_init PROC NEAR
; Line 51
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 52
	mov	DWORD PTR _title_camera, 0
; Line 53
	mov	DWORD PTR _title_camera+4, 0
; Line 54
	mov	DWORD PTR _title_camera+8, 0
; Line 56
	push	OFFSET FLAT:_title_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 57
	push	OFFSET FLAT:_stars_cam_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 59
	push	OFFSET FLAT:$SG549
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _logo, eax
; Line 60
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
; Line 62
	mov	WORD PTR _SL_CENTER_Y, 45		; 0000002dH
; Line 64
	call	_init_stars
; Line 65
	call	_create_textbox
; Line 67
	call	_init_hypercraft
; Line 68
$L548:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_title_init ENDP
_TEXT	ENDS
PUBLIC	_title_module
EXTRN	_rot_hypercraft:NEAR
_TEXT	SEGMENT
_title_module PROC NEAR
; Line 70
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 71
	call	_rot_hypercraft
; Line 72
$L551:
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
; Line 74
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 75
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
; Line 76
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
; Line 77
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
; Line 78
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
; Line 79
$L556:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_cursor ENDP
_TEXT	ENDS
PUBLIC	_title_draw
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
EXTRN	_quat_tomat:NEAR
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_StarblazerEntities:BYTE
EXTRN	_draw_scene:NEAR
EXTRN	_vputs:NEAR
EXTRN	_SG_ReadMouse:NEAR
EXTRN	_ui_display_widgets:NEAR
EXTRN	_draw_hypercraft:NEAR
EXTRN	_destroy_hypercraft:NEAR
EXTRN	_draw_stars:NEAR
EXTRN	_blazer2_init:NEAR
_DATA	SEGMENT
$SG563	DB	'STARBLAZER', 00H
	ORG $+1
$SG564	DB	'    II', 00H
	ORG $+1
$SG565	DB	'BY WILL KLEES AND JOSH PIETY', 00H
_DATA	ENDS
_TEXT	SEGMENT
_mouse$ = -8
_title_draw PROC NEAR
; Line 81
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 83
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 85
	xor	eax, eax
	mov	al, BYTE PTR _mouse$[ebp+4]
	test	eax, eax
	je	$L560
; Line 86
	push	28					; 0000001cH
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	push	eax
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_draw_cursor
	add	esp, 12					; 0000000cH
; Line 87
	call	_destroy_hypercraft
; Line 88
	call	_blazer2_init
; Line 90
	jmp	$L562
$L560:
; Line 91
	push	255					; 000000ffH
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	push	eax
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_draw_cursor
	add	esp, 12					; 0000000cH
; Line 92
$L562:
; Line 94
	push	0
	push	39					; 00000027H
	push	2
	push	3
	push	0
	push	0
	push	OFFSET FLAT:$SG563
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 95
	push	0
	push	-4					; fffffffcH
	push	2
	push	3
	push	10					; 0000000aH
	push	0
	push	OFFSET FLAT:$SG564
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 96
	push	0
	push	-1
	push	2
	push	3
	push	100					; 00000064H
	push	30					; 0000001eH
	push	OFFSET FLAT:$SG565
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 98
	push	0
	push	0
	push	1
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
; Line 99
	mov	eax, DWORD PTR _StarblazerEntities
	add	eax, 16					; 00000010H
	push	eax
	push	16					; 00000010H
	call	_quat_yaw
	add	esp, 8
; Line 101
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_pitch
	add	esp, 8
; Line 102
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_yaw
	add	esp, 8
; Line 103
	push	OFFSET FLAT:_stars_cam_ori
	push	8
	call	_quat_roll
	add	esp, 8
; Line 104
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_stars_cam_ori
	call	_quat_tomat
	add	esp, 8
; Line 105
	call	_draw_stars
; Line 107
	call	_ui_display_widgets
; Line 109
	push	160					; 000000a0H
	push	265					; 00000109H
	call	_draw_hypercraft
	add	esp, 8
; Line 110
$L558:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_title_draw ENDP
_TEXT	ENDS
END
