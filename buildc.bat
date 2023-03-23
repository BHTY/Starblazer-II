del %1.exe
del %1.obj
wcc386 %1.c -i=C:\watcom\h
wlink file %1.obj libpath C:\watcom\lib386\dos libpath C:\watcom\lib386
