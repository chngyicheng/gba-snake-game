# 1 "main.c"
# 1 "<built-in>"
# 1 "<command line>"
# 1 "main.c"




# 1 "gba.h" 1







typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef signed char s8;
typedef signed short s16;
typedef signed int s32;

typedef unsigned char byte;
typedef unsigned short hword;
typedef unsigned int word;
# 211 "gba.h"
enum
{
    VBLANK_HANDLER,
    HBLANK_HANDLER,
    VCOUNT_HANDLER,
    TIMER0_HANDLER,
    TIMER1_HANDLER,
    TIMER2_HANDLER,
    TIMER3_HANDLER,
    SERIAL_COM_HANDLER,
    DMA0_HANDLER,
    DMA1_HANDLER,
    DMA2_HANDLER,
    DMA3_HANDLER,
    KEYS_HANDLER,
    CART_HANDLER,
    MAX_INTERRUPT_HANDLERS,
};
# 267 "gba.h"
typedef void (*fp)(void);
# 6 "main.c" 2
# 1 "snakeSprites.h" 1





int palette[] = {
((0) + (0<<5) + (0<<10)),
((31) + (31<<5) + (31<<10)),
((0) + (31<<5) + (31<<10)),
((26) + (26<<5) + (26<<10)),
((9) + (9<<5) + (9<<10)),
((31) + (31<<5) + (0<<10)),
((31) + (0<<5) + (0<<10)),
((0) + (0<<5) + (31<<10)),
((11) + (8<<5) + (3<<10)),
((27) + (27<<5) + (27<<10)),
((16) + (16<<5) + (16<<10)),
((31) + (17<<5) + (17<<10)),
((31) + (24<<5) + (24<<10)),
((27) + (0<<5) + (0<<10)),
((0) + (16<<5) + (0<<10)),
((0) + (31<<5) + (0<<10)),
((16) + (31<<5) + (16<<10)),
((23) + (31<<5) + (23<<10))
};




