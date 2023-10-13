	TITLE	src\sl_math.c
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
;	COMDAT _int_abs
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _muldiv
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _fixed_mul
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _fixed_div
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _angle_atan2
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _fast_sqrt
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _vec3_add
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _vec3_subtract
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _vec3_cross
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _vec3_normalize
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _vec3_dot
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mat3_mul
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _mat3_inv
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _quat_pitch
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _quat_yaw
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _quat_roll
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _quat_tomat
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _quat_create
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _quat_slerp
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
;	COMDAT _quat_conjugate
_TEXT	SEGMENT PARA USE32 PUBLIC 'CODE'
_TEXT	ENDS
FLAT	GROUP _DATA, CONST, _BSS
	ASSUME	CS: FLAT, DS: FLAT, SS: FLAT
endif
PUBLIC	_SIN_LUT
PUBLIC	_COS_LUT
PUBLIC	_SIN_LUT_SMALL
PUBLIC	_COS_LUT_SMALL
_DATA	SEGMENT
_SIN_LUT DD	00H
	DD	0648H
	DD	0c90H
	DD	012d5H
	DD	01918H
	DD	01f56H
	DD	02590H
	DD	02bc4H
	DD	031f1H
	DD	03817H
	DD	03e34H
	DD	04447H
	DD	04a50H
	DD	0504dH
	DD	0563eH
	DD	05c22H
	DD	061f8H
	DD	067beH
	DD	06d74H
	DD	0731aH
	DD	078adH
	DD	07e2fH
	DD	0839cH
	DD	088f6H
	DD	08e3aH
	DD	09368H
	DD	09880H
	DD	09d80H
	DD	0a268H
	DD	0a736H
	DD	0abebH
	DD	0b086H
	DD	0b505H
	DD	0b968H
	DD	0bdafH
	DD	0c1d8H
	DD	0c5e4H
	DD	0c9d1H
	DD	0cd9fH
	DD	0d14dH
	DD	0d4dbH
	DD	0d848H
	DD	0db94H
	DD	0debeH
	DD	0e1c6H
	DD	0e4aaH
	DD	0e76cH
	DD	0ea0aH
	DD	0ec83H
	DD	0eed9H
	DD	0f109H
	DD	0f314H
	DD	0f4faH
	DD	0f6baH
	DD	0f854H
	DD	0f9c8H
	DD	0fb15H
	DD	0fc3bH
	DD	0fd3bH
	DD	0fe13H
	DD	0fec4H
	DD	0ff4eH
	DD	0ffb1H
	DD	0ffecH
	DD	010000H
	DD	0ffecH
	DD	0ffb1H
	DD	0ff4eH
	DD	0fec4H
	DD	0fe13H
	DD	0fd3bH
	DD	0fc3bH
	DD	0fb15H
	DD	0f9c8H
	DD	0f854H
	DD	0f6baH
	DD	0f4faH
	DD	0f314H
	DD	0f109H
	DD	0eed9H
	DD	0ec83H
	DD	0ea0aH
	DD	0e76cH
	DD	0e4aaH
	DD	0e1c6H
	DD	0debeH
	DD	0db94H
	DD	0d848H
	DD	0d4dbH
	DD	0d14dH
	DD	0cd9fH
	DD	0c9d1H
	DD	0c5e4H
	DD	0c1d8H
	DD	0bdafH
	DD	0b968H
	DD	0b505H
	DD	0b086H
	DD	0abebH
	DD	0a736H
	DD	0a268H
	DD	09d80H
	DD	09880H
	DD	09368H
	DD	08e3aH
	DD	088f6H
	DD	0839cH
	DD	07e2fH
	DD	078adH
	DD	0731aH
	DD	06d74H
	DD	067beH
	DD	061f8H
	DD	05c22H
	DD	0563eH
	DD	0504dH
	DD	04a50H
	DD	04447H
	DD	03e34H
	DD	03817H
	DD	031f1H
	DD	02bc4H
	DD	02590H
	DD	01f56H
	DD	01918H
	DD	012d5H
	DD	0c90H
	DD	0648H
	DD	00H
	DD	0fffff9b8H
	DD	0fffff370H
	DD	0ffffed2bH
	DD	0ffffe6e8H
	DD	0ffffe0aaH
	DD	0ffffda70H
	DD	0ffffd43cH
	DD	0ffffce0fH
	DD	0ffffc7e9H
	DD	0ffffc1ccH
	DD	0ffffbbb9H
	DD	0ffffb5b0H
	DD	0ffffafb3H
	DD	0ffffa9c2H
	DD	0ffffa3deH
	DD	0ffff9e08H
	DD	0ffff9842H
	DD	0ffff928cH
	DD	0ffff8ce6H
	DD	0ffff8753H
	DD	0ffff81d1H
	DD	0ffff7c64H
	DD	0ffff770aH
	DD	0ffff71c6H
	DD	0ffff6c98H
	DD	0ffff6780H
	DD	0ffff6280H
	DD	0ffff5d98H
	DD	0ffff58caH
	DD	0ffff5415H
	DD	0ffff4f7aH
	DD	0ffff4afbH
	DD	0ffff4698H
	DD	0ffff4251H
	DD	0ffff3e28H
	DD	0ffff3a1cH
	DD	0ffff362fH
	DD	0ffff3261H
	DD	0ffff2eb3H
	DD	0ffff2b25H
	DD	0ffff27b8H
	DD	0ffff246cH
	DD	0ffff2142H
	DD	0ffff1e3aH
	DD	0ffff1b56H
	DD	0ffff1894H
	DD	0ffff15f6H
	DD	0ffff137dH
	DD	0ffff1127H
	DD	0ffff0ef7H
	DD	0ffff0cecH
	DD	0ffff0b06H
	DD	0ffff0946H
	DD	0ffff07acH
	DD	0ffff0638H
	DD	0ffff04ebH
	DD	0ffff03c5H
	DD	0ffff02c5H
	DD	0ffff01edH
	DD	0ffff013cH
	DD	0ffff00b2H
	DD	0ffff004fH
	DD	0ffff0014H
	DD	0ffff0000H
	DD	0ffff0014H
	DD	0ffff004fH
	DD	0ffff00b2H
	DD	0ffff013cH
	DD	0ffff01edH
	DD	0ffff02c5H
	DD	0ffff03c5H
	DD	0ffff04ebH
	DD	0ffff0638H
	DD	0ffff07acH
	DD	0ffff0946H
	DD	0ffff0b06H
	DD	0ffff0cecH
	DD	0ffff0ef7H
	DD	0ffff1127H
	DD	0ffff137dH
	DD	0ffff15f6H
	DD	0ffff1894H
	DD	0ffff1b56H
	DD	0ffff1e3aH
	DD	0ffff2142H
	DD	0ffff246cH
	DD	0ffff27b8H
	DD	0ffff2b25H
	DD	0ffff2eb3H
	DD	0ffff3261H
	DD	0ffff362fH
	DD	0ffff3a1cH
	DD	0ffff3e28H
	DD	0ffff4251H
	DD	0ffff4698H
	DD	0ffff4afbH
	DD	0ffff4f7aH
	DD	0ffff5415H
	DD	0ffff58caH
	DD	0ffff5d98H
	DD	0ffff6280H
	DD	0ffff6780H
	DD	0ffff6c98H
	DD	0ffff71c6H
	DD	0ffff770aH
	DD	0ffff7c64H
	DD	0ffff81d1H
	DD	0ffff8753H
	DD	0ffff8ce6H
	DD	0ffff928cH
	DD	0ffff9842H
	DD	0ffff9e08H
	DD	0ffffa3deH
	DD	0ffffa9c2H
	DD	0ffffafb3H
	DD	0ffffb5b0H
	DD	0ffffbbb9H
	DD	0ffffc1ccH
	DD	0ffffc7e9H
	DD	0ffffce0fH
	DD	0ffffd43cH
	DD	0ffffda70H
	DD	0ffffe0aaH
	DD	0ffffe6e8H
	DD	0ffffed2bH
	DD	0fffff370H
	DD	0fffff9b8H
