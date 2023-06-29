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
_x$ = 8
_int_abs PROC NEAR					; COMDAT
; File src\sl_math.c
; Line 10
	mov	edx, DWORD PTR _x$[esp-4]
	mov	ecx, edx
	shr	ecx, 31					; 0000001fH
	neg	ecx
; Line 11
	mov	eax, ecx
	xor	eax, edx
	sub	eax, ecx
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
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 18
	mov	ecx, DWORD PTR _a$[ebp]
; Line 19
	xor	ecx, DWORD PTR _b$[ebp]
; Line 20
	xor	ecx, DWORD PTR _c$[ebp]
; Line 22
	mov	eax, DWORD PTR _a$[ebp]
; Line 23
	cmp	eax, 0
; Line 24
	jge	SHORT $no_nega$184
; Line 25
	neg	eax
$no_nega$184:
; Line 28
	mov	ebx, DWORD PTR _b$[ebp]
; Line 29
	cmp	ebx, 0
; Line 30
	jge	SHORT $no_negb$185
; Line 31
	neg	ebx
$no_negb$185:
; Line 33
	mov	esi, DWORD PTR _c$[ebp]
; Line 34
	cmp	esi, 0
; Line 35
	jge	SHORT $no_negc$186
; Line 36
	neg	esi
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
$done$188:
; Line 49
	jmp	SHORT $L183
$overflow$187:
; Line 53
	mov	eax, 2147483647				; 7fffffffH
$L183:
; Line 72
	pop	edi
	pop	esi
	pop	ebx
	pop	ebp
	ret	0
_muldiv	ENDP
_TEXT	ENDS
PUBLIC	_fixed_mul
;	COMDAT _fixed_mul
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_mul PROC NEAR					; COMDAT
; Line 74
	push	ebp
	mov	ebp, esp
; Line 77
	mov	eax, DWORD PTR _a$[ebp]
; Line 78
	imul	DWORD PTR _b$[ebp]
; Line 79
	shr	eax, 16					; 00000010H
; Line 80
	shl	edx, 16					; 00000010H
; Line 81
	or	eax, edx
; Line 86
	pop	ebp
	ret	0
_fixed_mul ENDP
_TEXT	ENDS
PUBLIC	_fixed_div
;	COMDAT _fixed_div
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_div PROC NEAR					; COMDAT
; Line 88
	push	ebp
	mov	ebp, esp
; Line 91
	mov	eax, DWORD PTR _a$[ebp]
; Line 92
	mov	edx, eax
; Line 93
	shr	edx, 16					; 00000010H
; Line 94
	movsx	edx, dx
; Line 95
	shl	eax, 16					; 00000010H
; Line 96
	idiv	DWORD PTR _b$[ebp]
; Line 101
	pop	ebp
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
; Line 108
	mov	ebx, DWORD PTR _n$[esp]
	mov	eax, ebx
	push	esi
	cdq
	sub	eax, edx
	push	edi
	mov	esi, eax
	sar	esi, 1
; Line 113
	xor	edi, edi
$L202:
; Line 114
	test	esi, esi
	je	SHORT $L334
; Line 115
	push	esi
	push	ebx
	call	_fixed_div
	add	eax, esi
	add	esp, 8
	cdq
	sub	eax, edx
	sar	eax, 1
	inc	edi
	mov	esi, eax
	cmp	edi, 8
	jl	SHORT $L202
	pop	edi
	pop	esi
	pop	ebx
; Line 118
	ret	0
$L334:
	pop	edi
	pop	esi
; Line 114
	xor	eax, eax
	pop	ebx
; Line 118
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
	mov	eax, DWORD PTR _b$[esp-4]
	push	esi
	mov	edx, DWORD PTR [ecx]
	mov	esi, DWORD PTR [eax]
	add	esi, edx
	mov	DWORD PTR [eax], esi
; Line 121
	mov	edx, DWORD PTR [ecx+4]
	mov	esi, DWORD PTR [eax+4]
	add	esi, edx