u16 sprites[] = {



14,14,14,14,14,14,14,14,
14,16,16,16,16,16,16,16,
14,17,17,14,17,17,14,17,
14,17,17,17,14,14,17,14,
14,17,17,14,17,17,14,17,
14,17,14,17,17,17,17,14,
14,17,17,14,1,1,14,17,
14,14,17,14,0,3,17,14,

14,14,14,14,14,14,14,14,
16,16,16,16,16,16,16,14,
17,14,17,17,14,17,17,14,
14,17,14,14,17,17,17,14,
17,14,17,17,14,17,17,14,
14,17,17,17,17,14,17,14,
17,14,1,1,14,17,17,14,
14,17,0,3,14,17,14,14,

0,14,14,17,0,0,17,14,
0,14,14,14,17,17,14,17,
0,0,14,14,17,14,17,17,
0,0,0,14,14,16,16,16,
0,0,0,0,14,14,14,14,
0,0,0,0,0,0,13,11,
0,0,0,0,0,13,11,13,
0,0,0,0,13,11,13,0,

14,17,0,0,17,14,14,0,
17,14,17,17,14,14,14,0,
17,17,14,17,14,14,0,0,
16,16,16,14,14,0,0,0,
14,14,14,14,0,0,0,0,
11,13,0,0,0,0,0,0,
13,11,13,0,0,0,0,0,
0,13,11,13,0,0,0,0,



14,14,14,14,14,14,14,14,
14,16,17,17,17,17,17,14,
14,16,17,17,17,14,17,17,
14,16,14,17,14,17,14,14,
14,16,17,14,17,17,1,0,
14,16,17,14,17,17,1,3,
14,16,14,17,14,17,14,17,
14,16,17,14,17,14,17,14,

0,0,0,0,0,0,0,0,
14,14,0,0,0,0,0,0,
14,14,14,0,0,0,0,0,
17,14,14,14,0,0,0,0,
0,17,17,14,14,0,0,13,
0,17,14,16,14,0,13,11,
17,14,17,16,14,13,11,13,
14,17,17,16,14,11,13,0,

14,16,17,14,17,14,17,14,
14,16,14,17,14,17,14,17,
14,16,17,14,17,17,1,0,
14,16,17,14,17,17,1,3,
14,16,14,17,14,17,14,14,
14,16,17,17,17,14,17,17,
14,16,17,17,17,17,17,14,
14,14,14,14,14,14,14,14,

14,17,17,16,14,11,13,0,
17,14,17,16,14,13,11,13,
0,17,14,16,14,0,13,11,
0,17,17,14,14,0,0,13,
17,14,14,14,0,0,0,0,
14,14,14,0,0,0,0,0,
14,14,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,13,11,13,0,
0,0,0,0,0,13,11,13,
0,0,0,0,0,0,13,11,
0,0,0,0,14,14,14,14,
0,0,0,14,14,16,16,16,
0,0,14,14,17,14,17,17,
0,14,14,14,17,17,14,17,
0,14,14,17,0,0,17,14,

0,13,11,13,0,0,0,0,
13,11,13,0,0,0,0,0,
11,13,0,0,0,0,0,0,
14,14,14,14,0,0,0,0,
16,16,16,14,14,0,0,0,
17,17,14,17,14,14,0,0,
17,14,17,17,14,14,14,0,
14,17,0,0,17,14,14,0,

14,14,17,14,0,3,17,14,
14,17,17,14,1,1,14,17,
14,17,14,17,17,17,17,14,
14,17,17,14,17,17,14,17,
14,17,17,17,14,14,17,14,
14,17,17,14,17,17,14,17,
14,16,16,16,16,16,16,16,
14,14,14,14,14,14,14,14,

14,17,0,3,14,17,14,14,
17,14,1,1,14,17,17,14,
14,17,17,17,17,14,17,14,
17,14,17,17,14,17,17,14,
14,17,14,14,17,17,17,14,
17,14,17,17,14,17,17,14,
16,16,16,16,16,16,16,14,
14,14,14,14,14,14,14,14,



0,0,0,0,0,0,0,0,
0,0,0,0,0,0,14,14,
0,0,0,0,0,14,14,14,
0,0,0,0,14,14,14,17,
13,0,0,14,14,17,17,0,
11,13,0,14,16,14,17,0,
13,11,13,14,16,17,14,17,
0,13,11,14,16,17,17,14,

14,14,14,14,14,14,14,14,
14,17,17,17,17,17,16,14,
17,17,14,17,17,17,16,14,
14,14,17,14,17,14,16,14,
0,1,17,17,14,17,16,14,
3,1,17,17,14,17,16,14,
17,14,17,14,17,14,16,14,
14,17,14,17,14,17,16,14,

0,13,11,14,16,17,17,14,
13,11,13,14,16,17,14,17,
11,13,0,14,16,14,17,0,
13,0,0,14,14,17,17,0,
0,0,0,0,14,14,14,17,
0,0,0,0,0,14,14,14,
0,0,0,0,0,0,14,14,
0,0,0,0,0,0,0,0,

14,17,14,17,14,17,16,14,
17,14,17,14,17,14,16,14,
0,1,17,17,14,17,16,14,
3,1,17,17,14,17,16,14,
14,14,17,14,17,14,16,14,
17,17,14,17,17,17,16,14,
14,17,17,17,17,17,16,14,
14,14,14,14,14,14,14,14,



14,14,14,14,14,14,14,14,
14,16,16,16,14,16,16,16,
14,16,17,14,14,17,17,17,
14,16,14,14,17,17,14,17,
14,14,14,17,17,14,14,17,
14,16,17,17,17,14,17,17,
14,16,17,17,14,14,14,17,
14,14,14,17,17,17,14,14,


14,14,14,14,14,14,14,14,
14,16,16,16,14,16,16,14,
14,14,17,17,17,14,14,14,
17,14,14,17,17,17,16,14,
17,17,14,17,17,17,16,14,
17,17,14,14,14,17,16,14,
17,17,17,17,14,14,16,14,
17,14,17,17,17,14,14,14,


14,16,14,14,17,17,17,14,
14,16,17,14,14,17,14,14,
14,16,17,17,14,17,17,17,
14,16,14,14,14,17,17,17,
14,16,14,17,17,17,17,17,
14,14,14,17,17,14,14,17,
14,16,16,16,14,16,16,14,
14,14,14,14,14,14,14,14,


14,14,17,17,17,17,16,14,
17,14,14,17,17,14,14,14,
17,14,17,17,14,14,16,14,
14,14,17,17,14,17,16,14,
14,17,17,14,14,17,16,14,
17,17,14,14,17,17,16,14,
16,16,14,16,16,16,16,14,
14,14,14,14,14,14,14,14,



0,0,0,0,0,0,0,8,
0,0,0,0,0,16,16,16,
0,0,0,0,0,0,0,8,
0,0,0,0,13,13,13,13,
0,0,0,13,11,11,11,11,
0,0,13,11,11,1,11,11,
0,0,13,11,11,11,11,11,
0,0,13,11,1,11,11,11,

8,8,0,0,0,0,0,0,
8,0,0,0,0,0,0,0,
8,0,0,0,0,0,0,0,
13,13,13,13,0,0,0,0,
11,11,11,11,13,0,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,

0,0,13,11,1,11,11,11,
0,0,13,11,1,11,11,11,
0,0,13,11,11,11,11,11,
0,0,13,11,11,11,11,11,
0,0,13,11,11,11,11,11,
0,0,0,13,11,11,11,11,
0,0,0,0,13,13,13,13,
0,0,0,0,0,0,0,0,

11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,13,0,0,0,
13,13,13,13,0,0,0,0,
0,0,0,0,0,0,0,0,



0,0,0,0,1,1,1,1,
0,0,0,0,1,1,1,1,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,

1, 1, 1, 1, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 1, 1, 1, 1, 1, 0, 0,

0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 0, 0, 0, 0, 0, 0,

0, 1, 1, 1, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
1, 1, 1, 1, 0, 0, 0, 0,
1, 1, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,


0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 1, 1, 1, 1,

1, 1, 1, 1, 0, 0, 0, 0,
1, 1, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,

0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,

0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,


0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 1, 1, 0, 0,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 0, 0, 1, 1,
0, 0, 1, 1, 0, 0, 0, 1,
0, 0, 1, 1, 0, 0, 0, 1,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,

0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 1, 1, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
1, 1, 0, 0, 1, 1, 0, 0,
1, 0, 0, 0, 1, 1, 0, 0,
1, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,

0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,

0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,


0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 1, 1, 1, 1,

1, 1, 1, 1, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
1, 1, 1, 1, 1, 0, 0, 0,
1, 1, 1, 1, 1, 0, 0, 0,

0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 0, 0, 0, 0, 0, 0,

0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,


0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,

1, 1, 1, 1, 0, 0, 0, 0,
1, 1, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,

0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 0, 0, 1, 1, 1, 1,
0, 0, 0, 0, 0, 0, 0, 0,

0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
1, 1, 1, 1, 0, 0, 0, 0,
1, 1, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,


0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 1, 1, 0, 0,

0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 1, 1, 1, 1, 0, 0,

0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 1, 0,
0, 0, 0, 0, 0, 1, 1, 0,
0, 0, 0, 0, 0, 1, 1, 1,
0, 0, 0, 0, 0, 0, 1, 1,
0, 0, 0, 0, 0, 0, 0, 1,
0, 0, 0, 0, 0, 0, 0, 0,

0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 1, 1, 1, 0, 0, 0, 0,
0, 1, 1, 0, 0, 0, 0, 0,
1, 1, 1, 0, 0, 0, 0, 0,
1, 1, 0, 0, 0, 0, 0, 0,
1, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,


0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 1, 1, 1, 1,

1, 1, 1, 1, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
0, 0, 0, 0, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,
1, 1, 1, 1, 1, 1, 0, 0,

0, 0, 1, 1, 1, 1, 1, 1,
0, 0, 1, 1, 0, 0, 1, 1,
0, 0, 1, 1, 0, 0, 0, 1,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,

0, 0, 0, 0, 0, 0, 0, 0,
1, 0, 0, 0, 0, 0, 0, 0,
1, 1, 0, 0, 0, 0, 0, 0,
1, 1, 1, 0, 0, 0, 0, 0,
0, 1, 1, 1, 0, 0, 0, 0,
0, 0, 1, 1, 1, 1, 0, 0,
0, 0, 0, 1, 1, 1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0,



0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,0,0,0,0,
0,0,15,15,0,0,0,0,
0,0,15,15,0,0,0,0,
0,0,15,15,0,0,0,0,
0,0,15,15,15,15,15,15,

15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
15,15,15,15,15,15,0,0,

0,0,15,15,15,15,15,15,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,

15,15,15,15,15,15,0,0,
0,0,0,0,15,15,0,0,
0,0,0,0,15,15,0,0,
0,0,0,0,15,15,0,0,
0,0,0,0,15,15,0,0,
15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,



0,15,15,15,0,0,0,0,
0,15,15,15,15,0,0,0,
0,15,15,15,15,15,0,0,
0,15,15,15,15,15,15,0,
0,15,15,15,15,15,15,15,
0,15,15,15,15,15,15,15,
0,15,15,15,15,15,15,15,
0,15,15,15,15,15,15,15,


0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
15,0,0,0,15,15,15,0,
15,15,0,0,15,15,15,0,
15,15,15,0,15,15,15,0,


0,15,15,15,0,15,15,15,
0,15,15,15,0,0,15,15,
0,15,15,15,0,0,0,15,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,


15,15,15,15,15,15,15,0,
15,15,15,15,15,15,15,0,
15,15,15,15,15,15,15,0,
15,15,15,15,15,15,15,0,
0,15,15,15,15,15,15,0,
0,0,15,15,15,15,15,0,
0,0,0,15,15,15,15,0,
0,0,0,0,15,15,15,0,



0,0,0,0,0,15,15,15,
0,0,0,0,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,


15,15,0,0,0,0,0,0,
15,15,15,0,0,0,0,0,
15,15,15,15,0,0,0,0,
15,15,15,15,0,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,


0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,


15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,



0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,


0,0,15,15,15,15,0,0,
0,15,15,15,15,15,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,0,0,0,0,
15,15,15,0,0,0,0,0,
15,15,0,0,0,0,0,0,
15,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,


0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,0,15,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,


0,0,0,0,0,0,0,0,
15,0,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,
15,15,15,0,0,0,0,0,
15,15,15,15,0,0,0,0,
15,15,15,15,15,0,0,0,
0,15,15,15,15,15,0,0,
0,0,15,15,15,15,0,0,



0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,


15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,


0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,


15,15,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,



0,0,0,0,15,15,15,15,
0,0,0,15,1,1,15,15,
0,0,0,15,1,0,1,1,
0,0,0,15,15,1,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,0,0,0,0,0,
0,0,0,0,0,11,11,11,


15,15,15,15,0,0,0,0,
15,1,1,1,15,0,0,0,
1,1,0,1,15,0,0,0,
15,1,1,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,0,15,15,15,0,0,0,
0,0,15,14,14,0,0,0,
15,15,15,15,15,0,0,0,


0,0,11,11,11,11,0,0,
0,0,0,11,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,15,
0,0,0,0,0,0,15,15,
0,0,0,0,0,0,15,15,
0,0,0,0,0,0,15,15,
0,0,0,0,0,0,0,15,


0,15,14,14,14,0,8,0,
15,15,15,15,0,0,15,0,
0,14,14,14,0,0,14,0,
15,15,15,0,0,0,15,0,
14,14,0,0,0,14,15,0,
15,14,15,14,15,14,15,0,
15,14,15,14,15,15,15,0,
15,15,15,15,15,15,0,0,



0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,0,0,0,
0,3,3,0,0,0,0,0,



0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,3,3,0,0,
0,3,3,0,0,3,3,0,



0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,



0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,0,0,0,3,3,0,0,
0,0,0,0,3,3,0,0,
0,3,3,0,3,3,0,0,
0,3,3,0,3,3,0,0,
0,3,3,3,3,3,0,0,
0,3,3,3,3,3,0,0,



0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,0,0,0,
0,3,3,3,3,3,0,0,
0,3,3,3,3,3,0,0,
0,3,3,0,0,0,0,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,



0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,0,0,0,
0,3,3,0,0,0,0,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,



0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,



10,10,10,10,0,10,10,10,
10,0,0,10,0,10,0,0,
10,0,0,10,0,10,0,0,
10,10,10,10,0,10,10,10,
10,0,0,0,0,10,10,0,
10,0,0,0,0,10,10,10,
10,0,0,0,0,10,0,10,
10,0,0,0,0,10,0,0,


10,0,10,10,10,10,0,10,
10,0,10,0,0,0,0,10,
10,0,10,0,0,0,0,10,
10,0,10,10,10,0,0,10,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,10,
10,0,10,0,0,0,0,10,
10,0,10,10,10,10,0,10,


10,10,10,0,10,10,10,10,
0,0,10,0,10,0,0,10,
0,0,0,0,10,0,0,0,
10,10,10,0,10,10,10,10,
0,0,10,0,0,0,0,10,
0,0,10,0,10,0,0,10,
0,0,10,0,10,0,0,10,
10,10,10,0,10,10,10,10,


0,0,0,10,10,10,10,0,
0,0,0,10,0,0,10,0,
0,0,0,10,0,0,0,0,
0,0,0,10,10,10,10,0,
0,0,0,0,0,0,10,0,
0,0,0,10,0,0,10,0,
0,0,0,10,0,0,10,0,
0,0,0,10,10,10,10,0,


10,10,10,10,10,0,0,10,
0,0,10,0,0,0,10,0,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,10,10,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,0,0,


0,0,0,10,10,10,10,0,
10,0,0,10,0,0,10,0,
0,10,0,10,0,0,10,0,
0,10,0,10,10,10,10,0,
10,10,0,10,10,0,0,0,
0,10,0,10,10,10,0,0,
0,10,0,10,0,10,10,0,
0,10,0,10,0,0,10,0,


10,10,10,10,10,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,



1,0,0,0,0,0,1,0,
0,1,0,0,0,1,0,0,
0,0,1,0,1,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,
0,0,0,1,0,0,0,0,


0,1,1,1,0,0,1,0,
1,0,0,0,1,0,1,0,
1,0,0,0,1,0,1,0,
1,0,0,0,1,0,1,0,
1,0,0,0,1,0,1,0,
1,0,0,0,1,0,1,0,
1,0,0,0,1,0,1,0,
0,1,1,1,0,0,0,1,


0,0,1,0,1,1,1,1,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,1,1,1,
0,0,1,0,1,1,0,0,
0,0,1,0,1,0,1,0,
0,0,1,0,1,0,0,1,
1,1,0,0,1,0,0,0,


0,0,0,0,0,0,0,1,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,1,0,
1,0,0,0,0,0,0,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
1,0,0,0,0,0,1,1,


1,1,1,0,0,1,1,1,
0,0,0,0,1,0,0,0,
0,0,0,0,1,0,0,0,
1,1,0,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
0,0,1,0,1,0,0,0,
1,1,0,0,0,1,1,1,


0,0,0,1,1,1,0,0,
1,0,1,0,0,0,1,0,
0,0,1,0,0,0,1,0,
0,0,1,0,0,0,1,0,
0,0,1,0,0,0,1,0,
0,0,1,0,0,0,1,0,
1,0,1,0,0,0,1,0,
0,0,0,1,1,1,0,0,


1,1,1,1,0,0,0,1,
1,0,0,0,1,0,0,1,
1,0,0,0,1,1,0,1,
1,0,0,0,1,0,0,1,
1,1,1,1,0,0,0,1,
1,0,0,1,0,0,0,1,
1,0,0,0,1,0,0,1,
1,0,0,0,0,1,0,1,


1,1,1,1,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,1,1,
1,1,1,0,0,0,1,1,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,1,1,
0,0,0,0,0,0,1,1,
1,1,1,1,0,0,0,0,






0,0,1,1,1,1,0,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,1,1,0,
0,1,1,0,1,0,1,0,
0,1,1,1,0,0,1,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,

0,0,0,0,1,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,1,1,0,0,

0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,0,0,0,0,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,1,1,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,0,0,0,0,
0,1,1,1,1,1,1,0,

0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,0,0,0,0,1,0,
0,0,0,0,0,0,1,0,
0,0,0,1,1,1,0,0,
0,0,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,0,1,1,1,1,0,0,

0,0,0,0,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,1,1,0,1,0,0,
0,1,1,0,0,1,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,

0,1,1,1,1,1,1,0,
0,1,1,1,1,1,1,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,0,1,1,1,1,0,0,
0,0,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,0,1,1,1,1,0,0,

0,0,0,1,1,1,1,0,
0,0,1,1,1,1,1,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,1,1,1,0,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,

0,1,1,1,1,1,1,0,
0,1,1,1,1,1,1,0,
0,1,0,0,0,1,1,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,0,0,0,0,

0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,1,0,0,0,1,0,
0,0,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,

0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0
};
# 7 "main.c" 2
# 1 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 1 3 4
# 10 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 1 3 4
# 15 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/newlib.h" 1 3 4
# 16 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/config.h" 1 3 4



