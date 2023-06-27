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
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
_DATA	SEGMENT
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
EXTRN	_memset:NEAR
_TEXT	SEGMENT
; File src\sndmixer.c
_init_sound PROC NEAR
; Line 18
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 19
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_sounds
	call	_memset
	add	esp, 12					; 0000000cH
; Line 20
	push	192					; 000000c0H
	push	0
	push	OFFSET FLAT:_channels
	call	_memset
	add	esp, 12					; 0000000cH
; Line 21
	push	1024					; 00000400H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer1, eax
; Line 22
	push	1024					; 00000400H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer2, eax
; Line 23
	push	1024					; 00000400H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _music_buffer, eax
; Line 24
	push	2048					; 00000800H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _mix_buffer, eax
; Line 25
	push	1024					; 00000400H
	push	0
	mov	eax, DWORD PTR _buffer1
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 26
	push	1024					; 00000400H
	push	0
	mov	eax, DWORD PTR _buffer2
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 27
	push	1024					; 00000400H
	push	0
	mov	eax, DWORD PTR _music_buffer
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 28
	push	2048					; 00000800H
	push	0
	mov	eax, DWORD PTR _mix_buffer
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 30
	mov	DWORD PTR _current_buffer, 0
; Line 31
	mov	BYTE PTR _sfx_enable, 0
; Line 32
$L351:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_sound ENDP
_TEXT	ENDS
PUBLIC	_play_music
EXTRN	_fopen:NEAR
_DATA	SEGMENT
$SG355	DB	'rb', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_play_music PROC NEAR
; Line 34
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 35
	push	OFFSET FLAT:$SG355
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _musicfp, eax
; Line 36
$L354:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_play_music ENDP
_TEXT	ENDS
PUBLIC	_stop_music
EXTRN	_fclose:NEAR
_TEXT	SEGMENT
_stop_music PROC NEAR
; Line 38
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 39
	cmp	DWORD PTR _musicfp, 0
	je	$L358
	mov	eax, DWORD PTR _musicfp
	push	eax
	call	_fclose
	add	esp, 4
; Line 40
$L358:
	mov	DWORD PTR _musicfp, 0
; Line 41
$L357:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_stop_music ENDP
_TEXT	ENDS
PUBLIC	_load_soundfx
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
_DATA	SEGMENT
	ORG $+1
$SG365	DB	'rb', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_priority$ = 12
_loop$ = 16
_fp$ = -12
_i$ = -4
_sz$ = -8
_load_soundfx PROC NEAR
; Line 52
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 53
	push	OFFSET FLAT:$SG365
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 56
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L368
$L369:
	inc	DWORD PTR _i$[ebp]
$L368:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L370
; Line 57
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	cmp	DWORD PTR _sounds[eax], 0
	jne	$L371
; Line 58
	mov	al, BYTE PTR _loop$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	BYTE PTR _sounds[ecx+12], al
; Line 59
	xor	eax, eax
	mov	al, BYTE PTR _priority$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _sounds[ecx+8], eax
; Line 60
	push	2
	push	0
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 61
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_ftell
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax
; Line 62
	push	0
	push	0
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 63
	mov	eax, DWORD PTR _sz$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _sounds[ecx+4], eax
; Line 64
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _sounds[ecx], eax
; Line 65
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	eax, DWORD PTR _sounds[eax]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 66
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 67
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L363
; Line 69
$L371:
	jmp	$L369
$L370:
; Line 71
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 72
	mov	eax, -1
	jmp	$L363
; Line 73
$L363:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_load_soundfx ENDP
_TEXT	ENDS
PUBLIC	_play_soundfx
_TEXT	SEGMENT
_index$ = 8
_i$ = -4
_play_soundfx PROC NEAR
; Line 82
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 86
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L376
$L377:
	inc	DWORD PTR _i$[ebp]
$L376:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L378
; Line 87
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cl, BYTE PTR _channels[eax*4]
	test	ecx, ecx
	jne	$L379
; Line 88
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	BYTE PTR _channels[eax*4], 1
; Line 89
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _channels[eax*4+8], 0
; Line 90
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _channels[ecx*4+4], eax
; Line 91
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L374
; Line 93
$L379:
	jmp	$L377
$L378:
; Line 96
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L380
$L381:
	inc	DWORD PTR _i$[ebp]
