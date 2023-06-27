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
_DATA	ENDS
_BSS	SEGMENT
_current_widget_focus DD 01H DUP (?)
_focused_textbox_ptr DB 01H DUP (?)
	ALIGN	4

_cursor	DB	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
_widget_can_focus DB 00H
	DB	00H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
_DATA	ENDS
PUBLIC	_UI_OPEN_SLOT
_TEXT	SEGMENT
_starting$ = 8
_i$ = -4
_UI_OPEN_SLOT PROC NEAR
; File src\ui.c
; Line 28
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 31
	mov	eax, DWORD PTR _starting$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L385
$L386:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L385:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	SHORT $L387
; Line 32
	mov	edx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[edx*4], 0
	jne	SHORT $L388
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L383
$L388:
; Line 33
	jmp	SHORT $L386
$L387:
; Line 35
	xor	eax, eax
$L383:
; Line 36
	mov	esp, ebp
	pop	ebp
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
; Line 39
	mov	al, BYTE PTR _color$[ebp]
	push	eax
	mov	ecx, DWORD PTR _y1$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	mov	edx, DWORD PTR _x2$[ebp]
	and	edx, 65535				; 0000ffffH
	push	edx
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	ecx, DWORD PTR _x1$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 40
	mov	dl, BYTE PTR _color$[ebp]
	push	edx
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	ecx, DWORD PTR _x2$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	mov	edx, DWORD PTR _y1$[ebp]
	and	edx, 65535				; 0000ffffH
	push	edx
	mov	eax, DWORD PTR _x2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 41
	mov	cl, BYTE PTR _color$[ebp]
	push	ecx
	mov	edx, DWORD PTR _y2$[ebp]
	and	edx, 65535				; 0000ffffH
	push	edx
	mov	eax, DWORD PTR _x1$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	ecx, DWORD PTR _y2$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	mov	edx, DWORD PTR _x2$[ebp]
	and	edx, 65535				; 0000ffffH
	push	edx
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 42
	mov	al, BYTE PTR _color$[ebp]
	push	eax
	mov	ecx, DWORD PTR _y1$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	mov	edx, DWORD PTR _x1$[ebp]
	and	edx, 65535				; 0000ffffH
	push	edx
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	push	eax
	mov	ecx, DWORD PTR _x1$[ebp]
	and	ecx, 65535				; 0000ffffH
	push	ecx
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 43
	pop	ebp
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
	push	ecx
; Line 49
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _i$[ebp], eax
	jmp	SHORT $L404
$L405:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L404:
	mov	edx, DWORD PTR _y2$[ebp]
	and	edx, 65535				; 0000ffffH
	cmp	DWORD PTR _i$[ebp], edx
	jge	SHORT $L406
; Line 51
	jmp	SHORT $L405
$L406:
; Line 52
	mov	esp, ebp
	pop	ebp
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
; Line 55
	mov	eax, DWORD PTR _text$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	lea	edx, DWORD PTR [ecx*4+1]
	mov	DWORD PTR _text_size_y$[ebp], edx
; Line 58
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+4]
	mov	edx, DWORD PTR _text$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+2]
	cmp	ecx, eax
	je	SHORT $L417
; Line 59
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	dl, BYTE PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+2]
	add	eax, edx
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx]
	add	eax, edx
	push	eax
	mov	ax, WORD PTR _y$[ebp]
	push	eax
	mov	cx, WORD PTR _x$[ebp]
	push	ecx
	call	_UI_FILL_RECT
	add	esp, 20					; 00000014H
$L417:
; Line 63
	mov	edx, DWORD PTR _current_widget_focus
	cmp	edx, DWORD PTR _id$[ebp]
	jne	SHORT $L544
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+6]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	SHORT $L545
$L544:
	mov	edx, DWORD PTR _ptr$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+5]
	mov	DWORD PTR -8+[ebp], eax
