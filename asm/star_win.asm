	TITLE	src\star_win.c
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
PUBLIC	_SG_platform
PUBLIC	_SG_title
PUBLIC	_newFrame
PUBLIC	_mouseDownLeft
PUBLIC	_mouseDownRight
_DATA	SEGMENT
COMM	_frontbuffer:DWORD
COMM	_hwnd:DWORD
COMM	_bmi:DWORD
COMM	_backBitmap:DWORD
COMM	_hPalette:DWORD
COMM	_rectScreen:BYTE:010H
COMM	_window_height:DWORD
COMM	_window_width:DWORD
COMM	_mouseFactorX:DWORD
COMM	_mouseFactorY:DWORD
COMM	_keys:BYTE:0100H
_SG_platform DD	FLAT:$SG19211
_SG_title DD	FLAT:$SG19213
_newFrame DD	00H
_mouseDownLeft DB 00H
	ORG $+3
_mouseDownRight DB 00H
	ORG $+3
$SG19211 DB	'win32', 00H
	ORG $+2
$SG19213 DB	'Starblazer II for Windows 95/NT', 00H
_DATA	ENDS
PUBLIC	_WndProc@16
EXTRN	__imp__GetDC@4:NEAR
EXTRN	__imp__ReleaseDC@8:NEAR
EXTRN	__imp__GetWindowRect@8:NEAR
EXTRN	__imp__CreateCompatibleDC@4:NEAR
EXTRN	__imp__DeleteDC@4:NEAR
EXTRN	__imp__DeleteObject@4:NEAR
EXTRN	__imp__DefWindowProcA@16:NEAR
EXTRN	__imp__PostQuitMessage@4:NEAR
EXTRN	__imp__ClipCursor@4:NEAR
EXTRN	__imp__DestroyWindow@4:NEAR
EXTRN	__imp__SelectObject@8:NEAR
EXTRN	__imp__StretchBlt@44:NEAR
EXTRN	__fltused:NEAR
EXTRN	__imp__ExitProcess@4:NEAR
CONST	SEGMENT
$T19332	DQ	04074000000000000r		; 320
$T19333	DQ	04069000000000000r		; 200
CONST	ENDS
_TEXT	SEGMENT
; File src\star_win.c
_hWnd$ = 8
_msg$ = 12
_wParam$ = 16
_lParam$ = 20
_hdc$ = -8
_hdc_bmp$ = -4
_old_bmp$ = -12
_WndProc@16 PROC NEAR
; Line 39
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 44
	mov	eax, DWORD PTR _msg$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	$L19236
; Line 45
$L19240:
; Line 46
	push	0
	call	DWORD PTR __imp__PostQuitMessage@4
; Line 47
	jmp	$L19237
; Line 50
$L19241:
; Line 51
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DestroyWindow@4
; Line 52
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 53
	jmp	$L19237
; Line 56
$L19242:
; Line 57
	push	0
	call	DWORD PTR __imp__ExitProcess@4
; Line 58
	jmp	$L19237
; Line 61
$L19243:
; Line 62
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 1
; Line 63
	jmp	$L19237
; Line 66
$L19244:
; Line 67
	xor	eax, eax
	mov	al, BYTE PTR _wParam$[ebp]
	mov	BYTE PTR _keys[eax], 0
; Line 68
	jmp	$L19237
; Line 71
$L19245:
; Line 72
	mov	eax, DWORD PTR _lParam$[ebp]
	and	eax, 65535				; 0000ffffH
	mov	DWORD PTR _window_width, eax
; Line 73
	mov	eax, DWORD PTR _lParam$[ebp]
	shr	eax, 16					; 00000010H
	mov	DWORD PTR _window_height, eax
; Line 74
	fld	QWORD PTR $T19332
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -20+[ebp], eax
	fidiv	DWORD PTR -20+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 75
	fld	QWORD PTR $T19333
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -24+[ebp], eax
	fidiv	DWORD PTR -24+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 76
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 77
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 78
	jmp	$L19237
; Line 81
$L19246:
; Line 82
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdc$[ebp], eax
; Line 83
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _hdc_bmp$[ebp], eax
; Line 84
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
	mov	DWORD PTR _old_bmp$[ebp], eax
