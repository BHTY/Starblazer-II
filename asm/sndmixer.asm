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
; Line 17
	push	ebp
	mov	ebp, esp
; Line 18
	push	256					; 00000100H
	push	0
	push	OFFSET FLAT:_sounds
	call	_memset
	add	esp, 12					; 0000000cH
; Line 19
	push	192					; 000000c0H
	push	0
	push	OFFSET FLAT:_channels
	call	_memset
	add	esp, 12					; 0000000cH
; Line 20
	push	1024					; 00000400H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer1, eax
; Line 21
	push	1024					; 00000400H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _buffer2, eax
; Line 22
	push	1024					; 00000400H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _music_buffer, eax
; Line 23
	push	2048					; 00000800H
	call	_malloc
	add	esp, 4
	mov	DWORD PTR _mix_buffer, eax
; Line 24
	push	1024					; 00000400H
	push	0
	mov	eax, DWORD PTR _buffer1
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 25
	push	1024					; 00000400H
	push	0
	mov	ecx, DWORD PTR _buffer2
	push	ecx
	call	_memset
	add	esp, 12					; 0000000cH
; Line 26
	push	1024					; 00000400H
	push	0
	mov	edx, DWORD PTR _music_buffer
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
; Line 27
	push	2048					; 00000800H
	push	0
	mov	eax, DWORD PTR _mix_buffer
	push	eax
	call	_memset
	add	esp, 12					; 0000000cH
; Line 29
	mov	DWORD PTR _current_buffer, 0
; Line 30
	pop	ebp
	ret	0
_init_sound ENDP
_TEXT	ENDS
PUBLIC	_play_music
EXTRN	_fopen:NEAR
_DATA	SEGMENT
$SG360	DB	'rb', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_play_music PROC NEAR
; Line 32
	push	ebp
	mov	ebp, esp
; Line 33
	push	OFFSET FLAT:$SG360
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _musicfp, eax
; Line 34
	pop	ebp
	ret	0
_play_music ENDP
_TEXT	ENDS
PUBLIC	_stop_music
EXTRN	_fclose:NEAR
_TEXT	SEGMENT
_stop_music PROC NEAR
; Line 36
	push	ebp
	mov	ebp, esp
; Line 37
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L363
	mov	eax, DWORD PTR _musicfp
	push	eax
	call	_fclose
	add	esp, 4
$L363:
; Line 38
	mov	DWORD PTR _musicfp, 0
; Line 39
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
$SG370	DB	'rb', 00H
_DATA	ENDS
_TEXT	SEGMENT
_filename$ = 8
_priority$ = 12
_loop$ = 16
_fp$ = -12
_i$ = -4
_sz$ = -8
_load_soundfx PROC NEAR
; Line 50
	push	ebp
	mov	ebp, esp
	sub	esp, 12					; 0000000cH
; Line 51
	push	OFFSET FLAT:$SG370
	mov	eax, DWORD PTR _filename$[ebp]
	push	eax
	call	_fopen
	add	esp, 8
	mov	DWORD PTR _fp$[ebp], eax
; Line 54
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L373
$L374:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L373:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	$L375
; Line 55
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	cmp	DWORD PTR _sounds[edx], 0
	jne	$L376
; Line 56
	mov	eax, DWORD PTR _i$[ebp]
	shl	eax, 4
	mov	cl, BYTE PTR _loop$[ebp]
	mov	BYTE PTR _sounds[eax+12], cl
; Line 57
	mov	edx, DWORD PTR _i$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _priority$[ebp]
	and	eax, 255				; 000000ffH
	mov	DWORD PTR _sounds[edx+8], eax
; Line 58
	push	2
	push	0
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 59
	mov	edx, DWORD PTR _fp$[ebp]
	push	edx
	call	_ftell
	add	esp, 4
	mov	DWORD PTR _sz$[ebp], eax
; Line 60
	push	0
	push	0
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fseek
	add	esp, 12					; 0000000cH
; Line 61
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	edx, DWORD PTR _sz$[ebp]
	mov	DWORD PTR _sounds[ecx+4], edx
; Line 62
	mov	eax, DWORD PTR _sz$[ebp]
	push	eax
	call	_malloc
	add	esp, 4
	mov	ecx, DWORD PTR _i$[ebp]
	shl	ecx, 4
	mov	DWORD PTR _sounds[ecx], eax
; Line 63
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
; Line 64
	mov	eax, DWORD PTR _fp$[ebp]
	push	eax
	call	_fclose
	add	esp, 4
; Line 65
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L368
$L376:
; Line 67
	jmp	$L374
$L375:
; Line 69
	mov	ecx, DWORD PTR _fp$[ebp]
	push	ecx
	call	_fclose
	add	esp, 4
; Line 70
	or	eax, -1
$L368:
; Line 71
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
; Line 80
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 84
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L381
$L382:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L381:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L383
; Line 85
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	xor	edx, edx
	mov	dl, BYTE PTR _channels[ecx]
	test	edx, edx
	jne	SHORT $L384
; Line 86
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	BYTE PTR _channels[eax], 1
; Line 87
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	DWORD PTR _channels[ecx+8], 0
; Line 88
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _index$[ebp]
	mov	DWORD PTR _channels[edx+4], eax
; Line 89
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L379
$L384:
; Line 91
	jmp	SHORT $L382
$L383:
; Line 94
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L385
$L386:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L385:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L387
; Line 95
	mov	edx, DWORD PTR _index$[ebp]
	shl	edx, 4
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	ecx, DWORD PTR _channels[eax+4]
	shl	ecx, 4
	mov	edx, DWORD PTR _sounds[edx+8]
	cmp	edx, DWORD PTR _sounds[ecx+8]
	jg	SHORT $L388
