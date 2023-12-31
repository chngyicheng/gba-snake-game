#include "gba.h"

#define NCOLS 20

// RGB palette used for sprites. The sprites defined below use the index of the color in the palette (so black = 0, white = 1, ...)
int palette[] = {
RGB(0,0,0), // pure black 0
RGB(31,31,31), // pure white 1
RGB(0,31,31), // light blue 2
RGB(26,26,26), // light grey 3
RGB(9,9,9), // darkest grey 4
RGB(31,31,0), // pure yellow 5
RGB(31,0,0), // pure red 6
RGB(0,0,31), // pure blue 7
RGB(11,8,3), // dark brown 8
RGB(27,27,27), // lightest grey 9
RGB(16,16,16), // dark grey 10
RGB(31,17,17), // light red 11
RGB(31,24,24), // lighter red 12
RGB(27,0,0), // dark red 13
RGB(0,16,0), // darkest green 14
RGB(0,31,0), // pure green 15
RGB(16,31,16), // light green 16
RGB(23,31,23) // lightest green 17
};


// Sprite array, defining each big 16x16 sprite as 4 8x8 tiles, using the palette above

u16 sprites[] = {

#define S_H_D 0 // Snake head looking down
// Tile 00
14,14,14,14,14,14,14,14,
14,16,16,16,16,16,16,16,
14,17,17,14,17,17,14,17,
14,17,17,17,14,14,17,14,
14,17,17,14,17,17,14,17,
14,17,14,17,17,17,17,14,
14,17,17,14,1,1,14,17,
14,14,17,14,0,3,17,14,
// Tile 01
14,14,14,14,14,14,14,14,
16,16,16,16,16,16,16,14,
17,14,17,17,14,17,17,14,
14,17,14,14,17,17,17,14,
17,14,17,17,14,17,17,14,
14,17,17,17,17,14,17,14,
17,14,1,1,14,17,17,14,
14,17,0,3,14,17,14,14,
// Tile 02
0,14,14,17,0,0,17,14,
0,14,14,14,17,17,14,17,
0,0,14,14,17,14,17,17,
0,0,0,14,14,16,16,16,
0,0,0,0,14,14,14,14,
0,0,0,0,0,0,13,11,
0,0,0,0,0,13,11,13,
0,0,0,0,13,11,13,0,
// Tile 03
14,17,0,0,17,14,14,0,
17,14,17,17,14,14,14,0,
17,17,14,17,14,14,0,0,
16,16,16,14,14,0,0,0,
14,14,14,14,0,0,0,0,
11,13,0,0,0,0,0,0,
13,11,13,0,0,0,0,0,
0,13,11,13,0,0,0,0,

#define S_H_R 1 // Snake Head Right
// Tile 00
14,14,14,14,14,14,14,14,
14,16,17,17,17,17,17,14,
14,16,17,17,17,14,17,17,
14,16,14,17,14,17,14,14,
14,16,17,14,17,17,1,0,
14,16,17,14,17,17,1,3,
14,16,14,17,14,17,14,17,
14,16,17,14,17,14,17,14,
//Tile 01
0,0,0,0,0,0,0,0,
14,14,0,0,0,0,0,0,
14,14,14,0,0,0,0,0,
17,14,14,14,0,0,0,0,
0,17,17,14,14,0,0,13,
0,17,14,16,14,0,13,11,
17,14,17,16,14,13,11,13,
14,17,17,16,14,11,13,0,
// Tile 02
14,16,17,14,17,14,17,14,
14,16,14,17,14,17,14,17,
14,16,17,14,17,17,1,0,
14,16,17,14,17,17,1,3,
14,16,14,17,14,17,14,14,
14,16,17,17,17,14,17,17,
14,16,17,17,17,17,17,14,
14,14,14,14,14,14,14,14,
// Tile 03
14,17,17,16,14,11,13,0,
17,14,17,16,14,13,11,13,
0,17,14,16,14,0,13,11,
0,17,17,14,14,0,0,13,
17,14,14,14,0,0,0,0,
14,14,14,0,0,0,0,0,
14,14,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

#define S_H_U 2 // Snake Head Up
// Tile 00
0,0,0,0,13,11,13,0,
0,0,0,0,0,13,11,13,
0,0,0,0,0,0,13,11,
0,0,0,0,14,14,14,14,
0,0,0,14,14,16,16,16,
0,0,14,14,17,14,17,17,
0,14,14,14,17,17,14,17,
0,14,14,17,0,0,17,14,
// Tile 01
0,13,11,13,0,0,0,0,
13,11,13,0,0,0,0,0,
11,13,0,0,0,0,0,0,
14,14,14,14,0,0,0,0,
16,16,16,14,14,0,0,0,
17,17,14,17,14,14,0,0,
17,14,17,17,14,14,14,0,
14,17,0,0,17,14,14,0,
//Tile 02
14,14,17,14,0,3,17,14,
14,17,17,14,1,1,14,17,
14,17,14,17,17,17,17,14,
14,17,17,14,17,17,14,17,
14,17,17,17,14,14,17,14,
14,17,17,14,17,17,14,17,
14,16,16,16,16,16,16,16,
14,14,14,14,14,14,14,14,
//Tile 03
14,17,0,3,14,17,14,14,
17,14,1,1,14,17,17,14,
14,17,17,17,17,14,17,14,
17,14,17,17,14,17,17,14,
14,17,14,14,17,17,17,14,
17,14,17,17,14,17,17,14,
16,16,16,16,16,16,16,14,
14,14,14,14,14,14,14,14,

#define S_H_L 3 // Snake Head Left
// Tile 00
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,14,14,
0,0,0,0,0,14,14,14,
0,0,0,0,14,14,14,17,
13,0,0,14,14,17,17,0,
11,13,0,14,16,14,17,0,
13,11,13,14,16,17,14,17,
0,13,11,14,16,17,17,14,
// Tile 01
14,14,14,14,14,14,14,14,
14,17,17,17,17,17,16,14,
17,17,14,17,17,17,16,14,
14,14,17,14,17,14,16,14,
0,1,17,17,14,17,16,14,
3,1,17,17,14,17,16,14,
17,14,17,14,17,14,16,14,
14,17,14,17,14,17,16,14,
// Tile 02 
0,13,11,14,16,17,17,14,
13,11,13,14,16,17,14,17,
11,13,0,14,16,14,17,0,
13,0,0,14,14,17,17,0,
0,0,0,0,14,14,14,17,
0,0,0,0,0,14,14,14,
0,0,0,0,0,0,14,14,
0,0,0,0,0,0,0,0,
// Tile 03
14,17,14,17,14,17,16,14,
17,14,17,14,17,14,16,14,
0,1,17,17,14,17,16,14,
3,1,17,17,14,17,16,14,
14,14,17,14,17,14,16,14,
17,17,14,17,17,17,16,14,
14,17,17,17,17,17,16,14,
14,14,14,14,14,14,14,14,

#define S_B 4 // Snake Body
// Tile 00
14,14,14,14,14,14,14,14,
14,16,16,16,14,16,16,16,
14,16,17,14,14,17,17,17,
14,16,14,14,17,17,14,17,
14,14,14,17,17,14,14,17,
14,16,17,17,17,14,17,17,
14,16,17,17,14,14,14,17,
14,14,14,17,17,17,14,14,

// Tile 01
14,14,14,14,14,14,14,14,
14,16,16,16,14,16,16,14,
14,14,17,17,17,14,14,14,
17,14,14,17,17,17,16,14,
17,17,14,17,17,17,16,14,
17,17,14,14,14,17,16,14,
17,17,17,17,14,14,16,14,
17,14,17,17,17,14,14,14,

// Tile 02
14,16,14,14,17,17,17,14,
14,16,17,14,14,17,14,14,
14,16,17,17,14,17,17,17,
14,16,14,14,14,17,17,17,
14,16,14,17,17,17,17,17,
14,14,14,17,17,14,14,17,
14,16,16,16,14,16,16,14,
14,14,14,14,14,14,14,14,

// Tile 03
14,14,17,17,17,17,16,14,
17,14,14,17,17,14,14,14,
17,14,17,17,14,14,16,14,
14,14,17,17,14,17,16,14,
14,17,17,14,14,17,16,14,
17,17,14,14,17,17,16,14,
16,16,14,16,16,16,16,14,
14,14,14,14,14,14,14,14,

#define S_F 5 //Snake Food
// Tile 00
0,0,0,0,0,0,0,8,
0,0,0,0,0,16,16,16,
0,0,0,0,0,0,0,8,
0,0,0,0,13,13,13,13,
0,0,0,13,11,11,11,11,
0,0,13,11,11,1,11,11,
0,0,13,11,11,11,11,11,
0,0,13,11,1,11,11,11,
// Tile 01
8,8,0,0,0,0,0,0,
8,0,0,0,0,0,0,0,
8,0,0,0,0,0,0,0,
13,13,13,13,0,0,0,0,
11,11,11,11,13,0,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
// Tile 02
0,0,13,11,1,11,11,11,
0,0,13,11,1,11,11,11,
0,0,13,11,11,11,11,11,
0,0,13,11,11,11,11,11,
0,0,13,11,11,11,11,11,
0,0,0,13,11,11,11,11,
0,0,0,0,13,13,13,13,
0,0,0,0,0,0,0,0,
// Tile 03
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,11,13,0,0,
11,11,11,11,13,0,0,0,
13,13,13,13,0,0,0,0,
0,0,0,0,0,0,0,0,


#define GO_g 6 //GAME OVER letter G							
0,0,0,0,1,1,1,1,
0,0,0,0,1,1,1,1,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
0,0,1,1,0,0,0,0,
							
1,	1,	1,	1,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	1,	1,	1,	1,	1,	0,	0,
							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	0,	0,	0,	0,	0,	0,
							
0,	1,	1,	1,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
1,	1,	1,	1,	0,	0,	0,	0,
1,	1,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
							
#define GO_a 7 //GAME OVER letter A							
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	1,	1,	1,	1,
							
1,	1,	1,	1,	0,	0,	0,	0,
1,	1,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
							
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	0,	0,	0, 0,	
							
#define GO_m 8 //GAME OVER letter M							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	1,	1,	0,	0,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	0,	0,	1,	1,
0,	0,	1,	1,	0,	0,	0,	1,
0,	0,	1,	1,	0,	0,	0,	1,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
							
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	1,	1,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
1,	1,	0,	0,	1,	1,	0,	0,
1,	0,	0,	0,	1,	1,	0,	0,
1,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
							
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	0, 0, 0, 0,			
							
#define GO_e 9 //GAME OVER letter E							
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	1,	1,	1,	1,
							
1,	1,	1,	1,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
1,	1,	1,	1,	1,	0,	0,	0,
1,	1,	1,	1,	1,	0,	0,	0,
							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	0,	0,	0,	0,	0,	0,
							
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
							
#define GO_o 10 //GAME OVER letter O							
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
							
1,	1,	1,	1,	0,	0,	0,	0,
1,	1,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	0,	0,	1,	1,	1,	1,
0,	0,	0,	0,	0,	0,	0,	0,
							
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
1,	1,	1,	1,	0,	0,	0,	0,
1,	1,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
							
#define GO_v 11 //GAME OVER letter V							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	1,	1,	0,	0,
							
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	1,	1,	1,	1,	0,	0,
							
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	1,	0,
0,	0,	0,	0,	0,	1,	1,	0,
0,	0,	0,	0,	0,	1,	1,	1,
0,	0,	0,	0,	0,	0,	1,	1,
0,	0,	0,	0,	0,	0,	0,	1,
0,	0,	0,	0,	0,	0,	0,	0,
							
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	1,	1,	1,	0,	0,	0,	0,
0,	1,	1,	0,	0,	0,	0,	0,
1,	1,	1,	0,	0,	0,	0,	0,
1,	1,	0,	0,	0,	0,	0,	0,
1,	0,	0,	0,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
							
#define GO_r 12 //GAME OVER letter R							
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	1,	1,	1,	1,
							
1,	1,	1,	1,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
0,	0,	0,	0,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
1,	1,	1,	1,	1,	1,	0,	0,
							
0,	0,	1,	1,	1,	1,	1,	1,
0,	0,	1,	1,	0,	0,	1,	1,
0,	0,	1,	1,	0,	0,	0,	1,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	0,	0,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,
							
0,	0,	0,	0,	0,	0,	0,	0,
1,	0,	0,	0,	0,	0,	0,	0,
1,	1,	0,	0,	0,	0,	0,	0,
1,	1,	1,	0,	0,	0,	0,	0,
0,	1,	1,	1,	0,	0,	0,	0,
0,	0,	1,	1,	1,	1,	0,	0,
0,	0,	0,	1,	1,	1,	0,	0,
0,	0,	0,	0,	0,	0,	0,	0,

#define L_S 13 // letter S
//Tile 00
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,0,0,0,0,
0,0,15,15,0,0,0,0,
0,0,15,15,0,0,0,0,
0,0,15,15,0,0,0,0,
0,0,15,15,15,15,15,15,
//Tile 01
15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
15,15,15,15,15,15,0,0,
//Tile 02
0,0,15,15,15,15,15,15,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
//Tile 03
15,15,15,15,15,15,0,0,
0,0,0,0,15,15,0,0,
0,0,0,0,15,15,0,0,
0,0,0,0,15,15,0,0,
0,0,0,0,15,15,0,0,
15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,
15,15,15,15,15,15,0,0,

#define L_N 14 //letter N
//Tile 00
0,15,15,15,0,0,0,0,
0,15,15,15,15,0,0,0,
0,15,15,15,15,15,0,0,
0,15,15,15,15,15,15,0,
0,15,15,15,15,15,15,15,
0,15,15,15,15,15,15,15,
0,15,15,15,15,15,15,15,
0,15,15,15,15,15,15,15,

//Tile 01
0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
0,0,0,0,15,15,15,0,
15,0,0,0,15,15,15,0,
15,15,0,0,15,15,15,0,
15,15,15,0,15,15,15,0,

//Tile 02
0,15,15,15,0,15,15,15,
0,15,15,15,0,0,15,15,
0,15,15,15,0,0,0,15,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,
0,15,15,15,0,0,0,0,

//Tile 03
15,15,15,15,15,15,15,0,
15,15,15,15,15,15,15,0,
15,15,15,15,15,15,15,0,
15,15,15,15,15,15,15,0,
0,15,15,15,15,15,15,0,
0,0,15,15,15,15,15,0,
0,0,0,15,15,15,15,0,
0,0,0,0,15,15,15,0,

#define L_A 15 //letter A
//Tile 00
0,0,0,0,0,15,15,15,
0,0,0,0,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,

//Tile 01
15,15,0,0,0,0,0,0,
15,15,15,0,0,0,0,0,
15,15,15,15,0,0,0,0,
15,15,15,15,0,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,

//Tile 02
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,

//Tile 03
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,

#define L_K 16 //letter K
//Tile 00
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,

//Tile 01
0,0,15,15,15,15,0,0,
0,15,15,15,15,15,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,0,0,0,0,
15,15,15,0,0,0,0,0,
15,15,0,0,0,0,0,0,
15,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,

//Tile 02
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,0,15,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,
0,0,0,15,15,15,0,0,

//Tile 03
0,0,0,0,0,0,0,0,
15,0,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,
15,15,15,0,0,0,0,0,
15,15,15,15,0,0,0,0,
15,15,15,15,15,0,0,0,
0,15,15,15,15,15,0,0,
0,0,15,15,15,15,0,0,

#define L_E 17 //letter E
//Tile 00
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,

//Tile 01
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,

//Tile 02
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,0,0,0,
0,0,15,15,15,0,0,0,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,
0,0,15,15,15,15,15,15,

//Tile 03
15,15,0,0,0,0,0,0,
15,15,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,15,15,15,15,0,0,0,

#define S_A 18 //snake art
//Tile 00
0,0,0,0,15,15,15,15,
0,0,0,15,1,1,15,15,
0,0,0,15,1,0,1,1,
0,0,0,15,15,1,15,15,
0,0,0,15,15,15,15,15,
0,0,0,15,15,15,15,15,
0,0,0,0,0,0,0,0,
0,0,0,0,0,11,11,11,

//Tile 01
15,15,15,15,0,0,0,0,
15,1,1,1,15,0,0,0,
1,1,0,1,15,0,0,0,
15,1,1,15,15,0,0,0,
15,15,15,15,15,0,0,0,
15,0,15,15,15,0,0,0,
0,0,15,14,14,0,0,0,
15,15,15,15,15,0,0,0,

//Tile 02
0,0,11,11,11,11,0,0,
0,0,0,11,0,0,0,0,
0,0,0,0,0,0,0,0,
0,0,0,0,0,0,0,15,
0,0,0,0,0,0,15,15,
0,0,0,0,0,0,15,15,
0,0,0,0,0,0,15,15,
0,0,0,0,0,0,0,15,

//Tile 03
0,15,14,14,14,0,8,0,
15,15,15,15,0,0,15,0,
0,14,14,14,0,0,14,0,
15,15,15,0,0,0,15,0,
14,14,0,0,0,14,15,0,
15,14,15,14,15,14,15,0,
15,14,15,14,15,15,15,0,
15,15,15,15,15,15,0,0,

#define S_P_Lp 19 //snake project letter p
//Tile 00
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,0,0,0,
0,3,3,0,0,0,0,0,

#define S_P_Lr 20 //snake project letter r
//Tile 00
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,3,3,0,0,
0,3,3,0,0,3,3,0,

#define S_P_Lo 21//snake project letter o
//Tile 00
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,0,0,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,

#define S_P_Lj 22 //snake project letter j
//Tile 00
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,0,0,0,3,3,0,0,
0,0,0,0,3,3,0,0,
0,3,3,0,3,3,0,0,
0,3,3,0,3,3,0,0,
0,3,3,3,3,3,0,0,
0,3,3,3,3,3,0,0,

#define S_P_Le 23 //snake project letter e
//Tile 00
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,0,0,0,
0,3,3,3,3,3,0,0,
0,3,3,3,3,3,0,0,
0,3,3,0,0,0,0,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,

#define S_P_Lc 24 //snake project letter c
//Tile 00
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,0,0,0,0,0,
0,3,3,0,0,0,0,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,

#define S_P_Lt 25 //snake project letter t
//Tile 00
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,3,3,3,3,3,3,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,
0,0,0,3,3,0,0,0,

#define P_S 26 //press start
//Tile 00
10,10,10,10,0,10,10,10,
10,0,0,10,0,10,0,0,
10,0,0,10,0,10,0,0,
10,10,10,10,0,10,10,10,
10,0,0,0,0,10,10,0,
10,0,0,0,0,10,10,10,
10,0,0,0,0,10,0,10,
10,0,0,0,0,10,0,0,

//Tile 01
10,0,10,10,10,10,0,10,
10,0,10,0,0,0,0,10,
10,0,10,0,0,0,0,10,
10,0,10,10,10,0,0,10,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,10,
10,0,10,0,0,0,0,10,
10,0,10,10,10,10,0,10,

//Tile 02
10,10,10,0,10,10,10,10,
0,0,10,0,10,0,0,10,
0,0,0,0,10,0,0,0,
10,10,10,0,10,10,10,10,
0,0,10,0,0,0,0,10,
0,0,10,0,10,0,0,10,
0,0,10,0,10,0,0,10,
10,10,10,0,10,10,10,10,

//Tile 03
0,0,0,10,10,10,10,0,
0,0,0,10,0,0,10,0,
0,0,0,10,0,0,0,0,
0,0,0,10,10,10,10,0,
0,0,0,0,0,0,10,0,
0,0,0,10,0,0,10,0,
0,0,0,10,0,0,10,0,
0,0,0,10,10,10,10,0,

//Tile 04
10,10,10,10,10,0,0,10,
0,0,10,0,0,0,10,0,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,10,10,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,0,0,
0,0,10,0,0,10,0,0,

//Tile 05
0,0,0,10,10,10,10,0,
10,0,0,10,0,0,10,0,
0,10,0,10,0,0,10,0,
0,10,0,10,10,10,10,0,
10,10,0,10,10,0,0,0,
0,10,0,10,10,10,0,0,
0,10,0,10,0,10,10,0,
0,10,0,10,0,0,10,0,

//Tile 06
10,10,10,10,10,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,
0,0,10,0,0,0,0,0,


#define Y_S 27  // "YOUR SCORE:" 8 tiles 
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


//end of 8 tiles


#define num_0 28 // Number 0 
0,0,1,1,1,1,0,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,1,1,0,
0,1,1,0,1,0,1,0,
0,1,1,1,0,0,1,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,
#define num_1 29 // Number 1 
0,0,0,0,1,0,0,0,
0,0,1,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,1,1,0,0,
#define num_2 30 // Number 2 
0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,0,0,0,0,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,1,1,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,0,0,0,0,
0,1,1,1,1,1,1,0,
#define num_3 31 // Number 3 
0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,0,0,0,0,1,0,
0,0,0,0,0,0,1,0,
0,0,0,1,1,1,0,0,
0,0,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,0,1,1,1,1,0,0,
#define num_4 32 // Number 4 
0,0,0,0,1,1,0,0,
0,0,0,1,1,1,0,0,
0,0,1,1,0,1,0,0,
0,1,1,0,0,1,0,0,
0,1,1,1,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
#define num_5 33 // Number 5 
0,1,1,1,1,1,1,0,
0,1,1,1,1,1,1,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,0,1,1,1,1,0,0,
0,0,0,0,0,0,1,0,
0,1,0,0,0,0,1,0,
0,0,1,1,1,1,0,0,
#define num_6 34 // Number 6 
0,0,0,1,1,1,1,0,
0,0,1,1,1,1,1,0,
0,1,1,0,0,0,0,0,
0,1,1,0,0,0,0,0,
0,1,1,1,1,1,0,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,
#define num_7 35 // Number 7 
0,1,1,1,1,1,1,0,
0,1,1,1,1,1,1,0,
0,1,0,0,0,1,1,0,
0,0,0,0,1,1,0,0,
0,0,0,0,1,1,0,0,
0,0,0,1,1,0,0,0,
0,0,0,1,1,0,0,0,
0,0,1,1,0,0,0,0,
#define num_8 36 // Number 8 
0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,1,0,0,0,1,0,
0,0,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,0,0,
#define num_9 37 // Number 9 
0,0,1,1,1,1,0,0,
0,1,1,1,1,1,1,0,
0,1,1,0,0,0,1,0,
0,1,1,0,0,0,1,0,
0,0,1,1,1,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0,
0,0,0,0,0,1,1,0
};


