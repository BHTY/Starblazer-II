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
_x$ = 8
_y$ = -4
_int_abs PROC NEAR
; File src\sl_math.c
; Line 9
	push	ebp
	mov	ebp, esp
	push	ecx
; Line 10
	mov	eax, DWORD PTR _x$[ebp]
	shr	eax, 31					; 0000001fH
	neg	eax
	mov	DWORD PTR _y$[ebp], eax
; Line 11
	mov	eax, DWORD PTR _x$[ebp]
	xor	eax, DWORD PTR _y$[ebp]
	sub	eax, DWORD PTR _y$[ebp]
; Line 12
	mov	esp, ebp
	pop	ebp
	ret	0
_int_abs ENDP
_TEXT	ENDS
PUBLIC	_muldiv
EXTRN	__allmul:NEAR
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
	push	ecx
	push	esi
; Line 20
	cmp	DWORD PTR _c$[ebp], 0
	jne	SHORT $L133
; Line 21
	mov	eax, DWORD PTR _a$[ebp]
	xor	eax, DWORD PTR _b$[ebp]
	xor	ecx, ecx
	test	eax, eax
	setge	cl
	dec	ecx
	and	ecx, -2147483648			; 80000000H
	add	ecx, 2147483647				; 7fffffffH
	mov	eax, ecx
	jmp	SHORT $L131
$L133:
; Line 25
	mov	eax, DWORD PTR _a$[ebp]
	cdq
	mov	ecx, eax
	mov	esi, edx
	mov	eax, DWORD PTR _b$[ebp]
	cdq
	push	edx
	push	eax
	push	esi
	push	ecx
	call	__allmul
	mov	ecx, eax
	mov	esi, edx
	mov	eax, DWORD PTR _c$[ebp]
	cdq
	push	edx
	push	eax
	push	esi
	push	ecx
	call	__alldiv
	mov	DWORD PTR _result$[ebp], eax
; Line 28
	mov	eax, DWORD PTR _result$[ebp]
$L131:
; Line 48
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_muldiv	ENDP
_TEXT	ENDS
PUBLIC	_fixed_mul
EXTRN	__allshr:NEAR
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_mul PROC NEAR
; Line 50
	push	ebp
	mov	ebp, esp
	push	esi
; Line 52
	mov	eax, DWORD PTR _a$[ebp]
	cdq
	mov	ecx, eax
	mov	esi, edx
	mov	eax, DWORD PTR _b$[ebp]
	cdq
	push	edx
	push	eax
	push	esi
	push	ecx
	call	__allmul
	mov	ecx, 16					; 00000010H
	call	__allshr
; Line 53
	pop	esi
	pop	ebp
	ret	0
_fixed_mul ENDP
_TEXT	ENDS
PUBLIC	_fixed_div
EXTRN	__allshl:NEAR
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_fixed_div PROC NEAR
; Line 55
	push	ebp
	mov	ebp, esp
	push	esi
; Line 57
	mov	eax, DWORD PTR _a$[ebp]
	cdq
	mov	ecx, 16					; 00000010H
	call	__allshl
	mov	ecx, eax
	mov	esi, edx
	mov	eax, DWORD PTR _b$[ebp]
	cdq
	push	edx
	push	eax
	push	esi
	push	ecx
	call	__alldiv
; Line 58
	pop	esi
	pop	ebp
	ret	0
_fixed_div ENDP
_TEXT	ENDS
PUBLIC	_angle_atan2
_TEXT	SEGMENT
_angle_atan2 PROC NEAR
; Line 60
	push	ebp
	mov	ebp, esp
; Line 62
	xor	al, al
; Line 63
	pop	ebp
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
; Line 65
	mov	eax, DWORD PTR _n$[ebp]
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 68
	mov	DWORD PTR _i$[ebp], 0
	jmp	SHORT $L147
$L148:
	mov	eax, DWORD PTR _i$[ebp]
	add	eax, 1
	mov	DWORD PTR _i$[ebp], eax
$L147:
	cmp	DWORD PTR _i$[ebp], 8
	jge	SHORT $L149
; Line 69
	cmp	DWORD PTR _x$[ebp], 0
	jne	SHORT $L150
	xor	eax, eax
	jmp	SHORT $L144
$L150:
; Line 70
	mov	ecx, DWORD PTR _x$[ebp]
	push	ecx
	mov	edx, DWORD PTR _n$[ebp]
	push	edx
	call	_fixed_div
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	add	eax, ecx
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	DWORD PTR _x$[ebp], eax
; Line 71
	jmp	SHORT $L148
