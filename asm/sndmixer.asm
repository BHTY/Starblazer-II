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
_init_sound PROC NEAR
; File src\sndmixer.c
; Line 18
	push	ebp
	mov	ebp, esp
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
	mov	ecx, DWORD PTR _buffer2
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
; Line 27
	push	1024					; 00000400H
	push	0
	mov	edx, DWORD PTR _music_buffer
	push	edx
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
	pop	ebp
	ret	0
_init_sound ENDP
_TEXT	ENDS
PUBLIC	_play_music
EXTRN	_fopen:NEAR
_DATA	SEGMENT
$SG361	DB	'rb', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_play_music PROC NEAR
; Line 34
	push	ebp
	mov	ebp, esp
; Line 35
	push	OFFSET FLAT:$SG361
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _musicfp, eax
; Line 36
	pop	ebp
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
; Line 39
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L364
	mov	eax, DWORD PTR _musicfp
	push	eax
	call	_fclose
	add	esp, 4
$L364:
; Line 40
	mov	DWORD PTR _musicfp, 0
; Line 41
	pop	ebp
	ret	0
_stop_music ENDP
_TEXT	ENDS
PUBLIC	_load_soundfx
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_ftell:NEAR
_DATA	SEGMENT
	ORG $+1
$SG371	DB	'rb', 00H
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
; Line 53
	push	OFFSET FLAT:$SG371
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 56
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L374
$L375:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L374:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L376
; Line 57
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	cmp	DWORD PTR _sounds[edx], 0
	jne	$L377
; Line 58
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	cl, BYTE PTR _loop$[ebp]
	mov	BYTE PTR _sounds[eax+12], cl
; Line 59
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _priority$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _sounds[edx+8], eax
; Line 60
	push	2
	push	0
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 61
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
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
	mov	ecx, DWORD PTR _sz$[ebp]
	sub	ecx, 100				; 00000064H
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	mov	DWORD PTR _sounds[edx+4], ecx
; Line 64
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _sounds[ecx], eax
; Line 65
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	push	1
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sounds[ecx]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
; Line 66
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 67
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sounds[ecx]
	add	edx, 70					; 00000046H
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	DWORD PTR _sounds[eax], edx
; Line 68
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L369
$L377:
; Line 70
	jmp	$L375
$L376:
; Line 72
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
; Line 73
	or	eax, -1
$L369:
; Line 74
	mov	esp, ebp
	pop	ebp
	ret	0
_load_soundfx ENDP
_TEXT	ENDS
PUBLIC	_play_soundfx
_TEXT	SEGMENT
_index$ = 8
_i$ = -4
_play_soundfx PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 87
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L382
$L383:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L382:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L384
; Line 88
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	xor	edx, edx
	mov	dl, BYTE PTR _channels[ecx]
	test	edx, edx
	jne	SHORT $L385
; Line 89
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	BYTE PTR _channels[eax], 1
; Line 90
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	DWORD PTR _channels[ecx+8], 0
; Line 91
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _index$[ebp]
	mov	DWORD PTR _channels[edx+4], eax
; Line 92
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L380
$L385:
; Line 94
	jmp	SHORT $L383
$L384:
; Line 97
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L386
$L387:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L386:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L388
; Line 98
	mov	edx, DWORD PTR _index$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _channels[eax+4]
	shl	ecx, 4
	mov	edx, DWORD PTR _sounds[edx+8]
	cmp	edx, DWORD PTR _sounds[ecx+8]
	jg	SHORT $L389
; Line 99
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	BYTE PTR _channels[eax], 1
; Line 100
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	DWORD PTR _channels[ecx+8], 0
; Line 101
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _index$[ebp]
	mov	DWORD PTR _channels[edx+4], eax
; Line 102
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L380
$L389:
; Line 104
	jmp	SHORT $L387
$L388:
; Line 107
	or	eax, -1
