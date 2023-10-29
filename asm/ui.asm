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
;	COMDAT _UI_OPEN_SLOT
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_RECT
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_FILL_RECT
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_BOX
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_LABEL
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_CHECKBOX
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_DROPDOWN
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_RADIO
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_TEXTBOX
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_DRAW_BUTTON
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _ui_create_widget
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _ui_destroy_widget
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _ui_get_handle_by_id
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _ui_get_state
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _ui_display_widgets
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_GET_RECT
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _UI_HANDLE_CLICK
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _ui_process_widgets
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
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
;	COMDAT _UI_OPEN_SLOT
_TEXT	SEGMENT
; File src\ui.c
_starting$ = 8
_UI_OPEN_SLOT PROC NEAR					; COMDAT
; Line 31
	mov	eax, DWORD PTR _starting$[esp-4]
	cmp	eax, 200				; 000000c8H
	jge	SHORT $L489
	lea	ecx, DWORD PTR _widgets[eax*4]
$L487:
; Line 32
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L484
	add	ecx, 4
	inc	eax
; Line 31
	cmp	ecx, OFFSET FLAT:_widgets+800
	jb	SHORT $L487
$L489:
; Line 35
	xor	eax, eax
; Line 36
$L484:
	ret	0
_UI_OPEN_SLOT ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_RECT
EXTRN	_draw_line:NEAR
;	COMDAT _UI_DRAW_RECT
_TEXT	SEGMENT
_x1$ = 8
_y1$ = 12
_x2$ = 16
_y2$ = 20
_color$ = 24
_UI_DRAW_RECT PROC NEAR					; COMDAT
; Line 38
	push	ebx
	push	esi
	mov	ebx, DWORD PTR _x2$[esp+4]
	push	edi
	push	ebp
	and	ebx, 65535				; 0000ffffH
	mov	ebp, DWORD PTR _y1$[esp+12]
	mov	edi, DWORD PTR _x1$[esp+12]
	and	ebp, 65535				; 0000ffffH
	and	edi, 65535				; 0000ffffH
; Line 39
	mov	al, BYTE PTR _color$[esp+12]
	push	eax
	push	ebp
	push	ebx
	push	ebp
	push	edi
	call	_draw_line
	mov	esi, DWORD PTR _y2$[esp+32]
	mov	al, BYTE PTR _color$[esp+32]
	add	esp, 20					; 00000014H
	and	esi, 65535				; 0000ffffH
; Line 40
	push	eax
	push	esi
	push	ebx
	push	ebp
	push	ebx
	call	_draw_line
	mov	al, BYTE PTR _color$[esp+32]
	add	esp, 20					; 00000014H
; Line 41
	push	eax
	push	esi
	push	edi
	push	esi
	push	ebx
	call	_draw_line
	mov	al, BYTE PTR _color$[esp+32]
	add	esp, 20					; 00000014H
; Line 42
	push	eax
	push	ebp
	push	edi
	push	esi
	push	edi
	call	_draw_line
	add	esp, 20					; 00000014H
; Line 43
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_UI_DRAW_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_FILL_RECT
;	COMDAT _UI_FILL_RECT
_TEXT	SEGMENT
_UI_FILL_RECT PROC NEAR					; COMDAT
; Line 52
	ret	0
_UI_FILL_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_BOX
EXTRN	_vputs:NEAR
;	COMDAT _UI_DRAW_BOX
_TEXT	SEGMENT
_x$ = 20
_y$ = 24
_px_offset$ = 28
_txt$ = 32
_text_size_y$ = -4
_id$ = 8
_ptr$ = 12
_text$ = 16
_UI_DRAW_BOX PROC NEAR					; COMDAT
; Line 54
	sub	esp, 4
	xor	eax, eax
	push	ebx
	push	esi
	mov	ebx, DWORD PTR _ptr$[esp+8]
	push	edi
	push	ebp
	mov	ebp, DWORD PTR _text$[esp+16]
; Line 55
	mov	al, BYTE PTR [ebp+1]
	lea	ecx, DWORD PTR [eax*4+1]
	mov	al, BYTE PTR [ebx+4]
	mov	DWORD PTR _text_size_y$[esp+20], ecx
	cmp	BYTE PTR [ebp+2], al
; Line 58
	je	SHORT $L674