# 1 "/usr/local/arm-thumb-elf/sys-include/machine/ieeefp.h" 1 3 4
# 5 "/usr/local/arm-thumb-elf/sys-include/sys/config.h" 2 3 4
# 17 "/usr/local/arm-thumb-elf/sys-include/_ansi.h" 2 3 4
# 11 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4



# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 213 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 325 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef int wchar_t;
# 15 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4

# 1 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 1 3 4
# 14 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 1 3 4
# 12 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 3 4
typedef long _off_t;
__extension__ typedef long long _off64_t;


typedef int _ssize_t;





# 1 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 1 3 4
# 354 "/usr/local/lib/gcc-lib/arm-thumb-elf/3.3.6/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 23 "/usr/local/arm-thumb-elf/sys-include/sys/_types.h" 2 3 4


typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;

typedef int _flock_t;
# 15 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 2 3 4




typedef unsigned long __ULong;
# 40 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};
# 68 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _atexit {
        struct _atexit *_next;
        int _ind;
        void (*_fns[32])(void);
        void *_fnargs[32];
        __ULong _fntypes;
};
# 91 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct __sbuf {
        unsigned char *_base;
        int _size;
};






typedef long _fpos_t;
# 156 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (void * _cookie, char *_buf, int _n);
  int (*_write) (void * _cookie, const char *_buf, int _n);

  _fpos_t (*_seek) (void * _cookie, _fpos_t _offset, int _whence);
  int (*_close) (void * _cookie);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  int _offset;


  struct _reent *_data;



  _flock_t _lock;

};
# 249 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
typedef struct __sFILE __FILE;


struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 280 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 532 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;


  struct _atexit *_atexit;
  struct _atexit _atexit0;


  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 728 "/usr/local/arm-thumb-elf/sys-include/sys/reent.h" 3 4
extern struct _reent *_impure_ptr ;

void _reclaim_reent (struct _reent *);
# 17 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4
# 1 "/usr/local/arm-thumb-elf/sys-include/machine/stdlib.h" 1 3 4
# 18 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4

# 1 "/usr/local/arm-thumb-elf/sys-include/alloca.h" 1 3 4
# 20 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 2 3 4




typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;
# 45 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4
extern int __mb_cur_max;



void abort (void) __attribute__ ((noreturn));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);

float atoff (const char *__nptr);

int atoi (const char *__nptr);
long atol (const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, int (* _compar) (const void *, const void *));




void * calloc (size_t __nmemb, size_t __size);
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((noreturn));
void free (void *);
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);
long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size);
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *, const char *, size_t);
int _mbtowc_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *, const char *, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *, const char *, size_t, _mbstate_t *);
size_t wcstombs (char *, const wchar_t *, size_t);
size_t _wcstombs_r (struct _reent *, char *, const wchar_t *, size_t, _mbstate_t *);


int mkstemp (char *);
char * mktemp (char *);


void qsort (void * __base, size_t __nmemb, size_t __size, int(*_compar)(const void *, const void *));
int rand (void);
void * realloc (void * __r, size_t __size);
void srand (unsigned __seed);
double strtod (const char *__n, char **__end_PTR);
double _strtod_r (struct _reent *,const char *__n, char **__end_PTR);
float strtof (const char *__n, char **__end_PTR);






