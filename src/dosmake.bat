wcl386 -c -cc -d1 -oneax -bcl=dos32a -i=\watcom\h blazer.c graphics.c title.c sl_math.c font.c ui.c blazer2.c 
wcl386 -c -cc -d1 -oneax -bcl=dos32a -i=\watcom\h slipstr.c ecs.c hyptest.c sndmixer.c serial.c net_dos.c star_dos.c

set lib=\watcom\lib386;\watcom\lib386\dos

wcl386 -cc -d1 -oneax -bcl=dos32a *.obj

del *.obj
del *.err
copy blazer.exe ..\release\blazer.exe
del blazer.exe