$L149:
; Line 72
	mov	eax, DWORD PTR _x$[ebp]
$L144:
; Line 73
	mov	esp, ebp
	pop	ebp
	ret	0
_fast_sqrt ENDP
_TEXT	ENDS
PUBLIC	_vec3_add
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_add PROC NEAR
; Line 74
	push	ebp
	mov	ebp, esp
; Line 75
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _a$[ebp]
	add	ecx, DWORD PTR [edx]
	mov	eax, DWORD PTR _b$[ebp]
	mov	DWORD PTR [eax], ecx
; Line 76
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _a$[ebp]
	add	edx, DWORD PTR [eax+4]
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx+4], edx
; Line 77
	mov	edx, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [edx+8]
	mov	ecx, DWORD PTR _a$[ebp]
	add	eax, DWORD PTR [ecx+8]
	mov	edx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [edx+8], eax
; Line 78
	pop	ebp
	ret	0
_vec3_add ENDP
_TEXT	ENDS
PUBLIC	_vec3_subtract
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_subtract PROC NEAR
; Line 79
	push	ebp
	mov	ebp, esp
; Line 80
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [eax]
	sub	edx, DWORD PTR [ecx]
	mov	eax, DWORD PTR _b$[ebp]
	mov	DWORD PTR [eax], edx
; Line 81
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [ecx+4]
	sub	eax, DWORD PTR [edx+4]
	mov	ecx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 82
	mov	edx, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [edx+8]
	sub	ecx, DWORD PTR [eax+8]
	mov	edx, DWORD PTR _b$[ebp]
	mov	DWORD PTR [edx+8], ecx
; Line 83
	pop	ebp
	ret	0
_vec3_subtract ENDP
_TEXT	ENDS
PUBLIC	_vec3_cross
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_o$ = 16
_vec3_cross PROC NEAR
; Line 84
	push	ebp
	mov	ebp, esp
	push	esi
; Line 85
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	edx, DWORD PTR _o$[ebp]
	mov	DWORD PTR [edx], esi
; Line 86
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	edx, DWORD PTR _o$[ebp]
	mov	DWORD PTR [edx+4], esi
; Line 87
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	edx, DWORD PTR _o$[ebp]
	mov	DWORD PTR [edx+8], esi
; Line 88
	pop	esi
	pop	ebp
	ret	0
_vec3_cross ENDP
_TEXT	ENDS
PUBLIC	_vec3_normalize
_TEXT	SEGMENT
_x$ = 8
_magnitude$ = -4
_vec3_normalize PROC NEAR
; Line 89
	push	ebp
	mov	ebp, esp
	push	ecx
	push	esi
; Line 90
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _x$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	push	esi
	call	_fast_sqrt
	add	esp, 4
	mov	DWORD PTR _magnitude$[ebp], eax
; Line 91
	cmp	DWORD PTR _magnitude$[ebp], 0
	jne	SHORT $L164
	jmp	SHORT $L162
$L164:
; Line 92
	mov	eax, DWORD PTR _magnitude$[ebp]
	push	eax
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	call	_fixed_div
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx], eax
; Line 93
	mov	edx, DWORD PTR _magnitude$[ebp]
	push	edx
	mov	eax, DWORD PTR _x$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_fixed_div
	add	esp, 8
	mov	edx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [edx+4], eax
; Line 94
	mov	eax, DWORD PTR _magnitude$[ebp]
	push	eax
	mov	ecx, DWORD PTR _x$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_fixed_div
	add	esp, 8
	mov	ecx, DWORD PTR _x$[ebp]
	mov	DWORD PTR [ecx+8], eax
$L162:
; Line 95
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_vec3_normalize ENDP
_TEXT	ENDS
PUBLIC	_vec3_dot
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_vec3_dot PROC NEAR
; Line 98
	push	ebp
	mov	ebp, esp
	push	esi
; Line 99
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	eax, esi
; Line 100
	pop	esi
	pop	ebp
	ret	0
_vec3_dot ENDP
_TEXT	ENDS
PUBLIC	_mat3_mul
_TEXT	SEGMENT
_a$ = 8
_b$ = 12
_dest$ = 16
_mat3_mul PROC NEAR
; Line 101
	push	ebp
	mov	ebp, esp
	push	esi
; Line 102
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [edx+8]
	push	eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [eax], esi
; Line 103
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [edx+4]
	push	eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx+20]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	ecx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [ecx+4], esi
; Line 104
	mov	edx, DWORD PTR _b$[ebp]
	mov	eax, DWORD PTR [edx]
	push	eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+24]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	eax, DWORD PTR _b$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx+28]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	ecx, DWORD PTR _b$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax+32]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR [edx+8], esi
