#include <dos.h>
typedef struct
{
    unsigned int segment;
    unsigned int offset;
    unsigned int selector;
} RMptr;

RMptr getmem(int size)
{
    union REGS regs;
    struct SREGS sregs;
    RMptr foo;

    segread(&sregs);
    regs.w.ax = 0x0100;
    regs.w.bx = (size+15) >> 4;
    int386x(0x31, &regs, &regs, &sregs);

    foo.segment = regs.w.ax;
    foo.offset = 0;
    foo.selector = regs.w.dx;
    return foo;
}
void freemem(RMptr foo)
{
    union REGS regs;
    struct SREGS sregs;

    segread(&sregs);
    regs.w.ax = 0x0101;
    regs.w.dx = foo.selector;
    int386x(0x31, &regs, &regs, &sregs);
}

void rm2pmcpy(RMptr from, char *to, int length)
{
    char far *pfrom;

    pfrom = (char far *)MK_FP(from.selector, 0);
    while (length--)
        *to++ = *pfrom++;
}

void pm2rmcpy(char *from, RMptr to, int length)
{
    char far *pto;

    pto = (char far *)MK_FP(to.selector, 0);
    while (length--)
        *pto++ = *from++;
}
