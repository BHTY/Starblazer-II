del release\star_win.exe
nmake CPU=i386
copy vc20.pdb release\star_win.pdb
del vc20.pdb
copy *.asm asm
del *.asm
clean