; Line 122
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [eax+4], esi
	mov	ecx, DWORD PTR [ecx+8]
	add	edx, ecx
	pop	esi
	mov	DWORD PTR [eax+8], edx
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
	mov	eax, DWORD PTR _b$[esp-4]
	push	esi
	mov	edx, DWORD PTR [ecx]
	mov	esi, DWORD PTR [eax]
	sub	esi, edx
	mov	DWORD PTR [eax], esi
; Line 126
	mov	edx, DWORD PTR [ecx+4]
	mov	esi, DWORD PTR [eax+4]
	sub	esi, edx
; Line 127
	mov	edx, DWORD PTR [eax+8]
	mov	DWORD PTR [eax+4], esi
	mov	ecx, DWORD PTR [ecx+8]
	sub	edx, ecx
	pop	esi
	mov	DWORD PTR [eax+8], edx
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
	push	ebp
	push	esi
; Line 130
	mov	esi, DWORD PTR _b$[esp+8]
	push	edi
	mov	edi, DWORD PTR _a$[esp+12]
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [edi+4]
	push	eax
	push	ecx
	call	_fixed_mul
	mov	edx, DWORD PTR [esi+4]
	mov	ebp, eax
	mov	eax, DWORD PTR [edi+8]
	push	edx
	push	eax
	call	_fixed_mul
	mov	ebx, DWORD PTR _o$[esp+28]
	sub	ebp, eax
	mov	DWORD PTR [ebx], ebp
; Line 131
	mov	ecx, DWORD PTR [esi+8]
	mov	edx, DWORD PTR [edi]
	push	ecx
	push	edx
	call	_fixed_mul
	mov	ecx, DWORD PTR [edi+8]
	mov	ebp, eax
	mov	eax, DWORD PTR [esi]
	push	eax
	push	ecx
	call	_fixed_mul
	sub	eax, ebp
	mov	DWORD PTR [ebx+4], eax
; Line 132
	mov	edx, DWORD PTR [esi+4]
	mov	eax, DWORD PTR [edi]
	push	edx
	push	eax
	call	_fixed_mul
	mov	ecx, DWORD PTR [esi]
	mov	edx, DWORD PTR [edi+4]
	push	ecx
	push	edx
	mov	ebp, eax
	call	_fixed_mul
	add	esp, 48					; 00000030H
	sub	ebp, eax
	mov	DWORD PTR [ebx+8], ebp
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 133
	ret	0
_vec3_cross ENDP
_TEXT	ENDS
PUBLIC	_vec3_normalize
;	COMDAT _vec3_normalize
_TEXT	SEGMENT
_x$ = 8
_vec3_normalize PROC NEAR				; COMDAT
; Line 137
	push	ebx
	push	ebp
	push	esi
; Line 138
	mov	esi, DWORD PTR _x$[esp+8]
	push	edi
	mov	eax, DWORD PTR [esi]
	mov	edi, DWORD PTR [esi+8]
	mov	ebx, DWORD PTR [esi+4]
	push	eax
	push	eax
	call	_fixed_mul
	push	ebx
	push	ebx
	mov	ebp, eax
	call	_fixed_mul
	push	edi
	push	edi
	add	ebp, eax
	call	_fixed_mul
	add	esp, 24					; 00000018H
	add	ebp, eax
	jns	SHORT $L348
	mov	edi, 2147483647				; 7fffffffH
	jmp	SHORT $L349
$L348:
	mov	eax, DWORD PTR [esi]
	mov	ebx, DWORD PTR [esi+8]
	mov	ebp, DWORD PTR [esi+4]
	push	eax
	push	eax
	call	_fixed_mul
	push	ebp
	push	ebp
	mov	edi, eax
	call	_fixed_mul
	push	ebx
	push	ebx
	add	edi, eax
	call	_fixed_mul
	add	esp, 24					; 00000018H
	add	edi, eax
$L349:
	push	edi
	call	_fast_sqrt
	mov	edi, eax
	add	esp, 4
; Line 139
	test	edi, edi
	je	SHORT $L217
; Line 140
	mov	eax, DWORD PTR [esi]
	push	edi
	push	eax
	call	_fixed_div
; Line 141
	mov	ecx, DWORD PTR [esi+4]
	push	edi
	push	ecx
	mov	DWORD PTR [esi], eax
	call	_fixed_div
