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
_DATA	ENDS
_BSS	SEGMENT
_current_widget_focus DD 01H DUP (?)
_focused_textbox_ptr DB 01H DUP (?)
	ALIGN	4

_cursor	DD	01H DUP (?)
_BSS	ENDS
_DATA	SEGMENT
_widget_can_focus DD 00H
	DD	00H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
	DD	01H
_DATA	ENDS
PUBLIC	_UI_OPEN_SLOT
;	COMDAT _UI_OPEN_SLOT
_TEXT	SEGMENT
_starting$ = 8
_UI_OPEN_SLOT PROC NEAR					; COMDAT
; File src\ui.c
; Line 31
	mov	eax, DWORD PTR _starting$[esp-4]
	cmp	eax, 200				; 000000c8H
	jge	SHORT $L429
	lea	ecx, DWORD PTR _widgets[eax*4]
$L427:
; Line 32
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L425
	add	ecx, 4
	inc	eax
	cmp	ecx, OFFSET FLAT:_widgets+800
	jl	SHORT $L427
$L429:
; Line 35
	xor	eax, eax
$L425:
; Line 36
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
; Line 39
	mov	eax, DWORD PTR _color$[esp-4]
	push	ebx
	mov	ebx, DWORD PTR _x1$[esp]
	push	ebp
	push	esi
	mov	esi, DWORD PTR _y1$[esp+8]
	push	edi
	mov	edi, DWORD PTR _x2$[esp+12]
	and	esi, 65535				; 0000ffffH
	and	edi, 65535				; 0000ffffH
	push	eax
	push	esi
	and	ebx, 65535				; 0000ffffH
	push	edi
	push	esi
	push	ebx
	call	_draw_line
; Line 40
	mov	ebp, DWORD PTR _y2$[esp+32]
	mov	ecx, DWORD PTR _color$[esp+32]
	and	ebp, 65535				; 0000ffffH
	push	ecx
	push	ebp
	push	edi
	push	esi
	push	edi
	call	_draw_line
; Line 41
	mov	edx, DWORD PTR _color$[esp+52]
	push	edx
	push	ebp
	push	ebx
	push	ebp
	push	edi
	call	_draw_line
; Line 42
	mov	eax, DWORD PTR _color$[esp+72]
	push	eax
	push	esi
	push	ebx
	push	ebp
	push	ebx
	call	_draw_line
	add	esp, 80					; 00000050H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 43
	ret	0
_UI_DRAW_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_FILL_RECT
;	COMDAT _UI_FILL_RECT
_TEXT	SEGMENT
_y1$ = 12
_i$ = 12
_UI_FILL_RECT PROC NEAR					; COMDAT
; Line 49
	mov	eax, DWORD PTR _y1$[esp-4]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _i$[esp-4], eax
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
_text_size_y$ = 16
_UI_DRAW_BOX PROC NEAR					; COMDAT
; Line 54
	push	ebx
; Line 58
	mov	ebx, DWORD PTR _ptr$[esp]
	push	ebp
	mov	ebp, DWORD PTR _text$[esp+4]
	xor	eax, eax
	push	esi
	mov	al, BYTE PTR [ebp+1]
	mov	esi, DWORD PTR _x$[esp+8]
	push	edi
	mov	edi, DWORD PTR _y$[esp+12]
	lea	ecx, DWORD PTR [eax*4+1]
	mov	al, BYTE PTR [ebx+4]
	mov	DWORD PTR _text_size_y$[esp+12], ecx
	mov	cl, BYTE PTR [ebp+2]
	cmp	al, cl
	je	SHORT $L459
; Line 59
	mov	dx, WORD PTR [ebx+2]
	push	eax
	mov	ax, WORD PTR [ebx]
	add	dx, di
	add	ax, si
	push	edx
	push	eax
	push	edi
	push	esi
	call	_UI_FILL_RECT
	add	esp, 20					; 00000014H
