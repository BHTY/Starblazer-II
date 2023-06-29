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
COMM	_sfx_enable:DWORD
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
_init_sound PROC NEAR					; COMDAT
; File src\sndmixer.c
; Line 21
	push	edi
; Line 22
	mov	ecx, 64					; 00000040H
	xor	eax, eax
	mov	edi, OFFSET FLAT:_sounds
	rep stosd
; Line 23
	mov	ecx, 48					; 00000030H
	mov	edi, OFFSET FLAT:_channels
	rep stosd
; Line 24
	mov	eax, DWORD PTR _BUFFER_SIZE
	push	eax
	call	_malloc
; Line 25
	mov	ecx, DWORD PTR _BUFFER_SIZE
	mov	DWORD PTR _buffer1, eax
	push	ecx
	call	_malloc
; Line 26
	mov	edx, DWORD PTR _BUFFER_SIZE
	mov	DWORD PTR _buffer2, eax
	push	edx
	call	_malloc
	mov	DWORD PTR _music_buffer, eax
; Line 27
	mov	eax, DWORD PTR _BUFFER_SIZE
	lea	ecx, DWORD PTR [eax+eax]
	push	ecx
	call	_malloc
; Line 28
	mov	ecx, DWORD PTR _BUFFER_SIZE
	mov	edi, DWORD PTR _buffer1
	mov	edx, ecx
	mov	DWORD PTR _mix_buffer, eax
	xor	eax, eax
	add	esp, 16					; 00000010H
	shr	ecx, 2
	rep stosd
	mov	ecx, edx
	and	ecx, 3
	rep stosb
; Line 29
	mov	ecx, DWORD PTR _BUFFER_SIZE
	mov	edi, DWORD PTR _buffer2
	mov	edx, ecx
	xor	eax, eax
	shr	ecx, 2
	rep stosd
	mov	ecx, edx
	and	ecx, 3
	rep stosb
; Line 30
	mov	ecx, DWORD PTR _BUFFER_SIZE
	mov	edi, DWORD PTR _music_buffer
	mov	edx, ecx
	xor	eax, eax
	shr	ecx, 2
	rep stosd
	mov	ecx, edx
	and	ecx, 3
	rep stosb
; Line 31
	mov	eax, DWORD PTR _BUFFER_SIZE
	mov	edi, DWORD PTR _mix_buffer
	lea	ecx, DWORD PTR [eax+eax]
	xor	eax, eax
	mov	edx, ecx
	shr	ecx, 2
	rep stosd
	mov	ecx, edx
	and	ecx, 3
	rep stosb
; Line 33
	xor	eax, eax
	pop	edi
	mov	DWORD PTR _current_buffer, eax
; Line 34
	mov	DWORD PTR _sfx_enable, eax
; Line 35
	ret	0
_init_sound ENDP
_TEXT	ENDS
PUBLIC	_play_music
PUBLIC	??_C@_02JKAF@rb?$AA@				; `string'
EXTRN	_fopen:NEAR
;	COMDAT ??_C@_02JKAF@rb?$AA@
; File src\sndmixer.c
_DATA	SEGMENT
??_C@_02JKAF@rb?$AA@ DB 'rb', 00H			; `string'
_DATA	ENDS
;	COMDAT _play_music
_TEXT	SEGMENT
_filename$ = 8
_play_music PROC NEAR					; COMDAT
; File src\sndmixer.c
; Line 38
	mov	eax, DWORD PTR _MUSIC_ENABLE
	test	eax, eax
	je	SHORT $L407
; Line 39
	mov	eax, DWORD PTR _filename$[esp-4]
	push	OFFSET FLAT:??_C@_02JKAF@rb?$AA@	; `string'
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _musicfp, eax
$L407:
; Line 41
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
	je	SHORT $L496
	push	eax
	call	_fclose
	add	esp, 4
$L496:
; Line 45
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
; Line 58
	mov	eax, DWORD PTR _filename$[esp-4]
	push	ebp
	push	edi
	push	OFFSET FLAT:??_C@_02JKAF@rb?$AA@	; `string'
	push	eax
	call	_fopen
	add	esp, 8
	mov	edi, eax
; Line 61
	xor	ebp, ebp
	mov	eax, OFFSET FLAT:_sounds