; Line 85
	push	13369376				; 00cc0020H
	push	200					; 000000c8H
	push	320					; 00000140H
	push	0
	push	0
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	mov	eax, DWORD PTR _window_height
	push	eax
	mov	eax, DWORD PTR _window_width
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__StretchBlt@44
; Line 86
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 87
	mov	eax, DWORD PTR _hdc_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 88
	mov	eax, DWORD PTR _old_bmp$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteObject@4
; Line 89
	mov	eax, DWORD PTR _hdc$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__ReleaseDC@8
; Line 90
	jmp	$L19237
; Line 93
$L19247:
; Line 94
	mov	BYTE PTR _mouseDownLeft, 1
; Line 95
	jmp	$L19237
; Line 98
$L19248:
; Line 99
	mov	BYTE PTR _mouseDownLeft, 0
; Line 100
	jmp	$L19237
; Line 103
$L19249:
; Line 104
	mov	BYTE PTR _mouseDownRight, 1
; Line 105
	jmp	$L19237
; Line 108
$L19250:
; Line 109
	mov	BYTE PTR _mouseDownRight, 0
; Line 110
	jmp	$L19237
; Line 113
$L19251:
; Line 114
	mov	eax, DWORD PTR _lParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _wParam$[ebp]
	push	eax
	mov	eax, DWORD PTR _msg$[ebp]
	push	eax
	mov	eax, DWORD PTR _hWnd$[ebp]
	push	eax
	call	DWORD PTR __imp__DefWindowProcA@16
	jmp	$L19232
; Line 116
	jmp	$L19237
$L19236:
	cmp	DWORD PTR -16+[ebp], 5
	ja	$L19329
	je	$L19245
	cmp	DWORD PTR -16+[ebp], 2
	je	$L19240
	jmp	$L19251
$L19329:
	cmp	DWORD PTR -16+[ebp], 256		; 00000100H
	ja	$L19330
	je	$L19243
	cmp	DWORD PTR -16+[ebp], 15			; 0000000fH
	je	$L19246
	cmp	DWORD PTR -16+[ebp], 16			; 00000010H
	je	$L19241
	cmp	DWORD PTR -16+[ebp], 18			; 00000012H
	je	$L19242
	jmp	$L19251
$L19330:
	cmp	DWORD PTR -16+[ebp], 513		; 00000201H
	ja	$L19331
	je	$L19247
	cmp	DWORD PTR -16+[ebp], 257		; 00000101H
	je	$L19244
	jmp	$L19251
$L19331:
	cmp	DWORD PTR -16+[ebp], 514		; 00000202H
	je	$L19248
	cmp	DWORD PTR -16+[ebp], 516		; 00000204H
	je	$L19249
	cmp	DWORD PTR -16+[ebp], 517		; 00000205H
	je	$L19250
	jmp	$L19251
$L19237:
; Line 117
$L19232:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	16					; 00000010H
_WndProc@16 ENDP
_TEXT	ENDS
PUBLIC	_mmproc@20
_TEXT	SEGMENT
_mmproc@20 PROC NEAR
; Line 119
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 120
	mov	DWORD PTR _newFrame, 1
; Line 121
$L19258:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	20					; 00000014H
_mmproc@20 ENDP
_TEXT	ENDS
PUBLIC	_SG_Init
EXTRN	__imp__UpdateWindow@4:NEAR
EXTRN	_malloc:NEAR
EXTRN	__imp__AdjustWindowRect@12:NEAR
EXTRN	__imp__RegisterClassA@4:NEAR
EXTRN	__imp__CreateWindowExA@48:NEAR
EXTRN	__imp__ShowWindow@8:NEAR
EXTRN	_memset:NEAR
EXTRN	__imp__CreateDIBSection@24:NEAR
EXTRN	__imp__LoadCursorA@8:NEAR
EXTRN	__imp__LoadIconA@8:NEAR
EXTRN	_SG_GameInit:NEAR
EXTRN	_FBPTR:DWORD
EXTRN	__imp__GetModuleHandleA@4:NEAR
EXTRN	__imp__timeSetEvent@20:NEAR
EXTRN	__imp__timeBeginPeriod@4:NEAR
_TEXT	SEGMENT
_winRect$ = -56
_hdcScreen$ = -60
_wc$ = -40
_SG_Init PROC NEAR
; Line 132
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 138
	call	_SG_GameInit