; Line 105
	pop	esi
	pop	ebp
	ret	0
_mat3_mul ENDP
_TEXT	ENDS
PUBLIC	_mat3_inv
_TEXT	SEGMENT
_mat3_inv PROC NEAR
; Line 106
	push	ebp
	mov	ebp, esp
; Line 109
	pop	ebp
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
; Line 110
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
; Line 111
	mov	eax, DWORD PTR _pitch$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _COS_LUT_SMALL[eax*4]
	mov	DWORD PTR _c$[ebp], ecx
; Line 112
	mov	edx, DWORD PTR _pitch$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _SIN_LUT_SMALL[edx*4]
	mov	DWORD PTR _s$[ebp], eax
; Line 113
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _w$[ebp], edx
; Line 114
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _x$[ebp], ecx
; Line 115
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _y$[ebp], eax
; Line 116
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _z$[ebp], edx
; Line 120
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _x$[ebp]
	push	edx
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [ecx+12], esi
; Line 121
	mov	edx, DWORD PTR _x$[ebp]
	push	edx
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _w$[ebp]
	push	ecx
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax], esi
; Line 122
	mov	ecx, DWORD PTR _y$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [edx+4], esi
; Line 123
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _y$[ebp]
	push	edx
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [ecx+8], esi
; Line 124
	pop	esi
	mov	esp, ebp
	pop	ebp
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
; Line 125
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
; Line 126
	mov	eax, DWORD PTR _yaw$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _COS_LUT_SMALL[eax*4]
	mov	DWORD PTR _c$[ebp], ecx
; Line 127
	mov	edx, DWORD PTR _yaw$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _SIN_LUT_SMALL[edx*4]
	mov	DWORD PTR _s$[ebp], eax
; Line 128
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _w$[ebp], edx
; Line 129
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _x$[ebp], ecx
; Line 130
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _y$[ebp], eax
; Line 131
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _z$[ebp], edx
; Line 135
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _y$[ebp]
	push	edx
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [ecx+12], esi
; Line 136
	mov	edx, DWORD PTR _x$[ebp]
	push	edx
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _z$[ebp]
	push	ecx
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax], esi
; Line 137
	mov	ecx, DWORD PTR _y$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [edx+4], esi
; Line 138
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _x$[ebp]
	push	edx
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [ecx+8], esi
; Line 139
	pop	esi
	mov	esp, ebp
	pop	ebp
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
; Line 140
	push	ebp
	mov	ebp, esp
	sub	esp, 24					; 00000018H
	push	esi
; Line 141
	mov	eax, DWORD PTR _roll$[ebp]
	and	eax, 255				; 000000ffH
	mov	ecx, DWORD PTR _COS_LUT_SMALL[eax*4]
	mov	DWORD PTR _c$[ebp], ecx
; Line 142
	mov	edx, DWORD PTR _roll$[ebp]
	and	edx, 255				; 000000ffH
	mov	eax, DWORD PTR _SIN_LUT_SMALL[edx*4]
	mov	DWORD PTR _s$[ebp], eax
; Line 143
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+12]
	mov	DWORD PTR _w$[ebp], edx
; Line 144
	mov	eax, DWORD PTR _a$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _x$[ebp], ecx
; Line 145
	mov	edx, DWORD PTR _a$[ebp]
	mov	eax, DWORD PTR [edx+4]
	mov	DWORD PTR _y$[ebp], eax
; Line 146
	mov	ecx, DWORD PTR _a$[ebp]
	mov	edx, DWORD PTR [ecx+8]
	mov	DWORD PTR _z$[ebp], edx
; Line 150
	mov	eax, DWORD PTR _w$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _z$[ebp]
	push	edx
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [ecx+12], esi
; Line 151
	mov	edx, DWORD PTR _x$[ebp]
	push	edx
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _y$[ebp]
	push	ecx
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax], esi
; Line 152
	mov	ecx, DWORD PTR _y$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	eax, DWORD PTR _x$[ebp]
	push	eax
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	edx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [edx+4], esi
; Line 153
	mov	eax, DWORD PTR _z$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _w$[ebp]
	push	edx
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [ecx+8], esi
; Line 154
	pop	esi
	mov	esp, ebp
	pop	ebp
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
; Line 155
	push	ebp
	mov	ebp, esp
	sub	esp, 68					; 00000044H
	push	esi
; Line 156
	mov	eax, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR [eax+12]
	mov	DWORD PTR _a$[ebp], ecx