$L420:
; Line 62
	cmp	DWORD PTR [eax], 0
	je	SHORT $L501
	add	eax, 16					; 00000010H
	inc	ebp
	cmp	eax, OFFSET FLAT:_sounds+256
	jl	SHORT $L420
; Line 77
	push	edi
	call	_fclose
	add	esp, 4
; Line 78
	or	eax, -1
	pop	edi
	pop	ebp
; Line 79
	ret	0
$L501:
; Line 64
	mov	edx, DWORD PTR _priority$[esp+4]
	mov	ecx, DWORD PTR _loop$[esp+4]
	push	ebx
	push	esi
	mov	esi, ebp
; Line 65
	push	2
	shl	esi, 4
	and	edx, 255				; 000000ffH
	push	0
	mov	DWORD PTR _sounds[esi+12], ecx
	push	edi
	mov	DWORD PTR _sounds[esi+8], edx
	call	_fseek
; Line 66
	push	edi
	call	_ftell
; Line 67
	push	0
	push	0
	push	edi
	mov	ebx, eax
	call	_fseek
; Line 68
	lea	eax, DWORD PTR [ebx-100]
; Line 69
	push	ebx
	mov	DWORD PTR _sounds[esi+4], eax
	call	_malloc
; Line 70
	push	edi
	push	ebx
	push	1
	push	eax
	mov	DWORD PTR _sounds[esi], eax
	call	_fread
; Line 71
	push	edi
	call	_fclose
; Line 72
	mov	eax, DWORD PTR _sounds[esi]
	add	esp, 52					; 00000034H
	add	eax, 70					; 00000046H
	mov	DWORD PTR _sounds[esi], eax
	pop	esi
	pop	ebx
; Line 73
	mov	eax, ebp
	pop	edi
	pop	ebp
; Line 79
	ret	0
_load_soundfx ENDP
_TEXT	ENDS
PUBLIC	_play_soundfx
;	COMDAT _play_soundfx
_TEXT	SEGMENT
_index$ = 8
_play_soundfx PROC NEAR					; COMDAT
; Line 88
	push	ebx
	push	esi
; Line 92
	xor	eax, eax
	mov	ecx, OFFSET FLAT:_channels
$L428:
; Line 93
	cmp	DWORD PTR [ecx], 0
	je	SHORT $L508
	add	ecx, 12					; 0000000cH
	inc	eax
	cmp	ecx, OFFSET FLAT:_channels+192
	jl	SHORT $L428
; Line 103
	mov	esi, DWORD PTR _index$[esp+4]
	xor	eax, eax
	mov	ecx, esi
	shl	ecx, 4
	mov	edx, DWORD PTR _sounds[ecx+8]
	mov	ecx, OFFSET FLAT:_channels+4
$L432:
	mov	ebx, DWORD PTR [ecx]
	shl	ebx, 4
	cmp	edx, DWORD PTR _sounds[ebx+8]
	jle	SHORT $L509
	add	ecx, 12					; 0000000cH
	inc	eax
	cmp	ecx, OFFSET FLAT:_channels+196
	jl	SHORT $L432
	pop	esi
; Line 112
	or	eax, -1
	pop	ebx
; Line 113
	ret	0
$L508:
; Line 96
	mov	edx, DWORD PTR _index$[esp+4]
	lea	ecx, DWORD PTR [eax+eax*2]
	shl	ecx, 2
	pop	esi
	mov	DWORD PTR _channels[ecx], 1
	mov	DWORD PTR _channels[ecx+8], 0
	mov	DWORD PTR _channels[ecx+4], edx
	pop	ebx
; Line 113
	ret	0
$L509:
; Line 104
	lea	ecx, DWORD PTR [eax+eax*2]
	shl	ecx, 2
	mov	DWORD PTR _channels[ecx], 1
; Line 105
	mov	DWORD PTR _channels[ecx+8], 0
; Line 106
	mov	DWORD PTR _channels[ecx+4], esi
	pop	esi
	pop	ebx
; Line 113
	ret	0
_play_soundfx ENDP
_TEXT	ENDS
PUBLIC	_mix_channel
;	COMDAT _mix_channel
_TEXT	SEGMENT
_ch$ = 8
_mix_channel PROC NEAR					; COMDAT
; Line 120
	mov	eax, DWORD PTR _ch$[esp-4]
	lea	eax, DWORD PTR [eax+eax*2]
	shl	eax, 2
	mov	ecx, DWORD PTR _channels[eax]
	test	ecx, ecx
	je	SHORT $L446
