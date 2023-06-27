	TITLE	src\ui.c
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
PUBLIC	_widget_can_focus
PUBLIC	_current_widget_focus
PUBLIC	_focused_textbox_ptr
PUBLIC	_cursor
_DATA	SEGMENT
COMM	_widgets:DWORD:0c8H
_widget_can_focus DB 00H
	DB	00H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	ORG $+1
_current_widget_focus DD 00H
_focused_textbox_ptr DB 00H
	ORG $+3
_cursor	DB	00H
_DATA	ENDS
PUBLIC	_UI_OPEN_SLOT
_TEXT	SEGMENT
; File src\ui.c
_starting$ = 8
_i$ = -4
_UI_OPEN_SLOT PROC NEAR
; Line 28
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 31
	mov	eax, DWORD PTR _starting$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L379
$L380:
	inc	DWORD PTR _i$[ebp]
$L379:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L381
; Line 32
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	jne	$L382
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L377
; Line 33
$L382:
	jmp	$L380
$L381:
; Line 35
	xor	eax, eax
	jmp	$L377
; Line 36
$L377:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_OPEN_SLOT ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_RECT
EXTRN	_draw_line:NEAR
_TEXT	SEGMENT
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_UI_DRAW_RECT PROC NEAR
; Line 38
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 39
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 40
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 41
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 42
	mov	eax, DWORD PTR _color$[ebp]
	push	eax
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	eax, DWORD PTR _x1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 43
$L389:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_FILL_RECT
_TEXT	SEGMENT
_y1$ = 12
_y2$ = 20
_i$ = -4
_UI_FILL_RECT PROC NEAR
; Line 45
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 49
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L398
$L399:
	inc	DWORD PTR _i$[ebp]
$L398:
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L400
; Line 51
	jmp	$L399
$L400:
; Line 52
$L396:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_FILL_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_BOX
EXTRN	_vputs:NEAR
_TEXT	SEGMENT
_id$ = 8
_ptr$ = 12
_text$ = 16
_x$ = 20
_y$ = 24
_px_offset$ = 28
_txt$ = 32
_text_size_y$ = -4
_UI_DRAW_BOX PROC NEAR
; Line 54
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 55
	mov	eax, DWORD PTR _text$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	lea	eax, DWORD PTR [ecx*4]
	inc	eax
	mov	DWORD PTR _text_size_y$[ebp], eax
; Line 58
	mov	eax, DWORD PTR _text$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+2]
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [eax+4]
	cmp	ecx, edx
	je	$L411
; Line 59
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	al, BYTE PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+2]
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax]
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_UI_FILL_RECT
	add	esp, 20					; 00000014H
; Line 63
$L411:
	mov	eax, DWORD PTR _id$[ebp]
	cmp	DWORD PTR _current_widget_focus, eax
	jne	$L534
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+6]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	$L535
$L534:
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+5]
	mov	DWORD PTR -8+[ebp], ecx
$L535:
	mov	eax, DWORD PTR -8+[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+2]
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax]
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 66
	mov	eax, DWORD PTR _text$[ebp]
	mov	al, BYTE PTR [eax+3]
	push	eax
	mov	eax, DWORD PTR _text$[ebp]
	mov	al, BYTE PTR [eax+2]
	push	eax
	mov	eax, DWORD PTR _text$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	push	ecx
	mov	eax, DWORD PTR _text$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+2]
	sub	ecx, DWORD PTR _text_size_y$[ebp]
	sar	ecx, 1
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	add	ecx, eax
	push	ecx
	mov	eax, DWORD PTR _px_offset$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _x$[ebp]
	and	ecx, 65535				; 0000ffffH
	add	eax, ecx
	push	eax
	mov	eax, DWORD PTR _txt$[ebp]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 67