; Line 157
	mov	edx, DWORD PTR _from$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _b$[ebp], eax
; Line 158
	mov	ecx, DWORD PTR _from$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	DWORD PTR _c$[ebp], edx
; Line 159
	mov	eax, DWORD PTR _from$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	mov	DWORD PTR _d$[ebp], ecx
; Line 160
	mov	edx, DWORD PTR _a$[ebp]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _b$[ebp]
	push	ecx
	mov	edx, DWORD PTR _b$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	eax, DWORD PTR _c$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _d$[ebp]
	push	edx
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	push	esi
	push	131072					; 00020000H
	call	_fixed_div
	add	esp, 8
	mov	DWORD PTR _s$[ebp], eax
; Line 161
	mov	ecx, DWORD PTR _s$[ebp]
	push	ecx
	mov	edx, DWORD PTR _b$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bs$[ebp], eax
; Line 162
	mov	eax, DWORD PTR _s$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cs$[ebp], eax
; Line 163
	mov	edx, DWORD PTR _s$[ebp]
	push	edx
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ds$[ebp], eax
; Line 164
	mov	ecx, DWORD PTR _bs$[ebp]
	push	ecx
	mov	edx, DWORD PTR _a$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ab$[ebp], eax
; Line 165
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	mov	ecx, DWORD PTR _a$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ac$[ebp], eax
; Line 166
	mov	edx, DWORD PTR _ds$[ebp]
	push	edx
	mov	eax, DWORD PTR _a$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ad$[ebp], eax
; Line 167
	mov	ecx, DWORD PTR _bs$[ebp]
	push	ecx
	mov	edx, DWORD PTR _b$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bb$[ebp], eax
; Line 168
	mov	eax, DWORD PTR _cs$[ebp]
	push	eax
	mov	ecx, DWORD PTR _b$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bc$[ebp], eax
; Line 169
	mov	edx, DWORD PTR _ds$[ebp]
	push	edx
	mov	eax, DWORD PTR _b$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _bd$[ebp], eax
; Line 170
	mov	ecx, DWORD PTR _cs$[ebp]
	push	ecx
	mov	edx, DWORD PTR _c$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cc$[ebp], eax
; Line 171
	mov	eax, DWORD PTR _ds$[ebp]
	push	eax
	mov	ecx, DWORD PTR _c$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cd$[ebp], eax
; Line 172
	mov	edx, DWORD PTR _ds$[ebp]
	push	edx
	mov	eax, DWORD PTR _d$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _dd$[ebp], eax
; Line 173
	mov	ecx, 65536				; 00010000H
	sub	ecx, DWORD PTR _cc$[ebp]
	sub	ecx, DWORD PTR _dd$[ebp]
	mov	edx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 174
	mov	eax, DWORD PTR _bc$[ebp]
	sub	eax, DWORD PTR _ad$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+4], eax
; Line 175
	mov	edx, DWORD PTR _bd$[ebp]
	add	edx, DWORD PTR _ac$[ebp]
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR [eax+8], edx
; Line 176
	mov	ecx, DWORD PTR _bc$[ebp]
	add	ecx, DWORD PTR _ad$[ebp]
	mov	edx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [edx+12], ecx
; Line 177
	mov	eax, 65536				; 00010000H
	sub	eax, DWORD PTR _bb$[ebp]
	sub	eax, DWORD PTR _dd$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+16], eax
; Line 178
	mov	edx, DWORD PTR _cd$[ebp]
	sub	edx, DWORD PTR _ab$[ebp]
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR [eax+20], edx
; Line 179
	mov	ecx, DWORD PTR _bd$[ebp]
	sub	ecx, DWORD PTR _ac$[ebp]
	mov	edx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [edx+24], ecx
; Line 180
	mov	eax, DWORD PTR _cd$[ebp]
	add	eax, DWORD PTR _ab$[ebp]
	mov	ecx, DWORD PTR _to$[ebp]
	mov	DWORD PTR [ecx+28], eax
; Line 181
	mov	edx, 65536				; 00010000H
	sub	edx, DWORD PTR _bb$[ebp]
	sub	edx, DWORD PTR _cc$[ebp]
	mov	eax, DWORD PTR _to$[ebp]
	mov	DWORD PTR [eax+32], edx
; Line 182
	pop	esi
	mov	esp, ebp
	pop	ebp
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
; Line 183
	push	ebp
	mov	ebp, esp
	sub	esp, 40					; 00000028H
	push	esi