; Line 124
	mov	ecx, DWORD PTR _channels[eax+4]
	mov	edx, DWORD PTR _channels[eax+8]
	shl	ecx, 4
	push	esi
	push	edi
	mov	edi, DWORD PTR _sounds[ecx+4]
	sub	edi, edx
; Line 125
	mov	edx, DWORD PTR _BUFFER_SIZE
	cmp	edx, edi
	mov	esi, edi
	ja	SHORT $L516
	mov	esi, edx
$L516:
; Line 127
	xor	ecx, ecx
	test	esi, esi
	jbe	SHORT $L445
	push	ebx
	push	ebp
$L443:
; Line 128
	mov	ebx, DWORD PTR _channels[eax+4]
	mov	ebp, DWORD PTR _channels[eax+8]
	mov	edx, DWORD PTR _mix_buffer
	shl	ebx, 4
	mov	ebx, DWORD PTR _sounds[ebx]
	movzx	bx, BYTE PTR [ebx+ebp]
	add	WORD PTR [edx+ecx*2], bx
	mov	ebp, DWORD PTR _channels[eax+8]
	inc	ebp
	inc	ecx
	cmp	ecx, esi
	mov	DWORD PTR _channels[eax+8], ebp
	jb	SHORT $L443
	mov	edx, DWORD PTR _BUFFER_SIZE
	pop	ebp
	pop	ebx
$L445:
; Line 131
	cmp	edx, edi
	pop	edi
	pop	esi
	jb	SHORT $L446
; Line 132
	mov	DWORD PTR _channels[eax], 0
$L446:
; Line 137
	ret	0
_mix_channel ENDP
_TEXT	ENDS
PUBLIC	_copy_music
;	COMDAT _copy_music
_TEXT	SEGMENT
_ptr$ = 8
_copy_music PROC NEAR					; COMDAT
; Line 140
	mov	eax, DWORD PTR _musicfp
	mov	ecx, DWORD PTR _BUFFER_SIZE
	push	esi
	push	edi
	mov	edi, DWORD PTR _ptr$[esp+4]
	push	eax
	push	ecx
	push	1
	push	edi
	call	_fread
	mov	esi, eax
; Line 142
	mov	eax, DWORD PTR _BUFFER_SIZE
	add	esp, 16					; 00000010H
	cmp	esi, eax
	jge	SHORT $L452
; Line 143
	mov	edx, DWORD PTR _musicfp
	push	0
	push	0
	push	edx
	call	_fseek
; Line 144
	mov	ecx, DWORD PTR _BUFFER_SIZE
	mov	eax, DWORD PTR _musicfp
	sub	ecx, esi
	push	eax
	push	ecx
	add	esi, edi
	push	1
	push	esi
	call	_fread
	add	esp, 28					; 0000001cH
$L452:
	pop	edi
	pop	esi
; Line 146
	ret	0
_copy_music ENDP
_TEXT	ENDS
PUBLIC	_mix_music
PUBLIC	__real@8@3ffec000000000000000
PUBLIC	__real@8@3ffd8000000000000000
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
;	COMDAT __real@8@3ffec000000000000000
; File src\sndmixer.c
CONST	SEGMENT
__real@8@3ffec000000000000000 DQ 03fe8000000000000r ; 0.75
CONST	ENDS
;	COMDAT __real@8@3ffd8000000000000000
CONST	SEGMENT
__real@8@3ffd8000000000000000 DQ 03fd0000000000000r ; 0.25
CONST	ENDS
;	COMDAT _mix_music
_TEXT	SEGMENT
_ptr$ = 8
_mix_music PROC NEAR					; COMDAT
; File src\sndmixer.c
; Line 152
	mov	eax, DWORD PTR _musicfp
	mov	ecx, DWORD PTR _BUFFER_SIZE
	mov	edx, DWORD PTR _music_buffer
	push	esi
	push	eax
	push	ecx
	push	1
	push	edx
	call	_fread
	mov	esi, eax
; Line 154
	mov	eax, DWORD PTR _BUFFER_SIZE
	add	esp, 16					; 00000010H
	cmp	esi, eax
	jge	SHORT $L458
; Line 155
	mov	eax, DWORD PTR _musicfp
	push	0
	push	0
	push	eax
	call	_fseek