_COS_LUT DD	010000H
	DD	0ffecH
	DD	0ffb1H
	DD	0ff4eH
	DD	0fec4H
	DD	0fe13H
	DD	0fd3bH
	DD	0fc3bH
	DD	0fb15H
	DD	0f9c8H
	DD	0f854H
	DD	0f6baH
	DD	0f4faH
	DD	0f314H
	DD	0f109H
	DD	0eed9H
	DD	0ec83H
	DD	0ea0aH
	DD	0e76cH
	DD	0e4aaH
	DD	0e1c6H
	DD	0debeH
	DD	0db94H
	DD	0d848H
	DD	0d4dbH
	DD	0d14dH
	DD	0cd9fH
	DD	0c9d1H
	DD	0c5e4H
	DD	0c1d8H
	DD	0bdafH
	DD	0b968H
	DD	0b505H
	DD	0b086H
	DD	0abebH
	DD	0a736H
	DD	0a268H
	DD	09d80H
	DD	09880H
	DD	09368H
	DD	08e3aH
	DD	088f6H
	DD	0839cH
	DD	07e2fH
	DD	078adH
	DD	0731aH
	DD	06d74H
	DD	067beH
	DD	061f8H
	DD	05c22H
	DD	0563eH
	DD	0504dH
	DD	04a50H
	DD	04447H
	DD	03e34H
	DD	03817H
	DD	031f1H
	DD	02bc4H
	DD	02590H
	DD	01f56H
	DD	01918H
	DD	012d5H
	DD	0c90H
	DD	0648H
	DD	00H
	DD	0fffff9b8H
	DD	0fffff370H
	DD	0ffffed2bH
	DD	0ffffe6e8H
	DD	0ffffe0aaH
	DD	0ffffda70H
	DD	0ffffd43cH
	DD	0ffffce0fH
	DD	0ffffc7e9H
	DD	0ffffc1ccH
	DD	0ffffbbb9H
	DD	0ffffb5b0H
	DD	0ffffafb3H
	DD	0ffffa9c2H
	DD	0ffffa3deH
	DD	0ffff9e08H
	DD	0ffff9842H
	DD	0ffff928cH
	DD	0ffff8ce6H
	DD	0ffff8753H
	DD	0ffff81d1H
	DD	0ffff7c64H
	DD	0ffff770aH
	DD	0ffff71c6H
	DD	0ffff6c98H
	DD	0ffff6780H
	DD	0ffff6280H
	DD	0ffff5d98H
	DD	0ffff58caH
	DD	0ffff5415H
	DD	0ffff4f7aH
	DD	0ffff4afbH
	DD	0ffff4698H
	DD	0ffff4251H
	DD	0ffff3e28H
	DD	0ffff3a1cH
	DD	0ffff362fH
	DD	0ffff3261H
	DD	0ffff2eb3H
	DD	0ffff2b25H
	DD	0ffff27b8H
	DD	0ffff246cH
	DD	0ffff2142H
	DD	0ffff1e3aH
	DD	0ffff1b56H
	DD	0ffff1894H
	DD	0ffff15f6H
	DD	0ffff137dH
	DD	0ffff1127H
	DD	0ffff0ef7H
	DD	0ffff0cecH
	DD	0ffff0b06H
	DD	0ffff0946H
	DD	0ffff07acH
	DD	0ffff0638H
	DD	0ffff04ebH
	DD	0ffff03c5H
	DD	0ffff02c5H
	DD	0ffff01edH
	DD	0ffff013cH
	DD	0ffff00b2H
	DD	0ffff004fH
	DD	0ffff0014H
	DD	0ffff0000H
	DD	0ffff0014H
	DD	0ffff004fH
	DD	0ffff00b2H
	DD	0ffff013cH
	DD	0ffff01edH
	DD	0ffff02c5H
	DD	0ffff03c5H
	DD	0ffff04ebH
	DD	0ffff0638H
	DD	0ffff07acH
	DD	0ffff0946H
	DD	0ffff0b06H
	DD	0ffff0cecH
	DD	0ffff0ef7H
	DD	0ffff1127H
	DD	0ffff137dH
	DD	0ffff15f6H
	DD	0ffff1894H
	DD	0ffff1b56H
	DD	0ffff1e3aH
	DD	0ffff2142H
	DD	0ffff246cH
	DD	0ffff27b8H
	DD	0ffff2b25H
	DD	0ffff2eb3H
	DD	0ffff3261H
	DD	0ffff362fH
	DD	0ffff3a1cH
	DD	0ffff3e28H
	DD	0ffff4251H
	DD	0ffff4698H
	DD	0ffff4afbH
	DD	0ffff4f7aH
	DD	0ffff5415H
	DD	0ffff58caH
	DD	0ffff5d98H
	DD	0ffff6280H
	DD	0ffff6780H
	DD	0ffff6c98H
	DD	0ffff71c6H
	DD	0ffff770aH
	DD	0ffff7c64H
	DD	0ffff81d1H
	DD	0ffff8753H
	DD	0ffff8ce6H
	DD	0ffff928cH
	DD	0ffff9842H
	DD	0ffff9e08H
	DD	0ffffa3deH
	DD	0ffffa9c2H
	DD	0ffffafb3H
	DD	0ffffb5b0H
	DD	0ffffbbb9H
	DD	0ffffc1ccH
	DD	0ffffc7e9H
	DD	0ffffce0fH
	DD	0ffffd43cH
	DD	0ffffda70H
	DD	0ffffe0aaH
	DD	0ffffe6e8H
	DD	0ffffed2bH
	DD	0fffff370H
	DD	0fffff9b8H
	DD	00H
	DD	0648H
	DD	0c90H
	DD	012d5H
	DD	01918H
	DD	01f56H
	DD	02590H
	DD	02bc4H
	DD	031f1H
	DD	03817H
	DD	03e34H
	DD	04447H
	DD	04a50H
	DD	0504dH
	DD	0563eH
	DD	05c22H
	DD	061f8H
	DD	067beH
	DD	06d74H
	DD	0731aH
	DD	078adH
	DD	07e2fH
	DD	0839cH
	DD	088f6H
	DD	08e3aH
	DD	09368H
	DD	09880H
	DD	09d80H
	DD	0a268H
	DD	0a736H
	DD	0abebH
	DD	0b086H
	DD	0b505H
	DD	0b968H
	DD	0bdafH
	DD	0c1d8H
	DD	0c5e4H
	DD	0c9d1H
	DD	0cd9fH
	DD	0d14dH
	DD	0d4dbH
	DD	0d848H
	DD	0db94H
	DD	0debeH
	DD	0e1c6H
	DD	0e4aaH
	DD	0e76cH
	DD	0ea0aH
	DD	0ec83H
	DD	0eed9H
	DD	0f109H
	DD	0f314H
	DD	0f4faH
	DD	0f6baH
	DD	0f854H
	DD	0f9c8H
	DD	0fb15H
	DD	0fc3bH
	DD	0fd3bH
	DD	0fe13H
	DD	0fec4H
	DD	0ff4eH
	DD	0ffb1H
	DD	0ffecH