$L459:
; Line 63
	mov	ecx, DWORD PTR _current_widget_focus
	mov	eax, DWORD PTR _id$[esp+12]
	cmp	ecx, eax
	jne	SHORT $L615
	xor	eax, eax
	mov	al, BYTE PTR [ebx+6]
	jmp	SHORT $L616
$L615:
	xor	eax, eax
	mov	al, BYTE PTR [ebx+5]
$L616:
	mov	dx, WORD PTR [ebx+2]
	push	eax
	mov	ax, WORD PTR [ebx]
	add	dx, di
	add	ax, si
	push	edx
	push	eax
	push	edi
	push	esi
	call	_UI_DRAW_RECT
; Line 66
	mov	cl, BYTE PTR [ebp+3]
	mov	dl, BYTE PTR [ebp+2]
	push	ecx
	xor	eax, eax
	mov	al, BYTE PTR [ebp+1]
	xor	ecx, ecx
	mov	cl, BYTE PTR [ebp]
	push	edx
	push	eax
	mov	eax, DWORD PTR _px_offset$[esp+44]
	xor	edx, edx
	push	ecx
	mov	dx, WORD PTR [ebx+2]
	mov	ecx, DWORD PTR _text_size_y$[esp+48]
	sub	edx, ecx
	mov	ecx, DWORD PTR _txt$[esp+48]
	sar	edx, 1
	and	edi, 65535				; 0000ffffH
	and	esi, 65535				; 0000ffffH
	and	eax, 65535				; 0000ffffH
	add	edx, edi
	add	esi, eax
	push	edx
	push	esi
	push	ecx
	call	_vputs
	add	esp, 48					; 00000030H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 67
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
	mov	eax, DWORD PTR [ecx+12]
; Line 72
	mov	dl, BYTE PTR [eax+3]
	push	edx
	mov	dl, BYTE PTR [eax+2]
	push	edx
	xor	edx, edx
	mov	dl, BYTE PTR [eax+1]
	push	edx
	xor	edx, edx
	mov	dl, BYTE PTR [eax]
	mov	eax, DWORD PTR [eax+4]
	push	edx
	xor	edx, edx
	mov	dx, WORD PTR [ecx+10]
	push	edx
	xor	edx, edx
	mov	dx, WORD PTR [ecx+8]
	push	edx
	push	eax
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
; Line 76
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	push	ebx
	push	ebp
	push	esi
	push	edi
	mov	edi, DWORD PTR _widgets[eax*4]
; Line 78
	xor	ecx, ecx
	mov	esi, DWORD PTR [edi+12]
; Line 82
	mov	ax, WORD PTR [edi+10]
	mov	bp, WORD PTR [edi+8]
	mov	cl, BYTE PTR [esi]
	mov	dl, BYTE PTR [esi+2]
	push	edx
	lea	ebx, DWORD PTR [ecx+ecx+1]
	movzx	cx, BYTE PTR [esi+1]
	lea	edx, DWORD PTR [eax+ecx*4+1]
	lea	ecx, DWORD PTR [ebx+ebp]
	push	edx
	push	ecx
	push	eax
	push	ebp
	call	_UI_DRAW_RECT
; Line 85
	mov	al, BYTE PTR [esi+3]
	mov	dl, BYTE PTR [esi+2]
	push	eax
	push	edx
	xor	ecx, ecx
	xor	edx, edx
	mov	cl, BYTE PTR [esi+1]
	mov	dl, BYTE PTR [esi]
	push	ecx
	push	edx
	xor	edx, edx
	xor	ecx, ecx
	mov	dx, WORD PTR [edi+8]
	mov	cx, WORD PTR [edi+10]
	and	eax, 255				; 000000ffH
	add	ebx, edx
	add	eax, ebx
	push	ecx
	push	eax
	mov	eax, DWORD PTR [esi+4]
	push	eax
	call	_vputs
	add	esp, 48					; 00000030H
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 90
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
_box_size_x$ = 8
_box_size_y$ = -4
_UI_DRAW_RADIO PROC NEAR				; COMDAT
; Line 105
	sub	esp, 8
