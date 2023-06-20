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
_TEXT	SEGMENT
; File src\sl_math.c
_x$ = 8
_y$ = -4
_int_abs PROC NEAR
; Line 9
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 10
	mov	eax, DWORD PTR _x$[ebp]
	shr	eax, 31					; 0000001fH
	neg	eax
	mov	DWORD PTR _y$[ebp], eax
; Line 11
	mov	eax, DWORD PTR _y$[ebp]
	xor	eax, DWORD PTR _x$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
	jmp	$L121
; Line 12
$L121:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_int_abs ENDP
_TEXT	ENDS
PUBLIC	_muldiv
EXTRN	__alldiv:NEAR
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_c$ = 16
_result$ = -4
_muldiv	PROC NEAR
; Line 17
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 20
	cmp	DWORD PTR _c$[ebp], 0
	jne	$L133
; Line 21
	mov	eax, DWORD PTR _a$[ebp]
	xor	eax, DWORD PTR _b$[ebp]
	jl	$L243
	mov	eax, 2147483647				; 7fffffffH
	jmp	$L244
$L243:
	mov	eax, -1
$L244:
	jmp	$L131
; Line 25
$L133:
	mov	eax, DWORD PTR _a$[ebp]
	imul	DWORD PTR _b$[ebp]
	mov	ecx, eax
	mov	ebx, edx
	mov	eax, DWORD PTR _c$[ebp]
	cdq
	push	edx
	push	eax
	push	ebx
	push	ecx
	call	__alldiv
	mov	DWORD PTR _result$[ebp], eax
; Line 28
	mov	eax, DWORD PTR _result$[ebp]
	jmp	$L131
; Line 48
$L131:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_muldiv	ENDP
_TEXT	ENDS
PUBLIC	_fixed_mul
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_mul PROC NEAR
; Line 50
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 52
	mov	eax, DWORD PTR _a$[ebp]
	imul	DWORD PTR _b$[ebp]
	mov	ecx, edx
	shrd	eax, ecx, 16
	jmp	$L136
; Line 53
$L136:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixed_mul ENDP
_TEXT	ENDS
PUBLIC	_fixed_div
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_div PROC NEAR
; Line 55
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 57
	mov	eax, DWORD PTR _a$[ebp]
	cdq
	mov	ecx, eax
	mov	ebx, edx
	shld	ebx, ecx, 16
	shl	ecx, 16					; 00000010H
	mov	eax, DWORD PTR _b$[ebp]
	cdq
	push	edx
	push	eax
	push	ebx
	push	ecx
	call	__alldiv
	jmp	$L139
; Line 58
$L139:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fixed_div ENDP
_TEXT	ENDS
PUBLIC	_angle_atan2
_TEXT	SEGMENT
_angle_atan2 PROC NEAR
; Line 60
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 62
	xor	al, al
	jmp	$L142
; Line 63
$L142:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_angle_atan2 ENDP
_TEXT	ENDS
PUBLIC	_fast_sqrt
_TEXT	SEGMENT
_n$ = 8
_x$ = -4
_i$ = -8
_fast_sqrt PROC NEAR
; Line 64
	push	ebp
	mov	ebp, esp
	sub	esp, 8
	push	ebx
	push	esi
	push	edi
; Line 65
	mov	eax, DWORD PTR _n$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 68
	mov	DWORD PTR _i$[ebp], 0
	jmp	$L147
$L148:
	inc	DWORD PTR _i$[ebp]
$L147:
	cmp	DWORD PTR _i$[ebp], 4
	jge	$L149
; Line 69
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _n$[ebp]
	push	eax
	call	_fixed_div
	add	esp, 8
	add	eax, DWORD PTR _x$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 70
	jmp	$L148
$L149:
; Line 71
	mov	eax, DWORD PTR _x$[ebp]
	jmp	$L144
; Line 72
$L144:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_fast_sqrt ENDP
_TEXT	ENDS
PUBLIC	_vec3_add
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_add PROC NEAR
; Line 73
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 74
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	ecx, DWORD PTR _b$[ebp]
	add	DWORD PTR [ecx], eax
; Line 75
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _b$[ebp]
	add	DWORD PTR [ecx+4], eax
; Line 76
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	ecx, DWORD PTR _b$[ebp]
	add	DWORD PTR [ecx+8], eax
; Line 77
$L152:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vec3_add ENDP
_TEXT	ENDS
PUBLIC	_vec3_subtract
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_subtract PROC NEAR
; Line 78
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 79
	xor	eax, eax
	mov	ecx, DWORD PTR _a$[ebp]
	sub	eax, DWORD PTR [ecx]
	neg	eax
	mov	ecx, DWORD PTR _b$[ebp]
	sub	DWORD PTR [ecx], eax
