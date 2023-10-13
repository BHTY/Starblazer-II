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
	jge	SHORT $L426
	lea	ecx, DWORD PTR _widgets[eax*4]
$L424:
; Line 32
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L422
	add	ecx, 4
	inc	eax
; Line 31
	cmp	ecx, OFFSET FLAT:_widgets+800
	jb	SHORT $L424
$L426:
; Line 35
	xor	eax, eax
; Line 36
$L422:
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
	mov	eax, DWORD PTR _color$[esp+12]
	push	eax
	push	ebp
	push	ebx
	push	ebp
	push	edi
	call	_draw_line
	mov	esi, DWORD PTR _y2$[esp+32]
	mov	eax, DWORD PTR _color$[esp+32]
	add	esp, 20					; 00000014H
	and	esi, 65535				; 0000ffffH
; Line 40
	push	eax
	push	esi
	push	ebx
	push	ebp
	push	ebx
	call	_draw_line
	mov	eax, DWORD PTR _color$[esp+32]
	add	esp, 20					; 00000014H
; Line 41
	push	eax
	push	esi
	push	edi
	push	esi
	push	ebx
	call	_draw_line
	mov	eax, DWORD PTR _color$[esp+32]
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
_id$ = 8
_ptr$ = 12
_text$ = 16
_x$ = 20
_y$ = 24
_px_offset$ = 28
_txt$ = 32
_text_size_y$ = -4
_UI_DRAW_BOX PROC NEAR					; COMDAT
; Line 54
	sub	esp, 4
	xor	eax, eax
	push	ebx
	push	esi
	mov	esi, DWORD PTR _text$[esp+8]
	push	edi
	mov	ebx, DWORD PTR _ptr$[esp+12]
	push	ebp
; Line 55
	mov	al, BYTE PTR [esi+1]
	lea	ecx, DWORD PTR [eax*4+1]
	mov	al, BYTE PTR [ebx+4]
	mov	DWORD PTR _text_size_y$[esp+20], ecx
	cmp	BYTE PTR [esi+2], al
; Line 58
	je	SHORT $L611
; Line 59
	mov	di, WORD PTR _y$[esp+16]
	push	eax
	mov	ax, WORD PTR [ebx+2]
	add	ax, di
	mov	bp, WORD PTR _x$[esp+20]
	push	eax
	mov	ax, WORD PTR [ebx]
	add	ax, bp
	push	eax
	push	edi
	push	ebp
	call	_UI_FILL_RECT
	add	esp, 20					; 00000014H
	jmp	SHORT $L456
$L611:
	mov	bp, WORD PTR _x$[esp+16]
	mov	di, WORD PTR _y$[esp+16]
; Line 63
$L456:
	mov	eax, DWORD PTR _id$[esp+16]
	cmp	DWORD PTR _current_widget_focus, eax
	jne	SHORT $L609
	xor	eax, eax
	mov	al, BYTE PTR [ebx+6]
	jmp	SHORT $L610
$L609:
	xor	eax, eax
	mov	al, BYTE PTR [ebx+5]
$L610:
	push	eax
	mov	ax, WORD PTR [ebx+2]
	add	ax, di
	push	eax
	mov	ax, WORD PTR [ebx]
	add	ax, bp
	push	eax
	push	edi
	push	ebp
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
	mov	cl, BYTE PTR [esi+3]
; Line 66
	mov	dl, BYTE PTR [esi+2]
	xor	eax, eax
	push	ecx
	mov	al, BYTE PTR [esi+1]
	push	edx
	xor	ecx, ecx
	mov	cx, WORD PTR [ebx+2]
	push	eax
	xor	eax, eax
	sub	ecx, DWORD PTR _text_size_y$[esp+32]
	sar	ecx, 1
	mov	al, BYTE PTR [esi]
	push	eax
	movzx	eax, di
	add	ecx, eax
	mov	edx, DWORD PTR _txt$[esp+32]
	movzx	eax, bp
	push	ecx
	mov	ecx, DWORD PTR _px_offset$[esp+36]
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
	mov	ecx, DWORD PTR _widgets[eax*4]
; Line 71
	mov	edx, DWORD PTR [ecx+12]
; Line 72
	mov	al, BYTE PTR [edx+3]
	push	eax
	mov	al, BYTE PTR [edx+2]
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR [edx+1]
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR [edx]
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR [ecx+10]
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR [ecx+8]
	mov	ecx, DWORD PTR [edx+4]
	push	eax
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
	mov	bp, WORD PTR [esi+8]
	mov	edi, DWORD PTR [esi+12]
	mov	dx, WORD PTR [esi+10]
	xor	eax, eax
; Line 78
	mov	al, BYTE PTR [edi]
	mov	cl, BYTE PTR [edi+2]
	push	ecx
	lea	ebx, DWORD PTR [eax*2+1]
; Line 79
	xor	eax, eax
	lea	ecx, DWORD PTR [ebp+ebx]
	mov	al, BYTE PTR [edi+1]
