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
; Line 26
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 29
	mov	eax, DWORD PTR _starting$[ebp]
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L188
$L189:
	inc	DWORD PTR _i$[ebp]
$L188:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L190
; Line 30
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	jne	$L191
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L186
; Line 31
$L191:
	jmp	$L189
$L190:
; Line 33
	xor	eax, eax
	jmp	$L186
; Line 34
$L186:
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
; Line 36
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 37
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
; Line 38
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
; Line 39
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
; Line 40
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
; Line 41
$L198:
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
; Line 43
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 47
	mov	eax, DWORD PTR _y1$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _i$[ebp], eax
	jmp	$L207
$L208:
	inc	DWORD PTR _i$[ebp]
$L207:
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L209
; Line 49
	jmp	$L208
$L209:
; Line 50
$L205:
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
; Line 52
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 53
	mov	eax, DWORD PTR _text$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	lea	eax, DWORD PTR [ecx*4]
	inc	eax
	mov	DWORD PTR _text_size_y$[ebp], eax
; Line 56
	mov	eax, DWORD PTR _text$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+2]
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [eax+4]
	cmp	ecx, edx
	je	$L220
; Line 57
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
; Line 61
$L220:
	mov	eax, DWORD PTR _id$[ebp]
	cmp	DWORD PTR _current_widget_focus, eax
	jne	$L346
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+6]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	$L347
$L346:
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+5]
	mov	DWORD PTR -8+[ebp], ecx
$L347:
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
; Line 64
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
; Line 65
$L218:
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
; Line 67
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 68
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 69
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _label_data$[ebp], eax
; Line 70
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
; Line 71
$L223:
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
; Line 73
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 74
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 75
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _checkbox_data$[ebp], eax
; Line 76
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	lea	eax, DWORD PTR [ecx*2]
	inc	eax
	mov	DWORD PTR _box_size_x$[ebp], eax
; Line 77
	mov	eax, DWORD PTR _checkbox_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	lea	eax, DWORD PTR [ecx*4]
	inc	eax
	mov	DWORD PTR _box_size_y$[ebp], eax
; Line 80
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
; Line 83
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
; Line 85
	mov	eax, DWORD PTR _ptr$[ebp]
	cmp	DWORD PTR [eax+16], 1
	jne	$L233
; Line 88
$L233:
$L228:
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
; Line 90
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 91
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 92
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _dropdown_data$[ebp], eax
; Line 101
$L236:
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
; Line 103
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 104
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 105
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _radio_data$[ebp], eax
; Line 108
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	lea	eax, DWORD PTR [ecx*2]
	inc	eax
	mov	DWORD PTR _box_size_x$[ebp], eax
; Line 109
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+1]
	lea	eax, DWORD PTR [ecx*4]
	inc	eax
	mov	DWORD PTR _box_size_y$[ebp], eax
; Line 110
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	mov	DWORD PTR _current_y$[ebp], ecx
; Line 112
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L248
$L249:
	inc	DWORD PTR _i$[ebp]
$L248:
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+4]
	cmp	ecx, DWORD PTR _i$[ebp]
	jle	$L250
; Line 114
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
; Line 117
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	cmp	DWORD PTR [eax+16], ecx
	jne	$L251
; Line 118
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
; Line 122
$L251:
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
; Line 124
	mov	eax, DWORD PTR _box_size_y$[ebp]
	inc	eax
	add	DWORD PTR _current_y$[ebp], eax
; Line 125
	jmp	$L249
$L250:
; Line 126
$L241:
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
; Line 128
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 129
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 130
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _textbox_data$[ebp], eax
; Line 136
	mov	eax, DWORD PTR _current_widget_focus
	cmp	DWORD PTR _widget_handle$[ebp], eax
	jne	$L257
; Line 137
	xor	eax, eax
	mov	al, BYTE PTR _cursor
	test	eax, eax
	je	$L258
; Line 140
$L258:
	xor	eax, eax
	mov	al, BYTE PTR _cursor
	test	eax, eax
	jne	$L348
	mov	BYTE PTR _cursor, 1
	jmp	$L349
$L348:
	mov	BYTE PTR _cursor, 0
$L349:
; Line 142
$L257:
$L254:
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
; Line 144
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 145
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 146
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _button_data$[ebp], eax
; Line 148
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
; Line 152
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
; Line 153
$L261:
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
; Line 155
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 156
	push	1
	call	_UI_OPEN_SLOT
	add	esp, 4
	mov	DWORD PTR _handle$[ebp], eax
; Line 158
	cmp	DWORD PTR _handle$[ebp], 0
	jne	$L273
	mov	eax, DWORD PTR _handle$[ebp]
	jmp	$L271
; Line 160
$L273:
	push	20					; 00000014H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	DWORD PTR _widgets[ecx*4], eax
; Line 161
	mov	al, BYTE PTR _widgetType$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	BYTE PTR [ecx], al
; Line 162
	mov	eax, DWORD PTR _widgetID$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	DWORD PTR [ecx+4], eax
; Line 163
	mov	ax, WORD PTR _posX$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	WORD PTR [ecx+8], ax
; Line 164
	mov	ax, WORD PTR _posY$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	WORD PTR [ecx+10], ax
; Line 165
	mov	eax, DWORD PTR _widgetData$[ebp]
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	DWORD PTR [ecx+12], eax
; Line 167
	xor	eax, eax
	mov	al, BYTE PTR _widgetType$[ebp]
	mov	DWORD PTR -8+[ebp], eax
	jmp	$L275
; Line 168
$L279:
; Line 169
	push	80					; 00000050H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _handle$[ebp]
	mov	ecx, DWORD PTR _widgets[ecx*4]
	mov	DWORD PTR [ecx+16], eax