long strtol (const char *__n, char **__end_PTR, int __base);
long _strtol_r (struct _reent *,const char *__n, char **__end_PTR, int __base);
unsigned long strtoul (const char *__n, char **__end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *__n, char **__end_PTR, int __base);

int system (const char *__string);


long a64l (const char *__input);
char * l64a (long __input);
char * _l64a_r (struct _reent *,long __input);
int on_exit (void (*__func)(int, void *),void * __arg);
void _Exit (int __status) __attribute__ ((noreturn));
int putenv (const char *__string);
int _putenv_r (struct _reent *, const char *__string);
int setenv (const char *__string, const char *__value, int __overwrite);
int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);

char * gcvt (double,int,char *);
char * gcvtf (float,int,char *);
char * fcvt (double,int,int *,int *);
char * fcvtf (float,int,int *,int *);
char * ecvt (double,int,int *,int *);
char * ecvtbuf (double, int, int*, int*, char *);
char * fcvtbuf (double, int, int*, int*, char *);
char * ecvtf (float,int,int *,int *);
char * dtoa (double, int, int, int *, int*, char**);
int rand_r (unsigned *__seed);

double drand48 (void);
double _drand48_r (struct _reent *);
double erand48 (unsigned short [3]);
double _erand48_r (struct _reent *, unsigned short [3]);
long jrand48 (unsigned short [3]);
long _jrand48_r (struct _reent *, unsigned short [3]);
void lcong48 (unsigned short [7]);
void _lcong48_r (struct _reent *, unsigned short [7]);
long lrand48 (void);
long _lrand48_r (struct _reent *);
long mrand48 (void);
long _mrand48_r (struct _reent *);
long nrand48 (unsigned short [3]);
long _nrand48_r (struct _reent *, unsigned short [3]);
unsigned short *
       seed48 (unsigned short [3]);