; Line 96
	mov	eax, DWORD PTR _i$[ebp]
	imul	eax, 12					; 0000000cH
	mov	BYTE PTR _channels[eax], 1
; Line 97
	mov	ecx, DWORD PTR _i$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	DWORD PTR _channels[ecx+8], 0
; Line 98
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _index$[ebp]
	mov	DWORD PTR _channels[edx+4], eax
; Line 99
	mov	eax, DWORD PTR _i$[ebp]
	jmp	SHORT $L379
$L388:
; Line 101
	jmp	SHORT $L386
$L387:
; Line 104
	or	eax, -1
$L379:
; Line 105
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
; Line 109
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 112
	mov	eax, DWORD PTR _ch$[ebp]
	imul	eax, 12					; 0000000cH
	xor	ecx, ecx
	mov	cl, BYTE PTR _channels[eax]
	test	ecx, ecx
	jne	SHORT $L395
; Line 113
	jmp	$L400
$L395:
; Line 116
	mov	edx, DWORD PTR _ch$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _channels[edx+4]
	shl	eax, 4
	mov	ecx, DWORD PTR _ch$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	edx, DWORD PTR _sounds[eax+4]
	sub	edx, DWORD PTR _channels[ecx+8]
	mov	DWORD PTR _samples_remaining$[ebp], edx
; Line 117
	cmp	DWORD PTR _samples_remaining$[ebp], 1024 ; 00000400H
	jae	SHORT $L432
	mov	eax, DWORD PTR _samples_remaining$[ebp]
	mov	DWORD PTR -16+[ebp], eax
	jmp	SHORT $L433
$L432:
	mov	DWORD PTR -16+[ebp], 1024		; 00000400H
$L433:
	mov	ecx, DWORD PTR -16+[ebp]
	mov	DWORD PTR _samples$[ebp], ecx
; Line 119
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L396
$L397:
	mov	edx, DWORD PTR _i$[ebp]
	add	edx, 1
	mov	DWORD PTR _i$[ebp], edx
$L396:
	mov	eax, DWORD PTR _i$[ebp]
	cmp	eax, DWORD PTR _samples$[ebp]
	jae	SHORT $L398
; Line 120
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
; Line 121
	jmp	SHORT $L397
$L398:
; Line 123
	cmp	DWORD PTR _samples_remaining$[ebp], 1024 ; 00000400H
	ja	SHORT $L399
; Line 124
	mov	ecx, DWORD PTR _ch$[ebp]
	imul	ecx, 12					; 0000000cH
	mov	BYTE PTR _channels[ecx], 0
$L399:
$L400:
; Line 129
	mov	esp, ebp
	pop	ebp
	ret	0
_mix_channel ENDP
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
; Line 131
	push	ebp
	mov	ebp, esp
	sub	esp, 16					; 00000010H
; Line 135
	mov	eax, DWORD PTR _musicfp
	push	eax
	push	1024					; 00000400H
	push	1
	mov	ecx, DWORD PTR _music_buffer
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
	mov	edx, DWORD PTR _music_buffer
	add	edx, DWORD PTR _bytes_read$[ebp]
	push	edx
	call	_fread
	add	esp, 16					; 00000010H
$L406:
; Line 142
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L407
$L408:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L407:
	cmp	DWORD PTR _i$[ebp], 1024		; 00000400H
	jge	SHORT $L409
; Line 143
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
; Line 144
	jmp	SHORT $L408
$L409:
; Line 145
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
; Line 147
	push	ebp
	mov	ebp, esp
	sub	esp, 8
; Line 151
	cmp	DWORD PTR _current_buffer, 0
	jne	SHORT $L414
; Line 152
	mov	eax, DWORD PTR _buffer1
	mov	DWORD PTR _ptr$[ebp], eax
; Line 153
	jmp	SHORT $L415
$L414:
; Line 154
	mov	ecx, DWORD PTR _buffer2
	mov	DWORD PTR _ptr$[ebp], ecx
$L415:
; Line 157
	push	2048					; 00000800H
	push	0
	mov	edx, DWORD PTR _mix_buffer
	push	edx
	call	_memset
	add	esp, 12					; 0000000cH
; Line 159
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L416
$L417:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L416:
	cmp	DWORD PTR _i$[ebp], 16			; 00000010H
	jge	SHORT $L418
; Line 160
	mov	ecx, DWORD PTR _i$[ebp]
	push	ecx
	call	_mix_channel
	add	esp, 4
; Line 161
	jmp	SHORT $L417
$L418:
; Line 163
	cmp	DWORD PTR _musicfp, 0
	je	SHORT $L419
; Line 164
	mov	edx, DWORD PTR _ptr$[ebp]
	push	edx
	call	_mix_music
	add	esp, 4
; Line 165
	jmp	SHORT $L423
$L419:
; Line 166
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L421
$L422:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L421:
	cmp	DWORD PTR _i$[ebp], 1024		; 00000400H
	jge	SHORT $L423
; Line 167
	mov	ecx, DWORD PTR _i$[ebp]
	mov	edx, DWORD PTR _mix_buffer
	xor	eax, eax
	mov	ax, WORD PTR [edx+ecx*2]
	sar	eax, 4
	mov	ecx, DWORD PTR _ptr$[ebp]
	add	ecx, DWORD PTR _i$[ebp]
	mov	BYTE PTR [ecx], al
; Line 168
	jmp	SHORT $L422
$L423:
; Line 170
	mov	esp, ebp
	pop	ebp
	ret	0
_mix	ENDP
_TEXT	ENDS
END