_SIN_LUT_SMALL DD 00H
	DD	032H
	DD	065H
	DD	097H
	DD	0c9H
	DD	0fbH
	DD	012eH
	DD	0160H
	DD	0192H
	DD	01c4H
	DD	01f7H
	DD	0229H
	DD	025bH
	DD	028dH
	DD	02c0H
	DD	02f2H
	DD	0324H
	DD	0356H
	DD	0389H
	DD	03bbH
	DD	03edH
	DD	0420H
	DD	0452H
	DD	0484H
	DD	04b6H
	DD	04e9H
	DD	051bH
	DD	054dH
	DD	057fH
	DD	05b2H
	DD	05e4H
	DD	0616H
	DD	0648H
	DD	067bH
	DD	06adH
	DD	06dfH
	DD	0711H
	DD	0744H
	DD	0776H
	DD	07a8H
	DD	07daH
	DD	080dH
	DD	083fH
	DD	0871H
	DD	08a3H
	DD	08d5H
	DD	0908H
	DD	093aH
	DD	096cH
	DD	099eH
	DD	09d1H
	DD	0a03H
	DD	0a35H
	DD	0a67H
	DD	0a9aH
	DD	0accH
	DD	0afeH
	DD	0b30H
	DD	0b62H
	DD	0b95H
	DD	0bc7H
	DD	0bf9H
	DD	0c2bH
	DD	0c5dH
	DD	0c90H
	DD	0cc2H
	DD	0cf4H
	DD	0d26H
	DD	0d59H
	DD	0d8bH
	DD	0dbdH
	DD	0defH
	DD	0e21H
	DD	0e53H
	DD	0e86H
	DD	0eb8H
	DD	0eeaH
	DD	0f1cH
	DD	0f4eH
	DD	0f81H
	DD	0fb3H
	DD	0fe5H
	DD	01017H
	DD	01049H
	DD	0107bH
	DD	010aeH
	DD	010e0H
	DD	01112H
	DD	01144H
	DD	01176H
	DD	011a8H
	DD	011daH
	DD	0120dH
	DD	0123fH
	DD	01271H
	DD	012a3H
	DD	012d5H
	DD	01307H
	DD	01339H
	DD	0136cH
	DD	0139eH
	DD	013d0H
	DD	01402H
	DD	01434H
	DD	01466H
	DD	01498H
	DD	014caH
	DD	014fcH
	DD	0152eH
	DD	01561H
	DD	01593H
	DD	015c5H
	DD	015f7H
	DD	01629H
	DD	0165bH
	DD	0168dH
	DD	016bfH
	DD	016f1H
	DD	01723H
	DD	01755H
	DD	01787H
	DD	017b9H
	DD	017ebH
	DD	0181dH
	DD	01850H
	DD	01882H
	DD	018b4H
	DD	018e6H
	DD	0ffffe6e8H
	DD	0ffffe71aH
	DD	0ffffe74cH
	DD	0ffffe77eH
	DD	0ffffe7b0H
	DD	0ffffe7e3H
	DD	0ffffe815H
	DD	0ffffe847H
	DD	0ffffe879H
	DD	0ffffe8abH
	DD	0ffffe8ddH
	DD	0ffffe90fH
	DD	0ffffe941H
	DD	0ffffe973H
	DD	0ffffe9a5H
	DD	0ffffe9d7H
	DD	0ffffea09H
	DD	0ffffea3bH
	DD	0ffffea6dH
	DD	0ffffea9fH
	DD	0ffffead2H
	DD	0ffffeb04H
	DD	0ffffeb36H
	DD	0ffffeb68H
	DD	0ffffeb9aH
	DD	0ffffebccH
	DD	0ffffebfeH
	DD	0ffffec30H
	DD	0ffffec62H
	DD	0ffffec94H
	DD	0ffffecc7H
	DD	0ffffecf9H
	DD	0ffffed2bH
	DD	0ffffed5dH
	DD	0ffffed8fH
	DD	0ffffedc1H
	DD	0ffffedf3H
	DD	0ffffee26H
	DD	0ffffee58H
	DD	0ffffee8aH
	DD	0ffffeebcH
	DD	0ffffeeeeH
	DD	0ffffef20H
	DD	0ffffef52H
	DD	0ffffef85H
	DD	0ffffefb7H
	DD	0ffffefe9H
	DD	0fffff01bH
	DD	0fffff04dH
	DD	0fffff07fH
	DD	0fffff0b2H
	DD	0fffff0e4H
	DD	0fffff116H
	DD	0fffff148H
	DD	0fffff17aH
	DD	0fffff1adH
	DD	0fffff1dfH
	DD	0fffff211H
	DD	0fffff243H
	DD	0fffff275H
	DD	0fffff2a7H
	DD	0fffff2daH
	DD	0fffff30cH
	DD	0fffff33eH
	DD	0fffff370H
	DD	0fffff3a3H
	DD	0fffff3d5H
	DD	0fffff407H
	DD	0fffff439H
	DD	0fffff46bH
	DD	0fffff49eH
	DD	0fffff4d0H
	DD	0fffff502H
	DD	0fffff534H
	DD	0fffff566H
	DD	0fffff599H
	DD	0fffff5cbH
	DD	0fffff5fdH
	DD	0fffff62fH
	DD	0fffff662H
	DD	0fffff694H
	DD	0fffff6c6H
	DD	0fffff6f8H
	DD	0fffff72bH
	DD	0fffff75dH
	DD	0fffff78fH
	DD	0fffff7c1H
	DD	0fffff7f3H
	DD	0fffff826H
	DD	0fffff858H
	DD	0fffff88aH
	DD	0fffff8bcH
	DD	0fffff8efH
	DD	0fffff921H
	DD	0fffff953H
	DD	0fffff985H
	DD	0fffff9b8H
	DD	0fffff9eaH
	DD	0fffffa1cH
	DD	0fffffa4eH
	DD	0fffffa81H
	DD	0fffffab3H
	DD	0fffffae5H
	DD	0fffffb17H
	DD	0fffffb4aH
	DD	0fffffb7cH
	DD	0fffffbaeH
	DD	0fffffbe0H
	DD	0fffffc13H
	DD	0fffffc45H
	DD	0fffffc77H
	DD	0fffffcaaH
	DD	0fffffcdcH
	DD	0fffffd0eH
	DD	0fffffd40H
	DD	0fffffd73H
	DD	0fffffda5H
	DD	0fffffdd7H
	DD	0fffffe09H
	DD	0fffffe3cH
	DD	0fffffe6eH
	DD	0fffffea0H
	DD	0fffffed2H
	DD	0ffffff05H
	DD	0ffffff37H
	DD	0ffffff69H
	DD	0ffffff9bH
	DD	0ffffffceH