unsigned short *
       _seed48_r (struct _reent *, unsigned short [3]);
void srand48 (long);
void _srand48_r (struct _reent *, long);
long long strtoll (const char *__n, char **__end_PTR, int __base);
long long _strtoll_r (struct _reent *, const char *__n, char **__end_PTR, int __base);
unsigned long long strtoull (const char *__n, char **__end_PTR, int __base);
unsigned long long _strtoull_r (struct _reent *, const char *__n, char **__end_PTR, int __base);


void cfree (void *);
# 172 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t);
void * _calloc_r (struct _reent *, size_t, size_t);
void _free_r (struct _reent *, void *);
void * _realloc_r (struct _reent *, void *, size_t);
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 213 "/usr/local/arm-thumb-elf/sys-include/stdlib.h" 3 4

# 8 "main.c" 2






typedef struct{
        int x;
        int y;
        int dir;
} tuple;


typedef struct{
        tuple *body;
        int size;
} snakeInfo;



int dir = 0;
int gamemode = 0;
snakeInfo snake;
tuple apple;
int dirX[4] = {0,16,0,-16};
int dirY[4] = {16,0,-16,0};
int firstApple = 1;

void drawSprite16(int numb, int N, int x, int y);
void drawSprite8(int numb, int N, int x, int y);
void Handler(void);
void fillPalette(void);
void fillSprites(void);
void checkbuttonDIR(void);
void snakeUpdateInfo(int direction);
void foodandgrow(void);


void drawSprite16(int numb, int N, int x, int y) {

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8*N) = numb*8;
}



void drawSprite8(int numb, int N, int x, int y) {

    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}


void Handler(void) {
    *(u16*)0x4000208 = 0x00;

    if((*(u16*)0x4000202&0x8)==0x8) {
        gameModeCheck();
    }
    *(u16*)0x4000202 = *(u16*)0x4000202;
    *(u16*)0x4000208 = 0x01;
}


