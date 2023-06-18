CC=gcc
CFLAGS=-g -fsanitize=address -lSDL2
DEPS = ../headers/blazer2.h  ../headers/ecs.h   ../headers/graphics.h  ../headers/int.h  ../headers/slipstr.h  ../headers/star_gen.h  ../headers/tables.h ../headers/blazer.h   ../headers/font.h  ../headers/hyptest.h   ../headers/net.h  ../headers/sl_math.h  ../headers/stats.h     ../headers/ui.h
OBJ = blazer2.o  blazer.o  ecs.o  font.o  graphics.o  hyptest.o  slipstr.o  sl_math.o  star_nix.o  title.o  ui.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

../release/star_nix: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