; Line 140
	mov	DWORD PTR _window_width, 640		; 00000280H
; Line 141
	mov	DWORD PTR _window_height, 480		; 000001e0H
; Line 143
	mov	DWORD PTR _winRect$[ebp], 0
; Line 144
	mov	DWORD PTR _winRect$[ebp+4], 0
; Line 145
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR _winRect$[ebp+12], eax
; Line 146
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR _winRect$[ebp+8], eax
; Line 148
	push	0
	push	13565952				; 00cf0000H
	lea	eax, DWORD PTR _winRect$[ebp]
	push	eax
	call	DWORD PTR __imp__AdjustWindowRect@12
; Line 150
	push	1068					; 0000042cH
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _bmi, eax
; Line 152
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax], 40			; 00000028H
; Line 153
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+4], 320			; 00000140H
; Line 154
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+8], -200			; ffffff38H
; Line 155
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+12], 1
; Line 156
	mov	eax, DWORD PTR _bmi
	mov	WORD PTR [eax+14], 8
; Line 157
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+32], 256			; 00000100H
; Line 158
	mov	eax, DWORD PTR _bmi
	mov	DWORD PTR [eax+16], 0
; Line 160
	push	0
	call	DWORD PTR __imp__GetDC@4
	mov	DWORD PTR _hdcScreen$[ebp], eax
; Line 161
	push	0
	push	0
	push	OFFSET FLAT:_frontbuffer
	push	0
	mov	eax, DWORD PTR _bmi
	push	eax
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	call	DWORD PTR __imp__CreateDIBSection@24
	mov	DWORD PTR _backBitmap, eax
; Line 162
	mov	eax, DWORD PTR _hdcScreen$[ebp]
	push	eax
	push	0
	call	DWORD PTR __imp__ReleaseDC@8
; Line 164
	mov	DWORD PTR _wc$[ebp], 0
; Line 165
	mov	DWORD PTR _wc$[ebp+4], OFFSET FLAT:_WndProc@16
; Line 166
	mov	DWORD PTR _wc$[ebp+8], 0
; Line 167
	mov	DWORD PTR _wc$[ebp+12], 0
; Line 168
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	mov	DWORD PTR _wc$[ebp+16], eax
; Line 169
	push	101					; 00000065H
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	call	DWORD PTR __imp__LoadIconA@8
	mov	DWORD PTR _wc$[ebp+20], eax
; Line 170
	push	32512					; 00007f00H
	push	0
	call	DWORD PTR __imp__LoadCursorA@8
	mov	DWORD PTR _wc$[ebp+24], eax
; Line 171
	mov	DWORD PTR _wc$[ebp+28], 6
; Line 172
	mov	DWORD PTR _wc$[ebp+32], 0
; Line 173
	mov	eax, DWORD PTR _SG_title
	mov	DWORD PTR _wc$[ebp+36], eax
; Line 174
	lea	eax, DWORD PTR _wc$[ebp]
	push	eax
	call	DWORD PTR __imp__RegisterClassA@4
; Line 176
	push	0
	push	0
	call	DWORD PTR __imp__GetModuleHandleA@4
	push	eax
	push	0
	push	0
	mov	eax, DWORD PTR _winRect$[ebp+12]
	sub	eax, DWORD PTR _winRect$[ebp+4]
	push	eax
	mov	eax, DWORD PTR _winRect$[ebp+8]
	sub	eax, DWORD PTR _winRect$[ebp]
	push	eax
	push	-2147483648				; 80000000H
	push	-2147483648				; 80000000H
	push	13565952				; 00cf0000H
	mov	eax, DWORD PTR _SG_title
	push	eax
	mov	eax, DWORD PTR _SG_title
	push	eax
	push	0
	call	DWORD PTR __imp__CreateWindowExA@48
	mov	DWORD PTR _hwnd, eax