$L409:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_BOX ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_LABEL
_TEXT	SEGMENT
_widget_handle$ = 8
_ptr$ = -4
_label_data$ = -8
_UI_DRAW_LABEL PROC NEAR
; Line 69
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 70
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 71
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _label_data$[ebp], eax
; Line 72
	mov	eax, DWORD PTR _label_data$[ebp]
	mov	al, BYTE PTR [eax+3]
	push	eax
	mov	eax, DWORD PTR _label_data$[ebp]
	mov	al, BYTE PTR [eax+2]
	push	eax
	mov	eax, DWORD PTR _label_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	push	ecx
	mov	eax, DWORD PTR _label_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	push	ecx
	mov	eax, DWORD PTR _label_data$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 73
$L414:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_LABEL ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_CHECKBOX
_TEXT	SEGMENT
_widget_handle$ = 8
_ptr$ = -4
_checkbox_data$ = -12
_box_size_x$ = -8
_box_size_y$ = -16
_UI_DRAW_CHECKBOX PROC NEAR
; Line 75
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 76
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 77
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _checkbox_data$[ebp], eax
; Line 78
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	lea	eax, DWORD PTR [ecx*2]
	inc	eax
	mov	DWORD PTR _box_size_x$[ebp], eax
; Line 79
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	lea	eax, DWORD PTR [ecx*4]
	inc	eax
	mov	DWORD PTR _box_size_y$[ebp], eax
; Line 82
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	mov	al, BYTE PTR [eax+2]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	add	ecx, DWORD PTR _box_size_y$[ebp]
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	add	ecx, DWORD PTR _box_size_x$[ebp]
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ax, WORD PTR [eax+10]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ax, WORD PTR [eax+8]
	push	eax
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 85
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	mov	al, BYTE PTR [eax+3]
	push	eax
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	mov	al, BYTE PTR [eax+2]
	push	eax
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	push	ecx
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	push	ecx
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+3]
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [eax+8]
	add	ecx, edx
	add	ecx, DWORD PTR _box_size_x$[ebp]
	push	ecx
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 87
	mov	eax, DWORD PTR _ptr$[ebp]
	cmp	DWORD PTR [eax+16], 1
	jne	$L424
; Line 90
$L424:
$L419:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_CHECKBOX ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_DROPDOWN
_TEXT	SEGMENT
_widget_handle$ = 8
_ptr$ = -4
_dropdown_data$ = -8
_UI_DRAW_DROPDOWN PROC NEAR
; Line 92
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 93
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 94
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _dropdown_data$[ebp], eax
; Line 103
$L427:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_DROPDOWN ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_RADIO
EXTRN	_plot_pixel:NEAR
_TEXT	SEGMENT
_widget_handle$ = 8
_ptr$ = -4
_radio_data$ = -24
_i$ = -16
_box_size_x$ = -12
_box_size_y$ = -20
_current_y$ = -8
_UI_DRAW_RADIO PROC NEAR
; Line 105
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 106
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 107
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _radio_data$[ebp], eax
; Line 110
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	lea	eax, DWORD PTR [ecx*2]
	inc	eax
	mov	DWORD PTR _box_size_x$[ebp], eax
; Line 111
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	lea	eax, DWORD PTR [ecx*4]
	inc	eax
	mov	DWORD PTR _box_size_y$[ebp], eax
; Line 112
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	mov	DWORD PTR _current_y$[ebp], ecx
; Line 114
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L439
$L440:
	inc	DWORD PTR _i$[ebp]
$L439:
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+4]
	cmp	ecx, DWORD PTR _i$[ebp]
	jle	$L441
; Line 116
	mov	eax, DWORD PTR _radio_data$[ebp]
	mov	al, BYTE PTR [eax+2]
	push	eax
	mov	eax, DWORD PTR _current_y$[ebp]
	add	eax, DWORD PTR _box_size_y$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	add	ecx, DWORD PTR _box_size_x$[ebp]
	push	ecx
	mov	eax, DWORD PTR _current_y$[ebp]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ax, WORD PTR [eax+8]
	push	eax
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 119
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L442
; Line 120
	mov	eax, DWORD PTR _radio_data$[ebp]
	mov	al, BYTE PTR [eax+2]
	push	eax
	mov	eax, DWORD PTR _current_y$[ebp]
	add	eax, DWORD PTR _box_size_y$[ebp]
	sar	eax, 1
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	add	ecx, DWORD PTR _box_size_x$[ebp]
	sar	ecx, 1
	push	ecx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 124