; Line 156
	mov	edx, DWORD PTR _BUFFER_SIZE
	mov	ecx, DWORD PTR _musicfp
	mov	eax, DWORD PTR _music_buffer
	sub	edx, esi
	push	ecx
	push	edx
	add	eax, esi
	push	1
	push	eax
	call	_fread
	add	esp, 28					; 0000001cH
$L458:
; Line 159
	mov	eax, DWORD PTR _BUFFER_SIZE
	xor	esi, esi
	test	eax, eax
	jle	SHORT $L461
	push	edi
	mov	edi, DWORD PTR _ptr$[esp+4]
$L459:
; Line 160
	mov	ecx, DWORD PTR _mix_buffer
	xor	eax, eax
	mov	dx, WORD PTR [ecx+esi*2]
	mov	ecx, DWORD PTR _music_buffer
	shr	dx, 4
	mov	al, BYTE PTR [ecx+esi]
	and	edx, 65535				; 0000ffffH
	mov	DWORD PTR 8+[esp+4], edx
	fild	DWORD PTR 8+[esp+4]
	mov	DWORD PTR 8+[esp+4], eax
	fmul	QWORD PTR __real@8@3ffec000000000000000
	fild	DWORD PTR 8+[esp+4]
	fmul	QWORD PTR __real@8@3ffd8000000000000000
	faddp	ST(1), ST(0)
	call	__ftol
	mov	BYTE PTR [esi+edi], al
	mov	eax, DWORD PTR _BUFFER_SIZE
	inc	esi
	cmp	esi, eax
	jl	SHORT $L459
	pop	edi
$L461:
	pop	esi
; Line 162
	ret	0
_mix_music ENDP
_TEXT	ENDS
PUBLIC	_mix
;	COMDAT _mix
_TEXT	SEGMENT
_mix	PROC NEAR					; COMDAT
; Line 168
	mov	eax, DWORD PTR _sfx_enable
	test	eax, eax
	je	SHORT $L536
	mov	eax, DWORD PTR _SFX_ENABLE
	test	eax, eax
	je	SHORT $L536
	mov	eax, 1
	jmp	SHORT $L542
$L536:
	xor	eax, eax
$L542:
; Line 170
	mov	ecx, DWORD PTR _current_buffer
	push	ebx
; Line 171
	mov	ebx, DWORD PTR _buffer1
	mov	DWORD PTR _sfx_enable, eax
	test	ecx, ecx
	je	SHORT $L467
; Line 173
	mov	ebx, DWORD PTR _buffer2
$L467:
; Line 176
	test	eax, eax
	jne	SHORT $L468
	mov	eax, DWORD PTR _musicfp
	test	eax, eax
	je	SHORT $L468
; Line 177
	push	ebx
	call	_copy_music
	add	esp, 4
	pop	ebx
; Line 194
	ret	0
$L468:
; Line 181
	mov	eax, DWORD PTR _BUFFER_SIZE
	push	esi
	push	edi
	mov	edi, DWORD PTR _mix_buffer
	lea	ecx, DWORD PTR [eax+eax]
	xor	eax, eax
	mov	edx, ecx
	shr	ecx, 2
	rep stosd
	mov	ecx, edx
	and	ecx, 3
; Line 183
	xor	esi, esi
	rep stosb
$L469:
; Line 184
	push	esi
	call	_mix_channel
	add	esp, 4
	inc	esi
	cmp	esi, 16					; 00000010H
	jl	SHORT $L469
; Line 187
	mov	eax, DWORD PTR _musicfp
	pop	edi
	test	eax, eax
	pop	esi
	je	SHORT $L472
; Line 188
	push	ebx
	call	_mix_music
	add	esp, 4
	pop	ebx
; Line 194
	ret	0
$L472:
; Line 190
	mov	ecx, DWORD PTR _BUFFER_SIZE
	xor	eax, eax
	test	ecx, ecx
	jle	SHORT $L476
$L474:
; Line 191
	mov	ecx, DWORD PTR _mix_buffer
	mov	dx, WORD PTR [ecx+eax*2]
	shr	edx, 4
	mov	BYTE PTR [eax+ebx], dl
	mov	ecx, DWORD PTR _BUFFER_SIZE
	inc	eax
	cmp	eax, ecx
	jl	SHORT $L474
$L476:
	pop	ebx
; Line 194
	ret	0
_mix	ENDP
_TEXT	ENDS
END