; Line 59
	mov	di, WORD PTR _y$[esp+16]
	push	eax
	mov	ax, WORD PTR [ebx+2]
	add	ax, di
	mov	si, WORD PTR _x$[esp+20]
	push	eax
	mov	ax, WORD PTR [ebx]
	add	ax, si
	push	eax
	push	edi
	push	esi
	call	_UI_FILL_RECT
	add	esp, 20					; 00000014H
	jmp	SHORT $L519
$L674:
	mov	si, WORD PTR _x$[esp+16]
	mov	di, WORD PTR _y$[esp+16]
; Line 63
$L519:
	mov	eax, DWORD PTR _id$[esp+16]
	cmp	eax, DWORD PTR _current_widget_focus
	jne	SHORT $L672
	xor	eax, eax
	mov	al, BYTE PTR [ebx+6]
	jmp	SHORT $L673
$L672:
	xor	eax, eax
	mov	al, BYTE PTR [ebx+5]
$L673:
	push	eax
	mov	ax, WORD PTR [ebx+2]
	add	ax, di
	push	eax
	mov	ax, WORD PTR [ebx]
	add	ax, si
	push	eax
	push	edi
	push	esi
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
	mov	cl, BYTE PTR [ebp+3]
; Line 66
	mov	dl, BYTE PTR [ebp+2]
	xor	eax, eax
	push	ecx
	mov	al, BYTE PTR [ebp+1]
	push	edx
	xor	ecx, ecx
	push	eax
	mov	cl, BYTE PTR [ebp]
	push	ecx
	mov	eax, edi
	xor	ecx, ecx
	and	eax, 65535				; 0000ffffH
	mov	cx, WORD PTR [ebx+2]
	sub	ecx, DWORD PTR _text_size_y$[esp+36]
	sar	ecx, 1
	add	ecx, eax
	mov	eax, esi
	push	ecx
	and	eax, 65535				; 0000ffffH
	mov	ecx, DWORD PTR _px_offset$[esp+36]
	mov	edx, DWORD PTR _txt$[esp+36]
	and	ecx, 65535				; 0000ffffH
	add	ecx, eax
	push	ecx
	push	edx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 67
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 4
	ret	0
_UI_DRAW_BOX ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_LABEL
;	COMDAT _UI_DRAW_LABEL
_TEXT	SEGMENT
_widget_handle$ = 8
_UI_DRAW_LABEL PROC NEAR				; COMDAT
; Line 70
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	mov	edx, DWORD PTR _widgets[eax*4]
; Line 71
	mov	ecx, DWORD PTR [edx+12]
; Line 72
	mov	al, BYTE PTR [ecx+3]
	push	eax
	mov	al, BYTE PTR [ecx+2]
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR [ecx+1]
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR [ecx]
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR [edx+10]
	mov	ecx, DWORD PTR [ecx+4]
	mov	dx, WORD PTR [edx+8]
	push	eax
	and	edx, 65535				; 0000ffffH
	push	edx
	push	ecx
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 73
	ret	0
_UI_DRAW_LABEL ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_CHECKBOX
;	COMDAT _UI_DRAW_CHECKBOX
_TEXT	SEGMENT
_widget_handle$ = 8
_UI_DRAW_CHECKBOX PROC NEAR				; COMDAT
; Line 75
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	push	ebx
	push	esi
	push	edi
	push	ebp
	mov	esi, DWORD PTR _widgets[eax*4]
; Line 77
	mov	cx, WORD PTR [esi+10]
	xor	eax, eax
	mov	dx, WORD PTR [esi+8]
	mov	edi, DWORD PTR [esi+12]
; Line 78
	movzx	ebp, BYTE PTR [edi+1]
	mov	al, BYTE PTR [edi]
	lea	ebp, DWORD PTR [ecx+ebp*4+1]
	lea	ebx, DWORD PTR [eax*2+1]
; Line 82
	mov	al, BYTE PTR [edi+2]
	push	eax
	push	ebp
	mov	ax, dx
	add	ax, bx
	push	eax
	push	ecx
	push	edx
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
	mov	al, BYTE PTR [edi+3]
; Line 85
	mov	cl, BYTE PTR [edi+2]
	xor	edx, edx
	push	eax
	mov	dl, BYTE PTR [edi+1]
	movzx	ebp, BYTE PTR [edi]
	push	ecx
	push	edx
	push	ebp
	xor	ecx, ecx
	mov	cx, WORD PTR [esi+10]
	push	ecx
	xor	ecx, ecx
	mov	cl, al
	xor	eax, eax
	mov	ax, WORD PTR [esi+8]
	add	ecx, eax
	mov	eax, DWORD PTR [edi+4]
	add	ecx, ebx
	push	ecx
	push	eax
	call	_vputs
	add	esp, 28					; 0000001cH