$L442:
	mov	eax, DWORD PTR _radio_data$[ebp]
	mov	al, BYTE PTR [eax+3]
	push	eax
	mov	eax, DWORD PTR _radio_data$[ebp]
	mov	al, BYTE PTR [eax+2]
	push	eax
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	push	ecx
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	eax, DWORD PTR _current_y$[ebp]
	push	eax
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+3]
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [eax+8]
	add	ecx, edx
	add	ecx, DWORD PTR _box_size_x$[ebp]
	push	ecx
	mov	eax, DWORD PTR _radio_data$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR [eax+ecx*4]
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 126
	mov	eax, DWORD PTR _box_size_y$[ebp]
	inc	eax
	add	DWORD PTR _current_y$[ebp], eax
; Line 127
	jmp	$L440
$L441:
; Line 128
$L432:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_RADIO ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_TEXTBOX
_TEXT	SEGMENT
_widget_handle$ = 8
_ptr$ = -4
_textbox_data$ = -8
_UI_DRAW_TEXTBOX PROC NEAR
; Line 130
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 131
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 132
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _textbox_data$[ebp], eax
; Line 138
	mov	eax, DWORD PTR _widget_handle$[ebp]
	cmp	DWORD PTR _current_widget_focus, eax
	jne	$L448
; Line 139
	xor	eax, eax
	mov	al, BYTE PTR _cursor
	test	eax, eax
	je	$L449
; Line 142
$L449:
	xor	eax, eax
	mov	al, BYTE PTR _cursor
	test	eax, eax
	jne	$L536
	mov	BYTE PTR _cursor, 1
	jmp	$L537
$L536:
	mov	BYTE PTR _cursor, 0
$L537:
; Line 144
$L448:
$L445:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_TEXTBOX ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_BUTTON
EXTRN	_strlen:NEAR
_TEXT	SEGMENT
_widget_handle$ = 8
_ptr$ = -8
_button_data$ = -4
_text_size_x$ = -12
_UI_DRAW_BUTTON PROC NEAR
; Line 146
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 147
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 148
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _button_data$[ebp], eax
; Line 150
	mov	eax, DWORD PTR _button_data$[ebp]
	xor	ebx, ebx
	mov	bl, BYTE PTR [eax]
	mov	eax, DWORD PTR _button_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+3]
	lea	ebx, DWORD PTR [ecx+ebx*2]
	add	ebx, 2
	mov	eax, DWORD PTR _button_data$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_strlen
	add	esp, 4
	imul	ebx, eax
	add	ebx, 6
	mov	DWORD PTR _text_size_x$[ebp], ebx
; Line 154
	mov	eax, DWORD PTR _button_data$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	mov	eax, DWORD PTR _button_data$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+4]
	sub	ecx, DWORD PTR _text_size_x$[ebp]
	sar	ecx, 1
	push	ecx
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ax, WORD PTR [eax+10]
	push	eax
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ax, WORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _button_data$[ebp]
	push	eax
	mov	eax, DWORD PTR _button_data$[ebp]
	add	eax, 4
	push	eax
	mov	eax, DWORD PTR _widget_handle$[ebp]
	push	eax
	call	_UI_DRAW_BOX
	add	esp, 28					; 0000001cH
; Line 155
$L452:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_DRAW_BUTTON ENDP
_TEXT	ENDS
PUBLIC	_ui_create_widget
EXTRN	_malloc:NEAR
_TEXT	SEGMENT
_widgetType$ = 8
_widgetID$ = 12
_posX$ = 16
_posY$ = 20
_widgetData$ = 24
_handle$ = -4
_ui_create_widget PROC NEAR
; Line 157
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 158
	push	1
	call	_UI_OPEN_SLOT
	add	esp, 4
	mov	DWORD PTR _handle$[ebp], eax