; Line 142
	mov	edx, DWORD PTR [esi+8]
	push	edi
	push	edx
	mov	DWORD PTR [esi+4], eax
	call	_fixed_div
	add	esp, 24					; 00000018H
	mov	DWORD PTR [esi+8], eax
$L217:
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 143
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
; Line 147
	mov	esi, DWORD PTR _b$[esp+4]
	push	edi
	mov	edi, DWORD PTR _a$[esp+8]
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [edi+8]
	push	eax
	push	ecx
	call	_fixed_mul
	mov	edx, DWORD PTR [esi+4]
	mov	ebx, eax
	mov	eax, DWORD PTR [edi+4]
	push	edx
	push	eax
	call	_fixed_mul
	mov	ecx, DWORD PTR [esi]
	mov	edx, DWORD PTR [edi]
	push	ecx
	push	edx
	add	ebx, eax
	call	_fixed_mul
	add	esp, 24					; 00000018H
	add	eax, ebx
	pop	edi
	pop	esi
	pop	ebx
; Line 148
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
	push	ebp
	push	esi
; Line 150
	mov	esi, DWORD PTR _b$[esp+8]
	push	edi
	mov	edi, DWORD PTR _a$[esp+12]
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [edi+8]
	push	eax
	push	ecx
	call	_fixed_mul
	mov	edx, DWORD PTR [esi+4]
	mov	ebp, eax
	mov	eax, DWORD PTR [edi+4]
	push	edx
	push	eax
	call	_fixed_mul
	mov	ecx, DWORD PTR [esi]
	mov	edx, DWORD PTR [edi]
	push	ecx
	push	edx
	add	ebp, eax
	call	_fixed_mul
	mov	ebx, DWORD PTR _dest$[esp+36]
	add	ebp, eax
	mov	DWORD PTR [ebx], ebp
; Line 151
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [edi+20]
	push	eax
	push	ecx
	call	_fixed_mul
	mov	edx, DWORD PTR [esi+4]
	mov	ebp, eax
	mov	eax, DWORD PTR [edi+16]
	push	edx
	push	eax
	call	_fixed_mul
	mov	ecx, DWORD PTR [esi]
	mov	edx, DWORD PTR [edi+12]
	push	ecx
	push	edx
	add	ebp, eax
	call	_fixed_mul
	add	ebp, eax
	mov	DWORD PTR [ebx+4], ebp
; Line 152
	mov	eax, DWORD PTR [esi+8]
	mov	ecx, DWORD PTR [edi+32]
	push	eax
	push	ecx
	call	_fixed_mul
	mov	edx, DWORD PTR [esi+4]
	mov	ebp, eax
	mov	eax, DWORD PTR [edi+28]
	push	edx
	push	eax
	call	_fixed_mul
	mov	ecx, DWORD PTR [esi]
	mov	edx, DWORD PTR [edi+24]
	add	esp, 64					; 00000040H
	add	ebp, eax
	push	ecx
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	ebp, eax
	mov	DWORD PTR [ebx+8], ebp
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 153
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
_w$ = -4
_x$ = -8
_y$ = 12
_z$ = 8
_quat_pitch PROC NEAR					; COMDAT
; Line 158
	sub	esp, 12					; 0000000cH
; Line 159
	mov	eax, DWORD PTR _pitch$[esp+8]
	push	ebx
	and	eax, 255				; 000000ffH
	push	ebp
	push	esi
; Line 161
	mov	esi, DWORD PTR _a$[esp+20]
	shl	eax, 2
	mov	ebp, DWORD PTR [esi+12]
; Line 163
	mov	ecx, DWORD PTR [esi+4]
	mov	ebx, DWORD PTR _SIN_LUT_SMALL[eax]
; Line 164
	mov	edx, DWORD PTR [esi+8]
	push	edi
	mov	edi, DWORD PTR _COS_LUT_SMALL[eax]
	mov	eax, DWORD PTR [esi]
	mov	DWORD PTR _w$[esp+28], ebp