; Line 90
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_UI_DRAW_CHECKBOX ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_DROPDOWN
;	COMDAT _UI_DRAW_DROPDOWN
_TEXT	SEGMENT
_UI_DRAW_DROPDOWN PROC NEAR				; COMDAT
; Line 103
	ret	0
_UI_DRAW_DROPDOWN ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_RADIO
EXTRN	_plot_pixel:NEAR
;	COMDAT _UI_DRAW_RADIO
_TEXT	SEGMENT
_widget_handle$ = 8
_box_size_x$ = -4
_box_size_y$ = -8
_UI_DRAW_RADIO PROC NEAR				; COMDAT
; Line 105
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
	push	ebp
; Line 106
	mov	edi, DWORD PTR _widgets[eax*4]
	xor	edx, edx
; Line 107
	xor	eax, eax
	mov	ebx, DWORD PTR [edi+12]
; Line 110
	xor	esi, esi
	mov	al, BYTE PTR [ebx]
	mov	si, WORD PTR [edi+10]
	mov	dl, BYTE PTR [ebx+1]
	lea	ecx, DWORD PTR [eax*2+1]
	xor	ebp, ebp
	lea	eax, DWORD PTR [edx*4+1]
	mov	DWORD PTR _box_size_x$[esp+24], ecx
; Line 111
	cmp	BYTE PTR [ebx+4], 0
	mov	DWORD PTR _box_size_y$[esp+24], eax
; Line 114
	jbe	$L540
$L547:
	mov	cx, WORD PTR [edi+8]
	mov	al, BYTE PTR [ebx+2]
; Line 116
	push	eax
	mov	ax, WORD PTR _box_size_y$[esp+28]
	add	ax, si
	push	eax
	mov	ax, WORD PTR _box_size_x$[esp+32]
	add	ax, cx
	push	eax
	push	esi
	push	ecx
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 119
	cmp	DWORD PTR [edi+16], ebp
	jne	SHORT $L550
; Line 120
	mov	al, BYTE PTR [ebx+2]
	push	eax
	mov	eax, DWORD PTR _box_size_y$[esp+28]
	add	eax, esi
	sar	eax, 1
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR [edi+8]
	add	eax, DWORD PTR _box_size_x$[esp+32]
	sar	eax, 1
	push	eax
	call	_plot_pixel
	add	esp, 12					; 0000000cH
; Line 124
$L550:
	mov	al, BYTE PTR [ebx+3]
	mov	cl, BYTE PTR [ebx+2]
	push	eax
	xor	edx, edx
	push	ecx
	mov	dl, BYTE PTR [ebx+1]
	push	edx
	xor	ecx, ecx
	mov	cl, BYTE PTR [ebx]
	and	eax, 255				; 000000ffH
	push	ecx
	xor	edx, edx
	mov	dx, WORD PTR [edi+8]
	push	esi
	add	eax, edx
	mov	ecx, DWORD PTR [ebx+8]
	add	eax, DWORD PTR _box_size_x$[esp+44]
	inc	ebp
	push	eax
	mov	edx, DWORD PTR [ecx+ebp*4-4]
	push	edx
	call	_vputs
	mov	ecx, DWORD PTR _box_size_y$[esp+52]
	add	esp, 28					; 0000001cH
; Line 126
	xor	eax, eax
	lea	esi, DWORD PTR [ecx+esi+1]
; Line 114
	mov	al, BYTE PTR [ebx+4]
	cmp	eax, ebp
	jg	$L547
; Line 128
$L540:
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 8
	ret	0
_UI_DRAW_RADIO ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_TEXTBOX
;	COMDAT _UI_DRAW_TEXTBOX
_TEXT	SEGMENT
_widget_handle$ = 8
_UI_DRAW_TEXTBOX PROC NEAR				; COMDAT
; Line 138
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	cmp	eax, DWORD PTR _current_widget_focus
	jne	SHORT $L553
; Line 142
	cmp	BYTE PTR _cursor, 1
	sbb	al, al
	neg	al
	mov	BYTE PTR _cursor, al
; Line 144
$L553:
	ret	0