$L380:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L382
; Line 97
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _channels[eax*4+4]
	shl	eax, 4
	mov	ecx, DWORD PTR _index$[ebp]
	shl	ecx, 4
	mov	ecx, DWORD PTR _sounds[ecx+8]
	cmp	DWORD PTR _sounds[eax+8], ecx
	jl	$L383
; Line 98
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	BYTE PTR _channels[eax*4], 1
; Line 99
	mov	eax, DWORD PTR _i$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	DWORD PTR _channels[eax*4+8], 0
; Line 100
	mov	eax, DWORD PTR _index$[ebp]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	DWORD PTR _channels[ecx*4+4], eax
; Line 101
	mov	eax, DWORD PTR _i$[ebp]
	jmp	$L374
; Line 103
$L383:
	jmp	$L381
$L382:
; Line 106
	mov	eax, -1
	jmp	$L374
; Line 107
$L374:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_play_soundfx ENDP
_TEXT	ENDS
PUBLIC	_mix_channel
_TEXT	SEGMENT
_ch$ = 8
_samples$ = -4
_i$ = -12
_samples_remaining$ = -8
_mix_channel PROC NEAR
; Line 111
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
	push	ebx
	push	esi
	push	edi
; Line 114
	mov	eax, DWORD PTR _ch$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	xor	ecx, ecx
	mov	cl, BYTE PTR _channels[eax*4]
	test	ecx, ecx
	jne	$L390
; Line 115
	jmp	$L386
; Line 118
$L390:
	mov	eax, DWORD PTR _ch$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _channels[eax*4+4]
	shl	eax, 4
	mov	eax, DWORD PTR _sounds[eax+4]
	mov	ecx, DWORD PTR _ch$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	sub	eax, DWORD PTR _channels[ecx*4+8]
	mov	DWORD PTR _samples_remaining$[ebp], eax
; Line 119
	mov	eax, DWORD PTR _samples_remaining$[ebp]
	cmp	eax, 1024				; 00000400H
	jb	$L427
	mov	eax, 1024				; 00000400H
$L427:
	mov	DWORD PTR _samples$[ebp], eax
; Line 121
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L391
$L392:
	inc	DWORD PTR _i$[ebp]
$L391:
	mov	eax, DWORD PTR _samples$[ebp]
	cmp	DWORD PTR _i$[ebp], eax
	jae	$L393
; Line 122
	mov	eax, DWORD PTR _ch$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _channels[eax*4+4]
	shl	eax, 4
	mov	eax, DWORD PTR _sounds[eax]
	mov	ecx, DWORD PTR _ch$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	mov	ecx, DWORD PTR _channels[ecx*4+8]
	xor	edx, edx
	mov	dl, BYTE PTR [eax+ecx]
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _mix_buffer
	xor	ebx, ebx
	mov	bx, WORD PTR [ecx+eax*2]
	add	edx, ebx
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _mix_buffer
	mov	WORD PTR [ecx+eax*2], dx
	mov	eax, DWORD PTR _ch$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	inc	DWORD PTR _channels[eax*4+8]
; Line 123
	jmp	$L392
$L393:
; Line 125
	cmp	DWORD PTR _samples_remaining$[ebp], 1024 ; 00000400H
	ja	$L394
; Line 126
	mov	eax, DWORD PTR _ch$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	BYTE PTR _channels[eax*4], 0
; Line 129
$L394:
	mov	eax, DWORD PTR _ch$[ebp]
	lea	eax, DWORD PTR [eax+eax*2]
	mov	eax, DWORD PTR _channels[eax*4+4]
	shl	eax, 4
	xor	ecx, ecx
	mov	cl, BYTE PTR _sounds[eax+12]
	test	ecx, ecx
	je	$L395
; Line 131
$L395:
$L386:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mix_channel ENDP
_TEXT	ENDS
PUBLIC	_copy_music
_TEXT	SEGMENT
_ptr$ = 8
_bytes_read$ = -4
_copy_music PROC NEAR
; Line 133
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 134
	mov	eax, DWORD PTR _musicfp
	push	eax
	push	1024					; 00000400H
	push	1
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bytes_read$[ebp], eax
; Line 136
	cmp	DWORD PTR _bytes_read$[ebp], 1024	; 00000400H
	jge	$L400
; Line 137
	push	0
	push	0
	mov	eax, DWORD PTR _musicfp
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 138
	mov	eax, DWORD PTR _musicfp
	push	eax
	mov	eax, 1024				; 00000400H
	sub	eax, DWORD PTR _bytes_read$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _bytes_read$[ebp]
	add	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 140