; Line 168
	push	eax
	push	ebx
	mov	DWORD PTR _x$[esp+36], eax
	mov	DWORD PTR _y$[esp+32], ecx
	mov	DWORD PTR _z$[esp+32], edx
	call	_fixed_mul
	mov	edx, eax
	push	ebp
	push	edi
	mov	DWORD PTR -12+[esp+44], edx
	call	_fixed_mul
	mov	ecx, DWORD PTR -12+[esp+44]
; Line 169
	mov	edx, DWORD PTR _x$[esp+44]
	sub	eax, ecx
	push	edx
	push	edi
	mov	DWORD PTR [esi+12], eax
	call	_fixed_mul
	mov	ebp, eax
	mov	eax, DWORD PTR _w$[esp+52]
	push	eax
	push	ebx
	call	_fixed_mul
; Line 170
	mov	ecx, DWORD PTR _z$[esp+56]
	add	ebp, eax
	push	ecx
	push	ebx
	mov	DWORD PTR [esi], ebp
	call	_fixed_mul
	mov	edx, DWORD PTR _y$[esp+64]
	mov	ebp, eax
	push	edx
	push	edi
	call	_fixed_mul
	add	ebp, eax
; Line 171
	mov	eax, DWORD PTR _z$[esp+72]
	push	eax
	push	edi
	mov	DWORD PTR [esi+4], ebp
	call	_fixed_mul
	mov	ecx, DWORD PTR _y$[esp+80]
	mov	edi, eax
	push	ecx
	push	ebx
	call	_fixed_mul
	add	esp, 64					; 00000040H
	sub	edi, eax
	mov	DWORD PTR [esi+8], edi
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 172
	add	esp, 12					; 0000000cH
	ret	0
_quat_pitch ENDP
_TEXT	ENDS
PUBLIC	_quat_yaw
;	COMDAT _quat_yaw
_TEXT	SEGMENT
_yaw$ = 8
_a$ = 12
_w$ = -4
_x$ = 12
_y$ = -8
_z$ = 8
_quat_yaw PROC NEAR					; COMDAT
; Line 173
	sub	esp, 12					; 0000000cH
; Line 174
	mov	eax, DWORD PTR _yaw$[esp+8]
	push	ebx
	and	eax, 255				; 000000ffH
	push	ebp
	push	esi
; Line 176
	mov	esi, DWORD PTR _a$[esp+20]
	shl	eax, 2
	mov	ebp, DWORD PTR [esi+12]
; Line 179
	mov	ecx, DWORD PTR [esi+8]
	mov	ebx, DWORD PTR _SIN_LUT_SMALL[eax]
	push	edi
	mov	edi, DWORD PTR _COS_LUT_SMALL[eax]
	mov	eax, DWORD PTR [esi]
	mov	DWORD PTR _x$[esp+24], eax
	mov	eax, DWORD PTR [esi+4]
; Line 183
	push	eax
	push	ebx
	mov	DWORD PTR _w$[esp+36], ebp
	mov	DWORD PTR _y$[esp+36], eax
	mov	DWORD PTR _z$[esp+32], ecx
	call	_fixed_mul
	mov	edx, eax
	push	ebp
	push	edi
	mov	DWORD PTR -12+[esp+44], edx
	call	_fixed_mul
	mov	edx, DWORD PTR -12+[esp+44]
	sub	eax, edx
	mov	DWORD PTR [esi+12], eax
; Line 184
	mov	eax, DWORD PTR _z$[esp+40]
	push	eax
	push	ebx
	call	_fixed_mul
	mov	ecx, DWORD PTR _x$[esp+48]
	mov	ebp, eax
	push	ecx
	push	edi
	call	_fixed_mul
; Line 185
	mov	edx, DWORD PTR _y$[esp+60]
	sub	eax, ebp
	push	edx
	push	edi
	mov	DWORD PTR [esi], eax
	call	_fixed_mul
	mov	ebp, eax
	mov	eax, DWORD PTR _w$[esp+68]
	push	eax
	push	ebx
	call	_fixed_mul
; Line 186
	mov	ecx, DWORD PTR _z$[esp+72]
	add	ebp, eax
	push	ecx
	push	edi
	mov	DWORD PTR [esi+4], ebp
	call	_fixed_mul
	mov	edx, DWORD PTR _x$[esp+80]
	mov	edi, eax
	push	edx
	push	ebx
	call	_fixed_mul
	add	esp, 64					; 00000040H
	add	edi, eax
	mov	DWORD PTR [esi+8], edi
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 187
	add	esp, 12					; 0000000cH
	ret	0
