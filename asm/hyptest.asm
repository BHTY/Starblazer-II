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
;	COMDAT ??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@
_DATA	SEGMENT DWORD USE32 PUBLIC 'DATA'
_DATA	ENDS
;	COMDAT _init_hypercraft
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _set_hypercraft_orientation
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _rot_hypercraft
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _draw_hypercraft
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _destroy_hypercraft
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_MAX_ROT
_DATA	SEGMENT
COMM	_shading:BYTE
COMM	_hypercraft:DWORD
COMM	_hc_template:DWORD
COMM	_hyptest_ori:BYTE:010H
_MAX_ROT DB	01fH
_DATA	ENDS
PUBLIC	_init_hypercraft
PUBLIC	??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@		; `string'
EXTRN	_quat_create:NEAR
EXTRN	_StarblazerEntities:BYTE
EXTRN	_spawn_entity:NEAR
EXTRN	_load_model:NEAR
;	COMDAT ??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@
_DATA	SEGMENT
??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ DB 'assets/hyper.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT _init_hypercraft
_TEXT	SEGMENT
; File src\hyptest.c
_init_hypercraft PROC NEAR				; COMDAT
; Line 18
	mov	BYTE PTR _shading, 1
; Line 19
	push	OFFSET FLAT:??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ ; `string'
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
	push	eax
	call	_spawn_entity
	add	esp, 28					; 0000001cH
	lea	eax, DWORD PTR _StarblazerEntities[eax*4]
; Line 22
	mov	ecx, DWORD PTR [eax]
	push	OFFSET FLAT:_hyptest_ori
	push	0
	mov	DWORD PTR _hypercraft, ecx
; Line 23
	push	0
	mov	DWORD PTR [eax], 0
; Line 25
	push	0
	call	_quat_create
	add	esp, 16					; 00000010H
; Line 26
	ret	0
_init_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_set_hypercraft_orientation
;	COMDAT _set_hypercraft_orientation
_TEXT	SEGMENT
_quat$ = 8
_set_hypercraft_orientation PROC NEAR			; COMDAT
; Line 29
	lea	ecx, DWORD PTR _quat$[esp-4]
	mov	edx, DWORD PTR _hypercraft
	add	edx, 16					; 00000010H
	mov	eax, DWORD PTR [ecx]
	mov	DWORD PTR [edx], eax
	mov	eax, DWORD PTR [ecx+4]
	mov	DWORD PTR [edx+4], eax
	mov	eax, DWORD PTR [ecx+8]
	mov	ecx, DWORD PTR [ecx+12]
	mov	DWORD PTR [edx+8], eax
	mov	DWORD PTR [edx+12], ecx
; Line 30
	ret	0
_set_hypercraft_orientation ENDP
_TEXT	ENDS
PUBLIC	_rot_hypercraft
EXTRN	_quat_pitch:NEAR
EXTRN	_quat_yaw:NEAR
EXTRN	_quat_roll:NEAR
EXTRN	_vjoy_read:NEAR
EXTRN	_angle_multiply:NEAR
;	COMDAT _rot_hypercraft
_TEXT	SEGMENT
_joy$ = -8
_rot_hypercraft PROC NEAR				; COMDAT
; Line 32
	sub	esp, 8
; Line 36
	lea	eax, DWORD PTR _joy$[esp+8]
	push	eax
	call	_vjoy_read
	mov	ecx, DWORD PTR _joy$[esp+12]
	add	esp, 4
; Line 39
	mov	eax, DWORD PTR _hypercraft
	mov	dl, BYTE PTR _MAX_ROT
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
	mov	ecx, DWORD PTR _joy$[esp+17]
	add	esp, 8
; Line 41
	mov	eax, DWORD PTR _hypercraft
	mov	dl, BYTE PTR _MAX_ROT
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
	mov	ecx, DWORD PTR _joy$[esp+18]
	add	esp, 8