$L545:
	mov	cl, BYTE PTR -8+[ebp]
	push	ecx
	mov	edx, DWORD PTR _y$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+2]
	add	edx, ecx
	push	edx
	mov	edx, DWORD PTR _x$[ebp]
	and	edx, 65535				; 0000ffffH
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax]
	add	edx, ecx
	push	edx
	mov	dx, WORD PTR _y$[ebp]
	push	edx
	mov	ax, WORD PTR _x$[ebp]
	push	eax
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 66
	mov	ecx, DWORD PTR _text$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	push	edx
	mov	eax, DWORD PTR _text$[ebp]
	mov	cl, BYTE PTR [eax+2]
	push	ecx
	mov	edx, DWORD PTR _text$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	push	eax
	mov	ecx, DWORD PTR _text$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _y$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+2]
	sub	edx, DWORD PTR _text_size_y$[ebp]
	sar	edx, 1
	add	eax, edx
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _px_offset$[ebp]
	and	ecx, 65535				; 0000ffffH
	add	eax, ecx
	push	eax
	mov	edx, DWORD PTR _txt$[ebp]
	push	edx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 67
	mov	esp, ebp
	pop	ebp
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
; Line 70
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 71
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _label_data$[ebp], eax
; Line 72
	mov	ecx, DWORD PTR _label_data$[ebp]
	mov	dl, BYTE PTR [ecx+3]
	push	edx
	mov	eax, DWORD PTR _label_data$[ebp]
	mov	cl, BYTE PTR [eax+2]
	push	ecx
	mov	edx, DWORD PTR _label_data$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	push	eax
	mov	ecx, DWORD PTR _label_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	push	ecx
	mov	edx, DWORD PTR _ptr$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _label_data$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 73
	mov	esp, ebp
	pop	ebp
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
; Line 76
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 77
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _checkbox_data$[ebp], eax
; Line 78
	mov	ecx, DWORD PTR _checkbox_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	lea	eax, DWORD PTR [edx+edx+1]
	mov	DWORD PTR _box_size_x$[ebp], eax
; Line 79
	mov	ecx, DWORD PTR _checkbox_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	lea	eax, DWORD PTR [edx*4+1]
	mov	DWORD PTR _box_size_y$[ebp], eax
; Line 82
	mov	ecx, DWORD PTR _checkbox_data$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	add	ecx, DWORD PTR _box_size_y$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ptr$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx+8]
	add	eax, DWORD PTR _box_size_x$[ebp]
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	dx, WORD PTR [ecx+10]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	cx, WORD PTR [eax+8]
	push	ecx
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 85
	mov	edx, DWORD PTR _checkbox_data$[ebp]
	mov	al, BYTE PTR [edx+3]
	push	eax
	mov	ecx, DWORD PTR _checkbox_data$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	push	edx
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	push	ecx
	mov	edx, DWORD PTR _checkbox_data$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+10]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	add	ecx, DWORD PTR _box_size_x$[ebp]
	mov	edx, DWORD PTR _checkbox_data$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+3]
	add	ecx, eax
	push	ecx
	mov	ecx, DWORD PTR _checkbox_data$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 90
	mov	esp, ebp
	pop	ebp
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
; Line 93
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 94
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _dropdown_data$[ebp], eax
; Line 103
	mov	esp, ebp
	pop	ebp
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
; Line 106
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 107
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _radio_data$[ebp], eax
; Line 110
	mov	ecx, DWORD PTR _radio_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	lea	eax, DWORD PTR [edx+edx+1]
	mov	DWORD PTR _box_size_x$[ebp], eax
; Line 111
	mov	ecx, DWORD PTR _radio_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	lea	eax, DWORD PTR [edx*4+1]
	mov	DWORD PTR _box_size_y$[ebp], eax
; Line 112
	mov	ecx, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+10]
	mov	DWORD PTR _current_y$[ebp], edx
; Line 114
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L445
$L446:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L445:
	mov	ecx, DWORD PTR _radio_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+4]
	cmp	DWORD PTR _i$[ebp], edx
	jge	$L447
