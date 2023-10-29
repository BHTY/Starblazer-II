	TITLE	src\sndmixer.c
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
;	COMDAT ??_C@_02JKAF@rb?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _init_sound
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _play_music
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _stop_music
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _load_soundfx
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _play_soundfx
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mix_channel
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _copy_music
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mix_music
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mix
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
COMM	_sounds:BYTE:0100H
COMM	_channels:BYTE:0c0H
COMM	_music_buffer:DWORD
COMM	_mix_buffer:DWORD
COMM	_musicfp:DWORD
COMM	_buffer1:DWORD
COMM	_buffer2:DWORD
COMM	_current_buffer:DWORD
COMM	_sfx_enable:BYTE
_DATA	ENDS
PUBLIC	_init_sound
EXTRN	_GAME_SETTINGS:BYTE
EXTRN	_malloc:NEAR
;	COMDAT _init_sound
_TEXT	SEGMENT
; File src\sndmixer.c
_init_sound PROC NEAR					; COMDAT
; Line 19
	push	esi
	xor	eax, eax
	push	edi
	mov	ecx, 64					; 00000040H
; Line 20
	mov	edi, OFFSET FLAT:_sounds
	rep	stosd
; Line 21
	mov	edi, OFFSET FLAT:_channels
	mov	ecx, 48					; 00000030H
	rep	stosd
; Line 22
	mov	eax, DWORD PTR _GAME_SETTINGS+72
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer1, eax
; Line 23
	mov	eax, DWORD PTR _GAME_SETTINGS+72
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer2, eax
; Line 24
	mov	eax, DWORD PTR _GAME_SETTINGS+72
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _music_buffer, eax
; Line 25
	mov	eax, DWORD PTR _GAME_SETTINGS+72
	add	eax, eax
	push	eax
	call	_malloc
	mov	DWORD PTR _mix_buffer, eax
	add	esp, 4
	mov	esi, eax
	mov	edx, DWORD PTR _GAME_SETTINGS+72
; Line 26
	mov	edi, DWORD PTR _buffer1
	xor	eax, eax
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 27
	mov	edx, DWORD PTR _GAME_SETTINGS+72
	mov	edi, DWORD PTR _buffer2
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 28
	mov	edx, DWORD PTR _GAME_SETTINGS+72
	mov	edi, DWORD PTR _music_buffer
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 29
	mov	edx, DWORD PTR _GAME_SETTINGS+72
	mov	edi, esi
	add	edx, edx
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 31
	pop	edi
	mov	DWORD PTR _current_buffer, eax
; Line 32
	pop	esi
	mov	BYTE PTR _sfx_enable, al
; Line 33
	ret	0
_init_sound ENDP
_TEXT	ENDS
PUBLIC	_play_music
PUBLIC	??_C@_02JKAF@rb?$AA@				; `string'
EXTRN	_fopen:NEAR
;	COMDAT ??_C@_02JKAF@rb?$AA@
_DATA	SEGMENT
??_C@_02JKAF@rb?$AA@ DB 'rb', 00H			; `string'
_DATA	ENDS
;	COMDAT _play_music
_TEXT	SEGMENT
_filename$ = 8
_play_music PROC NEAR					; COMDAT
; Line 36
	cmp	DWORD PTR _GAME_SETTINGS+64, 0
	je	SHORT $L490
; Line 37
	mov	eax, DWORD PTR _filename$[esp-4]
	push	OFFSET FLAT:??_C@_02JKAF@rb?$AA@	; `string'
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _musicfp, eax
; Line 39
$L490:
	ret	0
_play_music ENDP
_TEXT	ENDS
PUBLIC	_stop_music
EXTRN	_fclose:NEAR
;	COMDAT _stop_music
_TEXT	SEGMENT
_stop_music PROC NEAR					; COMDAT
; Line 42
	mov	eax, DWORD PTR _musicfp
	test	eax, eax
	je	SHORT $L495
	push	eax
	call	_fclose
	add	esp, 4
; Line 43
$L495:
	mov	DWORD PTR _musicfp, 0
; Line 44
	ret	0
_stop_music ENDP
_TEXT	ENDS
PUBLIC	_load_soundfx
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
;	COMDAT _load_soundfx
_TEXT	SEGMENT
_filename$ = 8
_priority$ = 12
_loop$ = 16
_load_soundfx PROC NEAR					; COMDAT
; Line 55
	mov	eax, DWORD PTR _filename$[esp-4]
	push	ebx
	push	esi
	push	edi
	push	ebp
	xor	edi, edi
; Line 56
	push	OFFSET FLAT:??_C@_02JKAF@rb?$AA@	; `string'
	push	eax
	call	_fopen
	add	esp, 8
	mov	esi, eax