; Line 80
	xor	eax, eax
	mov	ecx, DWORD PTR _a$[ebp]
	sub	eax, DWORD PTR [ecx+4]
	neg	eax
	mov	ecx, DWORD PTR _b$[ebp]
	sub	DWORD PTR [ecx+4], eax
; Line 81
	xor	eax, eax
	mov	ecx, DWORD PTR _a$[ebp]
	sub	eax, DWORD PTR [ecx+8]
	neg	eax
	mov	ecx, DWORD PTR _b$[ebp]
	sub	DWORD PTR [ecx+8], eax
; Line 82
$L155:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vec3_subtract ENDP
_TEXT	ENDS
PUBLIC	_vec3_cross
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_o$ = 16
_vec3_cross PROC NEAR
; Line 83
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 84
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _o$[ebp]
	mov	DWORD PTR [eax], ebx
; Line 85
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _o$[ebp]
	mov	DWORD PTR [eax+4], ebx
; Line 86
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _o$[ebp]
	mov	DWORD PTR [eax+8], ebx
; Line 87
$L159:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vec3_cross ENDP
_TEXT	ENDS
PUBLIC	_vec3_normalize
_TEXT	SEGMENT
_x$ = 8
_magnitude$ = -4
_vec3_normalize PROC NEAR
; Line 88
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	push	ebx
	push	esi
	push	edi
; Line 89
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	push	ebx
	call	_fast_sqrt
	add	esp, 4
	mov	DWORD PTR _magnitude$[ebp], eax
; Line 90
	mov	eax, DWORD PTR _magnitude$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 91
	mov	eax, DWORD PTR _magnitude$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 92
	mov	eax, DWORD PTR _magnitude$[ebp]
	push	eax
	mov	eax, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fixed_div
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 93
$L161:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vec3_normalize ENDP
_TEXT	ENDS
PUBLIC	_vec3_dot
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_dot PROC NEAR
; Line 94
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 95
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	eax, ebx
	jmp	$L165
; Line 96
$L165:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_vec3_dot ENDP
_TEXT	ENDS
PUBLIC	_mat3_mul
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_dest$ = 16
_mat3_mul PROC NEAR
; Line 97
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 98
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [eax], ebx
; Line 99
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+16]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+20]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+12]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [eax+4], ebx
; Line 100
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+4]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+28]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax+8]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+32]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [eax]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+24]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [eax+8], ebx
; Line 101
$L169:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mat3_mul ENDP
_TEXT	ENDS
PUBLIC	_mat3_inv
_TEXT	SEGMENT
_mat3_inv PROC NEAR
; Line 102
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 105
$L171:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_mat3_inv ENDP
_TEXT	ENDS
PUBLIC	_quat_pitch
_TEXT	SEGMENT
_pitch$ = 8
_a$ = 12
_c$ = -8
_s$ = -4
_w$ = -12
_x$ = -16
_y$ = -20
_z$ = -24
_quat_pitch PROC NEAR
; Line 106
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 107
	xor	eax, eax
	mov	al, BYTE PTR _pitch$[ebp]
	mov	eax, DWORD PTR _COS_LUT_SMALL[eax*4]
	mov	DWORD PTR _c$[ebp], eax
; Line 108
	xor	eax, eax
	mov	al, BYTE PTR _pitch$[ebp]
	mov	eax, DWORD PTR _SIN_LUT_SMALL[eax*4]
	mov	DWORD PTR _s$[ebp], eax
; Line 109
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _w$[ebp], eax
; Line 110
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _x$[ebp], eax
; Line 111
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$[ebp], eax
; Line 112
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _z$[ebp], eax
; Line 116
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+12], ebx
; Line 117
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax], ebx
; Line 118
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+4], ebx
; Line 119
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+8], ebx
; Line 120
$L174:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_quat_pitch ENDP
_TEXT	ENDS
PUBLIC	_quat_yaw
_TEXT	SEGMENT
_yaw$ = 8
_a$ = 12
_c$ = -8
_s$ = -4
_w$ = -12
_x$ = -16
_y$ = -20
_z$ = -24
_quat_yaw PROC NEAR
; Line 121
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 122
	xor	eax, eax
	mov	al, BYTE PTR _yaw$[ebp]
	mov	eax, DWORD PTR _COS_LUT_SMALL[eax*4]
	mov	DWORD PTR _c$[ebp], eax
; Line 123
	xor	eax, eax
	mov	al, BYTE PTR _yaw$[ebp]
	mov	eax, DWORD PTR _SIN_LUT_SMALL[eax*4]
	mov	DWORD PTR _s$[ebp], eax