_COS_LUT_SMALL DD 010000H
	DD	010000H
	DD	010000H
	DD	010000H
	DD	010000H
	DD	010000H
	DD	0ffffH
	DD	0ffffH
	DD	0ffffH
	DD	0fffeH
	DD	0fffeH
	DD	0fffeH
	DD	0fffdH
	DD	0fffdH
	DD	0fffcH
	DD	0fffcH
	DD	0fffbH
	DD	0fffaH
	DD	0fffaH
	DD	0fff9H
	DD	0fff8H
	DD	0fff7H
	DD	0fff7H
	DD	0fff6H
	DD	0fff5H
	DD	0fff4H
	DD	0fff3H
	DD	0fff2H
	DD	0fff1H
	DD	0fff0H
	DD	0ffefH
	DD	0ffedH
	DD	0ffecH
	DD	0ffebH
	DD	0ffeaH
	DD	0ffe8H
	DD	0ffe7H
	DD	0ffe6H
	DD	0ffe4H
	DD	0ffe3H
	DD	0ffe1H
	DD	0ffe0H
	DD	0ffdeH
	DD	0ffdcH
	DD	0ffdbH
	DD	0ffd9H
	DD	0ffd7H
	DD	0ffd5H
	DD	0ffd4H
	DD	0ffd2H
	DD	0ffd0H
	DD	0ffceH
	DD	0ffccH
	DD	0ffcaH
	DD	0ffc8H
	DD	0ffc6H
	DD	0ffc4H
	DD	0ffc1H
	DD	0ffbfH
	DD	0ffbdH
	DD	0ffbbH
	DD	0ffb8H
	DD	0ffb6H
	DD	0ffb4H
	DD	0ffb1H
	DD	0ffafH
	DD	0ffacH
	DD	0ffa9H
	DD	0ffa7H
	DD	0ffa4H
	DD	0ffa2H
	DD	0ff9fH
	DD	0ff9cH
	DD	0ff99H
	DD	0ff96H
	DD	0ff94H
	DD	0ff91H
	DD	0ff8eH
	DD	0ff8bH
	DD	0ff88H
	DD	0ff85H
	DD	0ff82H
	DD	0ff7eH
	DD	0ff7bH
	DD	0ff78H
	DD	0ff75H
	DD	0ff71H
	DD	0ff6eH
	DD	0ff6bH
	DD	0ff67H
	DD	0ff64H
	DD	0ff60H
	DD	0ff5dH
	DD	0ff59H
	DD	0ff56H
	DD	0ff52H
	DD	0ff4eH
	DD	0ff4bH
	DD	0ff47H
	DD	0ff43H
	DD	0ff3fH
	DD	0ff3bH
	DD	0ff38H
	DD	0ff34H
	DD	0ff30H
	DD	0ff2cH
	DD	0ff28H
	DD	0ff23H
	DD	0ff1fH
	DD	0ff1bH
	DD	0ff17H
	DD	0ff13H
	DD	0ff0eH
	DD	0ff0aH
	DD	0ff06H
	DD	0ff01H
	DD	0fefdH
	DD	0fef8H
	DD	0fef4H
	DD	0feefH
	DD	0feebH
	DD	0fee6H
	DD	0fee1H
	DD	0feddH
	DD	0fed8H
	DD	0fed3H
	DD	0feceH
	DD	0fec9H
	DD	0fec4H
	DD	0fec9H
	DD	0feceH
	DD	0fed3H
	DD	0fed8H
	DD	0feddH
	DD	0fee1H
	DD	0fee6H
	DD	0feebH
	DD	0feefH
	DD	0fef4H
	DD	0fef8H
	DD	0fefdH
	DD	0ff01H
	DD	0ff06H
	DD	0ff0aH
	DD	0ff0eH
	DD	0ff13H
	DD	0ff17H
	DD	0ff1bH
	DD	0ff1fH
	DD	0ff23H
	DD	0ff28H
	DD	0ff2cH
	DD	0ff30H
	DD	0ff34H
	DD	0ff38H
	DD	0ff3bH
	DD	0ff3fH
	DD	0ff43H
	DD	0ff47H
	DD	0ff4bH
	DD	0ff4eH
	DD	0ff52H
	DD	0ff56H
	DD	0ff59H
	DD	0ff5dH
	DD	0ff60H
	DD	0ff64H
	DD	0ff67H
	DD	0ff6bH
	DD	0ff6eH
	DD	0ff71H
	DD	0ff75H
	DD	0ff78H
	DD	0ff7bH
	DD	0ff7eH
	DD	0ff82H
	DD	0ff85H
	DD	0ff88H
	DD	0ff8bH
	DD	0ff8eH
	DD	0ff91H
	DD	0ff94H
	DD	0ff96H
	DD	0ff99H
	DD	0ff9cH
	DD	0ff9fH
	DD	0ffa2H
	DD	0ffa4H
	DD	0ffa7H
	DD	0ffa9H
	DD	0ffacH
	DD	0ffafH
	DD	0ffb1H
	DD	0ffb4H
	DD	0ffb6H
	DD	0ffb8H
	DD	0ffbbH
	DD	0ffbdH
	DD	0ffbfH
	DD	0ffc1H
	DD	0ffc4H
	DD	0ffc6H
	DD	0ffc8H
	DD	0ffcaH
	DD	0ffccH
	DD	0ffceH
	DD	0ffd0H
	DD	0ffd2H
	DD	0ffd4H
	DD	0ffd5H
	DD	0ffd7H
	DD	0ffd9H
	DD	0ffdbH
	DD	0ffdcH
	DD	0ffdeH
	DD	0ffe0H
	DD	0ffe1H
	DD	0ffe3H
	DD	0ffe4H
	DD	0ffe6H
	DD	0ffe7H
	DD	0ffe8H
	DD	0ffeaH
	DD	0ffebH
	DD	0ffecH
	DD	0ffedH
	DD	0ffefH
	DD	0fff0H
	DD	0fff1H
	DD	0fff2H
	DD	0fff3H
	DD	0fff4H
	DD	0fff5H
	DD	0fff6H
	DD	0fff7H
	DD	0fff7H
	DD	0fff8H
	DD	0fff9H
	DD	0fffaH
	DD	0fffaH
	DD	0fffbH
	DD	0fffcH
	DD	0fffcH
	DD	0fffdH
	DD	0fffdH
	DD	0fffeH
	DD	0fffeH
	DD	0fffeH
	DD	0ffffH
	DD	0ffffH
	DD	0ffffH
	DD	010000H
	DD	010000H
	DD	010000H
	DD	010000H
	DD	010000H