; Line 59
	mov	eax, OFFSET FLAT:_sounds
$L504:
; Line 60
	cmp	DWORD PTR [eax], 0
	je	SHORT $L579
	add	eax, 16					; 00000010H
	inc	edi
; Line 59
	cmp	eax, OFFSET FLAT:_sounds+256
	jb	SHORT $L504
; Line 75
	push	esi
	call	_fclose
	add	esp, 4
	mov	eax, -1
; Line 77
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
$L579:
	mov	ebx, edi
	mov	al, BYTE PTR _loop$[esp+12]
	shl	ebx, 4
	xor	ecx, ecx
; Line 61
	mov	cl, BYTE PTR _priority$[esp+12]
	push	2
	push	0
	mov	BYTE PTR _sounds[ebx+12], al
; Line 62
	push	esi
	mov	DWORD PTR _sounds[ebx+8], ecx
; Line 63
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 64
	push	esi
	call	_ftell
	add	esp, 4
	mov	ebp, eax
; Line 65
	push	0
	push	0
	push	esi
	call	_fseek
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [ebp-100]
; Line 66
	mov	DWORD PTR _sounds[ebx+4], ecx
; Line 67
	push	ebp
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _sounds[ebx], eax
; Line 68
	push	esi
	push	ebp
	push	1
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 69
	push	esi
	call	_fclose
	add	esp, 4
	mov	eax, edi
; Line 70
	add	DWORD PTR _sounds[ebx], 70		; 00000046H
; Line 71
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_load_soundfx ENDP
_TEXT	ENDS
PUBLIC	_play_soundfx
;	COMDAT _play_soundfx
_TEXT	SEGMENT
_index$ = 8
_play_soundfx PROC NEAR					; COMDAT
; Line 86
	push	esi
	xor	eax, eax
	push	edi
	mov	ecx, OFFSET FLAT:_channels
; Line 90
$L512:
; Line 91
	cmp	BYTE PTR [ecx], 0
	je	SHORT $L585
	add	ecx, 12					; 0000000cH
	inc	eax
; Line 90
	cmp	ecx, OFFSET FLAT:_channels+192
	jb	SHORT $L512
; Line 100
	mov	edx, DWORD PTR _index$[esp+4]
	mov	ecx, edx
	shl	ecx, 4
	xor	eax, eax
	mov	edi, OFFSET FLAT:_channels+4
	mov	ecx, DWORD PTR _sounds[ecx+8]
$L516:
; Line 101
	mov	esi, DWORD PTR [edi]
	shl	esi, 4
	cmp	DWORD PTR _sounds[esi+8], ecx
	jge	SHORT $L586
	add	edi, 12					; 0000000cH
	inc	eax
; Line 100
	cmp	edi, OFFSET FLAT:_channels+196
	jb	SHORT $L516
; Line 110
	mov	eax, -1
	pop	edi
; Line 111
	pop	esi
	ret	0
$L585:
	lea	ecx, DWORD PTR [eax+eax*2]
	mov	edx, DWORD PTR _index$[esp+4]
	shl	ecx, 2
	pop	edi
; Line 92
	pop	esi
	mov	BYTE PTR _channels[ecx], 1
; Line 93
	mov	DWORD PTR _channels[ecx+8], 0
; Line 94
	mov	DWORD PTR _channels[ecx+4], edx
; Line 95
	ret	0
; Line 97
$L586:
	lea	ecx, DWORD PTR [eax+eax*2]
	pop	edi
	shl	ecx, 2
	pop	esi