; Line 43
	mov	eax, DWORD PTR _hypercraft
	mov	dl, BYTE PTR _MAX_ROT
	add	eax, 16					; 00000010H
	push	eax
	push	ecx
	push	edx
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_roll
; Line 44
	add	esp, 16					; 00000010H
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
;	COMDAT _draw_hypercraft
_TEXT	SEGMENT
_centerX$ = 8
_centerY$ = 12
_vec$ = -48
_mat$ = -36
_draw_hypercraft PROC NEAR				; COMDAT
; Line 46
	sub	esp, 48					; 00000030H
	lea	eax, DWORD PTR _mat$[esp+48]
	push	ebx
	push	esi
	push	edi
	movsx	esi, WORD PTR _SL_CENTER_X
	movsx	edi, WORD PTR _SL_CENTER_Y
	push	ebp
; Line 54
	push	eax
	mov	eax, DWORD PTR _hypercraft
	xor	ebx, ebx
	add	eax, 16					; 00000010H
	push	eax
	call	_quat_tomat
	mov	ecx, DWORD PTR _centerX$[esp+68]
	mov	DWORD PTR _vec$[esp+72], ebx
	mov	WORD PTR _SL_CENTER_X, cx
	mov	eax, DWORD PTR _centerY$[esp+68]
	mov	WORD PTR _SL_CENTER_Y, ax
	mov	DWORD PTR _vec$[esp+76], ebx
	mov	DWORD PTR _vec$[esp+80], ebx
	add	esp, 8
; Line 64
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_hyptest_ori
	call	_quat_tomat
	add	esp, 8
; Line 65
	call	_render_begin
; Line 66
	lea	ecx, DWORD PTR _vec$[esp+64]
	push	ecx
	call	_camera_translate
	add	esp, 4
	mov	ecx, DWORD PTR _hc_template
; Line 68
	cmp	WORD PTR [ecx+8], bx
	jbe	SHORT $L305
	xor	ebp, ebp
$L303:
; Line 69
	lea	eax, DWORD PTR _vec$[esp+64]
	mov	ecx, DWORD PTR _hc_template
	push	eax
	inc	ebx
	mov	eax, DWORD PTR [ecx+4]
	lea	ecx, DWORD PTR _mat$[esp+68]
	add	eax, ebp
	add	ebp, 12					; 0000000cH
	push	eax
	push	ecx
	call	_mat3_mul
	lea	ecx, DWORD PTR _vec$[esp+76]
	add	esp, 12					; 0000000cH
; Line 70
	mov	eax, DWORD PTR _hypercraft
	push	ecx
	add	eax, 4
	push	eax
	call	_vec3_add
	lea	ecx, DWORD PTR _vec$[esp+72]
	add	esp, 8
; Line 71
	push	ecx
	call	_put_vertex
	add	esp, 4
	mov	eax, DWORD PTR _hc_template
; Line 68
	xor	ecx, ecx
	mov	cx, WORD PTR [eax+8]
	cmp	ecx, ebx
	jg	SHORT $L303
; Line 72
$L305:
; Line 74
	push	0
	mov	eax, DWORD PTR _hc_template
	mov	ax, WORD PTR [eax+10]
	push	0
	push	eax
	mov	ecx, DWORD PTR _hc_template
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_put_triangles
	add	esp, 16					; 00000010H
; Line 76
	call	_polygon_zsort
; Line 77
	mov	cl, BYTE PTR _shading
	push	ecx
	call	_render_end
	mov	WORD PTR _SL_CENTER_X, si
	add	esp, 4
; Line 80
	mov	WORD PTR _SL_CENTER_Y, di
	pop	ebp
; Line 81
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 48					; 00000030H
	ret	0
_draw_hypercraft ENDP
_TEXT	ENDS
PUBLIC	_destroy_hypercraft
EXTRN	_free:NEAR
;	COMDAT _destroy_hypercraft
_TEXT	SEGMENT
_destroy_hypercraft PROC NEAR				; COMDAT
; Line 84
	mov	eax, DWORD PTR _hypercraft
	push	eax
	call	_free
	add	esp, 4
	mov	eax, DWORD PTR _hc_template
; Line 85
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_free
	add	esp, 4
	mov	ecx, DWORD PTR _hc_template
; Line 86
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	call	_free
	add	esp, 4
	mov	ecx, DWORD PTR _hc_template
; Line 87
	push	ecx
	call	_free
	add	esp, 4
; Line 88
	ret	0
_destroy_hypercraft ENDP
_TEXT	ENDS
END
