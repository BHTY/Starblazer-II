	TITLE	src\hyptest.c
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
PUBLIC	_MAX_ROT
_DATA	SEGMENT
COMM	_hypercraft:DWORD
COMM	_hc_template:DWORD
COMM	_hyptest_ori:BYTE:010H
COMM	_velocity:BYTE:0cH
_MAX_ROT DB	01fH
_DATA	ENDS
PUBLIC	_init_hypercraft
EXTRN	_quat_create:NEAR
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_load_model:NEAR
_DATA	SEGMENT
	ORG $+3
$SG191	DB	'assets\hyper.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
; File src\hyptest.c
_id$ = -4
_init_hypercraft PROC NEAR
; Line 17
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 19
	push	OFFSET FLAT:$SG191
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _hc_template, eax
; Line 21
	push	0
	push	0
	push	0
	push	1638400					; 00190000H
	push	0
	push	0
	mov	eax, DWORD PTR _hc_template
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	mov	DWORD PTR _id$[ebp], eax
; Line 22
	mov	eax, DWORD PTR _id$[ebp]
	mov	eax, DWORD PTR _StarblazerEntities[eax*4]
	mov	DWORD PTR _hypercraft, eax
; Line 23
	mov	eax, DWORD PTR _id$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 25
	push	OFFSET FLAT:_hyptest_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 27
	mov	DWORD PTR _velocity, 0
; Line 28
	mov	DWORD PTR _velocity+4, 0
; Line 29
	mov	DWORD PTR _velocity+8, 65536		; 00010000H
; Line 30
$L189:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_init_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_set_hypercraft_orientation
_TEXT	SEGMENT
_quat$ = 8
_set_hypercraft_orientation PROC NEAR
; Line 32
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 33
	lea	eax, DWORD PTR _quat$[ebp]
	mov	ecx, DWORD PTR _hypercraft
	add	ecx, 16					; 00000010H
	mov	edx, DWORD PTR [eax]
	mov	DWORD PTR [ecx], edx
	mov	edx, DWORD PTR [eax+4]
	mov	DWORD PTR [ecx+4], edx
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [ecx+8], edx
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR [ecx+12], eax
; Line 34
$L193:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_set_hypercraft_orientation ENDP
_TEXT	ENDS
PUBLIC	_rot_hypercraft
EXTRN	_vec3_add:NEAR
EXTRN	_mat3_mul:NEAR
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
EXTRN	_quat_tomat:NEAR
EXTRN	_vjoy_read:NEAR
EXTRN	_angle_multiply:NEAR
EXTRN	_SG_KeyDown:NEAR
_TEXT	SEGMENT
_newvec$ = -56
_rot_mat$ = -36
_joy$ = -44
_rot_hypercraft PROC NEAR
; Line 36
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
	push	ebx
	push	esi
	push	edi
; Line 40
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 43
	mov	eax, DWORD PTR _hypercraft
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _joy$[ebp]
	push	eax
	mov	al, BYTE PTR _MAX_ROT
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
	add	esp, 8
; Line 45
	mov	eax, DWORD PTR _hypercraft
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _joy$[ebp+1]
	push	eax
	mov	al, BYTE PTR _MAX_ROT
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
	add	esp, 8
; Line 47
	mov	eax, DWORD PTR _hypercraft
	add	eax, 16					; 00000010H
	push	eax
	mov	eax, DWORD PTR _joy$[ebp+2]
	push	eax
	mov	al, BYTE PTR _MAX_ROT
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
	add	esp, 8
; Line 49
	push	75					; 0000004bH
	call	_SG_KeyDown
	add	esp, 4
	test	eax, eax
	je	$L199
; Line 50
	lea	eax, DWORD PTR _rot_mat$[ebp]
	push	eax
	mov	eax, DWORD PTR _hypercraft
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 51
	lea	eax, DWORD PTR _newvec$[ebp]
	push	eax
	push	OFFSET FLAT:_velocity
	lea	eax, DWORD PTR _rot_mat$[ebp]
	push	eax
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 52
	mov	eax, DWORD PTR _hypercraft
	add	eax, 4
	push	eax
	lea	eax, DWORD PTR _newvec$[ebp]
	push	eax
	call	_vec3_add
	add	esp, 8