_UI_DRAW_TEXTBOX ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_BUTTON
;	COMDAT _UI_DRAW_BUTTON
_TEXT	SEGMENT
_widget_handle$ = 8
_UI_DRAW_BUTTON PROC NEAR				; COMDAT
; Line 146
	mov	edx, DWORD PTR _widget_handle$[esp-4]
	push	ebx
	push	esi
	xor	eax, eax
	push	edi
	mov	ebx, DWORD PTR _widgets[edx*4]
	push	ebp
	mov	ecx, -1
; Line 148
	mov	esi, DWORD PTR [ebx+12]
; Line 150
	mov	al, BYTE PTR [esi+3]
	mov	edi, DWORD PTR [esi+12]
	movzx	ebp, BYTE PTR [esi]
	lea	ebp, DWORD PTR [eax+ebp*2+2]
	sub	eax, eax
	repnz	scasb
	not	ecx
	dec	ecx
	mov	eax, DWORD PTR [esi+12]
	imul	ebp, ecx
	add	ebp, 6
	lea	ecx, DWORD PTR [esi+4]
; Line 154
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR [ecx]
	sub	eax, ebp
	sar	eax, 1
	mov	bp, WORD PTR [ebx+10]
	push	eax
	mov	bx, WORD PTR [ebx+8]
	push	ebp
	push	ebx
	push	esi
	push	ecx
	push	edx
	call	_UI_DRAW_BOX
	add	esp, 28					; 0000001cH
; Line 155
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_UI_DRAW_BUTTON ENDP
_TEXT	ENDS
PUBLIC	_ui_create_widget
EXTRN	_malloc:NEAR
;	COMDAT _ui_create_widget
_TEXT	SEGMENT
_widgetType$ = 8
_widgetID$ = 12
_posX$ = 16
_posY$ = 20
_widgetData$ = 24
_ui_create_widget PROC NEAR				; COMDAT
; Line 157
	push	esi
	push	edi
; Line 158
	push	1
	call	_UI_OPEN_SLOT
	add	esp, 4
	mov	esi, eax
; Line 160
	test	esi, esi
	jne	SHORT $L571
	mov	eax, esi
	pop	edi
	pop	esi
	ret	0
; Line 162
$L571:
	lea	edi, DWORD PTR _widgets[esi*4]
	push	20					; 00000014H
	call	_malloc
	mov	cl, BYTE PTR _widgetType$[esp+8]
	add	esp, 4
	mov	DWORD PTR [edi], eax
; Line 163
	mov	BYTE PTR [eax], cl
; Line 164
	mov	eax, DWORD PTR _widgetID$[esp+4]
	mov	edx, DWORD PTR [edi]
	mov	DWORD PTR [edx+4], eax
; Line 165
	mov	edx, DWORD PTR [edi]
	mov	ax, WORD PTR _posX$[esp+4]
	mov	WORD PTR [edx+8], ax
; Line 166
	mov	edx, DWORD PTR [edi]
	mov	ax, WORD PTR _posY$[esp+4]
	and	ecx, 255				; 000000ffH
	mov	WORD PTR [edx+10], ax
	cmp	ecx, 5
; Line 167
	mov	edx, DWORD PTR [edi]
	mov	eax, DWORD PTR _widgetData$[esp+4]
	mov	DWORD PTR [edx+12], eax
; Line 169
	je	SHORT $L576
; Line 175
	mov	eax, DWORD PTR [edi]
	pop	edi
	mov	DWORD PTR [eax+16], 0
; Line 179
	mov	eax, esi
; Line 180
	pop	esi
	ret	0
; Line 170
$L576:
; Line 171
	push	80					; 00000050H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR [edi]
	mov	DWORD PTR [ecx+16], eax
; Line 172
	mov	ecx, DWORD PTR [edi]
	pop	edi
	mov	eax, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax], 0
; Line 179
	mov	eax, esi
; Line 180
	pop	esi
	ret	0
_ui_create_widget ENDP
_TEXT	ENDS
PUBLIC	_ui_destroy_widget
EXTRN	_free:NEAR
;	COMDAT _ui_destroy_widget
_TEXT	SEGMENT
_widget_handle$ = 8
_ui_destroy_widget PROC NEAR				; COMDAT
; Line 182
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	push	esi
	lea	eax, DWORD PTR _widgets[eax*4]
; Line 183
	mov	esi, DWORD PTR [eax]
; Line 184
	mov	DWORD PTR [eax], 0