; Line 124
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _w$[ebp], eax
; Line 125
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _x$[ebp], eax
; Line 126
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$[ebp], eax
; Line 127
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _z$[ebp], eax
; Line 131
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+12], ebx
; Line 132
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax], ebx
; Line 133
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+4], ebx
; Line 134
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+8], ebx
; Line 135
$L183:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_quat_yaw ENDP
_TEXT	ENDS
PUBLIC	_quat_roll
_TEXT	SEGMENT
_roll$ = 8
_a$ = 12
_c$ = -8
_s$ = -4
_w$ = -12
_x$ = -16
_y$ = -20
_z$ = -24
_quat_roll PROC NEAR
; Line 136
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	ebx
	push	esi
	push	edi
; Line 137
	xor	eax, eax
	mov	al, BYTE PTR _roll$[ebp]
	mov	eax, DWORD PTR _COS_LUT_SMALL[eax*4]
	mov	DWORD PTR _c$[ebp], eax
; Line 138
	xor	eax, eax
	mov	al, BYTE PTR _roll$[ebp]
	mov	eax, DWORD PTR _SIN_LUT_SMALL[eax*4]
	mov	DWORD PTR _s$[ebp], eax
; Line 139
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _w$[ebp], eax
; Line 140
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _x$[ebp], eax
; Line 141
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _y$[ebp], eax
; Line 142
	mov	eax, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _z$[ebp], eax
; Line 146
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+12], ebx
; Line 147
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax], ebx
; Line 148
	mov	eax, DWORD PTR _y$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+4], ebx
; Line 149
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+8], ebx
; Line 150
$L192:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_quat_roll ENDP
_TEXT	ENDS
PUBLIC	_quat_tomat
_TEXT	SEGMENT
_from$ = 8
_to$ = 12
_a$ = -16
_b$ = -24
_c$ = -32
_d$ = -36
_s$ = -28
_bs$ = -12
_cs$ = -44
_ds$ = -52
_ab$ = -60
_ac$ = -64
_ad$ = -68
_bb$ = -4
_bc$ = -8
_bd$ = -20
_cc$ = -40
_cd$ = -48
_dd$ = -56
_quat_tomat PROC NEAR
; Line 151
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	ebx
	push	esi
	push	edi
; Line 152
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax+12]
	mov	DWORD PTR _a$[ebp], eax
; Line 153
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax]
	mov	DWORD PTR _b$[ebp], eax
; Line 154
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax+4]
	mov	DWORD PTR _c$[ebp], eax
; Line 155
	mov	eax, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [eax+8]
	mov	DWORD PTR _d$[ebp], eax
; Line 156
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	push	ebx
	push	131072					; 00020000H
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR _s$[ebp], eax
; Line 157
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bs$[ebp], eax
; Line 158
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cs$[ebp], eax
; Line 159
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ds$[ebp], eax
; Line 160
	mov	eax, DWORD PTR _bs$[ebp]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ab$[ebp], eax
; Line 161
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ac$[ebp], eax
; Line 162
	mov	eax, DWORD PTR _ds$[ebp]
	push	eax
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ad$[ebp], eax
; Line 163
	mov	eax, DWORD PTR _bs$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bb$[ebp], eax
; Line 164
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bc$[ebp], eax
; Line 165
	mov	eax, DWORD PTR _ds$[ebp]
	push	eax
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bd$[ebp], eax
; Line 166
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cc$[ebp], eax
; Line 167
	mov	eax, DWORD PTR _ds$[ebp]
	push	eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cd$[ebp], eax
; Line 168
	mov	eax, DWORD PTR _ds$[ebp]
	push	eax
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _dd$[ebp], eax
; Line 169
	mov	eax, 65536				; 00010000H
	sub	eax, DWORD PTR _cc$[ebp]
	sub	eax, DWORD PTR _dd$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 170
	mov	eax, DWORD PTR _bc$[ebp]
	sub	eax, DWORD PTR _ad$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 171
	mov	eax, DWORD PTR _bd$[ebp]
	add	eax, DWORD PTR _ac$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 172
	mov	eax, DWORD PTR _bc$[ebp]
	add	eax, DWORD PTR _ad$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+12], eax
; Line 173
	mov	eax, 65536				; 00010000H
	sub	eax, DWORD PTR _bb$[ebp]
	sub	eax, DWORD PTR _dd$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 174
	mov	eax, DWORD PTR _cd$[ebp]
	sub	eax, DWORD PTR _ab$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+20], eax
; Line 175
	mov	eax, DWORD PTR _bd$[ebp]
	sub	eax, DWORD PTR _ac$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+24], eax
; Line 176
	mov	eax, DWORD PTR _cd$[ebp]
	add	eax, DWORD PTR _ab$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 177
	mov	eax, 65536				; 00010000H
	sub	eax, DWORD PTR _bb$[ebp]
	sub	eax, DWORD PTR _cc$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+32], eax