; Line 160
	cmp	DWORD PTR _handle$[ebp], 0
	jne	$L463
	mov	eax, DWORD PTR _handle$[ebp]
	jmp	$L461
; Line 162
$L463:
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	DWORD PTR _widgets[ecx*4], eax
; Line 163
	mov	al, BYTE PTR _widgetType$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	BYTE PTR [ecx], al
; Line 164
	mov	eax, DWORD PTR _widgetID$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	DWORD PTR [ecx+4], eax
; Line 165
	mov	ax, WORD PTR _posX$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	WORD PTR [ecx+8], ax
; Line 166
	mov	ax, WORD PTR _posY$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	WORD PTR [ecx+10], ax
; Line 167
	mov	eax, DWORD PTR _widgetData$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	DWORD PTR [ecx+12], eax
; Line 169
	xor	eax, eax
	mov	al, BYTE PTR _widgetType$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L464
; Line 170
$L468:
; Line 171
	push	80					; 00000050H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	DWORD PTR [ecx+16], eax
; Line 172
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR [eax], 0
; Line 173
	jmp	$L465
; Line 174
$L469:
; Line 175
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR [eax+16], 0
; Line 176
	jmp	$L465
; Line 177
	jmp	$L465
$L464:
	cmp	DWORD PTR -8+[ebp], 5
	je	$L468
	jmp	$L469
$L465:
; Line 179
	mov	eax, DWORD PTR _handle$[ebp]
	jmp	$L461
; Line 180
$L461:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_create_widget ENDP
_TEXT	ENDS
PUBLIC	_ui_destroy_widget
EXTRN	_free:NEAR
_TEXT	SEGMENT
_widget_handle$ = 8
_ptr$ = -4
_ui_destroy_widget PROC NEAR
; Line 182
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 183
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 184
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	DWORD PTR _widgets[eax*4], 0
; Line 186
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	cmp	ecx, 5
	jne	$L473
; Line 187
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_free
	add	esp, 4
; Line 190
$L473:
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 191
$L471:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_destroy_widget ENDP
_TEXT	ENDS
PUBLIC	_ui_get_handle_by_id
_TEXT	SEGMENT
_widgetID$ = 8
_i$ = -4
_ui_get_handle_by_id PROC NEAR
; Line 193
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 196
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L477
$L478:
	inc	DWORD PTR _i$[ebp]
$L477:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L479
; Line 197
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	je	$L480
; Line 198
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	ecx, DWORD PTR _widgetID$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L481
; Line 199
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L475
; Line 201
$L481:
; Line 202
$L480:
	jmp	$L478
$L479:
; Line 204
	xor	eax, eax
	jmp	$L475
; Line 205
$L475:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_get_handle_by_id ENDP
_TEXT	ENDS
PUBLIC	_ui_get_state
_TEXT	SEGMENT
_widget_handle$ = 8
_ui_get_state PROC NEAR
; Line 207
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 208
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+16]
	jmp	$L483
; Line 209
$L483:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_get_state ENDP
_TEXT	ENDS
PUBLIC	_ui_display_widgets
EXTRN	_SG_ReadMouse:NEAR
_TEXT	SEGMENT
_i$ = -4
_mouse$ = -12
_ui_display_widgets PROC NEAR
; Line 211
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 216
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 217
	push	255					; 000000ffH
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	add	eax, 5
	push	eax
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	add	eax, 5
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	sub	eax, 5
	push	eax
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	sub	eax, 5
	push	eax
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 219
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L487
$L488:
	inc	DWORD PTR _i$[ebp]
$L487:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L489
; Line 220
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	je	$L490
; Line 222
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	$L491
; Line 223
$L495:
; Line 224
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_LABEL
	add	esp, 4
; Line 225
	jmp	$L492
; Line 228
$L496:
; Line 229
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_CHECKBOX
	add	esp, 4
; Line 230
	jmp	$L492
; Line 233
$L497:
; Line 234
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_DROPDOWN
	add	esp, 4
