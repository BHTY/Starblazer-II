typedef struct JoyState{
    int x, y;
    int b1, b2;
} JoyState;

void readMouseKeyboard(JoyState* joy){
    union REGS regs;
    regs.x.eax = 5;
    regs.x.ebx = 0;
    int386(0x33, &regs, &regs);

    if(regs.x.ebx & 65535){
        joy->b1 = 1;
    }

    regs.x.eax = 6;
    regs.x.ebx = 0;
    int386(0x33, &regs, &regs);

    if(regs.x.ebx & 65535){
        joy->b1 = 0;
    }

    regs.x.eax = 5;
    regs.x.ebx = 1;
    int386(0x33, &regs, &regs);

    if(regs.x.ebx & 65535){
        joy->b2 = 1;
    }

    regs.x.eax = 6;
    regs.x.ebx = 1;
    int386(0x33, &regs, &regs);

    if(regs.x.ebx & 65535){
        joy->b2 = 0;
    }

    regs.x.eax = 3;
    int386(0x33, &regs, &regs);

    joy->x = (regs.x.ecx & 65535) / 2;
    joy->y = regs.x.edx & 65535;
}