; Line 186
	cmp	BYTE PTR [esi], 5
	jne	SHORT $L581
; Line 187
	mov	eax, DWORD PTR [esi+16]
	push	eax
	call	_free
	add	esp, 4
; Line 190
$L581:
	push	esi
	call	_free
	add	esp, 4
; Line 191
	pop	esi
	ret	0
_ui_destroy_widget ENDP
_TEXT	ENDS
PUBLIC	_ui_get_handle_by_id
;	COMDAT _ui_get_handle_by_id
_TEXT	SEGMENT
_widgetID$ = 8
_ui_get_handle_by_id PROC NEAR				; COMDAT
; Line 193
	push	esi
	mov	eax, 1
; Line 196
	mov	esi, OFFSET FLAT:_widgets+4
	mov	ecx, DWORD PTR _widgetID$[esp]
$L585:
	mov	edx, DWORD PTR [esi]
; Line 197
	test	edx, edx
	je	SHORT $L586
; Line 198
	cmp	DWORD PTR [edx+4], ecx
	je	SHORT $L583
; Line 196
$L586:
	add	esi, 4
	inc	eax
	cmp	esi, OFFSET FLAT:_widgets+800
	jb	SHORT $L585
; Line 204
	xor	eax, eax
; Line 205
$L583:
	pop	esi
	ret	0
_ui_get_handle_by_id ENDP
_TEXT	ENDS
PUBLIC	_ui_get_state
;	COMDAT _ui_get_state
_TEXT	SEGMENT
_widget_handle$ = 8
_ui_get_state PROC NEAR					; COMDAT
; Line 208
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	mov	ecx, DWORD PTR _widgets[eax*4]
	mov	eax, DWORD PTR [ecx+16]
; Line 209
	ret	0
_ui_get_state ENDP
_TEXT	ENDS
PUBLIC	_ui_display_widgets
EXTRN	_SG_ReadMouse:NEAR
;	COMDAT _ui_display_widgets
_TEXT	SEGMENT
_mouse$ = -8
_ui_display_widgets PROC NEAR				; COMDAT
; Line 211
	sub	esp, 8
	lea	eax, DWORD PTR _mouse$[esp+8]
	push	esi
; Line 216
	push	eax
	call	_SG_ReadMouse
	mov	ax, WORD PTR _mouse$[esp+18]
	add	esp, 4
; Line 217
	add	ax, 5
	push	255					; 000000ffH
	push	eax
	mov	ax, WORD PTR _mouse$[esp+20]
	add	ax, 5
	push	eax
	mov	ax, WORD PTR _mouse$[esp+26]
	sub	ax, 5
	mov	esi, 1
	push	eax
	mov	ax, WORD PTR _mouse$[esp+28]
	sub	ax, 5
	push	eax
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
; Line 219
$L595:
	mov	eax, DWORD PTR _widgets[esi*4]
; Line 220
	test	eax, eax
	je	SHORT $L596
; Line 222
	mov	al, BYTE PTR [eax]
	and	eax, 255				; 000000ffH
	dec	eax
	cmp	eax, 5
	ja	SHORT $L596
	jmp	DWORD PTR $L704[eax*4]
; Line 223
$L603:
; Line 224
	push	esi
	call	_UI_DRAW_LABEL
	jmp	SHORT $L709
; Line 228
$L604:
; Line 229
	push	esi
	call	_UI_DRAW_CHECKBOX
	jmp	SHORT $L709
; Line 233
$L605:
; Line 234
	push	esi
	call	_UI_DRAW_DROPDOWN
	jmp	SHORT $L709
; Line 238
$L606:
; Line 239
	push	esi
	call	_UI_DRAW_RADIO
	jmp	SHORT $L709
; Line 243
$L607:
; Line 244
	push	esi
	call	_UI_DRAW_TEXTBOX
	jmp	SHORT $L709
; Line 248
$L608:
; Line 249
	push	esi
	call	_UI_DRAW_BUTTON
$L709:
	add	esp, 4
; Line 219
$L596:
	inc	esi
	cmp	esi, 200				; 000000c8H
	jl	SHORT $L595
; Line 259
	pop	esi
	add	esp, 8
	ret	0
	npad	3
$L704:
	DD	OFFSET FLAT:$L603
	DD	OFFSET FLAT:$L604
	DD	OFFSET FLAT:$L605
	DD	OFFSET FLAT:$L606
	DD	OFFSET FLAT:$L607
	DD	OFFSET FLAT:$L608