_quat_yaw ENDP
_TEXT	ENDS
PUBLIC	_quat_roll
;	COMDAT _quat_roll
_TEXT	SEGMENT
_roll$ = 8
_a$ = 12
_w$ = -4
_x$ = 12
_y$ = 8
_z$ = -8
_quat_roll PROC NEAR					; COMDAT
; Line 188
	sub	esp, 12					; 0000000cH
; Line 189
	mov	eax, DWORD PTR _roll$[esp+8]
	push	ebx
	and	eax, 255				; 000000ffH
	push	ebp
	push	esi
; Line 191
	mov	esi, DWORD PTR _a$[esp+20]
	shl	eax, 2
	mov	ebp, DWORD PTR [esi+12]
; Line 193
	mov	ecx, DWORD PTR [esi+4]
	mov	ebx, DWORD PTR _SIN_LUT_SMALL[eax]
	push	edi
	mov	edi, DWORD PTR _COS_LUT_SMALL[eax]
	mov	eax, DWORD PTR [esi]
	mov	DWORD PTR _x$[esp+24], eax
; Line 194
	mov	eax, DWORD PTR [esi+8]
; Line 198
	push	eax
	push	ebx
	mov	DWORD PTR _w$[esp+36], ebp
	mov	DWORD PTR _y$[esp+32], ecx
	mov	DWORD PTR _z$[esp+36], eax
	call	_fixed_mul
	mov	edx, eax
	push	ebp
	push	edi
	mov	DWORD PTR -12+[esp+44], edx
	call	_fixed_mul
	mov	edx, DWORD PTR -12+[esp+44]
	sub	eax, edx
	mov	DWORD PTR [esi+12], eax
; Line 199
	mov	eax, DWORD PTR _y$[esp+40]
	push	eax
	push	ebx
	call	_fixed_mul
	mov	ecx, DWORD PTR _x$[esp+48]
	mov	ebp, eax
	push	ecx
	push	edi
	call	_fixed_mul
; Line 200
	mov	edx, DWORD PTR _y$[esp+56]
	add	ebp, eax
	push	edx
	push	edi
	mov	DWORD PTR [esi], ebp
	call	_fixed_mul
	mov	ebp, eax
	mov	eax, DWORD PTR _x$[esp+64]
	push	eax
	push	ebx
	call	_fixed_mul
; Line 201
	mov	ecx, DWORD PTR _z$[esp+76]
	sub	ebp, eax
	push	ecx
	push	edi
	mov	DWORD PTR [esi+4], ebp
	call	_fixed_mul
	mov	edx, DWORD PTR _w$[esp+84]
	mov	edi, eax
	push	edx
	push	ebx
	call	_fixed_mul
	add	esp, 64					; 00000040H
	add	edi, eax
	mov	DWORD PTR [esi+8], edi
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 202
	add	esp, 12					; 0000000cH
	ret	0
_quat_roll ENDP
_TEXT	ENDS
PUBLIC	_quat_tomat
;	COMDAT _quat_tomat
_TEXT	SEGMENT
_from$ = 8
_to$ = 12
_d$ = -16
_bs$ = -20
_cs$ = 8
_ab$ = -4
_ac$ = -12
_bb$ = -8
_bc$ = -20
_cc$ = 8
_quat_tomat PROC NEAR					; COMDAT
; Line 203
	sub	esp, 20					; 00000014H
; Line 204
	mov	eax, DWORD PTR _from$[esp+16]
	push	ebx
	push	ebp
	push	esi
; Line 205
	mov	esi, DWORD PTR [eax]
; Line 206
	mov	ebx, DWORD PTR [eax+4]
	push	edi
	mov	edi, DWORD PTR [eax+12]
; Line 207
	mov	eax, DWORD PTR [eax+8]