void gameModeCheck(void) {

    if (gamemode == 0) {
        resetGame();
        startScreen();
        checkbuttonSTART();
    }
    else if (gamemode == 1) {
        checkbuttonSTART();
        snakeMovement();
    }
    else if (gamemode == 2) {
        if (firstApple == 0) {
            clearScreen();
            firstApple = 1;
        }
        endScreen();
        checkbuttonSTART();
    }
    else if (gamemode == 3) {
        pauseScreen();
        checkbuttonSTART();
    }
}


void checkbuttonSTART(void) {

    u16 buttons = (0x3FF & (~*(volatile u16*)0x4000130));
    int i;

    if ((buttons & 0x008) == 0x008 && gamemode == 0) {
        gamemode = 1;
        for(i = 1; i < 30; i++) {
            drawSprite16(0, i, 240,160);
            drawSprite8(0, i, 240,160);
        }
    }
    else if ((buttons & 0x008) == 0x008 && gamemode == 1) {
        gamemode = 3;
    }
    else if ((buttons & 0x008) == 0x008 && gamemode == 2) {
        gamemode = 0;
        clearScreen();
        resetGame();
    }
    else if ((buttons & 0x008) == 0x008 && gamemode == 3) {
        for(i = 1; i < 30; i++) {
            drawSprite16(0, i, 240,160);
            drawSprite8(0, i, 240,160);
        }
        gamemode = 1;
    }
}


void snakeMovement(void) {

    int i;

    checkbuttonDIR();
    snakeUpdateInfo(dir);


    for (i = snake.size - 1; i > 0; i -= 1) {
        if (snake.body[i].x == snake.body->x && snake.body[i].y == snake.body->y && i != 1) {
            gamemode = 2;
            snake.body->x -= dirX[dir];
            snake.body->y -= dirY[dir];
            drawSprite16(dir, 30, snake.body->x, snake.body->y);
            return 0;
        }
    }
    drawSprite16(dir, 30, snake.body->x, snake.body->y);

    for (i = 1; i < snake.size; i += 1) {
        drawSprite16(4, 30 + i, snake.body[i].x, snake.body[i].y);
    }
    foodAndGrow();
}


void checkbuttonDIR(void) {

    u16 buttons = (0x3FF & (~*(volatile u16*)0x4000130));

    if ((buttons & 0x080) == 0x080 && dir != 2) {
        dir = 0;
         }
    else if ((buttons & 0x010) == 0x010 && dir != 3) {
        dir = 1;
    }
    else if ((buttons & 0x040) == 0x040 && dir != 0) {
        dir = 2;
    }
    else if ((buttons & 0x020) == 0x020 && dir != 1) {
        dir = 3;
    }
}


void snakeUpdateInfo(int direction) {

    int i;

    for (i = snake.size - 1; i > 0; i -= 1) {
        snake.body[i].x = snake.body[i-1].x;
        snake.body[i].y = snake.body[i-1].y;
        snake.body[i].dir = snake.body[i-1].dir;
    }

    snake.body->x += dirX[direction];
    snake.body->y += dirY[direction];
    snake.body->dir = direction;

    if (snake.body->y == 160) {
        snake.body->y = 0;
    }
    if (snake.body->x == 240) {
        snake.body->x = 0;
    }
    if (snake.body->y < 0) {
        snake.body->y =160;
    }
    if (snake.body->x < 0) {
        snake.body->x = 240;
    }
}


void foodAndGrow(void) {

    if (firstApple == 1) {
        apple.x = (rand()%(15))*16;
        apple.y = (rand()%(10))*16;
        firstApple = 0;
    }
    else if (snake.body->x == apple.x && snake.body->y == apple.y) {
        snake.size += 1;
        apple.x = (rand()%(15))*16;
        apple.y = (rand()%(10))*16;
    }

    appleOverlap();
    drawSprite16(5, 1, apple.x, apple.y);
}


void appleOverlap(void) {

    int i;

    for (i = 1; i <= snake.size; i++) {
        if (snake.body[i].x == apple.x && snake.body[i].y == apple.y) {
            apple.x = (rand()%(15))*16;
            apple.y = (rand()%(10))*16;
            appleOverlap();
            break;
        }
    }
}


void clearScreen(void) {

    int i;

    for(i = 0; i < 200; i++) {
        drawSprite16(0, i, 240,160);
        drawSprite8(0, i, 240,160);
    }
}


void resetGame(void) {

    snake.body = malloc(150);
    snake.body-> x = 64;
    snake.body-> y = 48;
    snake.size = 1;
    dir = 0;
}