_DATA	ENDS
PUBLIC	_int_abs
;	COMDAT _int_abs
_TEXT	SEGMENT
; File src\sl_math.c
_x$ = 8
_int_abs PROC NEAR					; COMDAT
; Line 10
	mov	ecx, DWORD PTR _x$[esp-4]
	mov	edx, ecx
	shr	edx, 31					; 0000001fH
	neg	edx
; Line 11
	mov	eax, edx
	xor	eax, ecx
	sub	eax, edx
; Line 12
	ret	0
_int_abs ENDP
_TEXT	ENDS
PUBLIC	_muldiv
;	COMDAT _muldiv
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_c$ = 16
_muldiv	PROC NEAR					; COMDAT
; Line 14
	push	ebx
	push	esi
; Line 18
	mov	ecx, DWORD PTR _a$[esp+4]
; Line 19
	xor	ecx, DWORD PTR _b$[esp+4]
; Line 20
	xor	ecx, DWORD PTR _c$[esp+4]
; Line 22
	mov	eax, DWORD PTR _a$[esp+4]
; Line 23
	cmp	eax, 0
; Line 24
	jge	SHORT $no_nega$184
; Line 25
	neg	eax
; Line 27
$no_nega$184:
; Line 28
	mov	ebx, DWORD PTR _b$[esp+4]
; Line 29
	cmp	ebx, 0
; Line 30
	jge	SHORT $no_negb$185
; Line 31
	neg	ebx
; Line 32
$no_negb$185:
; Line 33
	mov	esi, DWORD PTR _c$[esp+4]
; Line 34
	cmp	esi, 0
; Line 35
	jge	SHORT $no_negc$186
; Line 36
	neg	esi
; Line 37
$no_negc$186:
; Line 39
	mul	ebx
; Line 40
	cmp	edx, esi
; Line 41
	jge	SHORT $overflow$187
; Line 42
	div	esi
; Line 43
	cmp	ecx, 0
; Line 44
	jge	SHORT $done$188
; Line 45
	neg	eax
	jmp	SHORT $done$188
; Line 52
$overflow$187:
; Line 53
	mov	eax, 2147483647				; 7fffffffH
; Line 46
$done$188:
; Line 72
	pop	esi
	pop	ebx
	ret	0
_muldiv	ENDP
_TEXT	ENDS
PUBLIC	_fixed_mul
;	COMDAT _fixed_mul
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_mul PROC NEAR					; COMDAT
; Line 77
	mov	eax, DWORD PTR _a$[esp-4]
; Line 78
	imul	DWORD PTR _b$[esp-4]
; Line 79
	shr	eax, 16					; 00000010H
; Line 80
	shl	edx, 16					; 00000010H
; Line 81
	or	eax, edx
; Line 86
	ret	0
_fixed_mul ENDP
_TEXT	ENDS
PUBLIC	_fixed_div
;	COMDAT _fixed_div
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_div PROC NEAR					; COMDAT
; Line 91
	mov	eax, DWORD PTR _a$[esp-4]
; Line 92
	mov	edx, eax
; Line 93
	shr	edx, 16					; 00000010H
; Line 94
	movsx	edx, dx
; Line 95
	shl	eax, 16					; 00000010H
; Line 96
	idiv	DWORD PTR _b$[esp-4]
; Line 101
	ret	0
_fixed_div ENDP
_TEXT	ENDS
PUBLIC	_angle_atan2
;	COMDAT _angle_atan2
_TEXT	SEGMENT
_angle_atan2 PROC NEAR					; COMDAT
; Line 105
	xor	al, al
; Line 106
	ret	0
_angle_atan2 ENDP
_TEXT	ENDS
PUBLIC	_fast_sqrt
;	COMDAT _fast_sqrt
_TEXT	SEGMENT
_n$ = 8
_fast_sqrt PROC NEAR					; COMDAT
; Line 107
	push	ebx
	push	esi
	mov	esi, DWORD PTR _n$[esp+4]
	push	edi
; Line 108
	mov	eax, esi
	xor	ebx, ebx
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edi, eax
; Line 113
$L202:
; Line 114
	test	edi, edi
	je	SHORT $L331
; Line 115
	push	edi
	inc	ebx
	push	esi
	call	_fixed_div
	add	esp, 8
	add	eax, edi
	cdq
	sub	eax, edx
	sar	eax, 1
	cmp	ebx, 8
	mov	edi, eax
; Line 113
	jl	SHORT $L202
; Line 117
	mov	eax, edi
; Line 118
	pop	edi
	pop	esi
	pop	ebx
	ret	0
$L331:
; Line 114
	xor	eax, eax
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_fast_sqrt ENDP
_TEXT	ENDS
PUBLIC	_vec3_add
;	COMDAT _vec3_add
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_add PROC NEAR					; COMDAT
; Line 120
	mov	ecx, DWORD PTR _a$[esp-4]
	mov	edx, DWORD PTR _b$[esp-4]
	mov	eax, DWORD PTR [ecx]
	add	DWORD PTR [edx], eax
; Line 121
	mov	eax, DWORD PTR [ecx+4]
	add	DWORD PTR [edx+4], eax
; Line 122
	mov	ecx, DWORD PTR [ecx+8]
	add	DWORD PTR [edx+8], ecx
; Line 123
	ret	0
_vec3_add ENDP
_TEXT	ENDS
PUBLIC	_vec3_subtract
;	COMDAT _vec3_subtract
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_subtract PROC NEAR				; COMDAT
; Line 125
	mov	ecx, DWORD PTR _a$[esp-4]
	mov	edx, DWORD PTR _b$[esp-4]
	mov	eax, DWORD PTR [ecx]
	sub	DWORD PTR [edx], eax
; Line 126
	mov	eax, DWORD PTR [ecx+4]
	sub	DWORD PTR [edx+4], eax
; Line 127
	mov	ecx, DWORD PTR [ecx+8]
	sub	DWORD PTR [edx+8], ecx
; Line 128
	ret	0
_vec3_subtract ENDP
_TEXT	ENDS
PUBLIC	_vec3_cross
;	COMDAT _vec3_cross
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_o$ = 16
_vec3_cross PROC NEAR					; COMDAT
; Line 129
	push	ebx
	push	esi
	mov	esi, DWORD PTR _a$[esp+4]
	push	edi
	push	ebp
	mov	ecx, DWORD PTR [esi+4]
	mov	ebp, DWORD PTR _b$[esp+12]
; Line 130
	mov	eax, DWORD PTR [ebp+8]
	push	eax
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	ecx, DWORD PTR [ebp+4]
	mov	eax, DWORD PTR [esi+8]
	push	ecx
	push	eax
	call	_fixed_mul
	mov	edi, DWORD PTR _o$[esp+20]
	add	esp, 8
	sub	ebx, eax
	mov	DWORD PTR [edi], ebx
; Line 131
	mov	eax, DWORD PTR [ebp]
	mov	ecx, DWORD PTR [esi+8]
	push	eax
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	ecx, DWORD PTR [ebp+8]
	mov	eax, DWORD PTR [esi]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	DWORD PTR [edi+4], ebx