$L400:
$L398:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_copy_music ENDP
_TEXT	ENDS
PUBLIC	_mix_music
EXTRN	__ftol:NEAR
EXTRN	__fltused:NEAR
CONST	SEGMENT
$T428	DQ	03fe8000000000000r		; 0.75
$T429	DQ	03fd0000000000000r		; 0.25
CONST	ENDS
_TEXT	SEGMENT
_ptr$ = 8
_i$ = -4
_bytes_read$ = -8
_mix_music PROC NEAR
; Line 142
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
	push	ebx
	push	esi
	push	edi
; Line 146
	mov	eax, DWORD PTR _musicfp
	push	eax
	push	1024					; 00000400H
	push	1
	mov	eax, DWORD PTR _music_buffer
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bytes_read$[ebp], eax
; Line 148
	cmp	DWORD PTR _bytes_read$[ebp], 1024	; 00000400H
	jge	$L406
; Line 149
	push	0
	push	0
	mov	eax, DWORD PTR _musicfp
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 150
	mov	eax, DWORD PTR _musicfp
	push	eax
	mov	eax, 1024				; 00000400H
	sub	eax, DWORD PTR _bytes_read$[ebp]
	push	eax
	push	1
	mov	eax, DWORD PTR _bytes_read$[ebp]
	add	eax, DWORD PTR _music_buffer
	push	eax
	call	_fread
	add	esp, 16					; 00000010H
; Line 153
$L406:
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L407
$L408:
	inc	DWORD PTR _i$[ebp]
$L407:
	cmp	DWORD PTR _i$[ebp], 1024		; 00000400H
	jge	$L409
; Line 154
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _mix_buffer
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*2]
	sar	edx, 4
	mov	DWORD PTR -12+[ebp], edx
	fild	DWORD PTR -12+[ebp]
	fmul	QWORD PTR $T428
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _music_buffer
	xor	edx, edx
	mov	dl, BYTE PTR [eax+ecx]
	mov	DWORD PTR -16+[ebp], edx
	fild	DWORD PTR -16+[ebp]
	fmul	QWORD PTR $T429
	faddp	ST(1), ST(0)
	call	__ftol
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _ptr$[ebp]
	mov	BYTE PTR [ecx+edx], al
; Line 155
	jmp	$L408
$L409:
; Line 156
$L403:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mix_music ENDP
_TEXT	ENDS
PUBLIC	_mix
_TEXT	SEGMENT
_i$ = -8
_ptr$ = -4
_mix	PROC NEAR
; Line 158
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 162
	cmp	DWORD PTR _current_buffer, 0
	jne	$L414
; Line 163
	mov	eax, DWORD PTR _buffer1
	mov	DWORD PTR _ptr$[ebp], eax
; Line 164
	jmp	$L415
$L414:
; Line 165
	mov	eax, DWORD PTR _buffer2
	mov	DWORD PTR _ptr$[ebp], eax
; Line 166
$L415:
; Line 168
	xor	eax, eax
	mov	al, BYTE PTR _sfx_enable
	test	eax, eax
	jne	$L416
	cmp	DWORD PTR _musicfp, 0
	je	$L416
; Line 169
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_copy_music
	add	esp, 4
; Line 170
	jmp	$L411
; Line 173
$L416:
	push	2048					; 00000800H
	push	0
	mov	eax, DWORD PTR _mix_buffer
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 175
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L417
$L418:
	inc	DWORD PTR _i$[ebp]
$L417:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L419
; Line 176
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_mix_channel
	add	esp, 4
; Line 177
	jmp	$L418
$L419:
; Line 179
	cmp	DWORD PTR _musicfp, 0
	je	$L420
; Line 180
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_mix_music
	add	esp, 4
; Line 181
	jmp	$L421
$L420:
; Line 182
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L422
$L423:
	inc	DWORD PTR _i$[ebp]
$L422:
	cmp	DWORD PTR _i$[ebp], 1024		; 00000400H
	jge	$L424
; Line 183
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _mix_buffer
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*2]
	sar	edx, 4
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _ptr$[ebp]
	mov	BYTE PTR [eax+ecx], dl
; Line 184
	jmp	$L423
$L424:
; Line 185
$L421:
; Line 186
$L411:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mix	ENDP
_TEXT	ENDS
END