; Line 82
	lea	eax, DWORD PTR [edx+eax*4+1]
	push	eax
	push	ecx
	push	edx
	push	ebp
	call	_UI_DRAW_RECT
	add	esp, 20					; 00000014H
	mov	cl, BYTE PTR [edi+3]
; Line 85
	mov	dl, BYTE PTR [edi+2]
	xor	eax, eax
	push	ecx
	mov	al, BYTE PTR [edi+1]
	push	edx
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR [edi]
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR [esi+10]
	push	eax
	xor	eax, eax
	mov	al, cl
	xor	ecx, ecx
	mov	cx, WORD PTR [esi+8]
	add	eax, ecx
	mov	ecx, DWORD PTR [edi+4]
	add	eax, ebx
	push	eax
	push	ecx
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
_box_size_x$ = -8
_box_size_y$ = -4
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
; Line 107
	xor	eax, eax
	mov	ebx, DWORD PTR [edi+12]
; Line 110
	mov	al, BYTE PTR [ebx]
	xor	esi, esi
	mov	si, WORD PTR [edi+10]
	lea	ecx, DWORD PTR [eax*2+1]
	xor	eax, eax
	xor	ebp, ebp
	mov	al, BYTE PTR [ebx+1]
	mov	DWORD PTR _box_size_x$[esp+24], ecx
; Line 111
	cmp	BYTE PTR [ebx+4], 0
	lea	ecx, DWORD PTR [eax*4+1]
	mov	DWORD PTR _box_size_y$[esp+24], ecx
; Line 114
	jbe	$L477
$L484:
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
	jne	SHORT $L487
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
$L487:
	mov	cl, BYTE PTR [ebx+3]
	mov	al, BYTE PTR [ebx+2]
	push	ecx
	inc	ebp
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR [ebx+1]
	push	eax
	xor	eax, eax
	mov	al, BYTE PTR [ebx]
	push	eax
	push	esi
	xor	eax, eax
	mov	al, cl
	xor	ecx, ecx
	mov	cx, WORD PTR [edi+8]
	add	eax, ecx
	mov	ecx, DWORD PTR [ebx+8]
	add	eax, DWORD PTR _box_size_x$[esp+44]
	mov	edx, DWORD PTR [ecx+ebp*4-4]
	push	eax
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
	jg	$L484
; Line 128
$L477:
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
	jne	SHORT $L490
; Line 142
	cmp	BYTE PTR _cursor, 1
	sbb	al, al
	neg	al
	mov	BYTE PTR _cursor, al
; Line 144
$L490:
	ret	0
_UI_DRAW_TEXTBOX ENDP
_TEXT	ENDS
PUBLIC	_UI_DRAW_BUTTON
;	COMDAT _UI_DRAW_BUTTON
_TEXT	SEGMENT
_widget_handle$ = 8
_UI_DRAW_BUTTON PROC NEAR				; COMDAT
; Line 146
	push	ebx
	push	esi
	push	edi
	xor	ebx, ebx
	push	ebp
	xor	eax, eax
; Line 147
	mov	ebp, DWORD PTR _widget_handle$[esp+12]
	mov	ecx, -1
	mov	edx, DWORD PTR _widgets[ebp*4]
; Line 148
	mov	esi, DWORD PTR [edx+12]
; Line 150
	mov	bl, BYTE PTR [esi]
	mov	al, BYTE PTR [esi+3]
	mov	edi, DWORD PTR [esi+12]
	lea	ebx, DWORD PTR [eax+ebx*2+2]
	sub	eax, eax
	repnz	scasb
	not	ecx
	dec	ecx
	mov	eax, DWORD PTR [esi+12]
	imul	ebx, ecx
	add	ebx, 6
	lea	ecx, DWORD PTR [esi+4]
; Line 154
	push	eax
	xor	eax, eax
	mov	ax, WORD PTR [ecx]
	sub	eax, ebx
	sar	eax, 1
	mov	bx, WORD PTR [edx+10]
	push	eax
	mov	dx, WORD PTR [edx+8]
	push	ebx
	push	edx
	push	esi
	push	ecx
	push	ebp
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
	je	SHORT $L506
; Line 162
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
	mov	WORD PTR [edx+10], ax
; Line 167
	mov	edx, DWORD PTR [edi]
	mov	eax, DWORD PTR _widgetData$[esp+4]
	mov	DWORD PTR [edx+12], eax
; Line 169
	xor	eax, eax
	mov	al, cl
	cmp	eax, 5
	je	SHORT $L513
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
$L513:
; Line 171
	push	80					; 00000050H
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR [edi]
	mov	DWORD PTR [ecx+16], eax
; Line 172
	mov	ecx, DWORD PTR [edi]
	mov	eax, DWORD PTR [ecx+16]
	mov	DWORD PTR [eax], 0
; Line 179
	mov	eax, esi
; Line 180
$L506:
	pop	edi
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
	jne	SHORT $L518