$L380:
; Line 108
	mov	esp, ebp
	pop	ebp
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
; Line 112
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 115
	mov	eax, DWORD PTR _ch$[ebp]
	imul	eax, 12					; 0000000cH
	xor	ecx, ecx
	mov	cl, BYTE PTR _channels[eax]
	test	ecx, ecx
	jne	SHORT $L396
; Line 116
	jmp	$L401
$L396:
; Line 119
	mov	edx, DWORD PTR _ch$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _channels[edx+4]
	shl	eax, 4
	mov	ecx, DWORD PTR _ch$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _sounds[eax+4]
	sub	edx, DWORD PTR _channels[ecx+8]
	mov	DWORD PTR _samples_remaining$[ebp], edx
; Line 120
	cmp	DWORD PTR _samples_remaining$[ebp], 1024 ; 00000400H
	jae	SHORT $L439
	mov	eax, DWORD PTR _samples_remaining$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L440
$L439:
	mov	DWORD PTR -16+[ebp], 1024		; 00000400H
$L440:
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _samples$[ebp], ecx
; Line 122
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L397
$L398:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L397:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _samples$[ebp]
	jae	SHORT $L399
; Line 123
	mov	ecx, DWORD PTR _ch$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _channels[ecx+4]
	shl	edx, 4
	mov	eax, DWORD PTR _ch$[ebp]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _sounds[edx]
	mov	edx, DWORD PTR _channels[eax+8]
	movzx	ax, BYTE PTR [ecx+edx]
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _mix_buffer
	mov	cx, WORD PTR [edx+ecx*2]
	add	cx, ax
	mov	edx, DWORD PTR _i$[ebp]
	mov	eax, DWORD PTR _mix_buffer
	mov	WORD PTR [eax+edx*2], cx
	mov	ecx, DWORD PTR _ch$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _channels[ecx+8]
	add	edx, 1
	mov	eax, DWORD PTR _ch$[ebp]
	imul	eax, 12					; 0000000cH
	mov	DWORD PTR _channels[eax+8], edx
; Line 124
	jmp	SHORT $L398
$L399:
; Line 126
	cmp	DWORD PTR _samples_remaining$[ebp], 1024 ; 00000400H
	ja	SHORT $L400
; Line 127
	mov	ecx, DWORD PTR _ch$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	BYTE PTR _channels[ecx], 0
$L400:
$L401:
; Line 132
	mov	esp, ebp
	pop	ebp
	ret	0
_mix_channel ENDP
_TEXT	ENDS
PUBLIC	_copy_music
_TEXT	SEGMENT
_ptr$ = 8
_bytes_read$ = -4
_copy_music PROC NEAR
; Line 134
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 135
	mov	eax, DWORD PTR _musicfp
	push	eax
	push	1024					; 00000400H
	push	1
	mov	ecx, DWORD PTR _ptr$[ebp]
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bytes_read$[ebp], eax
; Line 137
	cmp	DWORD PTR _bytes_read$[ebp], 1024	; 00000400H
	jge	SHORT $L406
; Line 138
	push	0
	push	0
	mov	edx, DWORD PTR _musicfp
	push	edx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 139
	mov	eax, DWORD PTR _musicfp
	push	eax
	mov	ecx, 1024				; 00000400H
	sub	ecx, DWORD PTR _bytes_read$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _ptr$[ebp]
	add	edx, DWORD PTR _bytes_read$[ebp]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
$L406:
; Line 141
	mov	esp, ebp
	pop	ebp
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
_TEXT	SEGMENT
_ptr$ = 8
_i$ = -4
_bytes_read$ = -8
_mix_music PROC NEAR
; File src\sndmixer.c
; Line 143
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 147
	mov	eax, DWORD PTR _musicfp
	push	eax
	push	1024					; 00000400H
	push	1
	mov	ecx, DWORD PTR _music_buffer
	push	ecx
	call	_fread
	add	esp, 16					; 00000010H
	mov	DWORD PTR _bytes_read$[ebp], eax
