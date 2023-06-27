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
_MAX_ROT DB	01fH
_DATA	ENDS
PUBLIC	_init_hypercraft
EXTRN	_quat_create:NEAR
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_load_model:NEAR
_DATA	SEGMENT
	ORG $+3
$SG222	DB	'assets/hyper.obj', 00H
_DATA	ENDS
_TEXT	SEGMENT
_id$ = -4
_init_hypercraft PROC NEAR
; File src\hyptest.c
; Line 15
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 17
	push	OFFSET FLAT:$SG222
	call	_load_model
	add	esp, 4
	mov	DWORD PTR _hc_template, eax
; Line 19
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
; Line 20
	mov	ecx, DWORD PTR _id$[ebp]
	mov	edx, DWORD PTR _StarblazerEntities[ecx*4]
	mov	DWORD PTR _hypercraft, edx
; Line 21
	mov	eax, DWORD PTR _id$[ebp]
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
; Line 23
	push	OFFSET FLAT:_hyptest_ori
	push	0
	push	0
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 24
	mov	esp, ebp
	pop	ebp
	ret	0
_init_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_set_hypercraft_orientation
_TEXT	SEGMENT
_quat$ = 8
_set_hypercraft_orientation PROC NEAR
; Line 26
	push	ebp
	mov	ebp, esp
; Line 27
	mov	eax, DWORD PTR _hypercraft
	add	eax, 16					; 00000010H
	mov	ecx, DWORD PTR _quat$[ebp]
	mov	DWORD PTR [eax], ecx
	mov	edx, DWORD PTR _quat$[ebp+4]
	mov	DWORD PTR [eax+4], edx
	mov	ecx, DWORD PTR _quat$[ebp+8]
	mov	DWORD PTR [eax+8], ecx
	mov	edx, DWORD PTR _quat$[ebp+12]
	mov	DWORD PTR [eax+12], edx
; Line 28
	pop	ebp
	ret	0
_set_hypercraft_orientation ENDP
_TEXT	ENDS
PUBLIC	_rot_hypercraft
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
EXTRN	_vjoy_read:NEAR
EXTRN	_angle_multiply:NEAR
_TEXT	SEGMENT
_joy$ = -44
_rot_hypercraft PROC NEAR
; Line 30
	push	ebp
	mov	ebp, esp
	sub	esp, 56					; 00000038H
; Line 34
	lea	eax, DWORD PTR _joy$[ebp]
	push	eax
	call	_vjoy_read
	add	esp, 4
; Line 37
	mov	ecx, DWORD PTR _hypercraft
	add	ecx, 16					; 00000010H
	push	ecx
	mov	dl, BYTE PTR _joy$[ebp]
	push	edx
	mov	al, BYTE PTR _MAX_ROT
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
	add	esp, 8
; Line 39
	mov	ecx, DWORD PTR _hypercraft
	add	ecx, 16					; 00000010H
	push	ecx
	mov	dl, BYTE PTR _joy$[ebp+1]
	push	edx
	mov	al, BYTE PTR _MAX_ROT
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
	add	esp, 8
; Line 41
	mov	ecx, DWORD PTR _hypercraft
	add	ecx, 16					; 00000010H
	push	ecx
	mov	dl, BYTE PTR _joy$[ebp+2]
	push	edx
	mov	al, BYTE PTR _MAX_ROT
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
	add	esp, 8
; Line 42
	mov	esp, ebp
	pop	ebp
	ret	0
_rot_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_draw_hypercraft
EXTRN	_vec3_add:NEAR
EXTRN	_mat3_mul:NEAR
EXTRN	_quat_tomat:NEAR
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
; Line 44
	push	ebp
	mov	ebp, esp
	sub	esp, 60					; 0000003cH
; Line 49
	movsx	eax, WORD PTR _SL_CENTER_X
	mov	DWORD PTR _old_centerX$[ebp], eax