; Line 106
	mov	eax, DWORD PTR _widget_handle$[esp+4]
	push	ebx
	push	ebp
	push	esi
	mov	ebx, DWORD PTR _widgets[eax*4]
; Line 110
	xor	ecx, ecx
; Line 111
	xor	eax, eax
	push	edi
	mov	esi, DWORD PTR [ebx+12]
; Line 112
	xor	edi, edi
	mov	di, WORD PTR [ebx+10]
; Line 114
	xor	ebp, ebp
	mov	cl, BYTE PTR [esi]
	mov	al, BYTE PTR [esi+1]
	lea	edx, DWORD PTR [ecx+ecx+1]
	lea	ecx, DWORD PTR [eax*4+1]
	mov	al, BYTE PTR [esi+4]
	mov	DWORD PTR _box_size_x$[esp+20], edx
	test	al, al
	mov	DWORD PTR _box_size_y$[esp+24], ecx
	jbe	$L489
	lea	edx, DWORD PTR [edi+ecx]
	mov	DWORD PTR -8+[esp+24], edx
	jmp	SHORT $L487
$L631:
; Line 106
	mov	ecx, DWORD PTR _box_size_y$[esp+24]
$L487:
; Line 116
	mov	dl, BYTE PTR [esi+2]
	mov	ax, WORD PTR [ebx+8]
	push	edx
	mov	edx, DWORD PTR _box_size_x$[esp+24]
	add	ecx, edi
	push	ecx
	lea	ecx, DWORD PTR [eax+edx]
	push	ecx
	push	edi
	push	eax
	call	_UI_DRAW_RECT
; Line 119
	mov	eax, DWORD PTR [ebx+16]
	add	esp, 20					; 00000014H
	cmp	eax, ebp
	jne	SHORT $L490
; Line 120
	mov	dl, BYTE PTR [esi+2]
	mov	eax, DWORD PTR -8+[esp+24]
	xor	ecx, ecx
	push	edx
	mov	cx, WORD PTR [ebx+8]
	mov	edx, DWORD PTR _box_size_x$[esp+24]
	add	ecx, edx
	sar	eax, 1
	sar	ecx, 1
	push	eax
	push	ecx
	call	_plot_pixel
	add	esp, 12					; 0000000cH
$L490:
; Line 124
	mov	al, BYTE PTR [esi+3]
	mov	dl, BYTE PTR [esi+2]
	push	eax
	xor	ecx, ecx
	mov	cl, BYTE PTR [esi+1]
	push	edx
	xor	edx, edx
	push	ecx
	mov	dl, BYTE PTR [esi]
	xor	ecx, ecx
	mov	cx, WORD PTR [ebx+8]
	push	edx
	mov	edx, DWORD PTR _box_size_x$[esp+36]
	and	eax, 255				; 000000ffH
	add	edx, ecx
	push	edi
	add	eax, edx
	push	eax
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [eax+ebp*4]
	push	ecx
	call	_vputs
; Line 126
	mov	edx, DWORD PTR _box_size_y$[esp+52]
	mov	ecx, DWORD PTR -8+[esp+52]
	add	esp, 28					; 0000001cH
	lea	eax, DWORD PTR [edx+1]
	add	edi, eax
	add	ecx, eax
	xor	eax, eax
	inc	ebp
	mov	al, BYTE PTR [esi+4]
	mov	DWORD PTR -8+[esp+24], ecx
	cmp	ebp, eax
	jl	$L631
$L489:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 128
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
	mov	eax, DWORD PTR _current_widget_focus
	mov	ecx, DWORD PTR _widget_handle$[esp-4]
	cmp	eax, ecx
	jne	SHORT $L496
; Line 142
	mov	eax, DWORD PTR _cursor
	xor	ecx, ecx
	test	eax, eax
	sete	cl
	mov	DWORD PTR _cursor, ecx
$L496:
; Line 144
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
	push	ebp