; Line 132
	mov	ecx, DWORD PTR [ebp+4]
	mov	eax, DWORD PTR [esi]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	ecx, DWORD PTR [ebp]
	mov	eax, DWORD PTR [esi+4]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	DWORD PTR [edi+8], ebx
; Line 133
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_vec3_cross ENDP
_TEXT	ENDS
PUBLIC	_vec3_normalize
;	COMDAT _vec3_normalize
_TEXT	SEGMENT
_x$ = 8
_vec3_normalize PROC NEAR				; COMDAT
; Line 137
	push	esi
	push	edi
	mov	esi, DWORD PTR _x$[esp+4]
; Line 138
	mov	eax, DWORD PTR [esi+4]
	push	eax
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	edi, eax
	mov	ecx, DWORD PTR [esi+8]
	push	ecx
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	edi, eax
	mov	ecx, DWORD PTR [esi]
	push	ecx
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	edi, eax
	mov	eax, 2147483647				; 7fffffffH
	js	SHORT $L341
	mov	eax, DWORD PTR [esi+4]
	push	eax
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	edi, eax
	mov	ecx, DWORD PTR [esi+8]
	push	ecx
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	edi, eax
	mov	ecx, DWORD PTR [esi]
	push	ecx
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	eax, edi
$L341:
	push	eax
	call	_fast_sqrt
	add	esp, 4
	mov	edi, eax
; Line 139
	test	edi, edi
	je	SHORT $L217
; Line 140
	push	edi
	mov	eax, DWORD PTR [esi]
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR [esi], eax
; Line 141
	mov	eax, DWORD PTR [esi+4]
	push	edi
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR [esi+4], eax
; Line 142
	mov	eax, DWORD PTR [esi+8]
	push	edi
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR [esi+8], eax
; Line 143
$L217:
	pop	edi
	pop	esi
	ret	0
_vec3_normalize ENDP
_TEXT	ENDS
PUBLIC	_vec3_dot
;	COMDAT _vec3_dot
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_dot PROC NEAR					; COMDAT
; Line 146
	push	ebx
	push	esi
	mov	esi, DWORD PTR _a$[esp+4]
	push	edi
; Line 147
	mov	edi, DWORD PTR _b$[esp+8]
	mov	ecx, DWORD PTR [esi+8]
	mov	eax, DWORD PTR [edi+8]
	push	eax
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR [edi+4]
	mov	ecx, DWORD PTR [esi+4]
	push	eax
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	ecx, DWORD PTR [edi]
	mov	eax, DWORD PTR [esi]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	eax, ebx
; Line 148
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_vec3_dot ENDP
_TEXT	ENDS
PUBLIC	_mat3_mul
;	COMDAT _mat3_mul
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_dest$ = 16
_mat3_mul PROC NEAR					; COMDAT
; Line 149
	push	ebx
	push	esi
	mov	ebx, DWORD PTR _a$[esp+4]
	push	edi
	mov	edi, DWORD PTR _b$[esp+8]
	push	ebp
; Line 150
	mov	ecx, DWORD PTR [ebx]
	mov	eax, DWORD PTR [edi]
	push	eax
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	ebp, eax
	mov	eax, DWORD PTR [edi+8]
	mov	ecx, DWORD PTR [ebx+8]
	push	eax
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	ecx, DWORD PTR [edi+4]
	mov	eax, DWORD PTR [ebx+4]
	push	ecx
	push	eax
	call	_fixed_mul
	mov	esi, DWORD PTR _dest$[esp+20]
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [esi], ebp
; Line 151
	mov	eax, DWORD PTR [edi]
	mov	ecx, DWORD PTR [ebx+12]
	push	eax
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	ebp, eax
	mov	ecx, DWORD PTR [edi+8]
	mov	eax, DWORD PTR [ebx+20]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	ecx, DWORD PTR [edi+4]
	mov	eax, DWORD PTR [ebx+16]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [esi+4], ebp
; Line 152
	mov	ecx, DWORD PTR [edi]
	mov	eax, DWORD PTR [ebx+24]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebp, eax
	mov	ecx, DWORD PTR [edi+8]
	push	ecx
	mov	eax, DWORD PTR [ebx+32]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	ecx, DWORD PTR [edi+4]
	mov	eax, DWORD PTR [ebx+28]
	push	ecx
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [esi+8], ebp
; Line 153
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	ret	0
_mat3_mul ENDP
_TEXT	ENDS
PUBLIC	_mat3_inv
;	COMDAT _mat3_inv
_TEXT	SEGMENT
_mat3_inv PROC NEAR					; COMDAT
; Line 157
	ret	0
_mat3_inv ENDP
_TEXT	ENDS
PUBLIC	_quat_pitch
;	COMDAT _quat_pitch
_TEXT	SEGMENT
_pitch$ = 8
_a$ = 12
_w$ = -12
_y$ = -4
_z$ = -8
_quat_pitch PROC NEAR					; COMDAT
; Line 158
	sub	esp, 16					; 00000010H
	xor	eax, eax
	mov	al, BYTE PTR _pitch$[esp+12]
	push	ebx
	shl	eax, 2
	push	esi
	mov	esi, DWORD PTR _a$[esp+20]
	push	edi
	push	ebp
	mov	ebx, DWORD PTR _COS_LUT_SMALL[eax]
; Line 160
	mov	edi, DWORD PTR _SIN_LUT_SMALL[eax]
	mov	ebp, DWORD PTR [esi]
; Line 161
	mov	eax, DWORD PTR [esi+12]
	mov	ecx, DWORD PTR [esi+4]
	mov	DWORD PTR _w$[esp+32], eax
	mov	DWORD PTR _y$[esp+32], ecx
; Line 164
	mov	eax, DWORD PTR [esi+8]
	mov	edx, DWORD PTR _w$[esp+32]
	mov	DWORD PTR _z$[esp+32], eax
	push	edx
; Line 168
	push	ebx
	call	_fixed_mul
	mov	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	push	ebp
	push	edi
	call	_fixed_mul
	sub	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	mov	ecx, DWORD PTR -16+[esp+32]
	push	ebp
	push	ebx
	mov	DWORD PTR [esi+12], ecx
; Line 169
	call	_fixed_mul
	mov	ecx, DWORD PTR _w$[esp+40]
	add	esp, 8
	mov	ebp, eax
	push	ecx
	push	edi
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [esi], ebp
; Line 170
	mov	eax, DWORD PTR _z$[esp+32]
	push	eax
	push	edi
	call	_fixed_mul
	add	esp, 8
	mov	ebp, eax
	mov	eax, DWORD PTR _y$[esp+32]
	push	eax
	push	ebx
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [esi+4], ebp
; Line 171
	mov	eax, DWORD PTR _z$[esp+32]
	push	eax
	push	ebx
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _y$[esp+32]
	push	eax
	push	edi
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	DWORD PTR [esi+8], ebx
; Line 172
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_quat_pitch ENDP
_TEXT	ENDS
PUBLIC	_quat_yaw
;	COMDAT _quat_yaw
_TEXT	SEGMENT
_yaw$ = 8
_a$ = 12
_w$ = -12
_x$ = -4
_z$ = -8
_quat_yaw PROC NEAR					; COMDAT
; Line 173
	sub	esp, 16					; 00000010H
	xor	eax, eax
	mov	al, BYTE PTR _yaw$[esp+12]
	push	ebx
	shl	eax, 2
	push	esi
	mov	esi, DWORD PTR _a$[esp+20]
	push	edi
	push	ebp
	mov	ebx, DWORD PTR _COS_LUT_SMALL[eax]
