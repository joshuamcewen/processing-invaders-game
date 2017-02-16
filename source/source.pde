/* 
  Title: Coral Criminals
  Author: Joshua McEwen
  Date: January 2017
*/

// Declare variables.
PImage background;
PFont fontMono;

// Declare and initialise variables.
int timer = 0;
int splashSize = 15;

ArrayList<Level> levels = new ArrayList<Level>();
Player player = new Player(0,0,0,0);

// Executed when the program is compiled.
void setup()
{
  // Canvas configuration
  background = loadImage("assets/images/background.png");
  fontMono = createFont("assets/fonts/mono.ttf", 30);
  textFont(fontMono);
  
  size(500, 500);
  resetBackground();
  
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
  splashScreen();
}

// Handle key press events.
void keyPressed()
{
}

// Handle key release events.
void keyReleased()
{
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
  text("Play", 10, 10);
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