; Line 147
	mov	ebp, DWORD PTR _widget_handle$[esp+4]
	push	esi
	push	edi
; Line 150
	or	ecx, -1
	mov	esi, DWORD PTR _widgets[ebp*4]
	xor	eax, eax
	mov	edx, DWORD PTR [esi+12]
; Line 154
	mov	edi, DWORD PTR [edx+12]
	lea	ebx, DWORD PTR [edx+4]
	push	edi
	repne scasb
	mov	al, BYTE PTR [edx]
	mov	edi, eax
	xor	eax, eax
	mov	al, BYTE PTR [edx+3]
	not	ecx
	dec	ecx
	lea	eax, DWORD PTR [eax+edi*2+2]
	imul	ecx, eax
	xor	eax, eax
	mov	ax, WORD PTR [ebx]
	sub	eax, ecx
	mov	cx, WORD PTR [esi+10]
	sub	eax, 6
	sar	eax, 1
	push	eax
	mov	ax, WORD PTR [esi+8]
	push	ecx
	push	eax
	push	edx
	push	ebx
	push	ebp
	call	_UI_DRAW_BOX
	add	esp, 28					; 0000001cH
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 155
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
; Line 158
	push	1
	call	_UI_OPEN_SLOT
	mov	esi, eax
	add	esp, 4
; Line 160
	test	esi, esi
	jne	SHORT $L511
	pop	esi
; Line 180
	ret	0
$L511:
; Line 162
	push	20					; 00000014H
	call	_malloc
; Line 163
	mov	cl, BYTE PTR _widgetType$[esp+4]
; Line 164
	mov	edx, DWORD PTR _widgetID$[esp+4]
	mov	DWORD PTR _widgets[esi*4], eax
	mov	BYTE PTR [eax], cl
	mov	eax, DWORD PTR _widgets[esi*4]
	add	esp, 4
; Line 169
	cmp	cl, 5
	mov	DWORD PTR [eax+4], edx
	mov	eax, DWORD PTR _widgets[esi*4]
	mov	dx, WORD PTR _posX$[esp]
	mov	WORD PTR [eax+8], dx
	mov	eax, DWORD PTR _widgets[esi*4]
	mov	dx, WORD PTR _posY$[esp]
	mov	WORD PTR [eax+10], dx
	mov	eax, DWORD PTR _widgets[esi*4]
	mov	edx, DWORD PTR _widgetData$[esp]
	mov	DWORD PTR [eax+12], edx
	je	SHORT $L516
; Line 175
	mov	eax, DWORD PTR _widgets[esi*4]
	mov	DWORD PTR [eax+16], 0
; Line 179
	mov	eax, esi
	pop	esi
; Line 180
	ret	0
$L516:
; Line 171
	push	80					; 00000050H
	call	_malloc
	mov	ecx, DWORD PTR _widgets[esi*4]
	add	esp, 4
	mov	DWORD PTR [ecx+16], eax
; Line 172
	mov	edx, DWORD PTR _widgets[esi*4]
	mov	eax, DWORD PTR [edx+16]
	mov	DWORD PTR [eax], 0
; Line 179
	mov	eax, esi
	pop	esi
; Line 180
	ret	0
_ui_create_widget ENDP
_TEXT	ENDS
PUBLIC	_ui_destroy_widget
EXTRN	_free:NEAR
;	COMDAT _ui_destroy_widget
_TEXT	SEGMENT
_widget_handle$ = 8
_ui_destroy_widget PROC NEAR				; COMDAT
; Line 183
	mov	eax, DWORD PTR _widget_handle$[esp-4]
	push	esi
	mov	esi, DWORD PTR _widgets[eax*4]
; Line 184
	mov	DWORD PTR _widgets[eax*4], 0
; Line 186
	cmp	BYTE PTR [esi], 5
	jne	SHORT $L521
; Line 187
	mov	eax, DWORD PTR [esi+16]
	push	eax
	call	_free
	add	esp, 4
