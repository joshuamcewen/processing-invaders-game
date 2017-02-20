/* 
  Title: Assignment
  Author: Joshua McEwen
  Date: January 2017
*/

// Declare variables.
PImage background;
PFont fontMono;
Player player;

final int SPLASH = 0;
final int PLAYING = 1;
final int FINISH = 2;

int state = SPLASH;

boolean leftPressed, rightPressed;

// Declare and initialise variables.
int timer = 0;
int splashSize = 15;

ArrayList<Level> levels = new ArrayList<Level>();

// Executed when the program is compiled.
void setup()
{
  // Canvas configuration
  background = loadImage("assets/images/background.png");
  fontMono = createFont("assets/fonts/mono.ttf", 30);
  textFont(fontMono);
  
  size(500, 500);
  resetBackground();
  
  player = new Player(width/2, height - 50, 80,20);
  
  // Create levels for the game.
  levels.add(new Level(10));
  levels.add(new Level(5));
  levels.add(new Level(2));
}

// Executed 60 times per second.
void draw()
{
  timer++;
  resetBackground();
  
  switch(state)
  {
    case SPLASH:
      splashScreen();
      break;
    case PLAYING:
      playScreen();
      break;
    default:
      splashScreen();
  }
}

// Handle key press events.
void keyPressed()
{
  switch(state)
  {
    case SPLASH:
      if(keyCode == ' ')
      {
        state = PLAYING;
      }
      break;
    case PLAYING:
      if(key == CODED)
      {
        if(keyCode == LEFT)
        {
          leftPressed = true;
        }
        else if(keyCode == RIGHT)
        {
          rightPressed = true;
        }
      }
      break;
  }
}

// Handle key release events.
void keyReleased()
{
  switch(state)
  {
    case PLAYING:
      if(key == CODED)
      {
        if(keyCode == LEFT)
        {
          leftPressed = false;
        }
        else if(keyCode == RIGHT)
        {
          rightPressed = false;
        }
      }
      break;
  }
}

// Handles the splash screen mechanics.
void splashScreen()
{ 
  if(timer % 30 == 0)
  {
    if(splashSize == 15)
    {
      splashSize = 14;
    }
    else {
      splashSize = 15;
    }
  }
  
  textAlign(CENTER);
  
  textSize(30);
  text("Game name", width/2, 150);
  
  textSize(14);
  text("Press SPACE while in game to fire at the enemies.\n Clear each screen to progress to the next level.\n You have 5 lives.", width/2, height/2);
  
  textSize(splashSize);
  text("Press SPACE to begin", width/2, height/2 + 100);
}

// Handles the level screen mechanics.
void playScreen()
{
  textAlign(CORNER);
  text("Play", 10, 20);
  player.update();
}

// Handles the death screen mechanics.
void deathScreen()
{
  text("Died", 10, 10);
}

// Handles the game completion screen mechanics.
void completeScreen()
{
  text("Complete", 10, 10);
}

// Resets the background, removing old positioning.
void resetBackground()
{
  clear();
  imageMode(CORNER);
  image(background, 0, 0);
}