; Line 170
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+16]
	mov	DWORD PTR [eax], 0
; Line 171
	jmp	$L276
; Line 172
$L280:
; Line 173
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR [eax+16], 0
; Line 174
	jmp	$L276
; Line 175
	jmp	$L276
$L275:
	cmp	DWORD PTR -8+[ebp], 5
	je	$L279
	jmp	$L280
$L276:
; Line 177
	mov	eax, DWORD PTR _handle$[ebp]
	jmp	$L271
; Line 178
$L271:
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
; Line 180
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 181
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR _ptr$[ebp], eax
; Line 182
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	DWORD PTR _widgets[eax*4], 0
; Line 184
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	cmp	ecx, 5
	jne	$L284
; Line 185
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_free
	add	esp, 4
; Line 188
$L284:
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 189
$L282:
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
; Line 191
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 194
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L289
$L290:
	inc	DWORD PTR _i$[ebp]
$L289:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L291
; Line 195
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	je	$L292
; Line 196
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	ecx, DWORD PTR _widgetID$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L293
; Line 197
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L287
; Line 199
$L293:
; Line 200
$L292:
	jmp	$L290
$L291:
; Line 202
	xor	eax, eax
	jmp	$L287
; Line 203
$L287:
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
; Line 205
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 206
	mov	eax, DWORD PTR _widget_handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+16]
	jmp	$L295
; Line 207
$L295:
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
; Line 209
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 214
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 215
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
; Line 217
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L299
$L300:
	inc	DWORD PTR _i$[ebp]
$L299:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L301
; Line 218
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	je	$L302
; Line 220
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	$L303
; Line 221
$L307:
; Line 222
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_LABEL
	add	esp, 4
; Line 223
	jmp	$L304
; Line 226
$L308:
; Line 227
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_CHECKBOX
	add	esp, 4
; Line 228
	jmp	$L304
; Line 231
$L309:
; Line 232
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_DROPDOWN
	add	esp, 4
; Line 233
	jmp	$L304
; Line 236
$L310:
; Line 237
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_RADIO
	add	esp, 4
; Line 238
	jmp	$L304
; Line 241
$L311:
; Line 242
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_TEXTBOX
	add	esp, 4
; Line 243
	jmp	$L304
; Line 246
$L312:
; Line 247
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_BUTTON
	add	esp, 4
; Line 248
	jmp	$L304
; Line 251
$L313:
; Line 252
	jmp	$L304
; Line 254
	jmp	$L304
$L303:
	dec	DWORD PTR -16+[ebp]
	cmp	DWORD PTR -16+[ebp], 5
	ja	$L313
	mov	eax, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L350[eax*4]
$L350:
	DD	OFFSET FLAT:$L307
	DD	OFFSET FLAT:$L308
	DD	OFFSET FLAT:$L309
	DD	OFFSET FLAT:$L310
	DD	OFFSET FLAT:$L311
	DD	OFFSET FLAT:$L312
$L304:
; Line 256
$L302:
	jmp	$L300
$L301:
; Line 257
$L296:
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
; Line 261
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 262
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _button_data$[ebp], eax
; Line 264
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 265
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+10]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax+8], ecx
; Line 267
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	$L319
; Line 268
$L323:
; Line 269
	mov	eax, DWORD PTR _button_data$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+4]
	mov	eax, DWORD PTR _rect$[ebp]
	add	ecx, DWORD PTR [eax]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax+4], ecx
; Line 270
	mov	eax, DWORD PTR _button_data$[ebp]
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+6]
	mov	eax, DWORD PTR _rect$[ebp]
	add	ecx, DWORD PTR [eax+8]
	mov	eax, DWORD PTR _rect$[ebp]
	mov	DWORD PTR [eax+12], ecx
; Line 271
	jmp	$L320
; Line 273
$L324:
; Line 275
	jmp	$L320
; Line 277
	jmp	$L320
$L319:
	cmp	DWORD PTR -8+[ebp], 6
	je	$L323
	jmp	$L324
$L320:
; Line 278
$L317:
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
; Line 281
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 282
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -4+[ebp], ecx
	jmp	$L328
; Line 283
$L332:
; Line 284
	mov	eax, DWORD PTR _id$[ebp]
	push	eax
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [eax+12]
	call	DWORD PTR [eax+16]
	add	esp, 4
; Line 285
	jmp	$L329
; Line 287
$L333:
; Line 288
	jmp	$L329
; Line 290
	jmp	$L329
$L328:
	cmp	DWORD PTR -4+[ebp], 6
	je	$L332
	jmp	$L333
$L329:
; Line 291
$L327:
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
; Line 316
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 320
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 322
	xor	eax, eax
	mov	al, BYTE PTR _mouse$[ebp+4]
	test	eax, eax
	je	$L338
; Line 323
	mov	DWORD PTR _i$[ebp], 1
	jmp	$L339
$L340:
	inc	DWORD PTR _i$[ebp]
$L339:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L341
; Line 324
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	jne	$L342
	jmp	$L340
; Line 326
$L342:
	lea	eax, DWORD PTR _rect$[ebp]
	push	eax
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_GET_RECT
	add	esp, 8
; Line 328
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _rect$[ebp]
	jl	$L343
	mov	eax, DWORD PTR _mouse$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _rect$[ebp+4]
	jg	$L343
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	cmp	eax, DWORD PTR _rect$[ebp+8]
	jl	$L343
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[ebp+2]
	cmp	eax, DWORD PTR _rect$[ebp+12]
	jg	$L343
; Line 329
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_HANDLE_CLICK
	add	esp, 4
; Line 330
	jmp	$L334
; Line 332
$L343:
	jmp	$L340
$L341:
; Line 334
$L338:
$L334:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_process_widgets ENDP
_TEXT	ENDS
END