; Line 50
	movsx	ecx, WORD PTR _SL_CENTER_Y
	mov	DWORD PTR _old_centerY$[ebp], ecx
; Line 52
	lea	edx, DWORD PTR _mat$[ebp]
	push	edx
	mov	eax, DWORD PTR _hypercraft
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	add	esp, 8
; Line 54
	mov	DWORD PTR _vec$[ebp], 0
; Line 55
	mov	DWORD PTR _vec$[ebp+4], 0
; Line 56
	mov	DWORD PTR _vec$[ebp+8], 0
; Line 58
	mov	cx, WORD PTR _centerX$[ebp]
	mov	WORD PTR _SL_CENTER_X, cx
; Line 59
	mov	dx, WORD PTR _centerY$[ebp]
	mov	WORD PTR _SL_CENTER_Y, dx
; Line 62
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_hyptest_ori
	call	_quat_tomat
	add	esp, 8
; Line 63
	call	_render_begin
; Line 64
	lea	eax, DWORD PTR _vec$[ebp]
	push	eax
	call	_camera_translate
	add	esp, 4
; Line 66
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L237
$L238:
	mov	ecx, DWORD PTR _i$[ebp]
	add	ecx, 1
	mov	DWORD PTR _i$[ebp], ecx
$L237:
	mov	edx, DWORD PTR _hc_template
	xor	eax, eax
	mov	ax, WORD PTR [edx+8]
	cmp	DWORD PTR _i$[ebp], eax
	jge	SHORT $L239
; Line 67
	lea	ecx, DWORD PTR _vec$[ebp]
	push	ecx
	mov	edx, DWORD PTR _i$[ebp]
	imul	edx, 12					; 0000000cH
	mov	eax, DWORD PTR _hc_template
	mov	ecx, DWORD PTR [eax+4]
	add	ecx, edx
	push	ecx
	lea	edx, DWORD PTR _mat$[ebp]
	push	edx
	call	_mat3_mul
	add	esp, 12					; 0000000cH
; Line 68
	lea	eax, DWORD PTR _vec$[ebp]
	push	eax
	mov	ecx, DWORD PTR _hypercraft
	add	ecx, 4
	push	ecx
	call	_vec3_add
	add	esp, 8
; Line 69
	lea	edx, DWORD PTR _vec$[ebp]
	push	edx
	call	_put_vertex
	add	esp, 4
; Line 70
	jmp	SHORT $L238
$L239:
; Line 72
	push	0
	push	0
	mov	eax, DWORD PTR _hc_template
	mov	cx, WORD PTR [eax+10]
	push	ecx
	mov	edx, DWORD PTR _hc_template
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_put_triangles
	add	esp, 16					; 00000010H
; Line 74
	call	_polygon_zsort
; Line 75
	push	1
	call	_render_end
	add	esp, 4
; Line 77
	mov	cx, WORD PTR _old_centerX$[ebp]
	mov	WORD PTR _SL_CENTER_X, cx
; Line 78
	mov	dx, WORD PTR _old_centerY$[ebp]
	mov	WORD PTR _SL_CENTER_Y, dx
; Line 79
	mov	esp, ebp
	pop	ebp
	ret	0
_draw_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_destroy_hypercraft
EXTRN	_free:NEAR
_TEXT	SEGMENT
_destroy_hypercraft PROC NEAR
; Line 81
	push	ebp
	mov	ebp, esp
; Line 82
	mov	eax, DWORD PTR _hypercraft
	push	eax
	call	_free
	add	esp, 4
; Line 83
	mov	ecx, DWORD PTR _hc_template
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_free
	add	esp, 4
; Line 84
	mov	eax, DWORD PTR _hc_template
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_free
	add	esp, 4
; Line 85
	mov	edx, DWORD PTR _hc_template
	push	edx
	call	_free
	add	esp, 4
; Line 86
	pop	ebp
	ret	0
_destroy_hypercraft ENDP
_TEXT	ENDS
END