$L521:
; Line 190
	push	esi
	call	_free
	add	esp, 4
	pop	esi
; Line 191
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
; Line 196
	mov	esi, DWORD PTR _widgetID$[esp]
	mov	eax, 1
	mov	ecx, OFFSET FLAT:_widgets+4
$L525:
; Line 197
	mov	edx, DWORD PTR [ecx]
	test	edx, edx
	je	SHORT $L526
; Line 198
	cmp	DWORD PTR [edx+4], esi
	je	SHORT $L523
$L526:
; Line 196
	add	ecx, 4
	inc	eax
	cmp	ecx, OFFSET FLAT:_widgets+800
	jl	SHORT $L525
; Line 204
	xor	eax, eax
$L523:
	pop	esi
; Line 205
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
_mouse$ = -12
_ui_display_widgets PROC NEAR				; COMDAT
; Line 211
	sub	esp, 12					; 0000000cH
; Line 216
	lea	eax, DWORD PTR _mouse$[esp+12]
	push	esi
	push	edi
	push	eax
	call	_SG_ReadMouse
; Line 217
	mov	eax, DWORD PTR _mouse$[esp+26]
	push	255					; 000000ffH
	lea	ecx, DWORD PTR [eax+5]
	add	eax, -5					; fffffffbH
	push	ecx
	mov	ecx, DWORD PTR _mouse$[esp+32]
	lea	edx, DWORD PTR [ecx+5]
	add	ecx, -5					; fffffffbH
	push	edx
	push	eax
	push	ecx
	call	_UI_DRAW_RECT
	add	esp, 24					; 00000018H
; Line 219
	mov	esi, 1
	mov	edi, OFFSET FLAT:_widgets+4
$L535:
; Line 220
	mov	eax, DWORD PTR [edi]
	test	eax, eax
	je	SHORT $L536
; Line 222
	xor	ecx, ecx
	mov	cl, BYTE PTR [eax]
	mov	eax, ecx
	dec	eax
	cmp	eax, 5
	ja	SHORT $L536
	jmp	DWORD PTR $L659[eax*4]
$L543:
; Line 224
	push	esi
	call	_UI_DRAW_LABEL
; Line 225
	jmp	SHORT $L658
$L544:
; Line 229
	push	esi
	call	_UI_DRAW_CHECKBOX
; Line 230
	jmp	SHORT $L658
$L545:
; Line 234
	push	esi
	call	_UI_DRAW_DROPDOWN
; Line 235
	jmp	SHORT $L658
$L546:
; Line 239
	push	esi
	call	_UI_DRAW_RADIO
; Line 240
	jmp	SHORT $L658
$L547:
; Line 244
	push	esi
	call	_UI_DRAW_TEXTBOX
; Line 245
	jmp	SHORT $L658
$L548:
; Line 249
	push	esi
	call	_UI_DRAW_BUTTON
$L658:
	add	esp, 4
$L536:
; Line 219
	add	edi, 4
	inc	esi
	cmp	edi, OFFSET FLAT:_widgets+800
	jl	SHORT $L535
	pop	edi
	pop	esi
; Line 259
	add	esp, 12					; 0000000cH
	ret	0
	npad	2
$L659:
	DD	$L543
	DD	$L544
	DD	$L545
	DD	$L546
	DD	$L547
	DD	$L548
_ui_display_widgets ENDP
_TEXT	ENDS
PUBLIC	_UI_GET_RECT
;	COMDAT _UI_GET_RECT
_TEXT	SEGMENT
_id$ = 8
_rect$ = 12
_UI_GET_RECT PROC NEAR					; COMDAT
; Line 264
	mov	ecx, DWORD PTR _id$[esp-4]
	push	esi
; Line 266
	xor	esi, esi
	mov	eax, DWORD PTR _widgets[ecx*4]
	push	edi