_ui_display_widgets ENDP
_TEXT	ENDS
PUBLIC	_UI_GET_RECT
;	COMDAT _UI_GET_RECT
_TEXT	SEGMENT
_id$ = 8
_rect$ = 12
_UI_GET_RECT PROC NEAR					; COMDAT
; Line 263
	mov	eax, DWORD PTR _id$[esp-4]
	push	ebx
	push	esi
	push	edi
	lea	ebx, DWORD PTR _widgets[eax*4]
	xor	edi, edi
	mov	edx, DWORD PTR _rect$[esp+8]
	xor	ecx, ecx
	mov	eax, DWORD PTR [ebx]
; Line 264
	mov	di, WORD PTR [eax+8]
	mov	esi, DWORD PTR [eax+12]
; Line 266
	mov	DWORD PTR [edx], edi
	mov	eax, DWORD PTR [ebx]
	mov	cx, WORD PTR [eax+10]
; Line 267
	mov	DWORD PTR [edx+8], ecx
; Line 269
	mov	eax, DWORD PTR [ebx]
	xor	ebx, ebx
	mov	bl, BYTE PTR [eax]
	cmp	ebx, 6
	jne	SHORT $L613
; Line 271
	xor	eax, eax
	mov	ax, WORD PTR [esi+4]
	add	eax, edi
	mov	DWORD PTR [edx+4], eax
; Line 272
	xor	eax, eax
	mov	ax, WORD PTR [esi+6]
	add	eax, ecx
	mov	DWORD PTR [edx+12], eax
; Line 280
$L613:
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_UI_GET_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_HANDLE_CLICK
;	COMDAT _UI_HANDLE_CLICK
_TEXT	SEGMENT
_id$ = 8
_UI_HANDLE_CLICK PROC NEAR				; COMDAT
; Line 283
	mov	eax, DWORD PTR _id$[esp-4]
	xor	edx, edx
	mov	ecx, DWORD PTR _widgets[eax*4]
; Line 284
	mov	dl, BYTE PTR [ecx]
	cmp	edx, 6
	jne	SHORT $L623
; Line 286
	push	eax
	mov	eax, DWORD PTR [ecx+12]
	call	DWORD PTR [eax+16]
	add	esp, 4
; Line 293
$L623:
	ret	0
_UI_HANDLE_CLICK ENDP
_TEXT	ENDS
PUBLIC	_ui_process_widgets
;	COMDAT _ui_process_widgets
_TEXT	SEGMENT
_mouse$ = -24
_rect$ = -16
_ui_process_widgets PROC NEAR				; COMDAT
; Line 318
	sub	esp, 24					; 00000018H
	lea	eax, DWORD PTR _mouse$[esp+24]
	push	esi
	push	edi
; Line 322
	push	eax
	call	_SG_ReadMouse
	add	esp, 4
; Line 324
	cmp	BYTE PTR _mouse$[esp+36], 0
	je	SHORT $L630
; Line 325
	mov	esi, 1
	xor	edi, edi
$L635:
; Line 326
	cmp	DWORD PTR _widgets[esi*4], edi
	je	SHORT $L636
; Line 328
	lea	eax, DWORD PTR _rect$[esp+32]
	push	eax
	push	esi
	call	_UI_GET_RECT
	movsx	eax, WORD PTR _mouse$[esp+40]
	add	esp, 8
; Line 330
	cmp	eax, DWORD PTR _rect$[esp+32]
	jl	SHORT $L636
	cmp	eax, DWORD PTR _rect$[esp+36]
	jg	SHORT $L636
	movsx	eax, WORD PTR _mouse$[esp+34]
	cmp	eax, DWORD PTR _rect$[esp+40]
	jl	SHORT $L636
	cmp	eax, DWORD PTR _rect$[esp+44]
	jle	SHORT $L717
; Line 325
$L636:
	inc	esi
	cmp	esi, 200				; 000000c8H
	jl	SHORT $L635
	pop	edi
	pop	esi
	add	esp, 24					; 00000018H
	ret	0
$L717:
; Line 331
	push	esi
	call	_UI_HANDLE_CLICK
	add	esp, 4
; Line 336
$L630:
	pop	edi
	pop	esi
	add	esp, 24					; 00000018H
	ret	0
_ui_process_widgets ENDP
_TEXT	ENDS
END
