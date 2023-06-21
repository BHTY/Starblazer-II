wcl386 -cc blazer.c graphics.c title.c sl_math.c font.c ui.c blazer2.c slipstr.c ecs.c hyptest.c star_dos.c -fe=star2.exe
del *.obj
del *.err
copy star2.exe \release\star2.exe
del star2.exe