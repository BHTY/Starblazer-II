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
; File src\hyptest.c
_DATA	SEGMENT
??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ DB 'assets/hyper.obj', 00H ; `string'
_DATA	ENDS
;	COMDAT _init_hypercraft
_TEXT	SEGMENT
_init_hypercraft PROC NEAR				; COMDAT
; File src\hyptest.c
; Line 19
	push	OFFSET FLAT:??_C@_0BB@BDIL@assets?1hyper?4obj?$AA@ ; `string'
	mov	BYTE PTR _shading, 1
	call	_load_model
; Line 21
	push	0
	push	0
	push	0
	push	1638400					; 00190000H
	push	0
	push	0
	push	eax
	mov	DWORD PTR _hc_template, eax
	call	_spawn_entity
; Line 22
	mov	ecx, DWORD PTR _StarblazerEntities[eax*4]
; Line 25
	push	OFFSET FLAT:_hyptest_ori
	push	0
	push	0
	push	0
	mov	DWORD PTR _hypercraft, ecx
	mov	DWORD PTR _StarblazerEntities[eax*4], 0
	call	_quat_create
	add	esp, 48					; 00000030H
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
	mov	eax, DWORD PTR _hypercraft
	mov	ecx, DWORD PTR _quat$[esp-4]
	mov	edx, DWORD PTR _quat$[esp]
	add	eax, 16					; 00000010H
	mov	DWORD PTR [eax], ecx
	mov	ecx, DWORD PTR _quat$[esp+4]
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR _quat$[esp+8]
	mov	DWORD PTR [eax+8], ecx
	mov	DWORD PTR [eax+12], edx
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
; Line 39
	mov	ecx, DWORD PTR _hypercraft
	mov	edx, DWORD PTR _joy$[esp+12]
	mov	al, BYTE PTR _MAX_ROT
	add	esp, 4
	add	ecx, 16					; 00000010H
	push	ecx
	push	edx
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_pitch
; Line 41
	mov	ecx, DWORD PTR _hypercraft
	mov	edx, DWORD PTR _joy$[esp+17]
	mov	al, BYTE PTR _MAX_ROT
	add	esp, 8
	add	ecx, 16					; 00000010H
	push	ecx
	push	edx
	push	eax
	call	_angle_multiply
	add	esp, 8
	push	eax
	call	_quat_yaw
; Line 43
	mov	ecx, DWORD PTR _hypercraft
	mov	edx, DWORD PTR _joy$[esp+18]
	mov	al, BYTE PTR _MAX_ROT
	add	esp, 8
	add	ecx, 16					; 00000010H
	push	ecx
	push	edx
	push	eax
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
; Line 54
	mov	ecx, DWORD PTR _hypercraft
	push	ebx
	movsx	ebx, WORD PTR _SL_CENTER_X
	push	ebp
	lea	eax, DWORD PTR _mat$[esp+56]
	movsx	ebp, WORD PTR _SL_CENTER_Y
	push	esi
	add	ecx, 16					; 00000010H
	push	eax
	push	ecx
	call	_quat_tomat
; Line 60
	mov	dx, WORD PTR _centerX$[esp+64]
; Line 61
	mov	ax, WORD PTR _centerY$[esp+64]
	xor	esi, esi
; Line 64
	push	OFFSET FLAT:_SL_CAMERA_ORIENTATION
	push	OFFSET FLAT:_hyptest_ori
	mov	DWORD PTR _vec$[esp+76], esi
	mov	DWORD PTR _vec$[esp+80], esi
	mov	DWORD PTR _vec$[esp+84], esi
	mov	WORD PTR _SL_CENTER_X, dx
	mov	WORD PTR _SL_CENTER_Y, ax
	call	_quat_tomat
; Line 65
	call	_render_begin
; Line 66
	lea	ecx, DWORD PTR _vec$[esp+76]
	push	ecx
	call	_camera_translate
; Line 68
	mov	eax, DWORD PTR _hc_template
	add	esp, 20					; 00000014H
	cmp	WORD PTR [eax+8], si
	jbe	SHORT $L303
	push	edi
	xor	edi, edi
$L301:
; Line 69
	mov	eax, DWORD PTR [eax+4]
	lea	edx, DWORD PTR _vec$[esp+64]
	add	eax, edi
	push	edx
	lea	ecx, DWORD PTR _mat$[esp+68]
	push	eax
	push	ecx
	call	_mat3_mul
; Line 70
	mov	eax, DWORD PTR _hypercraft
	lea	edx, DWORD PTR _vec$[esp+76]
	add	eax, 4
	push	edx
	push	eax
	call	_vec3_add
; Line 71
	lea	ecx, DWORD PTR _vec$[esp+84]
	push	ecx
	call	_put_vertex
	mov	eax, DWORD PTR _hc_template
	xor	edx, edx
	add	esp, 24					; 00000018H
	inc	esi
	mov	dx, WORD PTR [eax+8]
	add	edi, 12					; 0000000cH
	cmp	esi, edx
	jl	SHORT $L301
	xor	esi, esi
	pop	edi
$L303:
; Line 74
	mov	cx, WORD PTR [eax+10]
	mov	edx, DWORD PTR [eax]
	push	esi
	push	esi
	push	ecx
	push	edx
	call	_put_triangles
; Line 76
	call	_polygon_zsort
; Line 77
	mov	al, BYTE PTR _shading
	push	eax
	call	_render_end
	add	esp, 20					; 00000014H
; Line 80
	mov	WORD PTR _SL_CENTER_Y, bp
	mov	WORD PTR _SL_CENTER_X, bx
	pop	esi
	pop	ebp
	pop	ebx
; Line 81
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
; Line 85
	mov	ecx, DWORD PTR _hc_template
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_free
; Line 86
	mov	eax, DWORD PTR _hc_template
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_free
; Line 87
	mov	edx, DWORD PTR _hc_template
	push	edx
	call	_free
	add	esp, 16					; 00000010H
; Line 88
	ret	0
_destroy_hypercraft ENDP
_TEXT	ENDS
END