; Line 175
	mov	edi, DWORD PTR _SIN_LUT_SMALL[eax]
	mov	ecx, DWORD PTR [esi]
; Line 176
	mov	eax, DWORD PTR [esi+12]
	mov	ebp, DWORD PTR [esi+4]
	mov	DWORD PTR _w$[esp+32], eax
	mov	DWORD PTR _x$[esp+32], ecx
; Line 179
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR _w$[esp+32]
	mov	DWORD PTR _z$[esp+32], eax
	push	ecx
; Line 183
	push	ebx
	call	_fixed_mul
	mov	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	push	ebp
	push	edi
	call	_fixed_mul
	mov	edx, DWORD PTR _x$[esp+40]
	sub	DWORD PTR -16+[esp+40], eax
	mov	ecx, DWORD PTR -16+[esp+40]
	add	esp, 8
	mov	DWORD PTR [esi+12], ecx
; Line 184
	push	edx
	push	ebx
	call	_fixed_mul
	mov	ecx, DWORD PTR _z$[esp+40]
	mov	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	push	ecx
	push	edi
	call	_fixed_mul
	sub	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	mov	ecx, DWORD PTR -16+[esp+32]
	push	ebp
	push	ebx
	mov	DWORD PTR [esi], ecx
; Line 185
	call	_fixed_mul
	mov	ecx, DWORD PTR _w$[esp+40]
	add	esp, 8
	mov	ebp, eax
	push	ecx
	push	edi
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [esi+4], ebp
; Line 186
	mov	eax, DWORD PTR _z$[esp+32]
	push	eax
	push	ebx
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[esp+32]
	push	eax
	push	edi
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	DWORD PTR [esi+8], ebx
; Line 187
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_quat_yaw ENDP
_TEXT	ENDS
PUBLIC	_quat_roll
;	COMDAT _quat_roll
_TEXT	SEGMENT
_roll$ = 8
_a$ = 12
_w$ = -8
_x$ = -12
_z$ = -4
_quat_roll PROC NEAR					; COMDAT
; Line 188
	sub	esp, 16					; 00000010H
	xor	eax, eax
	mov	al, BYTE PTR _roll$[esp+12]
	push	ebx
	shl	eax, 2
	push	esi
	mov	esi, DWORD PTR _a$[esp+20]
	push	edi
	push	ebp
	mov	ebx, DWORD PTR _COS_LUT_SMALL[eax]
; Line 190
	mov	edi, DWORD PTR _SIN_LUT_SMALL[eax]
	mov	ecx, DWORD PTR [esi]
; Line 191
	mov	eax, DWORD PTR [esi+12]
	mov	ebp, DWORD PTR [esi+4]
	mov	DWORD PTR _w$[esp+32], eax
	mov	DWORD PTR _x$[esp+32], ecx
; Line 194
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR _w$[esp+32]
	mov	DWORD PTR _z$[esp+32], eax
	push	ecx
; Line 198
	push	ebx
	call	_fixed_mul
	mov	ecx, DWORD PTR _z$[esp+40]
	mov	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	push	ecx
	push	edi
	call	_fixed_mul
	sub	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	mov	ecx, DWORD PTR -16+[esp+32]
	push	ebp
	push	edi
	mov	DWORD PTR [esi+12], ecx
; Line 199
	call	_fixed_mul
	mov	ecx, DWORD PTR _x$[esp+40]
	mov	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	push	ecx
	push	ebx
	call	_fixed_mul
	add	DWORD PTR -16+[esp+40], eax
	add	esp, 8
	mov	ecx, DWORD PTR -16+[esp+32]
	push	ebp
	push	ebx
	mov	DWORD PTR [esi], ecx
; Line 200
	call	_fixed_mul
	mov	ecx, DWORD PTR _x$[esp+40]
	add	esp, 8
	mov	ebp, eax
	push	ecx
	push	edi
	call	_fixed_mul
	add	esp, 8
	sub	ebp, eax
	mov	DWORD PTR [esi+4], ebp
; Line 201
	mov	eax, DWORD PTR _w$[esp+32]
	push	eax
	push	edi
	call	_fixed_mul
	add	esp, 8
	mov	edi, eax
	mov	eax, DWORD PTR _z$[esp+32]
	push	eax
	push	ebx
	call	_fixed_mul
	add	esp, 8
	add	edi, eax
	mov	DWORD PTR [esi+8], edi
; Line 202
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_quat_roll ENDP
_TEXT	ENDS
PUBLIC	_quat_tomat
;	COMDAT _quat_tomat
_TEXT	SEGMENT
_from$ = 8
_to$ = 12
_d$ = -20
_bs$ = -24
_cs$ = -28
_ab$ = -8
_ac$ = -12
_ad$ = -16
_bb$ = -4
_bc$ = -24
_cc$ = -28
_quat_tomat PROC NEAR					; COMDAT
; Line 203
	mov	eax, DWORD PTR _from$[esp-4]
	sub	esp, 28					; 0000001cH
	push	ebx
	push	esi
	push	edi
	mov	esi, DWORD PTR [eax+12]
	push	ebp
	mov	edi, DWORD PTR [eax]
; Line 206
	mov	ebp, DWORD PTR [eax+4]
; Line 207
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _d$[esp+44], eax
	push	eax
; Line 208
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	push	ebp
	push	ebp
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	push	edi
	push	edi
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	push	esi
	push	esi
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	push	ebx
	push	131072					; 00020000H
	call	_fixed_div
	add	esp, 8
	mov	ebx, eax
; Line 209
	push	ebx
	push	edi
	call	_fixed_mul
	mov	DWORD PTR _bs$[esp+52], eax
	add	esp, 8
; Line 210
	push	ebx
	push	ebp
	call	_fixed_mul
	mov	DWORD PTR _cs$[esp+52], eax
	add	esp, 8
; Line 211
	mov	eax, DWORD PTR _d$[esp+44]
	push	ebx
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
; Line 212
	mov	eax, DWORD PTR _bs$[esp+44]
	push	eax
	push	esi
	call	_fixed_mul
	mov	DWORD PTR _ab$[esp+52], eax
; Line 213
	mov	eax, DWORD PTR _cs$[esp+52]
	add	esp, 8
	push	eax
	push	esi
	call	_fixed_mul
	mov	DWORD PTR _ac$[esp+52], eax
	add	esp, 8
; Line 214
	push	ebx
	push	esi
	call	_fixed_mul
	mov	DWORD PTR _ad$[esp+52], eax
; Line 215
	mov	eax, DWORD PTR _bs$[esp+52]
	add	esp, 8
	push	eax
	push	edi
	call	_fixed_mul
	mov	DWORD PTR _bb$[esp+52], eax
