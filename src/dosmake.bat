wcl386 -cc star_dos.c blazer.c graphics.c title.c sl_math.c font.c ui.c blazer2.c slipstr.c ecs.c hyptest.c -fe=star2.exe
del *.obj
del *.err
copy star2.exe \release\star2.exe
del star2.exe