; Line 116
	mov	eax, DWORD PTR _radio_data$[ebp]
	mov	cl, BYTE PTR [eax+2]
	push	ecx
	mov	edx, DWORD PTR _current_y$[ebp]
	add	edx, DWORD PTR _box_size_y$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	add	ecx, DWORD PTR _box_size_x$[ebp]
	push	ecx
	mov	dx, WORD PTR _current_y$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	cx, WORD PTR [eax+8]
	push	ecx
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 119
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+16]
	cmp	eax, DWORD PTR _i$[ebp]
	jne	SHORT $L448
; Line 120
	mov	ecx, DWORD PTR _radio_data$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	push	edx
	mov	eax, DWORD PTR _current_y$[ebp]
	add	eax, DWORD PTR _box_size_y$[ebp]
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+8]
	add	edx, DWORD PTR _box_size_x$[ebp]
	sar	edx, 1
	push	edx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L448:
; Line 124
	mov	eax, DWORD PTR _radio_data$[ebp]
	mov	cl, BYTE PTR [eax+3]
	push	ecx
	mov	edx, DWORD PTR _radio_data$[ebp]
	mov	al, BYTE PTR [edx+2]
	push	eax
	mov	ecx, DWORD PTR _radio_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx+1]
	push	edx
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _current_y$[ebp]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	add	ecx, DWORD PTR _box_size_x$[ebp]
	mov	edx, DWORD PTR _radio_data$[ebp]
	xor	eax, eax
	mov	al, BYTE PTR [edx+3]
	add	ecx, eax
	push	ecx
	mov	ecx, DWORD PTR _radio_data$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR [edx+eax*4]
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 126
	mov	edx, DWORD PTR _box_size_y$[ebp]
	mov	eax, DWORD PTR _current_y$[ebp]
	lea	ecx, DWORD PTR [eax+edx+1]
	mov	DWORD PTR _current_y$[ebp], ecx
; Line 127
	jmp	$L446
$L447:
; Line 128
	mov	esp, ebp
	pop	ebp
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
; Line 131
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 132
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _textbox_data$[ebp], eax
; Line 138
	mov	ecx, DWORD PTR _current_widget_focus
	cmp	ecx, DWORD PTR _widget_handle$[ebp]
	jne	SHORT $L454
; Line 142
	xor	eax, eax
	mov	al, BYTE PTR _cursor
	neg	eax
	sbb	eax, eax
	inc	eax
	mov	BYTE PTR _cursor, al
$L454:
; Line 144
	mov	esp, ebp
	pop	ebp
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
; Line 147
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 148
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _button_data$[ebp], eax
; Line 150
	mov	ecx, DWORD PTR _button_data$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	push	edx
	call	_strlen
	add	esp, 4
	mov	ecx, DWORD PTR _button_data$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	mov	ecx, DWORD PTR _button_data$[ebp]
	xor	ebx, ebx
	mov	bl, BYTE PTR [ecx+3]
	lea	edx, DWORD PTR [ebx+edx*2+2]
	imul	eax, edx
	add	eax, 6
	mov	DWORD PTR _text_size_x$[ebp], eax
; Line 154
	mov	eax, DWORD PTR _button_data$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	mov	edx, DWORD PTR _button_data$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx+4]
	sub	eax, DWORD PTR _text_size_x$[ebp]
	sar	eax, 1
	push	eax
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	dx, WORD PTR [ecx+10]
	push	edx
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	cx, WORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _button_data$[ebp]
	push	edx
	mov	eax, DWORD PTR _button_data$[ebp]
	add	eax, 4
	push	eax
	mov	ecx, DWORD PTR _widget_handle$[ebp]
	push	ecx
	call	_UI_DRAW_BOX
	add	esp, 28					; 0000001cH
; Line 155
	pop	ebx
	mov	esp, ebp
	pop	ebp
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
; Line 158
	push	1
	call	_UI_OPEN_SLOT
	add	esp, 4
	mov	DWORD PTR _handle$[ebp], eax
; Line 160
	cmp	DWORD PTR _handle$[ebp], 0
	jne	SHORT $L469
	mov	eax, DWORD PTR _handle$[ebp]
	jmp	$L467
$L469:
; Line 162
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	DWORD PTR _widgets[ecx*4], eax
; Line 163
	mov	edx, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[edx*4]
	mov	cl, BYTE PTR _widgetType$[ebp]
	mov	BYTE PTR [eax], cl
