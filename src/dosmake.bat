wcl386 -c -cc -ot -bcl=dos32a blazer.c graphics.c title.c sl_math.c font.c ui.c blazer2.c
wcl386 -c -cc -ot -bcl=dos32a slipstr.c ecs.c hyptest.c sndmixer.c net_dos.c star_dos.c
wcl386 -cc -ot -bcl=dos32a *.obj

del *.obj
del *.err
copy blazer.exe \release\blazer.exe
del blazer.exe