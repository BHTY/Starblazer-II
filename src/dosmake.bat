wcl386 -cc blazer.c graphics.c title.c sl_math.c font.c ui.c blazer2.c slipstr.c ecs.c hyptest.c sndmixer.c net_dos.c star_dos.c -ot -fe=star2.exe > output.txt
del *.obj
del *.err
copy blazer.exe \release\blazer.exe
del blazer.exe