; Line 164
	mov	edx, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[edx*4]
	mov	ecx, DWORD PTR _widgetID$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 165
	mov	edx, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[edx*4]
	mov	cx, WORD PTR _posX$[ebp]
	mov	WORD PTR [eax+8], cx
; Line 166
	mov	edx, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[edx*4]
	mov	cx, WORD PTR _posY$[ebp]
	mov	WORD PTR [eax+10], cx
; Line 167
	mov	edx, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[edx*4]
	mov	ecx, DWORD PTR _widgetData$[ebp]
	mov	DWORD PTR [eax+12], ecx
; Line 169
	mov	dl, BYTE PTR _widgetType$[ebp]
	mov	BYTE PTR -8+[ebp], dl
	cmp	BYTE PTR -8+[ebp], 5
	je	SHORT $L474
	jmp	SHORT $L475
$L474:
; Line 171
	push	80					; 00000050H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	edx, DWORD PTR _widgets[ecx*4]
	mov	DWORD PTR [edx+16], eax
; Line 172
	mov	eax, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	edx, DWORD PTR [ecx+16]
	mov	DWORD PTR [edx], 0
; Line 173
	jmp	SHORT $L471
$L475:
; Line 175
	mov	eax, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR [ecx+16], 0
$L471:
; Line 179
	mov	eax, DWORD PTR _handle$[ebp]
$L467:
; Line 180
	mov	esp, ebp
	pop	ebp
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
	push	ecx
; Line 183
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], ecx
; Line 184
	mov	edx, DWORD PTR _widget_handle$[ebp]
	mov	DWORD PTR _widgets[edx*4], 0
; Line 186
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	cmp	ecx, 5
	jne	SHORT $L479
; Line 187
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [edx+16]
	push	eax
	call	_free
	add	esp, 4
$L479:
; Line 190
	mov	ecx, DWORD PTR _ptr$[ebp]
	push	ecx
	call	_free
	add	esp, 4
; Line 191
	mov	esp, ebp
	pop	ebp
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
	push	ecx
; Line 196
	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L483
$L484:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L483:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	SHORT $L485
; Line 197
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[ecx*4], 0
	je	SHORT $L487
; Line 198
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _widgets[edx*4]
	mov	ecx, DWORD PTR [eax+4]
	cmp	ecx, DWORD PTR _widgetID$[ebp]
	jne	SHORT $L487
; Line 199
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L481
$L487:
; Line 202
	jmp	SHORT $L484
$L485:
; Line 204
	xor	eax, eax
$L481:
; Line 205
	mov	esp, ebp
	pop	ebp
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
; Line 208
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [ecx+16]
; Line 209
	pop	ebp
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
; Line 216
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 217
	push	255					; 000000ffH
	mov	ecx, DWORD PTR _mouse$[ebp+2]
	and	ecx, 65535				; 0000ffffH
	add	ecx, 5
	push	ecx
	mov	edx, DWORD PTR _mouse$[ebp]
	and	edx, 65535				; 0000ffffH
	add	edx, 5
	push	edx
	mov	eax, DWORD PTR _mouse$[ebp+2]
	and	eax, 65535				; 0000ffffH
	sub	eax, 5
	push	eax
	mov	ecx, DWORD PTR _mouse$[ebp]
	and	ecx, 65535				; 0000ffffH
	sub	ecx, 5
	push	ecx
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 219
	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L493
$L494:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L493:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L495
; Line 220
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	je	SHORT $L498
; Line 222
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _widgets[ecx*4]
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	mov	DWORD PTR -16+[ebp], eax
	mov	ecx, DWORD PTR -16+[ebp]
	sub	ecx, 1
	mov	DWORD PTR -16+[ebp], ecx
	cmp	DWORD PTR -16+[ebp], 5
	ja	SHORT $L507
	mov	edx, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L557[edx*4]
$L501:
; Line 224
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_LABEL
	add	esp, 4
; Line 225
	jmp	SHORT $L498
