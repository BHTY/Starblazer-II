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
COMM	_BUFFER_SIZE:DWORD
COMM	_MUSIC_ENABLE:DWORD
COMM	_SOUND_ENABLE:DWORD
COMM	_SFX_ENABLE:DWORD
COMM	_buffer1:DWORD
COMM	_buffer2:DWORD
COMM	_current_buffer:DWORD
COMM	_sfx_enable:BYTE
COMM	_sounds:BYTE:0100H
COMM	_channels:BYTE:0c0H
COMM	_music_buffer:DWORD
COMM	_mix_buffer:DWORD
COMM	_musicfp:DWORD
_DATA	ENDS
PUBLIC	_init_sound
EXTRN	_malloc:NEAR
;	COMDAT _init_sound
_TEXT	SEGMENT
; File src\sndmixer.c
_init_sound PROC NEAR					; COMDAT
; Line 21
	push	esi
	xor	eax, eax
	push	edi
	mov	ecx, 64					; 00000040H
; Line 22
	mov	edi, OFFSET FLAT:_sounds
	rep	stosd
; Line 23
	mov	edi, OFFSET FLAT:_channels
	mov	ecx, 48					; 00000030H
	rep	stosd
; Line 24
	mov	eax, DWORD PTR _BUFFER_SIZE
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer1, eax
; Line 25
	mov	eax, DWORD PTR _BUFFER_SIZE
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer2, eax
; Line 26
	mov	eax, DWORD PTR _BUFFER_SIZE
	push	eax
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _music_buffer, eax
; Line 27
	mov	eax, DWORD PTR _BUFFER_SIZE
	add	eax, eax
	push	eax
	call	_malloc
	mov	DWORD PTR _mix_buffer, eax
	add	esp, 4
	mov	esi, eax
	mov	edx, DWORD PTR _BUFFER_SIZE
; Line 28
	mov	edi, DWORD PTR _buffer1
	xor	eax, eax
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 29
	mov	edi, DWORD PTR _buffer2
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 30
	mov	edi, DWORD PTR _music_buffer
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 31
	add	edx, edx
	mov	edi, esi
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 33
	pop	edi
	mov	DWORD PTR _current_buffer, eax
; Line 34
	pop	esi
	mov	BYTE PTR _sfx_enable, al
; Line 35
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
; Line 38
	cmp	DWORD PTR _MUSIC_ENABLE, 0
	je	SHORT $L400
; Line 39
	mov	eax, DWORD PTR _filename$[esp-4]
	push	OFFSET FLAT:??_C@_02JKAF@rb?$AA@	; `string'
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _musicfp, eax
; Line 41
$L400:
	ret	0
_play_music ENDP
_TEXT	ENDS
PUBLIC	_stop_music
EXTRN	_fclose:NEAR
;	COMDAT _stop_music
_TEXT	SEGMENT
_stop_music PROC NEAR					; COMDAT
; Line 44
	mov	eax, DWORD PTR _musicfp
	test	eax, eax
	je	SHORT $L405
	push	eax
	call	_fclose
	add	esp, 4
; Line 45
$L405:
	mov	DWORD PTR _musicfp, 0
; Line 46
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
; Line 57
	mov	eax, DWORD PTR _filename$[esp-4]
	push	ebx
	push	esi
	push	edi
	push	ebp
	xor	edi, edi
; Line 58
	push	OFFSET FLAT:??_C@_02JKAF@rb?$AA@	; `string'
	push	eax
	call	_fopen
	add	esp, 8
	mov	esi, eax
; Line 61
	mov	eax, OFFSET FLAT:_sounds
$L414:
; Line 62
	cmp	DWORD PTR [eax], 0
	je	SHORT $L490
	add	eax, 16					; 00000010H
	inc	edi
; Line 61
	cmp	eax, OFFSET FLAT:_sounds+256
	jb	SHORT $L414
; Line 77
	push	esi
	call	_fclose
	add	esp, 4
	mov	eax, -1
; Line 79
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
$L490:
	mov	ebx, edi
	mov	al, BYTE PTR _loop$[esp+12]
	shl	ebx, 4
	push	2
; Line 63
	push	0
	push	esi
	mov	BYTE PTR _sounds[ebx+12], al
; Line 64
	xor	eax, eax
	mov	al, BYTE PTR _priority$[esp+24]
	mov	DWORD PTR _sounds[ebx+8], eax
; Line 65
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 66
	push	esi
	call	_ftell
	add	esp, 4
	mov	ebp, eax
; Line 67
	push	0
	push	0
	push	esi
	call	_fseek
	add	esp, 12					; 0000000cH
	lea	ecx, DWORD PTR [ebp-100]
; Line 68
	mov	DWORD PTR _sounds[ebx+4], ecx
; Line 69
	push	ebp
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _sounds[ebx], eax
; Line 70
	push	esi
	push	ebp
	push	1
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 71
	push	esi
	call	_fclose
	add	esp, 4
	mov	eax, edi