; Line 208
	push	eax
	push	eax
	mov	DWORD PTR _d$[esp+44], eax
	call	_fixed_mul
	push	ebx
	push	ebx
	mov	ebp, eax
	call	_fixed_mul
	push	esi
	push	esi
	add	ebp, eax
	call	_fixed_mul
	push	edi
	push	edi
	add	ebp, eax
	call	_fixed_mul
	add	ebp, eax
	push	ebp
	push	131072					; 00020000H
	call	_fixed_div
	mov	ebp, eax
; Line 209
	push	ebp
	push	esi
	call	_fixed_mul
; Line 210
	push	ebp
	push	ebx
	mov	DWORD PTR _bs$[esp+92], eax
	call	_fixed_mul
	mov	DWORD PTR _cs$[esp+88], eax
; Line 211
	mov	eax, DWORD PTR _d$[esp+92]
	push	ebp
	push	eax
	call	_fixed_mul
; Line 212
	mov	ecx, DWORD PTR _bs$[esp+100]
	add	esp, 64					; 00000040H
	mov	ebp, eax
	push	ecx
	push	edi
	call	_fixed_mul
; Line 213
	mov	edx, DWORD PTR _cs$[esp+40]
	mov	DWORD PTR _ab$[esp+44], eax
	push	edx
	push	edi
	call	_fixed_mul
; Line 214
	push	ebp
	push	edi
	mov	DWORD PTR _ac$[esp+60], eax
	call	_fixed_mul
	mov	edi, eax
; Line 215
	mov	eax, DWORD PTR _bs$[esp+60]
	push	eax
	push	esi
	call	_fixed_mul
; Line 216
	mov	ecx, DWORD PTR _cs$[esp+64]
	mov	DWORD PTR _bb$[esp+68], eax
	push	ecx
	push	esi
	call	_fixed_mul
; Line 217
	push	ebp
	push	esi
	mov	DWORD PTR _bc$[esp+84], eax
	call	_fixed_mul
; Line 218
	mov	edx, DWORD PTR _cs$[esp+80]
	mov	esi, eax
	push	edx
	push	ebx
	call	_fixed_mul
; Line 219
	push	ebp
	push	ebx
	mov	DWORD PTR _cc$[esp+96], eax
	call	_fixed_mul
	add	esp, 64					; 00000040H
	mov	ebx, eax
; Line 220
	mov	eax, DWORD PTR _d$[esp+36]
	push	ebp
	push	eax
	call	_fixed_mul
; Line 221
	mov	ecx, 65536				; 00010000H
	add	esp, 8
	sub	ecx, eax
	mov	eax, DWORD PTR _cc$[esp+32]
	mov	edx, ecx
	sub	edx, eax
	mov	eax, DWORD PTR _to$[esp+32]
	mov	DWORD PTR [eax], edx
; Line 222
	mov	edx, DWORD PTR _bc$[esp+36]
	sub	edx, edi
	mov	DWORD PTR [eax+4], edx
; Line 223
	mov	edx, DWORD PTR _ac$[esp+36]
	lea	ebp, DWORD PTR [esi+edx]
; Line 227
	sub	esi, edx
	mov	DWORD PTR [eax+8], ebp
	mov	ebp, DWORD PTR _bc$[esp+36]
	add	ebp, edi
	mov	edi, DWORD PTR _bb$[esp+36]
	sub	ecx, edi
	mov	DWORD PTR [eax+12], ebp
	mov	DWORD PTR [eax+16], ecx
	mov	ecx, DWORD PTR _ab$[esp+36]
	mov	ebp, ebx
	mov	DWORD PTR [eax+24], esi
; Line 229
	mov	esi, DWORD PTR _cc$[esp+32]
	sub	ebp, ecx
	add	ebx, ecx
	mov	ecx, 65536				; 00010000H
	sub	ecx, esi
	mov	DWORD PTR [eax+20], ebp
	sub	ecx, edi
	pop	edi
	pop	esi
	mov	DWORD PTR [eax+28], ebx
	pop	ebp
	mov	DWORD PTR [eax+32], ecx
	pop	ebx
; Line 230
	add	esp, 20					; 00000014H
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
_cy$ = 12
_sy$ = 8
_cc$ = -4
_cs$ = 16
_sc$ = 12
_ss$ = 8
_quat_create PROC NEAR					; COMDAT
; Line 231
	push	ecx