; Line 54
$L199:
$L194:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_rot_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_draw_hypercraft
EXTRN	_SL_CAMERA_ORIENTATION:BYTE
EXTRN	_SL_CENTER_X:WORD
EXTRN	_SL_CENTER_Y:WORD
EXTRN	_render_begin:NEAR
EXTRN	_camera_translate:NEAR
EXTRN	_put_vertex:NEAR
EXTRN	_put_triangles:NEAR
EXTRN	_polygon_zsort:NEAR
EXTRN	_render_end:NEAR
_TEXT	SEGMENT
_centerX$ = 8
_centerY$ = 12
_vec$ = -48
_mat$ = -36
_i$ = -52
_old_centerX$ = -56
_old_centerY$ = -60
_draw_hypercraft PROC NEAR
; Line 56
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
	push	ebx
	push	esi
	push	edi
; Line 61
	movsx	eax, WORD PTR _SL_CENTER_X
	mov	DWORD PTR _old_centerX$[ebp], eax
; Line 62
	movsx	eax, WORD PTR _SL_CENTER_Y
	mov	DWORD PTR _old_centerY$[ebp], eax
; Line 64
	lea	eax, DWORD PTR _mat$[ebp]
	push	eax
	mov	eax, DWORD PTR _hypercraft
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 66
	mov	DWORD PTR _vec$[ebp], 0
; Line 67
	mov	DWORD PTR _vec$[ebp+4], 0
; Line 68
	mov	DWORD PTR _vec$[ebp+8], 0
; Line 70
	mov	eax, DWORD PTR _centerX$[ebp]
	mov	WORD PTR _SL_CENTER_X, ax
; Line 71
	mov	eax, DWORD PTR _centerY$[ebp]
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 74
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_hyptest_ori
	call	_quat_tomat
	add	esp, 8
; Line 75
	call	_render_begin
; Line 76
	lea	eax, DWORD PTR _vec$[ebp]
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 78
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L208
$L209:
	inc	DWORD PTR _i$[ebp]
$L208:
	mov	eax, DWORD PTR _hc_template
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	cmp	ecx, DWORD PTR _i$[ebp]
	jle	$L210
; Line 79
	lea	eax, DWORD PTR _vec$[ebp]
	push	eax
	mov	eax, DWORD PTR _hc_template
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _i$[ebp]
	lea	ecx, DWORD PTR [ecx+ecx*2]
	lea	eax, DWORD PTR [eax+ecx*4]
	push	eax
	lea	eax, DWORD PTR _mat$[ebp]
	push	eax
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 80
	lea	eax, DWORD PTR _vec$[ebp]
	push	eax
	mov	eax, DWORD PTR _hypercraft
	add	eax, 4
	push	eax
	call	_vec3_add
	add	esp, 8
; Line 81
	lea	eax, DWORD PTR _vec$[ebp]
	push	eax
	call	_put_vertex
	add	esp, 4
; Line 82
	jmp	$L209
$L210:
; Line 84
	push	0
	push	0
	mov	eax, DWORD PTR _hc_template
	mov	ax, WORD PTR [eax+10]
	push	eax
	mov	eax, DWORD PTR _hc_template
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_put_triangles
	add	esp, 16					; 00000010H
; Line 86
	call	_polygon_zsort
; Line 87
	push	0
	call	_render_end
	add	esp, 4
; Line 89
	mov	eax, DWORD PTR _old_centerX$[ebp]
	mov	WORD PTR _SL_CENTER_X, ax
; Line 90
	mov	eax, DWORD PTR _old_centerY$[ebp]
	mov	WORD PTR _SL_CENTER_Y, ax
; Line 91
$L202:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_draw_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_destroy_hypercraft
EXTRN	_free:NEAR
_TEXT	SEGMENT
_destroy_hypercraft PROC NEAR
; Line 93
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 94
	mov	eax, DWORD PTR _hypercraft
	push	eax
	call	_free
	add	esp, 4
; Line 95
	mov	eax, DWORD PTR _hc_template
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_free
	add	esp, 4
; Line 96
	mov	eax, DWORD PTR _hc_template
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_free
	add	esp, 4
; Line 97
	mov	eax, DWORD PTR _hc_template
	push	eax
	call	_free
	add	esp, 4
; Line 98
$L211:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_destroy_hypercraft ENDP
_TEXT	ENDS
END