; Line 72
	add	DWORD PTR _sounds[ebx], 70		; 00000046H
; Line 73
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
; Line 88
	push	esi
	xor	eax, eax
	push	edi
	mov	ecx, OFFSET FLAT:_channels
; Line 92
$L422:
; Line 93
	cmp	BYTE PTR [ecx], 0
	je	SHORT $L496
	add	ecx, 12					; 0000000cH
	inc	eax
; Line 92
	cmp	ecx, OFFSET FLAT:_channels+192
	jb	SHORT $L422
; Line 102
	mov	edx, DWORD PTR _index$[esp+4]
	mov	ecx, edx
	shl	ecx, 4
	xor	eax, eax
	mov	edi, OFFSET FLAT:_channels+4
	mov	ecx, DWORD PTR _sounds[ecx+8]
$L426:
; Line 103
	mov	esi, DWORD PTR [edi]
	shl	esi, 4
	cmp	DWORD PTR _sounds[esi+8], ecx
	jge	SHORT $L497
	add	edi, 12					; 0000000cH
	inc	eax
; Line 102
	cmp	edi, OFFSET FLAT:_channels+196
	jb	SHORT $L426
; Line 112
	mov	eax, -1
	pop	edi
; Line 113
	pop	esi
	ret	0
$L496:
	lea	ecx, DWORD PTR [eax+eax*2]
	mov	edx, DWORD PTR _index$[esp+4]
	shl	ecx, 2
	pop	edi
; Line 94
	pop	esi
	mov	BYTE PTR _channels[ecx], 1
; Line 95
	mov	DWORD PTR _channels[ecx+8], 0
; Line 96
	mov	DWORD PTR _channels[ecx+4], edx
; Line 97
	ret	0
; Line 99
$L497:
	lea	ecx, DWORD PTR [eax+eax*2]
	pop	edi
	shl	ecx, 2
	pop	esi
; Line 104
	mov	BYTE PTR _channels[ecx], 1
; Line 105
	mov	DWORD PTR _channels[ecx+8], 0
; Line 106
	mov	DWORD PTR _channels[ecx+4], edx
; Line 107
	ret	0
_play_soundfx ENDP
_TEXT	ENDS
PUBLIC	_mix_channel
;	COMDAT _mix_channel
_TEXT	SEGMENT
_ch$ = 8
_mix_channel PROC NEAR					; COMDAT
; Line 117
	mov	eax, DWORD PTR _ch$[esp-4]
	push	ebx
	push	esi
	push	edi
	push	ebp
	lea	ecx, DWORD PTR [eax+eax*2]
	lea	esi, DWORD PTR [ecx*4]
; Line 120
	cmp	BYTE PTR _channels[esi], 0
	je	SHORT $L440
; Line 124
	mov	eax, DWORD PTR _channels[esi+4]
	shl	eax, 4
	mov	edi, DWORD PTR _sounds[eax+4]
	mov	eax, DWORD PTR _BUFFER_SIZE
	sub	edi, DWORD PTR _channels[esi+8]
; Line 125
	cmp	edi, eax
	mov	edx, edi
	jb	SHORT $L504
	mov	edx, eax
$L504:
; Line 127
	test	edx, edx
	je	SHORT $L439
	xor	ecx, ecx
$L437:
	mov	ebx, DWORD PTR _mix_buffer
	mov	eax, DWORD PTR _channels[esi+4]
; Line 128
	shl	eax, 4
	add	ecx, 2
	mov	ebp, DWORD PTR _sounds[eax]
	mov	eax, DWORD PTR _channels[esi+8]
	movzx	ax, BYTE PTR [ebp+eax]
	add	WORD PTR [ebx+ecx-2], ax
	inc	DWORD PTR _channels[esi+8]
	dec	edx
	jne	SHORT $L437
; Line 129
$L439:
; Line 131
	cmp	edi, DWORD PTR _BUFFER_SIZE
	ja	SHORT $L440
; Line 132
	mov	BYTE PTR _channels[esi], 0
; Line 135
$L440:
; Line 137
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
; Line 139
	push	esi
	mov	eax, DWORD PTR _musicfp
	push	edi
	mov	ecx, DWORD PTR _BUFFER_SIZE
; Line 140
	mov	esi, DWORD PTR _ptr$[esp+4]
	push	eax
	push	ecx
	push	1
	push	esi
	call	_fread
	add	esp, 16					; 00000010H
	mov	edi, eax
; Line 142
	cmp	DWORD PTR _BUFFER_SIZE, edi
	jle	SHORT $L444
; Line 143
	push	0
	mov	eax, DWORD PTR _musicfp
	push	0
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _musicfp
; Line 144
	add	esi, edi
	push	eax
	mov	eax, DWORD PTR _BUFFER_SIZE
	sub	eax, edi
	push	eax
	push	1
	push	esi
	call	_fread
	add	esp, 16					; 00000010H