; Line 235
	jmp	$L492
; Line 238
$L498:
; Line 239
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_RADIO
	add	esp, 4
; Line 240
	jmp	$L492
; Line 243
$L499:
; Line 244
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_TEXTBOX
	add	esp, 4
; Line 245
	jmp	$L492
; Line 248
$L500:
; Line 249
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_BUTTON
	add	esp, 4
; Line 250
	jmp	$L492
; Line 253
$L501:
; Line 254
	jmp	$L492
; Line 256
	jmp	$L492
$L491:
	dec	DWORD PTR -16+[ebp]
	cmp	DWORD PTR -16+[ebp], 5
	ja	$L501
	mov	eax, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L538[eax*4]
$L538:
	DD	OFFSET FLAT:$L495
	DD	OFFSET FLAT:$L496
	DD	OFFSET FLAT:$L497
	DD	OFFSET FLAT:$L498
	DD	OFFSET FLAT:$L499
	DD	OFFSET FLAT:$L500
$L492:
; Line 258
$L490:
	jmp	$L488
$L489:
; Line 259
$L484:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_display_widgets ENDP
_TEXT	ENDS
PUBLIC	_UI_GET_RECT
_TEXT	SEGMENT
_id$ = 8
_rect$ = 12
_button_data$ = -4
_UI_GET_RECT PROC NEAR
; Line 263
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 264
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _button_data$[ebp], eax
; Line 266
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 267
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 269
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	$L507
; Line 270
$L511:
; Line 271
	mov	eax, DWORD PTR _button_data$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+4]
	mov	eax, DWORD PTR _rect$[ebp]
	add	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 272
	mov	eax, DWORD PTR _button_data$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+6]
	mov	eax, DWORD PTR _rect$[ebp]
	add	ecx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax+12], ecx
; Line 273
	jmp	$L508
; Line 275
$L512:
; Line 277
	jmp	$L508
; Line 279
	jmp	$L508
$L507:
	cmp	DWORD PTR -8+[ebp], 6
	je	$L511
	jmp	$L512
$L508:
; Line 280
$L505:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_GET_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_HANDLE_CLICK
_TEXT	SEGMENT
_id$ = 8
_UI_HANDLE_CLICK PROC NEAR
; Line 283
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 284
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -4+[ebp], ecx
	jmp	$L516
; Line 285
$L520:
; Line 286
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+12]
	call	DWORD PTR [eax+16]
	add	esp, 4
; Line 287
	jmp	$L517
; Line 289
$L521:
; Line 290
	jmp	$L517
; Line 292
	jmp	$L517
$L516:
	cmp	DWORD PTR -4+[ebp], 6
	je	$L520
	jmp	$L521
$L517:
; Line 293
$L515:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_UI_HANDLE_CLICK ENDP
_TEXT	ENDS
PUBLIC	_ui_process_widgets
_TEXT	SEGMENT
_i$ = -20
_mouse$ = -28
_rect$ = -16
_ui_process_widgets PROC NEAR
; Line 318
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 322
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 324
	xor	eax, eax
	mov	al, BYTE PTR _mouse$[ebp+4]
	test	eax, eax
	je	$L526
; Line 325
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L527
$L528:
	inc	DWORD PTR _i$[ebp]
$L527:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L529
; Line 326
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	jne	$L530
	jmp	$L528
; Line 328
$L530:
	lea	eax, DWORD PTR _rect$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_GET_RECT
	add	esp, 8
; Line 330
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _rect$[ebp]
	jl	$L531
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _rect$[ebp+4]
	jg	$L531
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	cmp	eax, DWORD PTR _rect$[ebp+8]
	jl	$L531
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	cmp	eax, DWORD PTR _rect$[ebp+12]
	jg	$L531
; Line 331
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_HANDLE_CLICK
	add	esp, 4
; Line 332
	jmp	$L522
; Line 334
$L531:
	jmp	$L528
$L529:
; Line 336
$L526:
$L522:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_process_widgets ENDP
_TEXT	ENDS
END