; Line 149
	cmp	DWORD PTR _bytes_read$[ebp], 1024	; 00000400H
	jge	SHORT $L412
; Line 150
	push	0
	push	0
	mov	edx, DWORD PTR _musicfp
	push	edx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 151
	mov	eax, DWORD PTR _musicfp
	push	eax
	mov	ecx, 1024				; 00000400H
	sub	ecx, DWORD PTR _bytes_read$[ebp]
	push	ecx
	push	1
	mov	edx, DWORD PTR _music_buffer
	add	edx, DWORD PTR _bytes_read$[ebp]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
$L412:
; Line 154
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L413
$L414:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L413:
	cmp	DWORD PTR _i$[ebp], 1024		; 00000400H
	jge	SHORT $L415
; Line 155
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _mix_buffer
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx*2]
	sar	eax, 4
	mov	DWORD PTR -12+[ebp], eax
	fild	DWORD PTR -12+[ebp]
	fmul	QWORD PTR __real@8@3ffec000000000000000
	mov	ecx, DWORD PTR _music_buffer
	add	ecx, DWORD PTR _i$[ebp]
	xor	edx, edx
	mov	dl, BYTE PTR [ecx]
	mov	DWORD PTR -16+[ebp], edx
	fild	DWORD PTR -16+[ebp]
	fmul	QWORD PTR __real@8@3ffd8000000000000000
	faddp	ST(1), ST(0)
	call	__ftol
	mov	ecx, DWORD PTR _ptr$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], al
; Line 156
	jmp	SHORT $L414
$L415:
; Line 157
	mov	esp, ebp
	pop	ebp
	ret	0
_mix_music ENDP
_TEXT	ENDS
PUBLIC	_mix
_TEXT	SEGMENT
_i$ = -8
_ptr$ = -4
_mix	PROC NEAR
; Line 159
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 163
	cmp	DWORD PTR _current_buffer, 0
	jne	SHORT $L420
; Line 164
	mov	eax, DWORD PTR _buffer1
	mov	DWORD PTR _ptr$[ebp], eax
; Line 165
	jmp	SHORT $L421
$L420:
; Line 166
	mov	ecx, DWORD PTR _buffer2
	mov	DWORD PTR _ptr$[ebp], ecx
$L421:
; Line 169
	xor	edx, edx
	mov	dl, BYTE PTR _sfx_enable
	test	edx, edx
	jne	SHORT $L422
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L422
; Line 170
	mov	eax, DWORD PTR _ptr$[ebp]
	push	eax
	call	_copy_music
	add	esp, 4
; Line 171
	jmp	$L430
$L422:
; Line 174
	push	2048					; 00000800H
	push	0
	mov	ecx, DWORD PTR _mix_buffer
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
; Line 176
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L423
$L424:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L423:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L425
; Line 177
	mov	eax, DWORD PTR _i$[ebp]
	push	eax
	call	_mix_channel
	add	esp, 4
; Line 178
	jmp	SHORT $L424
$L425:
; Line 180
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L426
; Line 181
	mov	ecx, DWORD PTR _ptr$[ebp]
	push	ecx
	call	_mix_music
	add	esp, 4
; Line 182
	jmp	SHORT $L430
$L426:
; Line 183
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L428
$L429:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L428:
	cmp	DWORD PTR _i$[ebp], 1024		; 00000400H
	jge	SHORT $L430
; Line 184
	mov	eax, DWORD PTR _i$[ebp]
	mov	ecx, DWORD PTR _mix_buffer
	xor	edx, edx
	mov	dx, WORD PTR [ecx+eax*2]
	sar	edx, 4
	mov	eax, DWORD PTR _ptr$[ebp]
	add	eax, DWORD PTR _i$[ebp]
	mov	BYTE PTR [eax], dl
; Line 185
	jmp	SHORT $L429
$L430:
; Line 187
	mov	esp, ebp
	pop	ebp
	ret	0
_mix	ENDP
_TEXT	ENDS
END