; Line 188
	mov	eax, DWORD PTR _pitch$[ebp]
	and	eax, 255				; 000000ffH
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	eax, DWORD PTR _COS_LUT[eax*4]
	mov	DWORD PTR _cp$[ebp], eax
; Line 189
	mov	eax, DWORD PTR _pitch$[ebp]
	and	eax, 255				; 000000ffH
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _SIN_LUT[eax*4]
	mov	DWORD PTR _sp$[ebp], ecx
; Line 190
	mov	eax, DWORD PTR _yaw$[ebp]
	and	eax, 255				; 000000ffH
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _COS_LUT[eax*4]
	mov	DWORD PTR _cy$[ebp], edx
; Line 191
	mov	eax, DWORD PTR _yaw$[ebp]
	and	eax, 255				; 000000ffH
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	eax, DWORD PTR _SIN_LUT[eax*4]
	mov	DWORD PTR _sy$[ebp], eax
; Line 192
	mov	eax, DWORD PTR _roll$[ebp]
	and	eax, 255				; 000000ffH
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	ecx, DWORD PTR _COS_LUT[eax*4]
	mov	DWORD PTR _cr$[ebp], ecx
; Line 193
	mov	eax, DWORD PTR _roll$[ebp]
	and	eax, 255				; 000000ffH
	cdq
	sub	eax, edx
	sar	eax, 1
	mov	edx, DWORD PTR _SIN_LUT[eax*4]
	mov	DWORD PTR _sr$[ebp], edx
; Line 194
	mov	eax, DWORD PTR _cy$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cp$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cc$[ebp], eax
; Line 195
	mov	edx, DWORD PTR _sy$[ebp]
	push	edx
	mov	eax, DWORD PTR _cp$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _cs$[ebp], eax
; Line 196
	mov	ecx, DWORD PTR _cy$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sp$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _sc$[ebp], eax
; Line 197
	mov	eax, DWORD PTR _sy$[ebp]
	push	eax
	mov	ecx, DWORD PTR _sp$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	DWORD PTR _ss$[ebp], eax
; Line 198
	mov	edx, DWORD PTR _cr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cc$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _sr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ss$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+12], esi
; Line 199
	mov	ecx, DWORD PTR _cr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _sc$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	eax, DWORD PTR _sr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cs$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	edx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [edx], esi
; Line 200
	mov	eax, DWORD PTR _cr$[ebp]
	push	eax
	mov	ecx, DWORD PTR _cs$[ebp]
	push	ecx
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	edx, DWORD PTR _sr$[ebp]
	push	edx
	mov	eax, DWORD PTR _sc$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	sub	esi, eax
	mov	ecx, DWORD PTR _a$[ebp]
	mov	DWORD PTR [ecx+4], esi
; Line 201
	mov	edx, DWORD PTR _sr$[ebp]
	push	edx
	mov	eax, DWORD PTR _cc$[ebp]
	push	eax
	call	_fixed_mul
	add	esp, 8
	mov	esi, eax
	mov	ecx, DWORD PTR _cr$[ebp]
	push	ecx
	mov	edx, DWORD PTR _ss$[ebp]
	push	edx
	call	_fixed_mul
	add	esp, 8
	add	esi, eax
	mov	eax, DWORD PTR _a$[ebp]
	mov	DWORD PTR [eax+8], esi
; Line 202
	pop	esi
	mov	esp, ebp
	pop	ebp
	ret	0
_quat_create ENDP
_TEXT	ENDS
PUBLIC	_quat_slerp
_TEXT	SEGMENT
_quat_slerp PROC NEAR
; Line 203
	push	ebp
	mov	ebp, esp
; Line 205
	pop	ebp
	ret	0
_quat_slerp ENDP
_TEXT	ENDS
PUBLIC	_quat_conjugate
_TEXT	SEGMENT
_q$ = 8
_quat_conjugate PROC NEAR
; Line 207
	push	ebp
	mov	ebp, esp
; Line 208
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR [eax]
	neg	ecx
	mov	edx, DWORD PTR _q$[ebp]
	mov	DWORD PTR [edx], ecx
; Line 209
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR [eax+4]
	neg	ecx
	mov	edx, DWORD PTR _q$[ebp]
	mov	DWORD PTR [edx+4], ecx
; Line 210
	mov	eax, DWORD PTR _q$[ebp]
	mov	ecx, DWORD PTR [eax+8]
	neg	ecx
	mov	edx, DWORD PTR _q$[ebp]
	mov	DWORD PTR [edx+8], ecx
; Line 211
	pop	ebp
	ret	0
_quat_conjugate ENDP
_TEXT	ENDS
END