void startScreen(void) {

    drawSprite16(13, 1, 84, 48);
    drawSprite16(14, 2, 100, 48);
    drawSprite16(15, 3, 115, 48);
    drawSprite16(16, 4, 127, 48);
    drawSprite16(17, 5, 141, 48);

         drawSprite16(18, 20, 156, 48);

    drawSprite8(76, 6, 68, 75);
    drawSprite8(77, 7, 84, 75);
    drawSprite8(78, 8, 100, 75);
    drawSprite8(79, 9, 116, 75);
    drawSprite8(80, 10, 132, 75);
    drawSprite8(81, 11, 148, 75);
    drawSprite8(82, 12, 164, 75);

    drawSprite8(83, 13, 92, 105);
    drawSprite8(84, 14, 100, 105);
    drawSprite8(85, 15, 108, 105);
    drawSprite8(86, 16, 116, 105);
    drawSprite8(87, 17, 124, 105);
    drawSprite8(88, 18, 132, 105);
    drawSprite8(89, 19, 140, 105);

    drawSprite16(dir, 30, snake.body->x, snake.body->y);
}


void endScreen(void) {

    drawSprite16(6, 1, 48, 50);
    drawSprite16(7, 2, 64, 50);
    drawSprite16(8, 3, 80, 50);
    drawSprite16(9, 4, 96, 50);
    drawSprite16(10, 5, 128, 50);
    drawSprite16(11, 6, 144, 50);
    drawSprite16(9, 7, 160, 50);
    drawSprite16(12, 8, 176, 50);

    drawSprite8(83, 13, 92, 85);
    drawSprite8(84, 14, 100, 85);
    drawSprite8(85, 15, 108, 85);
    drawSprite8(86, 16, 116, 85);
    drawSprite8(87, 17, 124, 85);
    drawSprite8(88, 18, 132, 85);
    drawSprite8(89, 19, 140, 85);

    drawSprite8(90, 20, 76, 100);
    drawSprite8(91, 21, 84, 100);
    drawSprite8(92, 22, 92, 100);
    drawSprite8(93, 23, 100, 100);
    drawSprite8(94, 24, 108, 100);
    drawSprite8(95, 25, 116, 100);
    drawSprite8(96, 26, 124, 100);
         drawSprite8(97, 27, 132, 100);

    if (snake.size >= 10) {
        drawSprite8(98 + ((snake.size-1)/10), 28, 150, 100);
    } else {
        drawSprite8(98, 28, 150, 120);
    }
    drawSprite8(98 + (snake.size-1)%10, 29, 158, 100);

}


void pauseScreen(void) {

    drawSprite16(13, 1, 84, 48);
    drawSprite16(14, 2, 100, 48);
    drawSprite16(15, 3, 115, 48);
    drawSprite16(16, 4, 127, 48);
    drawSprite16(17, 5, 141, 48);

    drawSprite8(76, 6, 68, 75);
    drawSprite8(77, 7, 84, 75);
    drawSprite8(78, 8, 100, 75);
    drawSprite8(79, 9, 116, 75);
    drawSprite8(80, 10, 132, 75);
    drawSprite8(81, 11, 148, 75);
    drawSprite8(82, 12, 164, 75);

    drawSprite8(83, 13, 92, 105);
    drawSprite8(84, 14, 100, 105);
    drawSprite8(85, 15, 108, 105);
    drawSprite8(86, 16, 116, 105);
    drawSprite8(87, 17, 124, 105);
    drawSprite8(88, 18, 132, 105);
    drawSprite8(89, 19, 140, 105);

    drawSprite8(90, 20, 76, 120);
    drawSprite8(91, 21, 84, 120);
    drawSprite8(92, 22, 92, 120);
    drawSprite8(93, 23, 100, 120);
    drawSprite8(94, 24, 108, 120);
    drawSprite8(95, 25, 116, 120);
    drawSprite8(96, 26, 124, 120);
         drawSprite8(97, 27, 132, 120);

    drawSprite16(37, 100, 100, 140);

    if (snake.size >= 10) {
        drawSprite8(98 + ((snake.size-1)/10), 28, 150, 120);
    } else {
        drawSprite8(98, 28, 150, 120);
    }
    drawSprite8(98 + (snake.size-1)%10, 29, 158, 120);


}


void fillPalette(void) {
    int i;


    for (i = 0; i < 20; i++)
        ((unsigned short *) 0x5000200)[i] = palette[i];
}


void fillSprites(void) {
    int i;


    for (i = 0; i < 128*16*16; i++)
        ((unsigned short *) 0x6010000)[i] = (sprites[i*2+1] << 8) + sprites[i*2];

        clearScreen();
}






int main(void)
{

    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;
    fillPalette();
    fillSprites();


    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = ((31) + (31<<5) + (31<<10));


    (*(unsigned int*)0x3007FFC) = (int)&Handler;
    *(u16*)0x4000200 |= 0x8;



         *(u16*)0x4000100 = 20000;
    *(u16*)0x4000102 |= 0x0001 | 0x0080 | 0x0040;

    *(u16*)0x4000208 = 0x1;

    while(1);


        return 0;
}