; Line 187
	mov	eax, DWORD PTR [esi+16]
	push	eax
	call	_free
	add	esp, 4
; Line 190
$L518:
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
$L522:
	mov	edx, DWORD PTR [esi]
; Line 197
	test	edx, edx
	je	SHORT $L523
; Line 198
	cmp	DWORD PTR [edx+4], ecx
	je	SHORT $L520
; Line 196
$L523:
	add	esi, 4
	inc	eax
	cmp	esi, OFFSET FLAT:_widgets+800
	jb	SHORT $L522
; Line 204
	xor	eax, eax
; Line 205
$L520:
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
$L532:
	mov	eax, DWORD PTR _widgets[esi*4]
; Line 220
	test	eax, eax
	je	SHORT $L533
; Line 222
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	dec	ecx
	cmp	ecx, 5
	ja	SHORT $L533
	jmp	DWORD PTR $L641[ecx*4]
; Line 223
$L540:
; Line 224
	push	esi
	call	_UI_DRAW_LABEL
	jmp	SHORT $L646
; Line 228
$L541:
; Line 229
	push	esi
	call	_UI_DRAW_CHECKBOX
	jmp	SHORT $L646
; Line 233
$L542:
; Line 234
	push	esi
	call	_UI_DRAW_DROPDOWN
	jmp	SHORT $L646
; Line 238
$L543:
; Line 239
	push	esi
	call	_UI_DRAW_RADIO
	jmp	SHORT $L646
; Line 243
$L544:
; Line 244
	push	esi
	call	_UI_DRAW_TEXTBOX
	jmp	SHORT $L646
; Line 248
$L545:
; Line 249
	push	esi
	call	_UI_DRAW_BUTTON
$L646:
	add	esp, 4
; Line 219
$L533:
	inc	esi
	cmp	esi, 200				; 000000c8H
	jl	SHORT $L532
; Line 259
	pop	esi
	add	esp, 8
	ret	0
	npad	2
$L641:
	DD	OFFSET FLAT:$L540
	DD	OFFSET FLAT:$L541
	DD	OFFSET FLAT:$L542
	DD	OFFSET FLAT:$L543
	DD	OFFSET FLAT:$L544
	DD	OFFSET FLAT:$L545
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
	mov	ecx, DWORD PTR _rect$[esp+8]
	xor	edx, edx
	mov	eax, DWORD PTR [ebx]
; Line 264
	mov	di, WORD PTR [eax+8]
	mov	esi, DWORD PTR [eax+12]
; Line 266
	mov	DWORD PTR [ecx], edi
	mov	eax, DWORD PTR [ebx]
	mov	dx, WORD PTR [eax+10]
; Line 267
	xor	eax, eax
	mov	DWORD PTR [ecx+8], edx
; Line 269
	mov	ebx, DWORD PTR [ebx]
	mov	al, BYTE PTR [ebx]
	cmp	eax, 6
	jne	SHORT $L550
; Line 271
	xor	eax, eax
	mov	ax, WORD PTR [esi+4]
	add	eax, edi
	mov	DWORD PTR [ecx+4], eax
; Line 272
	xor	eax, eax
	mov	ax, WORD PTR [esi+6]
	add	eax, edx
	mov	DWORD PTR [ecx+12], eax
; Line 280
$L550:
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
	jne	SHORT $L560
; Line 286
	push	eax
	mov	eax, DWORD PTR [ecx+12]
	call	DWORD PTR [eax+16]
	add	esp, 4
; Line 293
$L560:
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
	je	SHORT $L567
; Line 325
	mov	esi, 1
	xor	edi, edi
$L572:
; Line 326
	cmp	DWORD PTR _widgets[esi*4], edi
	je	SHORT $L573
; Line 328
	lea	eax, DWORD PTR _rect$[esp+32]
	push	eax
	push	esi
	call	_UI_GET_RECT
	mov	eax, DWORD PTR _mouse$[esp+40]
	add	esp, 8
	and	eax, 65535				; 0000ffffH
; Line 330
	cmp	DWORD PTR _rect$[esp+32], eax
	jg	SHORT $L573
	cmp	DWORD PTR _rect$[esp+36], eax
	jl	SHORT $L573
	xor	eax, eax
	mov	ax, WORD PTR _mouse$[esp+34]
	cmp	DWORD PTR _rect$[esp+40], eax
	jg	SHORT $L573
	cmp	DWORD PTR _rect$[esp+44], eax
	jge	SHORT $L654
; Line 325
$L573:
	inc	esi
	cmp	esi, 200				; 000000c8H
	jl	SHORT $L572
	pop	edi
	pop	esi
	add	esp, 24					; 00000018H
	ret	0
$L654:
; Line 331
	push	esi
	call	_UI_HANDLE_CLICK
	add	esp, 4
; Line 336
$L567:
	pop	edi
	pop	esi
	add	esp, 24					; 00000018H
	ret	0
_ui_process_widgets ENDP
_TEXT	ENDS
END
