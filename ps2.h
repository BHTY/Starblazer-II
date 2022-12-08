
unsigned char keys[256] = {0};

static unsigned char kbdus[128] =
{
    0,  27, '1', '2', '3', '4', '5', '6', '7', '8',     /* 9 */
  '9', '0', '-', '=', '\b',     /* Backspace */
  '\t',                 /* Tab */
  'q', 'w', 'e', 'r',   /* 19 */
  't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n', /* Enter key */
    0,                  /* 29   - Control */
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',     /* 39 */
 '\'', '`',   0,                /* Left shift */
 '\\', 'z', 'x', 'c', 'v', 'b', 'n',                    /* 49 */
  'm', ',', '.', '/',   0,                              /* Right shift */
  '*',
    0,  /* Alt */
  ' ',  /* Space bar */
    0,  /* Caps lock */
    0,  /* 59 - F1 key ... > */
    0,   0,   0,   0,   0,   0,   0,   0,
    0,  /* < ... F10 */
    0,  /* 69 - Num lock*/
    0,  /* Scroll Lock */
    0,  /* Home key */
    1,  /* Up Arrow */
    0,  /* Page Up */
  '-',
    3,  /* Left Arrow */
    0,
    4,  /* Right Arrow */
  '+',
    0,  /* 79 - End key*/
    2,  /* Down Arrow */
    0,  /* Page Down */
    0,  /* Insert Key */
    0,  /* Delete Key */
    0,   0,   0,
    0,  /* F11 Key */
    0,  /* F12 Key */
    0,  /* All other keys are undefined */
};



void scan_kbd(){
    unsigned char scancode;

    if(inp(0x64) & 0x1){
        return;
    }

    scancode = inp(0x60);

    if(scancode & 0x80){ //key has been released
        keys[kbdus[scancode - 0x80]] = 0;
    }

    else{ //key has been pressed
        keys[kbdus[scancode]] = 1;
    }
}