; Line 178
$L201:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_quat_tomat ENDP
_TEXT	ENDS
PUBLIC	_quat_create
_TEXT	SEGMENT
_pitch$ = 8
_yaw$ = 12
_roll$ = 16
_a$ = 20
_cp$ = -4
_sp$ = -8
_cy$ = -36
_sy$ = -40
_cr$ = -12
_sr$ = -24
_cc$ = -20
_cs$ = -16
_sc$ = -32
_ss$ = -28
_quat_create PROC NEAR
; Line 179
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	ebx
	push	esi
	push	edi
; Line 184
	xor	eax, eax
	mov	al, BYTE PTR _pitch$[ebp]
	and	eax, -2					; fffffffeH
	sar	eax, 0
	mov	eax, DWORD PTR _COS_LUT[eax*2]
	mov	DWORD PTR _cp$[ebp], eax
; Line 185
	xor	eax, eax
	mov	al, BYTE PTR _pitch$[ebp]
	and	eax, -2					; fffffffeH
	sar	eax, 0
	mov	eax, DWORD PTR _SIN_LUT[eax*2]
	mov	DWORD PTR _sp$[ebp], eax
; Line 186
	xor	eax, eax
	mov	al, BYTE PTR _yaw$[ebp]
	and	eax, -2					; fffffffeH
	sar	eax, 0
	mov	eax, DWORD PTR _COS_LUT[eax*2]
	mov	DWORD PTR _cy$[ebp], eax
; Line 187
	xor	eax, eax
	mov	al, BYTE PTR _yaw$[ebp]
	and	eax, -2					; fffffffeH
	sar	eax, 0
	mov	eax, DWORD PTR _SIN_LUT[eax*2]
	mov	DWORD PTR _sy$[ebp], eax
; Line 188
	xor	eax, eax
	mov	al, BYTE PTR _roll$[ebp]
	and	eax, -2					; fffffffeH
	sar	eax, 0
	mov	eax, DWORD PTR _COS_LUT[eax*2]
	mov	DWORD PTR _cr$[ebp], eax
; Line 189
	xor	eax, eax
	mov	al, BYTE PTR _roll$[ebp]
	and	eax, -2					; fffffffeH
	sar	eax, 0
	mov	eax, DWORD PTR _SIN_LUT[eax*2]
	mov	DWORD PTR _sr$[ebp], eax
; Line 190
	mov	eax, DWORD PTR _cy$[ebp]
	push	eax
	mov	eax, DWORD PTR _cp$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cc$[ebp], eax
; Line 191
	mov	eax, DWORD PTR _sy$[ebp]
	push	eax
	mov	eax, DWORD PTR _cp$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cs$[ebp], eax
; Line 192
	mov	eax, DWORD PTR _cy$[ebp]
	push	eax
	mov	eax, DWORD PTR _sp$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _sc$[ebp], eax
; Line 193
	mov	eax, DWORD PTR _sy$[ebp]
	push	eax
	mov	eax, DWORD PTR _sp$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ss$[ebp], eax
; Line 194
	mov	eax, DWORD PTR _cr$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	mov	eax, DWORD PTR _ss$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+12], ebx
; Line 195
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _cr$[ebp]
	push	eax
	mov	eax, DWORD PTR _sc$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax], ebx
; Line 196
	mov	eax, DWORD PTR _cr$[ebp]
	push	eax
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	mov	eax, DWORD PTR _sc$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+4], ebx
; Line 197
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	mov	eax, DWORD PTR _cc$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	ebx, eax
	mov	eax, DWORD PTR _cr$[ebp]
	push	eax
	mov	eax, DWORD PTR _ss$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	ebx, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+8], ebx
; Line 198
$L223:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_quat_create ENDP
_TEXT	ENDS
PUBLIC	_quat_slerp
_TEXT	SEGMENT
_quat_slerp PROC NEAR
; Line 199
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 201
$L238:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_quat_slerp ENDP
_TEXT	ENDS
PUBLIC	_quat_conjugate
_TEXT	SEGMENT
_q$ = 8
_quat_conjugate PROC NEAR
; Line 203
	push	ebp
	mov	ebp, esp
	push	ebx
	push	esi
	push	edi
; Line 204
	mov	eax, DWORD PTR _q$[ebp]
	mov	eax, DWORD PTR [eax]
	neg	eax
	mov	ecx, DWORD PTR _q$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 205
	mov	eax, DWORD PTR _q$[ebp]
	mov	eax, DWORD PTR [eax+4]
	neg	eax
	mov	ecx, DWORD PTR _q$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 206
	mov	eax, DWORD PTR _q$[ebp]
	mov	eax, DWORD PTR [eax+8]
	neg	eax
	mov	ecx, DWORD PTR _q$[ebp]
	mov	DWORD PTR [ecx+8], eax
; Line 207
$L240:
	pop	edi
	pop	esi
	pop	ebx
	leave
	ret	0
_quat_conjugate ENDP
_TEXT	ENDS
END