; Line 102
	mov	BYTE PTR _channels[ecx], 1
; Line 103
	mov	DWORD PTR _channels[ecx+8], 0
; Line 104
	mov	DWORD PTR _channels[ecx+4], edx
; Line 105
	ret	0
_play_soundfx ENDP
_TEXT	ENDS
PUBLIC	_mix_channel
;	COMDAT _mix_channel
_TEXT	SEGMENT
_ch$ = 8
_mix_channel PROC NEAR					; COMDAT
; Line 115
	mov	eax, DWORD PTR _ch$[esp-4]
	push	ebx
	push	esi
	push	edi
	push	ebp
	lea	ecx, DWORD PTR [eax+eax*2]
	lea	esi, DWORD PTR [ecx*4]
; Line 118
	cmp	BYTE PTR _channels[esi], 0
	je	SHORT $L530
; Line 122
	mov	eax, DWORD PTR _channels[esi+4]
	shl	eax, 4
	mov	edi, DWORD PTR _sounds[eax+4]
	mov	eax, DWORD PTR _GAME_SETTINGS+72
	sub	edi, DWORD PTR _channels[esi+8]
; Line 123
	cmp	edi, eax
	mov	edx, edi
	jb	SHORT $L593
	mov	edx, eax
$L593:
; Line 125
	test	edx, edx
	je	SHORT $L529
	xor	ecx, ecx
$L527:
	mov	ebx, DWORD PTR _mix_buffer
	mov	eax, DWORD PTR _channels[esi+4]
; Line 126
	shl	eax, 4
	add	ecx, 2
	mov	ebp, DWORD PTR _sounds[eax]
	mov	eax, DWORD PTR _channels[esi+8]
	mov	al, BYTE PTR [ebp+eax]
	and	eax, -65281				; ffff00ffH
	add	WORD PTR [ebx+ecx-2], ax
	inc	DWORD PTR _channels[esi+8]
	dec	edx
	jne	SHORT $L527
; Line 127
$L529:
; Line 129
	cmp	edi, DWORD PTR _GAME_SETTINGS+72
	ja	SHORT $L530
; Line 130
	mov	BYTE PTR _channels[esi], 0
; Line 133
$L530:
; Line 135
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_mix_channel ENDP
_TEXT	ENDS
PUBLIC	_copy_music
;	COMDAT _copy_music
_TEXT	SEGMENT
_ptr$ = 8
_copy_music PROC NEAR					; COMDAT
; Line 137
	push	esi
	mov	eax, DWORD PTR _musicfp
	push	edi
	mov	ecx, DWORD PTR _GAME_SETTINGS+72
; Line 138
	mov	esi, DWORD PTR _ptr$[esp+4]
	push	eax
	push	ecx
	push	1
	push	esi
	call	_fread
	add	esp, 16					; 00000010H
	mov	edi, eax
; Line 140
	cmp	DWORD PTR _GAME_SETTINGS+72, edi
	jbe	SHORT $L534
; Line 141
	push	0
	mov	eax, DWORD PTR _musicfp
	push	0
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _musicfp
; Line 142
	add	esi, edi
	push	eax
	mov	eax, DWORD PTR _GAME_SETTINGS+72
	sub	eax, edi
	push	eax
	push	1
	push	esi
	call	_fread
	add	esp, 16					; 00000010H
; Line 144
$L534:
	pop	edi
	pop	esi
	ret	0
_copy_music ENDP
_TEXT	ENDS
PUBLIC	_mix_music
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
CONST	SEGMENT
$T600	DQ	03fe8000000000000r		; 0.75
$T601	DQ	03fd0000000000000r		; 0.25
CONST	ENDS
;	COMDAT _mix_music
_TEXT	SEGMENT
_ptr$ = 8
_mix_music PROC NEAR					; COMDAT
; Line 146
	sub	esp, 4
	mov	eax, DWORD PTR _musicfp
	mov	ecx, DWORD PTR _GAME_SETTINGS+72
	mov	edx, DWORD PTR _music_buffer
	push	esi
	push	edi