; Line 177
	push	5
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ShowWindow@8
; Line 178
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__UpdateWindow@4
; Line 180
	push	OFFSET FLAT:_rectScreen
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__GetWindowRect@8
; Line 182
	push	1
	call	DWORD PTR __imp__timeBeginPeriod@4
; Line 184
	fld	QWORD PTR $T19332
	mov	eax, DWORD PTR _window_width
	mov	DWORD PTR -64+[ebp], eax
	fidiv	DWORD PTR -64+[ebp]
	fstp	DWORD PTR _mouseFactorX
; Line 185
	fld	QWORD PTR $T19333
	mov	eax, DWORD PTR _window_height
	mov	DWORD PTR -68+[ebp], eax
	fidiv	DWORD PTR -68+[ebp]
	fstp	DWORD PTR _mouseFactorY
; Line 187
	push	OFFSET FLAT:_rectScreen
	call	DWORD PTR __imp__ClipCursor@4
; Line 189
	push	64000					; 0000fa00H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _FBPTR, eax
; Line 190
	push	1
	push	0
	push	OFFSET FLAT:_mmproc@20
	push	1
	push	14					; 0000000eH
	call	DWORD PTR __imp__timeSetEvent@20
; Line 191
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_keys
	call	_memset
	add	esp, 12					; 0000000cH
; Line 193
$L19261:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_Init ENDP
_TEXT	ENDS
PUBLIC	_SG_ReadMouse
EXTRN	__imp__GetCursorPos@4:NEAR
EXTRN	__imp__ScreenToClient@8:NEAR
EXTRN	__ftol:NEAR
_TEXT	SEGMENT
_mouse$ = 8
_p$ = -8
_SG_ReadMouse PROC NEAR
; Line 195
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 197
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	call	DWORD PTR __imp__GetCursorPos@4
; Line 198
	lea	eax, DWORD PTR _p$[ebp]
	push	eax
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__ScreenToClient@8
; Line 199
	mov	eax, DWORD PTR _p$[ebp]
	mov	DWORD PTR -12+[ebp], eax
	fild	DWORD PTR -12+[ebp]
	fmul	DWORD PTR _mouseFactorX
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx], ax
; Line 200
	mov	eax, DWORD PTR _p$[ebp+4]
	mov	DWORD PTR -16+[ebp], eax
	fild	DWORD PTR -16+[ebp]
	fmul	DWORD PTR _mouseFactorY
	call	__ftol
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	WORD PTR [ecx+2], ax
; Line 201
	mov	al, BYTE PTR _mouseDownLeft
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+4], al
; Line 202
	mov	al, BYTE PTR _mouseDownRight
	mov	ecx, DWORD PTR _mouse$[ebp]
	mov	BYTE PTR [ecx+5], al
; Line 203
$L19266:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_ReadMouse ENDP
_TEXT	ENDS
PUBLIC	_SG_KeyDown
_TEXT	SEGMENT
_key$ = 8
_SG_KeyDown PROC NEAR
; Line 205
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 206
	xor	eax, eax
	mov	al, BYTE PTR _key$[ebp]
	mov	al, BYTE PTR _keys[eax]
	jmp	$L19269
; Line 207
$L19269:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_KeyDown ENDP
_TEXT	ENDS
PUBLIC	_SG_DrawFrame
EXTRN	__imp__InvalidateRect@12:NEAR
_TEXT	SEGMENT
_SG_DrawFrame PROC NEAR
; Line 209
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 210
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	call	DWORD PTR __imp__InvalidateRect@12
; Line 211
$L19270:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_DrawFrame ENDP
_TEXT	ENDS
PUBLIC	_SG_SetPaletteIndex
EXTRN	__imp__SetDIBColorTable@16:NEAR
_TEXT	SEGMENT
_index$ = 8
_r$ = 12
_g$ = 16
_b$ = 20
_col$ = -4
_willPalette$ = -8
_tempHDC$ = -12
_SG_SetPaletteIndex PROC NEAR
; Line 213
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 215
	mov	eax, DWORD PTR _bmi
	add	eax, 40					; 00000028H
	mov	DWORD PTR _willPalette$[ebp], eax
