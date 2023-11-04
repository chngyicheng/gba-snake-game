// -----------------------------------------------------------------------------
// C-Skeleton to be used with HAM Library from www.ngine.de
// -----------------------------------------------------------------------------
//#include "numbers.h"
#include "gba.h"
#include "snakeSprites.h"
#include <stdlib.h>

#define INPUT                      (KEY_MASK & (~REG_KEYS))
#define KEYINPUT *(volatile u16*)0x4000130
#define Xaxis 240
#define Yaxis 160

typedef struct{
	int x;
	int y;
	int dir;
} tuple;


typedef struct{
	tuple *body;
	int size;
} snakeInfo;

//int snake.body->y = 16;
//int snake.body->x = 16;
int dir = 0;
int gamemode = 0;    // Game Mode: 0 = Start, 1 = Snake game, 2 = End
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
    // Displays sprite number numb on screen at position (x,y), as sprite object N for 16 bit sprites
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x | 0x4000;
    *(unsigned short *)(0x7000004 + 8*N) = numb*8;
}



void drawSprite8(int numb, int N, int x, int y) {
    // Displays sprite number numb on screen at position (x,y), as sprite object N for 8 bit sprites
    *(unsigned short *)(0x7000000 + 8*N) = y | 0x2000;
    *(unsigned short *)(0x7000002 + 8*N) = x;
    *(unsigned short *)(0x7000004 + 8*N) = numb*2;
}


void Handler(void) {
    REG_IME = 0x00; // Stop all other interrupt handling, while we handle this current one
	 
    if((REG_IF&0x8)==0x8) {
        gameModeCheck();
    }
    REG_IF = REG_IF; // Update interrupt table, to confirm we have handled this interrupt
    REG_IME = 0x01;  // Re-enable interrupt handling
}


void gameModeCheck(void) {
    // Checks which state Game Mode is currently in and runs the appropriate checkbutton functions
    if (gamemode == 0) {  // Start Screen
        resetGame();
        startScreen();
        checkbuttonSTART();
    } 
    else if (gamemode == 1) {  // Snake Game
        checkbuttonSTART();
        snakeMovement();
    }
    else if (gamemode == 2) {  // End Screen
        if (firstApple == 0) {  // Use firstApple as a flag to clear screen only once, and reset firstApple
            clearScreen();
            firstApple = 1;
        }
        endScreen();
        checkbuttonSTART();
    }
    else if (gamemode == 3) {  // Pause screen
        pauseScreen();
        checkbuttonSTART();
    }
}


void checkbuttonSTART(void) {
    // Check if start button pushed, then changese to correct Game Mode. If game is running, pause the game
    u16 buttons = INPUT;
    int i;

    if ((buttons & KEY_START) == KEY_START && gamemode == 0) {  // Change from Start Screen to start of game
        gamemode = 1;
        for(i = 1; i < 30; i++) {    // Clear text from screen, but leave snake (50th sprite) on screen 
            drawSprite16(0, i, 240,160);
            drawSprite8(0, i, 240,160);	
        }
    }
    else if ((buttons & KEY_START) == KEY_START && gamemode == 1) {    // Pause game
        gamemode = 3;
    }
    else if ((buttons & KEY_START) == KEY_START && gamemode == 2) {  // Change from End Screen to Start Screen
        gamemode = 0;
        clearScreen();
        resetGame();
    }
    else if ((buttons & KEY_START) == KEY_START && gamemode == 3) {    // Unpauses game
        for(i = 1; i < 30; i++) {    // Clear text from screen, but leave snake on screen
            drawSprite16(0, i, 240,160);
            drawSprite8(0, i, 240,160);	
        }
        gamemode = 1;
    }
}


void snakeMovement(void) {
    // Code for snake movement
    int i;

    checkbuttonDIR();
    snakeUpdateInfo(dir);

    // Check if snake has died, ends game if true
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

    for (i = 1; i < snake.size; i += 1) {    // Draws snake body
        drawSprite16(4, 30 + i, snake.body[i].x, snake.body[i].y);
    }
    foodAndGrow();
}