; Line 146
$L444:
	pop	edi
	pop	esi
	ret	0
_copy_music ENDP
_TEXT	ENDS
PUBLIC	_mix_music
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
CONST	SEGMENT
$T511	DQ	03fe8000000000000r		; 0.75
$T512	DQ	03fd0000000000000r		; 0.25
CONST	ENDS
;	COMDAT _mix_music
_TEXT	SEGMENT
_ptr$ = 8
_mix_music PROC NEAR					; COMDAT
; Line 148
	sub	esp, 4
	mov	eax, DWORD PTR _musicfp
	mov	ecx, DWORD PTR _BUFFER_SIZE
	mov	edx, DWORD PTR _music_buffer
	push	esi
	push	edi
; Line 152
	push	eax
	push	ecx
	push	1
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
	mov	esi, eax
; Line 154
	cmp	esi, DWORD PTR _BUFFER_SIZE
	jge	SHORT $L452
; Line 155
	push	0
	mov	eax, DWORD PTR _musicfp
	push	0
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
	mov	eax, DWORD PTR _musicfp
; Line 156
	push	eax
	mov	eax, DWORD PTR _BUFFER_SIZE
	sub	eax, esi
	push	eax
	push	1
	mov	eax, DWORD PTR _music_buffer
	add	eax, esi
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 159
$L452:
	xor	esi, esi
	cmp	DWORD PTR _BUFFER_SIZE, esi
	jle	SHORT $L449
	mov	edi, DWORD PTR _ptr$[esp+8]
$L453:
; Line 160
	mov	eax, DWORD PTR _mix_buffer
	mov	edx, DWORD PTR _music_buffer
	mov	ax, WORD PTR [eax+esi*2]
	inc	esi
	shr	ax, 4
	movzx	ecx, ax
	mov	DWORD PTR -4+[esp+12], ecx
	xor	ecx, ecx
	fild	DWORD PTR -4+[esp+12]
	mov	cl, BYTE PTR [edx+esi-1]
	mov	DWORD PTR -4+[esp+12], ecx
	fmul	QWORD PTR $T511
	fild	DWORD PTR -4+[esp+12]
	fmul	QWORD PTR $T512
	faddp	ST(1), ST(0)
	call	__ftol
	mov	BYTE PTR [edi+esi-1], al
; Line 159
	cmp	esi, DWORD PTR _BUFFER_SIZE
	jl	SHORT $L453
; Line 162
$L449:
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
; Line 164
	cmp	BYTE PTR _sfx_enable, 0
	push	esi
	push	edi
; Line 168
	je	SHORT $L517
	cmp	DWORD PTR _SFX_ENABLE, 0
	je	SHORT $L517
	mov	BYTE PTR _sfx_enable, 1
	jmp	SHORT $L518
$L517:
	mov	BYTE PTR _sfx_enable, 0
$L518:
; Line 170
	cmp	DWORD PTR _current_buffer, 0
	jne	SHORT $L460
; Line 171
	mov	esi, DWORD PTR _buffer1
; Line 172
	jmp	SHORT $L461
$L460:
; Line 173
	mov	esi, DWORD PTR _buffer2
; Line 174
$L461:
; Line 176
	cmp	BYTE PTR _sfx_enable, 0
	jne	SHORT $L462
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L462
; Line 177
	push	esi
	call	_copy_music
	add	esp, 4
; Line 178
	pop	edi
	pop	esi
	ret	0
; Line 181
$L462:
	mov	edx, DWORD PTR _BUFFER_SIZE
	mov	edi, DWORD PTR _mix_buffer
	add	edx, edx
	xor	eax, eax
	mov	ecx, edx
	shr	ecx, 2
	rep	stosd
	mov	ecx, edx
	and	ecx, 3
	rep	stosb
; Line 183
	xor	edi, edi
$L463:
; Line 184
	push	edi
	call	_mix_channel
	add	esp, 4
	inc	edi
; Line 183
	cmp	edi, 16					; 00000010H
	jl	SHORT $L463
; Line 187
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L466
; Line 188
	push	esi
	call	_mix_music
	add	esp, 4
; Line 189
	pop	edi
	pop	esi
	ret	0
$L466:
; Line 190
	xor	eax, eax
	cmp	DWORD PTR _BUFFER_SIZE, eax
	jle	SHORT $L457
$L468:
; Line 191
	mov	ecx, DWORD PTR _mix_buffer
	inc	eax
	mov	cx, WORD PTR [ecx+eax*2-2]
	shr	cx, 4
	mov	BYTE PTR [esi+eax-1], cl
; Line 190
	cmp	eax, DWORD PTR _BUFFER_SIZE
	jl	SHORT $L468
; Line 194
$L457:
	pop	edi
	pop	esi
	ret	0
_mix	ENDP
_TEXT	ENDS
END