; Line 236
	mov	eax, DWORD PTR _pitch$[esp]
	push	ebx
	and	eax, 255				; 000000ffH
	push	ebp
	shr	eax, 1
	shl	eax, 2
	push	esi
	push	edi
	mov	ebx, DWORD PTR _COS_LUT[eax]
; Line 237
	mov	ebp, DWORD PTR _SIN_LUT[eax]
; Line 238
	mov	eax, DWORD PTR _yaw$[esp+16]
	and	eax, 255				; 000000ffH
	shr	eax, 1
	shl	eax, 2
	mov	ecx, DWORD PTR _COS_LUT[eax]
; Line 239
	mov	eax, DWORD PTR _SIN_LUT[eax]
	mov	DWORD PTR _sy$[esp+16], eax
; Line 240
	mov	eax, DWORD PTR _roll$[esp+16]
	and	eax, 255				; 000000ffH
; Line 242
	push	ecx
	shr	eax, 1
	shl	eax, 2
	push	ebx
	mov	DWORD PTR _cy$[esp+24], ecx
	mov	esi, DWORD PTR _COS_LUT[eax]
	mov	edi, DWORD PTR _SIN_LUT[eax]
	call	_fixed_mul
; Line 243
	mov	ecx, DWORD PTR _sy$[esp+24]
	mov	DWORD PTR _cc$[esp+28], eax
	push	ecx
	push	ebx
	call	_fixed_mul
; Line 244
	mov	edx, DWORD PTR _cy$[esp+32]
	mov	DWORD PTR _cs$[esp+32], eax
	push	edx
	push	ebp
	call	_fixed_mul
	mov	DWORD PTR _sc$[esp+40], eax
; Line 245
	mov	eax, DWORD PTR _sy$[esp+40]
	push	eax
	push	ebp
	call	_fixed_mul
; Line 246
	push	edi
	push	eax
	mov	DWORD PTR _ss$[esp+56], eax
	call	_fixed_mul
	mov	ecx, DWORD PTR _cc$[esp+60]
	push	esi
	push	ecx
	mov	ebx, eax
	call	_fixed_mul
; Line 247
	mov	edx, DWORD PTR _cs$[esp+64]
	sub	eax, ebx
	mov	ebx, DWORD PTR _a$[esp+64]
	push	edi
	push	edx
	mov	DWORD PTR [ebx+12], eax
	call	_fixed_mul
	mov	ebp, eax
	mov	eax, DWORD PTR _sc$[esp+72]
	push	esi
	push	eax
	call	_fixed_mul
; Line 248
	mov	ecx, DWORD PTR _sc$[esp+80]
	add	esp, 64					; 00000040H
	add	ebp, eax
	push	edi
	push	ecx
	mov	DWORD PTR [ebx], ebp
	call	_fixed_mul
	mov	edx, DWORD PTR _cs$[esp+24]
	push	esi
	push	edx
	mov	ebp, eax
	call	_fixed_mul
	sub	eax, ebp
; Line 249
	push	esi
	mov	DWORD PTR [ebx+4], eax
	mov	eax, DWORD PTR _ss$[esp+36]
	push	eax
	call	_fixed_mul
	mov	ecx, DWORD PTR _cc$[esp+44]
	push	edi
	push	ecx
	mov	esi, eax
	call	_fixed_mul
	add	esp, 32					; 00000020H
	add	esi, eax
	mov	DWORD PTR [ebx+8], esi
	pop	edi
	pop	esi
	pop	ebp
	pop	ebx
; Line 250
	pop	ecx
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
	mov	eax, DWORD PTR _q$[esp-4]
	mov	ecx, DWORD PTR [eax]
; Line 257
	mov	edx, DWORD PTR [eax+4]
	neg	ecx
	mov	DWORD PTR [eax], ecx
; Line 258
	mov	ecx, DWORD PTR [eax+8]
	neg	edx
	neg	ecx
	mov	DWORD PTR [eax+4], edx
	mov	DWORD PTR [eax+8], ecx
; Line 259
	ret	0
_quat_conjugate ENDP
_TEXT	ENDS
END