; Line 267
	xor	edi, edi
	mov	edx, DWORD PTR [eax+12]
	mov	si, WORD PTR [eax+8]
	mov	eax, DWORD PTR _rect$[esp+4]
	mov	DWORD PTR [eax], esi
	mov	esi, DWORD PTR _widgets[ecx*4]
	mov	di, WORD PTR [esi+10]
	mov	DWORD PTR [eax+8], edi
; Line 269
	mov	ecx, DWORD PTR _widgets[ecx*4]
	cmp	BYTE PTR [ecx], 6
	jne	SHORT $L556
; Line 271
	mov	esi, DWORD PTR [eax]
	xor	ecx, ecx
	mov	cx, WORD PTR [edx+4]
	add	ecx, esi
	mov	DWORD PTR [eax+4], ecx
; Line 272
	xor	ecx, ecx
	mov	cx, WORD PTR [edx+6]
	mov	edx, edi
	add	ecx, edx
	mov	DWORD PTR [eax+12], ecx
$L556:
	pop	edi
	pop	esi
; Line 280
	ret	0
_UI_GET_RECT ENDP
_TEXT	ENDS
PUBLIC	_UI_HANDLE_CLICK
;	COMDAT _UI_HANDLE_CLICK
_TEXT	SEGMENT
_id$ = 8
_UI_HANDLE_CLICK PROC NEAR				; COMDAT
; Line 284
	mov	ecx, DWORD PTR _id$[esp-4]
	mov	eax, DWORD PTR _widgets[ecx*4]
	cmp	BYTE PTR [eax], 6
	jne	SHORT $L565
; Line 286
	mov	eax, DWORD PTR [eax+12]
	push	ecx
	call	DWORD PTR [eax+16]
	pop	ecx
$L565:
; Line 293
	ret	0
_UI_HANDLE_CLICK ENDP
_TEXT	ENDS
PUBLIC	_ui_process_widgets
;	COMDAT _ui_process_widgets
_TEXT	SEGMENT
_mouse$ = -28
_rect$ = -16
_ui_process_widgets PROC NEAR				; COMDAT
; Line 318
	sub	esp, 28					; 0000001cH
; Line 322
	lea	eax, DWORD PTR _mouse$[esp+28]
	push	esi
	push	edi
	push	eax
	call	_SG_ReadMouse
; Line 324
	mov	eax, DWORD PTR _mouse$[esp+44]
	add	esp, 4
	test	eax, eax
	je	SHORT $L577
; Line 325
	mov	edi, 1
	mov	esi, OFFSET FLAT:_widgets+4
$L575:
; Line 326
	cmp	DWORD PTR [esi], 0
	je	SHORT $L576
; Line 328
	lea	ecx, DWORD PTR _rect$[esp+36]
	push	ecx
	push	edi
	call	_UI_GET_RECT
; Line 330
	mov	eax, DWORD PTR _mouse$[esp+44]
	mov	ecx, DWORD PTR _rect$[esp+44]
	and	eax, 65535				; 0000ffffH
	add	esp, 8
	cmp	eax, ecx
	jl	SHORT $L576
	cmp	eax, DWORD PTR _rect$[esp+40]
	jg	SHORT $L576
	mov	eax, DWORD PTR _mouse$[esp+38]
	mov	ecx, DWORD PTR _rect$[esp+44]
	and	eax, 65535				; 0000ffffH
	cmp	eax, ecx
	jl	SHORT $L576
	cmp	eax, DWORD PTR _rect$[esp+48]
	jle	SHORT $L670
$L576:
; Line 325
	add	esi, 4
	inc	edi
	cmp	esi, OFFSET FLAT:_widgets+800
	jl	SHORT $L575
	pop	edi
	pop	esi
; Line 336
	add	esp, 28					; 0000001cH
	ret	0
$L670:
; Line 331
	push	edi
	call	_UI_HANDLE_CLICK
	add	esp, 4
$L577:
	pop	edi
	pop	esi
; Line 336
	add	esp, 28					; 0000001cH
	ret	0
_ui_process_widgets ENDP
_TEXT	ENDS
END
