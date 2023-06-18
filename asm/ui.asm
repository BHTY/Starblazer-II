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
	jmp	$L185
$L186:
	inc	DWORD PTR _i$[ebp]
$L185:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L187
; Line 30
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	jne	$L188
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L183
; Line 31
$L188:
	jmp	$L186
$L187:
; Line 33
	xor	eax, eax
	jmp	$L183
; Line 34
$L183:
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
$L195:
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
	jmp	$L204
$L205:
	inc	DWORD PTR _i$[ebp]
$L204:
	mov	eax, DWORD PTR _y2$[ebp]
	and	eax, 65535				; 0000ffffH
	cmp	eax, DWORD PTR _i$[ebp]
	jle	$L206
; Line 49
	jmp	$L205
$L206:
; Line 50
$L202:
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
	je	$L217
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
$L217:
	mov	eax, DWORD PTR _id$[ebp]
	cmp	DWORD PTR _current_widget_focus, eax
	jne	$L315
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+6]
	mov	DWORD PTR -8+[ebp], ecx
	jmp	$L316
$L315:
	mov	eax, DWORD PTR _ptr$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+5]
	mov	DWORD PTR -8+[ebp], ecx
$L316:
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
$L215:
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
$L220:
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
	jne	$L230
; Line 88
$L230:
$L225:
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
$L233:
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
	jmp	$L245
$L246:
	inc	DWORD PTR _i$[ebp]
$L245:
	mov	eax, DWORD PTR _radio_data$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax+4]
	cmp	ecx, DWORD PTR _i$[ebp]
	jle	$L247
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
	jne	$L248
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
$L248:
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
	jmp	$L246
$L247:
; Line 126
$L238:
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
	jne	$L254
; Line 137
	xor	eax, eax
	mov	al, BYTE PTR _cursor
	test	eax, eax
	je	$L255
; Line 140
$L255:
	xor	eax, eax
	mov	al, BYTE PTR _cursor
	test	eax, eax
	jne	$L317
	mov	BYTE PTR _cursor, 1
	jmp	$L318
$L317:
	mov	BYTE PTR _cursor, 0
$L318:
; Line 142
$L254:
$L251:
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
$L258:
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
	jne	$L270
	mov	eax, DWORD PTR _handle$[ebp]
	jmp	$L268
; Line 160
$L270:
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
	jmp	$L272
; Line 168
$L276:
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
	jmp	$L273
; Line 172
$L277:
; Line 173
	mov	eax, DWORD PTR _handle$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	DWORD PTR [eax+16], 0
; Line 174
	jmp	$L273
; Line 175
	jmp	$L273
$L272:
	cmp	DWORD PTR -8+[ebp], 5
	je	$L276
	jmp	$L277
$L273:
; Line 177
	mov	eax, DWORD PTR _handle$[ebp]
	jmp	$L268
; Line 178
$L268:
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
	jne	$L281
; Line 185
	mov	eax, DWORD PTR _ptr$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_free
	add	esp, 4
; Line 188
$L281:
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_free
	add	esp, 4
; Line 189
$L279:
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
	jmp	$L286
$L287:
	inc	DWORD PTR _i$[ebp]
$L286:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L288
; Line 195
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	je	$L289
; Line 196
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	mov	ecx, DWORD PTR _widgetID$[ebp]
	cmp	DWORD PTR [eax+4], ecx
	jne	$L290
; Line 197
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L284
; Line 199
$L290:
; Line 200
$L289:
	jmp	$L287
$L288:
; Line 202
	xor	eax, eax
	jmp	$L284
; Line 203
$L284:
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
	jmp	$L292
; Line 207
$L292:
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
	jmp	$L296
$L297:
	inc	DWORD PTR _i$[ebp]
$L296:
	cmp	DWORD PTR _i$[ebp], 200			; 000000c8H
	jge	$L298
; Line 218
	mov	eax, DWORD PTR _i$[ebp]
	cmp	DWORD PTR _widgets[eax*4], 0
	je	$L299
; Line 220
	mov	eax, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _widgets[eax*4]
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	DWORD PTR -16+[ebp], ecx
	jmp	$L300
; Line 221
$L304:
; Line 222
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_LABEL
	add	esp, 4
; Line 223
	jmp	$L301
; Line 226
$L305:
; Line 227
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_CHECKBOX
	add	esp, 4
; Line 228
	jmp	$L301
; Line 231
$L306:
; Line 232
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_DROPDOWN
	add	esp, 4
; Line 233
	jmp	$L301
; Line 236
$L307:
; Line 237
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_RADIO
	add	esp, 4
; Line 238
	jmp	$L301
; Line 241
$L308:
; Line 242
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_TEXTBOX
	add	esp, 4
; Line 243
	jmp	$L301
; Line 246
$L309:
; Line 247
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_UI_DRAW_BUTTON
	add	esp, 4
; Line 248
	jmp	$L301
; Line 251
$L310:
; Line 252
	jmp	$L301
; Line 254
	jmp	$L301
$L300:
	dec	DWORD PTR -16+[ebp]
	cmp	DWORD PTR -16+[ebp], 5
	ja	$L310
	mov	eax, DWORD PTR -16+[ebp]
	jmp	DWORD PTR $L319[eax*4]
$L319:
	DD	OFFSET FLAT:$L304
	DD	OFFSET FLAT:$L305
	DD	OFFSET FLAT:$L306
	DD	OFFSET FLAT:$L307
	DD	OFFSET FLAT:$L308
	DD	OFFSET FLAT:$L309
$L301:
; Line 256
$L299:
	jmp	$L297
$L298:
; Line 257
$L293:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_display_widgets ENDP
_TEXT	ENDS
PUBLIC	_ui_process_widgets
_TEXT	SEGMENT
_mouse$ = -8
_ui_process_widgets PROC NEAR
; Line 284
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 286
	lea	eax, DWORD PTR _mouse$[ebp]
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 287
$L311:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_ui_process_widgets ENDP
_TEXT	ENDS
END