; Line 150
	push	eax
	push	ecx
	push	1
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	mov	esi, eax
; Line 152
	cmp	DWORD PTR _GAME_SETTINGS+72, esi
	jbe	SHORT $L542
; Line 153
	push	0
	mov	eax, DWORD PTR _musicfp
	push	0
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _musicfp
; Line 154
	push	eax
	mov	eax, DWORD PTR _GAME_SETTINGS+72
	sub	eax, esi
	push	eax
	push	1
	mov	eax, DWORD PTR _music_buffer
	add	eax, esi
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 157
$L542:
	xor	edi, edi
	cmp	DWORD PTR _GAME_SETTINGS+72, edi
	jbe	SHORT $L539
	mov	esi, DWORD PTR _ptr$[esp+8]
$L543:
; Line 158
	mov	eax, DWORD PTR _mix_buffer
	mov	edx, DWORD PTR _music_buffer
	mov	ax, WORD PTR [eax+edi*2]
	inc	edi
	shr	ax, 4
	mov	ecx, eax
	xor	eax, eax
	and	ecx, 65535				; 0000ffffH
	mov	al, BYTE PTR [edx+edi-1]
	mov	DWORD PTR -4+[esp+12], ecx
	fild	DWORD PTR -4+[esp+12]
	mov	DWORD PTR -4+[esp+12], eax
	fmul	QWORD PTR $T600
	fild	DWORD PTR -4+[esp+12]
	fmul	QWORD PTR $T601
	faddp	ST(1), ST(0)
	call	__ftol
	mov	BYTE PTR [esi+edi-1], al
; Line 157
	cmp	edi, DWORD PTR _GAME_SETTINGS+72
	jb	SHORT $L543
; Line 160
$L539:
	pop	edi
	pop	esi
	add	esp, 4
	ret	0
_mix_music ENDP
_TEXT	ENDS
PUBLIC	_mix
;	COMDAT _mix
_TEXT	SEGMENT
_mix	PROC NEAR					; COMDAT
; Line 162
	cmp	BYTE PTR _sfx_enable, 0
	push	esi
	push	edi
; Line 166
	je	SHORT $L606
	cmp	DWORD PTR _GAME_SETTINGS+60, 0
	mov	BYTE PTR _sfx_enable, 1
	jne	SHORT $L607
$L606:
	mov	BYTE PTR _sfx_enable, 0
$L607:
; Line 168
	cmp	DWORD PTR _current_buffer, 0
	jne	SHORT $L549
; Line 169
	mov	esi, DWORD PTR _buffer1
; Line 170
	jmp	SHORT $L550
$L549:
; Line 171
	mov	esi, DWORD PTR _buffer2
; Line 172
$L550:
; Line 174
	cmp	BYTE PTR _sfx_enable, 0
	jne	SHORT $L551
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L551
; Line 175
	push	esi
	call	_copy_music
	add	esp, 4
; Line 176
	pop	edi
	pop	esi
	ret	0
; Line 179
$L551:
	mov	edx, DWORD PTR _GAME_SETTINGS+72
	mov	edi, DWORD PTR _mix_buffer
	add	edx, edx
	xor	eax, eax
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 181
	xor	edi, edi
$L552:
; Line 182
	push	edi
	call	_mix_channel
	add	esp, 4
	inc	edi
; Line 181
	cmp	edi, 16					; 00000010H
	jl	SHORT $L552
; Line 185
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L555
; Line 186
	push	esi
	call	_mix_music
	add	esp, 4
; Line 187
	pop	edi
	pop	esi
	ret	0
$L555:
; Line 188
	xor	eax, eax
	cmp	DWORD PTR _GAME_SETTINGS+72, eax
	jbe	SHORT $L546
$L557:
; Line 189
	mov	ecx, DWORD PTR _mix_buffer
	inc	eax
	mov	cx, WORD PTR [ecx+eax*2-2]
	shr	cx, 4
	mov	BYTE PTR [eax+esi-1], cl
; Line 188
	cmp	DWORD PTR _GAME_SETTINGS+72, eax
	ja	SHORT $L557
; Line 192
$L546:
	pop	edi
	pop	esi
	ret	0
_mix	ENDP
_TEXT	ENDS
END