; Line 217
	push	0
	call	DWORD PTR __imp__CreateCompatibleDC@4
	mov	DWORD PTR _tempHDC$[ebp], eax
; Line 218
	mov	eax, DWORD PTR _backBitmap
	push	eax
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__SelectObject@8
; Line 219
	mov	al, BYTE PTR _r$[ebp]
	mov	BYTE PTR _col$[ebp+2], al
; Line 220
	mov	al, BYTE PTR _g$[ebp]
	mov	BYTE PTR _col$[ebp+1], al
; Line 221
	mov	al, BYTE PTR _b$[ebp]
	mov	BYTE PTR _col$[ebp], al
; Line 222
	mov	eax, DWORD PTR _col$[ebp]
	xor	ecx, ecx
	mov	cl, BYTE PTR _index$[ebp]
	mov	edx, DWORD PTR _willPalette$[ebp]
	mov	DWORD PTR [edx+ecx*4], eax
; Line 223
	xor	eax, eax
	mov	al, BYTE PTR _index$[ebp]
	shl	eax, 2
	add	eax, DWORD PTR _willPalette$[ebp]
	push	eax
	push	1
	xor	eax, eax
	mov	al, BYTE PTR _index$[ebp]
	push	eax
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__SetDIBColorTable@16
; Line 224
	mov	eax, DWORD PTR _tempHDC$[ebp]
	push	eax
	call	DWORD PTR __imp__DeleteDC@4
; Line 225
$L19275:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_SetPaletteIndex ENDP
_TEXT	ENDS
PUBLIC	_SG_GetTicks
EXTRN	__imp__timeGetTime@0:NEAR
_TEXT	SEGMENT
_SG_GetTicks PROC NEAR
; Line 227
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 228
	call	DWORD PTR __imp__timeGetTime@0
	jmp	$L19279
; Line 229
$L19279:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_GetTicks ENDP
_TEXT	ENDS
PUBLIC	_SG_WaitBlank
EXTRN	__imp__TranslateMessage@4:NEAR
EXTRN	__imp__DispatchMessageA@4:NEAR
EXTRN	__imp__PeekMessageA@20:NEAR
_TEXT	SEGMENT
_Msg$ = -28
_SG_WaitBlank PROC NEAR
; Line 231
	push	ebp
	mov	ebp, esp
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
; Line 234
$L19283:
	cmp	DWORD PTR _newFrame, 0
	jne	$L19284
; Line 235
	push	1
	push	0
	push	0
	mov	eax, DWORD PTR _hwnd
	push	eax
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__PeekMessageA@20
	test	eax, eax
	je	$L19285
; Line 236
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__TranslateMessage@4
; Line 237
	lea	eax, DWORD PTR _Msg$[ebp]
	push	eax
	call	DWORD PTR __imp__DispatchMessageA@4
; Line 239
$L19285:
	jmp	$L19283
$L19284:
; Line 240
	mov	DWORD PTR _newFrame, 0
; Line 241
$L19280:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_SG_WaitBlank ENDP
_TEXT	ENDS
PUBLIC	_main
EXTRN	_SG_Tick:NEAR
EXTRN	_SG_WelcomeMessage:NEAR
EXTRN	_SG_InitPalette:NEAR
EXTRN	_title_init:NEAR
_TEXT	SEGMENT
_argc$ = 8
_argv$ = 12
_main	PROC NEAR
; Line 243
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 244
	call	_SG_WelcomeMessage
; Line 245
	mov	eax, DWORD PTR _argv$[ebp]
	push	eax
	mov	eax, DWORD PTR _argc$[ebp]
	push	eax
	call	_SG_Init
	add	esp, 8
; Line 246
	call	_SG_InitPalette
; Line 247
	call	_title_init
; Line 249
$L19293:
; Line 250
	call	_SG_Tick
; Line 251
	jmp	$L19293
$L19294:
; Line 252
$L19289:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_main	ENDP
_TEXT	ENDS
END