$L502:
; Line 229
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	call	_UI_DRAW_CHECKBOX
	add	esp, 4
; Line 230
	jmp	SHORT $L498
$L503:
; Line 234
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	call	_UI_DRAW_DROPDOWN
	add	esp, 4
; Line 235
	jmp	SHORT $L498
$L504:
; Line 239
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_RADIO
	add	esp, 4
; Line 240
	jmp	SHORT $L498
$L505:
; Line 244
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	call	_UI_DRAW_TEXTBOX
	add	esp, 4
; Line 245
	jmp	SHORT $L498
$L506:
; Line 249
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	call	_UI_DRAW_BUTTON
	add	esp, 4
$L507:
$L498:
; Line 258
	jmp	$L494
$L495:
; Line 259
	mov	esp, ebp
	pop	ebp
	ret	0
$L557:
	DD	$L501
	DD	$L502
	DD	$L503
	DD	$L504
	DD	$L505
	DD	$L506
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
; Line 264
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _button_data$[ebp], edx
; Line 266
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+8]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax], edx
; Line 267
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _widgets[ecx*4]
	xor	eax, eax
	mov	ax, WORD PTR [edx+10]
	mov	ecx, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 269
	mov	edx, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[edx*4]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR -8+[ebp], cl
	cmp	BYTE PTR -8+[ebp], 6
	je	SHORT $L517
	jmp	SHORT $L518
$L517:
; Line 271
	mov	edx, DWORD PTR _button_data$[ebp]
	xor	eax, eax
	mov	ax, WORD PTR [edx+4]
	mov	ecx, DWORD PTR _rect$[ebp]
	mov	edx, DWORD PTR [ecx]
	add	edx, eax
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax+4], edx
; Line 272
	mov	ecx, DWORD PTR _button_data$[ebp]
	xor	edx, edx
	mov	dx, WORD PTR [ecx+6]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	add	ecx, edx
	mov	edx, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [edx+12], ecx
$L518:
; Line 280
	mov	esp, ebp
	pop	ebp
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
	push	ecx
; Line 284
	mov	eax, DWORD PTR _id$[ebp]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR -4+[ebp], dl
	cmp	BYTE PTR -4+[ebp], 6
	je	SHORT $L526
	jmp	SHORT $L527
$L526:
; Line 286
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _widgets[ecx*4]
	mov	eax, DWORD PTR [edx+12]
	call	DWORD PTR [eax+16]
	add	esp, 4
$L527:
; Line 293
	mov	esp, ebp
	pop	ebp
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
; Line 322
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 324
	mov	ecx, DWORD PTR _mouse$[ebp+4]
	and	ecx, 255				; 000000ffH
	test	ecx, ecx
	je	$L535
; Line 325
	mov	DWORD PTR _i$[ebp], 1
	jmp	SHORT $L533
$L534:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L533:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	SHORT $L535
; Line 326
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	jne	SHORT $L536
	jmp	SHORT $L534
$L536:
; Line 328
	lea	ecx, DWORD PTR _rect$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	push	edx
	call	_UI_GET_RECT
	add	esp, 8
; Line 330
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _rect$[ebp]
	jl	SHORT $L537
	mov	ecx, DWORD PTR _mouse$[ebp]
	and	ecx, 65535				; 0000ffffH
	cmp	ecx, DWORD PTR _rect$[ebp+4]
	jg	SHORT $L537
	mov	edx, DWORD PTR _mouse$[ebp+2]
	and	edx, 65535				; 0000ffffH
	cmp	edx, DWORD PTR _rect$[ebp+8]
	jl	SHORT $L537
	mov	eax, DWORD PTR _mouse$[ebp+2]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _rect$[ebp+12]
	jg	SHORT $L537
; Line 331
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	call	_UI_HANDLE_CLICK
	add	esp, 4
; Line 332
	jmp	SHORT $L535
$L537:
; Line 334
	jmp	SHORT $L534
$L535:
; Line 336
	mov	esp, ebp
	pop	ebp
	ret	0
_ui_process_widgets ENDP
_TEXT	ENDS
END