void checkbuttonDIR(void) {
	// Check if button pressed and sets snake direction. If no button pressed, continue in direction
    u16 buttons = INPUT;
    
    if ((buttons & KEY_DOWN) == KEY_DOWN && dir != 2) { 
        dir = 0;  
	 }
    else if ((buttons & KEY_RIGHT) == KEY_RIGHT && dir != 3) {
        dir = 1;
    }
    else if ((buttons & KEY_UP) == KEY_UP && dir != 0) {
        dir = 2;
    }
    else if ((buttons & KEY_LEFT) == KEY_LEFT && dir != 1) {
        dir = 3;
    }
}


void snakeUpdateInfo(int direction) {
    // Moves snake and snake body
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
    // Moves the apple to a randomized position, and makes snake grow
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
    // Checks if apple is spawned on top of snake, and redraws until correct location
    int i;

    for (i = 1; i <= snake.size; i++) {
        if (snake.body[i].x == apple.x && snake.body[i].y == apple.y) {  
            apple.x = (rand()%(15))*16;
            apple.y = (rand()%(10))*16;
            appleOverlap();  // Checks new position of apple if in overlap
            break;
        }
    }
}


void clearScreen(void) {
    // Draw all sprites on screen, but all of them outside of the screen (starting at position (240,160) the bottom right corner of the GBA screen)
    int i;

    for(i = 0; i < 200; i++) {
        drawSprite16(0, i, 240,160);
        drawSprite8(0, i, 240,160);	
    }
}


void resetGame(void) {
    // Resets game settings to defauit
    snake.body = malloc(150);
    snake.body-> x = 64;
    snake.body-> y = 48;
    snake.size = 1;
    dir = 0;
}


void startScreen(void) {
    // Draws the start screen
    drawSprite16(13, 1, 84, 48);  // "Snake"
    drawSprite16(14, 2, 100, 48);
    drawSprite16(15, 3, 115, 48);
    drawSprite16(16, 4, 127, 48);
    drawSprite16(17, 5, 141, 48);

	 drawSprite16(18, 20, 156, 48); // Snake art

    drawSprite8(76, 6, 68, 75);  // "Project"
    drawSprite8(77, 7, 84, 75);
    drawSprite8(78, 8, 100, 75);
    drawSprite8(79, 9, 116, 75);
    drawSprite8(80, 10, 132, 75);
    drawSprite8(81, 11, 148, 75);
    drawSprite8(82, 12, 164, 75);

    drawSprite8(83, 13, 92, 105);  // "Press Start"
    drawSprite8(84, 14, 100, 105);
    drawSprite8(85, 15, 108, 105);
    drawSprite8(86, 16, 116, 105);
    drawSprite8(87, 17, 124, 105);
    drawSprite8(88, 18, 132, 105);
    drawSprite8(89, 19, 140, 105);
	
    drawSprite16(dir, 30, snake.body->x, snake.body->y);  // Starting position of Snake
}


void endScreen(void) {
    // Draws the Game Over screen
    drawSprite16(6, 1, 48, 50);    // "Game Over"
    drawSprite16(7, 2, 64, 50);
    drawSprite16(8, 3, 80, 50);
    drawSprite16(9, 4, 96, 50);
    drawSprite16(10, 5, 128, 50);
    drawSprite16(11, 6, 144, 50);
    drawSprite16(9, 7, 160, 50);
    drawSprite16(12, 8, 176, 50);
    
    drawSprite8(83, 13, 92, 85);  // "Press Start"
    drawSprite8(84, 14, 100, 85);
    drawSprite8(85, 15, 108, 85);
    drawSprite8(86, 16, 116, 85);
    drawSprite8(87, 17, 124, 85);
    drawSprite8(88, 18, 132, 85);
    drawSprite8(89, 19, 140, 85);

    drawSprite8(90, 20, 76, 100);    // "Your Score:"
    drawSprite8(91, 21, 84, 100);
    drawSprite8(92, 22, 92, 100);
    drawSprite8(93, 23, 100, 100);
    drawSprite8(94, 24, 108, 100);
    drawSprite8(95, 25, 116, 100);
    drawSprite8(96, 26, 124, 100);
	 drawSprite8(97, 27, 132, 100);

    if (snake.size >= 10) {
        drawSprite8(98 + ((snake.size-1)/10), 28, 150, 100); // Score Tens
    } else {
        drawSprite8(98, 28, 150, 100);
    }
    drawSprite8(98 + (snake.size-1)%10, 29, 158, 100); // Score Ones

}