; Line 216
	mov	eax, DWORD PTR _cs$[esp+52]
	add	esp, 8
	push	eax
	push	edi
	call	_fixed_mul
	mov	DWORD PTR _bc$[esp+52], eax
	add	esp, 8
; Line 217
	push	ebx
	push	edi
	call	_fixed_mul
	add	esp, 8
	mov	edi, eax
; Line 218
	mov	eax, DWORD PTR _cs$[esp+44]
	push	eax
	push	ebp
	call	_fixed_mul
	mov	DWORD PTR _cc$[esp+52], eax
	add	esp, 8
; Line 219
	push	ebx
	push	ebp
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
; Line 220
	mov	eax, DWORD PTR _d$[esp+44]
	push	ebx
	push	eax
	call	_fixed_mul
	mov	ecx, DWORD PTR _to$[esp+48]
	add	esp, 8
	mov	edx, 65536				; 00010000H
	sub	edx, eax
; Line 221
	mov	eax, edx
	sub	eax, DWORD PTR _cc$[esp+44]
	mov	DWORD PTR [ecx], eax
; Line 222
	mov	eax, DWORD PTR _bc$[esp+44]
	sub	eax, DWORD PTR _ad$[esp+44]
	mov	DWORD PTR [ecx+4], eax
; Line 223
	mov	eax, DWORD PTR _ac$[esp+44]
	add	eax, edi
	sub	edx, DWORD PTR _bb$[esp+44]
	mov	DWORD PTR [ecx+8], eax
	mov	DWORD PTR [ecx+16], edx
; Line 224
	mov	eax, DWORD PTR _bc$[esp+44]
	add	eax, DWORD PTR _ad$[esp+44]
	mov	DWORD PTR [ecx+12], eax
; Line 226
	mov	eax, esi
	sub	eax, DWORD PTR _ab$[esp+44]
	mov	DWORD PTR [ecx+20], eax
; Line 227
	sub	edi, DWORD PTR _ac$[esp+44]
	mov	eax, DWORD PTR _ab$[esp+44]
	add	eax, esi
	mov	DWORD PTR [ecx+24], edi
; Line 228
	mov	DWORD PTR [ecx+28], eax
; Line 229
	mov	eax, 65536				; 00010000H
	sub	eax, DWORD PTR _cc$[esp+44]
	sub	eax, DWORD PTR _bb$[esp+44]
	pop	ebp
	pop	edi
	mov	DWORD PTR [ecx+32], eax
; Line 230
	pop	esi
	pop	ebx
	add	esp, 28					; 0000001cH
	ret	0
_quat_tomat ENDP
_TEXT	ENDS
PUBLIC	_quat_create
;	COMDAT _quat_create
_TEXT	SEGMENT
_pitch$ = 8
_yaw$ = 12
_roll$ = 16
_a$ = 20
_cp$ = -16
_sp$ = -12
_cc$ = -4
_cs$ = -16
_sc$ = -8
_ss$ = -12
_quat_create PROC NEAR					; COMDAT
; Line 231
	sub	esp, 16					; 00000010H
	xor	eax, eax
	mov	al, BYTE PTR _pitch$[esp+12]
	push	ebx
	push	esi
	and	eax, -2					; fffffffeH
	push	edi
	add	eax, eax
	push	ebp
; Line 236
	mov	ecx, DWORD PTR _COS_LUT[eax]
	mov	edx, DWORD PTR _SIN_LUT[eax]
	mov	DWORD PTR _cp$[esp+32], ecx
; Line 237
	xor	eax, eax
	mov	DWORD PTR _sp$[esp+32], edx
	mov	al, BYTE PTR _yaw$[esp+28]
	and	eax, -2					; fffffffeH
	add	eax, eax
; Line 238
	mov	esi, DWORD PTR _COS_LUT[eax]
	mov	ebp, DWORD PTR _SIN_LUT[eax]
; Line 239
	xor	eax, eax
	push	esi
	mov	al, BYTE PTR _roll$[esp+32]
	push	ecx
	and	eax, -2					; fffffffeH
	add	eax, eax
; Line 240
	mov	edi, DWORD PTR _COS_LUT[eax]
	mov	ebx, DWORD PTR _SIN_LUT[eax]
; Line 242
	call	_fixed_mul
	mov	ecx, DWORD PTR _cp$[esp+40]
	mov	DWORD PTR _cc$[esp+40], eax
	add	esp, 8
; Line 243
	push	ebp
	push	ecx
	call	_fixed_mul
	mov	DWORD PTR _cs$[esp+40], eax
	add	esp, 8
; Line 244
	mov	eax, DWORD PTR _sp$[esp+32]
	push	esi
	push	eax
	call	_fixed_mul
	mov	DWORD PTR _sc$[esp+40], eax
	add	esp, 8
; Line 245
	mov	eax, DWORD PTR _sp$[esp+32]
	push	ebp
	push	eax
	call	_fixed_mul
	mov	DWORD PTR _ss$[esp+40], eax
	add	esp, 8
; Line 246
	mov	eax, DWORD PTR _cc$[esp+32]
	push	edi
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebp, eax
	mov	eax, DWORD PTR _ss$[esp+32]
	push	ebx
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebp, eax
	mov	esi, DWORD PTR _a$[esp+28]
	mov	eax, DWORD PTR _cs$[esp+32]
	push	ebx
	push	eax
	mov	DWORD PTR [esi+12], ebp
; Line 247
	call	_fixed_mul
	add	esp, 8
	mov	ebp, eax
	mov	eax, DWORD PTR _sc$[esp+32]
	push	edi
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [esi], ebp
; Line 248
	push	edi
	mov	eax, DWORD PTR _cs$[esp+36]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebp, eax
	mov	eax, DWORD PTR _sc$[esp+32]
	push	ebx
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebp, eax
	mov	DWORD PTR [esi+4], ebp
; Line 249
	push	ebx
	mov	eax, DWORD PTR _cc$[esp+36]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _ss$[esp+32]
	push	edi
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	DWORD PTR [esi+8], ebx
; Line 250
	pop	ebp
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 16					; 00000010H
	ret	0
_quat_create ENDP
_TEXT	ENDS
PUBLIC	_quat_slerp
;	COMDAT _quat_slerp
_TEXT	SEGMENT
_quat_slerp PROC NEAR					; COMDAT
; Line 253
	ret	0
_quat_slerp ENDP
_TEXT	ENDS
PUBLIC	_quat_conjugate
;	COMDAT _quat_conjugate
_TEXT	SEGMENT
_q$ = 8
_quat_conjugate PROC NEAR				; COMDAT
; Line 256
	mov	ecx, DWORD PTR _q$[esp-4]
	mov	eax, DWORD PTR [ecx]
	neg	eax
	mov	DWORD PTR [ecx], eax
; Line 257
	mov	eax, DWORD PTR [ecx+4]
	neg	eax
	mov	DWORD PTR [ecx+4], eax
; Line 258
	mov	eax, DWORD PTR [ecx+8]
	neg	eax
	mov	DWORD PTR [ecx+8], eax
; Line 259
	ret	0
_quat_conjugate ENDP
_TEXT	ENDS
END