void pauseScreen(void) {
    // Draws the pause screen as a background
    drawSprite16(13, 1, 84, 48);  // "Snake"
    drawSprite16(14, 2, 100, 48);
    drawSprite16(15, 3, 115, 48);
    drawSprite16(16, 4, 127, 48);
    drawSprite16(17, 5, 141, 48);

    drawSprite8(76, 6, 68, 75);  // "Project"
    drawSprite8(77, 7, 84, 75);
    drawSprite8(78, 8, 100, 75);
    drawSprite8(79, 9, 116, 75);
    drawSprite8(80, 10, 132, 75);
    drawSprite8(81, 11, 148, 75);
    drawSprite8(82, 12, 164, 75);

    drawSprite8(83, 13, 92, 105);  // "Press Start"
    drawSprite8(84, 14, 100, 105);
    drawSprite8(85, 15, 108, 105);
    drawSprite8(86, 16, 116, 105);
    drawSprite8(87, 17, 124, 105);
    drawSprite8(88, 18, 132, 105);
    drawSprite8(89, 19, 140, 105);

    drawSprite8(90, 20, 76, 120);    // "Your Score:"
    drawSprite8(91, 21, 84, 120);
    drawSprite8(92, 22, 92, 120);
    drawSprite8(93, 23, 100, 120);
    drawSprite8(94, 24, 108, 120);
    drawSprite8(95, 25, 116, 120);
    drawSprite8(96, 26, 124, 120);
	 drawSprite8(97, 27, 132, 120);

    drawSprite16(37, 100, 100, 140);

    if (snake.size >= 10) {
        drawSprite8(98 + ((snake.size-1)/10), 28, 150, 120); // Score Tens
    } else {
        drawSprite8(98, 28, 150, 120);
    }
    drawSprite8(98 + (snake.size-1)%10, 29, 158, 120); // Score Ones

    
}


void fillPalette(void) {
    int i;

	// Fill the palette in GBA memory
    for (i = 0; i < NCOLS; i++)
        spritePal[i] = palette[i];
}


void fillSprites(void) {
    int i;

	// Load all sprites in GBA memory
    for (i = 0; i < 128*16*16; i++)
        spriteData[i] = (sprites[i*2+1] << 8) + sprites[i*2];

	clearScreen();
}



// -----------------------------------------------------------------------------
// Project Entry Point
// -----------------------------------------------------------------------------
int main(void)
{
    // Set Mode 2
    *(unsigned short *) 0x4000000 = 0x40 | 0x2 | 0x1000;
    fillPalette();
    fillSprites();

    // Fill SpritePal
    *(unsigned short *) 0x5000200 = 0;
    *(unsigned short *) 0x5000202 = RGB(31,31,31);
    
    // Set Handler Function for interrupts and enable selected interrupts
    REG_INT = (int)&Handler;
    REG_IE |= INT_TIMER0;// enable timer0 interrupt

    // Set Timer Mode (fill that section and replace TMX with selected timer number)
 // based on calculations 64103 counts with 256 cycles is the best option (so start from 1433)
	 REG_TM0D = 20000;
    REG_TM0CNT |= TIMER_FREQUENCY_64 | TIMER_ENABLE | TIMER_INTERRUPTS;

    REG_IME = 0x1;		// Enable interrupt handling
	 
    while(1);


	return 0;
}




