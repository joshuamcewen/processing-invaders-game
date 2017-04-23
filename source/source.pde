/** 
*  Programming Assignment
*  @author Joshua McEwen
*/

// Declare variables.
PImage background, deathImage, completeImage;
int firstBackgroundY, secondBackgroundY;
PFont fontMono;
Player player;
PImage[] playerSprites;

Invader keyAssault, keySniper;

final int SPLASH = 0;
final int PLAYING = 1;
final int DEAD = 2;
final int FINISH = 3;

int state = SPLASH;

boolean leftPressed, rightPressed;

// Declare and initialise variables.
int timer = 0;
int splashSize = 15;

ArrayList<Level> levels = new ArrayList<Level>();

// Keep track of the current level.
Level currentLevel;
int levelPointer = 0;

//Track hiscore.
int hiScore = 0;

// Executed when the program is compiled.
void setup()
{
  // Canvas configuration
  firstBackgroundY = 0;
  secondBackgroundY = -500;
  background = loadImage("assets/images/background.png");
  fontMono = createFont("assets/fonts/mono.ttf", 30);
  textFont(fontMono);
  
  size(500, 500);
  resetBackground();
  
  deathImage = loadImage("/assets/images/explosion.png");
  deathImage.resize(100, 100);
  
  completeImage = loadImage("assets/images/player-1.png");
  completeImage.resize(100, 100);
  
  playerSprites = new PImage[5];
  playerSprites[0] = loadImage("assets/images/player-1.png");
  playerSprites[1] = loadImage("assets/images/player-2.png");
  playerSprites[2] = loadImage("assets/images/player-3.png");
  playerSprites[3] = loadImage("assets/images/player-4.png");
  playerSprites[4] = loadImage("assets/images/player-5.png");
  
  player = new Player(width/2, height - 50, 60, 60, playerSprites);
  
  keyAssault = new InvaderAssault(100, height/2 + 70, 50, 50, 0);
  keySniper = new InvaderSniper(width - 150, height/2 + 70, 50, 50, 0);
  
  // Create levels for the game.
  // Level(rows, ySpeed)
  levels.add(new Level(2, 360));
  levels.add(new Level(3, 180));
  levels.add(new Level(4, 150));
  levels.add(new Level(4, 100));
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
    case DEAD:
      deathScreen();
      break;
    case FINISH:
      completeScreen();
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
        // Set the first level to match the first level element.
        currentLevel = levels.get(0);
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
      
      // On spacebar, execute shoot method, creating a bullet instance.
      if(key == ' ')
      {
        player.shoot();
      }
      
      // Return to splash screen.
      if(key == 'm')
      {
        resetGame();
      }
      break;
    case DEAD:
    case FINISH:
      if(key == 'c' || key == 'C')
      {
        resetGame();
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
  
  // Every 500ms, alter the splash screen font 'pulse' effect.
  if(timer % 30 == 0)
  {
    if(splashSize == 16)
    {
      splashSize = 15;
    }
    else {
      splashSize = 16;
    }
  }
  
  textAlign(CENTER);
  
  textSize(30);
  text("Sea Hawks", width/2, 100);
  
  textSize(15);
  text("Press SPACE while in game to fire at the enemies.\n Clear each screen to progress to the next level.\n You have 5 lives.", width/2, height/2 - 75);
  
  fill(178, 255, 102);
  textSize(splashSize);
  text("Press SPACE to begin", width/2, height/2);
  
  keyAssault.update();
  keySniper.update();
  
  fill(178, 255, 102);
  textSize(splashSize);
  text("Assault", 125, height/2 + 120);
  
  fill(255);
  textSize(14);
  text("Normal bullet speed.\n70% chance of spawning.", 125, height/2 + 140);
  
  fill(178, 255, 102);
  textSize(splashSize);
  text("Sniper", width - 125, height/2 + 120);
  
  fill(255);
  textSize(14);
  text("Treble (3x) bullet speed.\n30% chance of spawning.", width - 125, height/2 + 140);
}

// Handles the level screen mechanics.
void playScreen()
{
  fill(255);
  // Display level name.
  textAlign(LEFT);
  text("Level " + (levelPointer + 1), 10, 20);
  
  // Display player score.
  textAlign(CENTER);
  text("Score: " + player.returnScore(), width/2, 20);
  
  // Display hiscore.
  textAlign(CENTER);
  text("HiScore: " + hiScore, width/2, 40);
  
  // Display player lives.
  textAlign(RIGHT);
  text("Lives: " + player.returnLives(), width - 10, 20);
  
  // Is the player dead?
  if(player.returnLives() <= 0)
  {
    state = DEAD;
  }
  
  // Retrieve the current level object from the levels array.
  currentLevel.update();
 
  // If the isComplete() level method returns true (no invaders left) then
  // increase the level pointer and alter the currentLevel reference to that of the next.
  if(currentLevel.isComplete() && levels.size() > (levelPointer + 1))
  {
    levelPointer++;
    currentLevel = levels.get(levelPointer);
  }
  else if (currentLevel.isComplete())
  {   
    state = FINISH;
  }

  player.update();
}

// Handles the death screen mechanics.
void deathScreen()
{ 
  imageMode(CENTER);
  image(deathImage, width/2, 120);
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  
  text("You died... Unlucky", width/2, height/2 - 40);
  text("Your score: " + player.returnScore(), width/2, height/2);
  
  textSize(14);
  text("Press 'C' to go back to the splash screen.", width/2, (height/2 + 40));
}

// Handles the game completion screen mechanics.
void completeScreen()
{
  
  imageMode(CENTER);
  image(completeImage, width/2, 120);
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  
  text("You completed the game!", width/2, height/2 - 40);
  
  if(player.returnScore() > hiScore)
  {
    text("New Hi-Score: " + hiScore, width/2, height/2);
    hiScore = player.returnScore();
  }
  else
  {
    text("Your score: " + hiScore, width/2, height/2);
  }
  
  textSize(14);
  text("Press 'C' to go back to the splash screen.", width/2, (height/2 + 40));
}

// Resets the background, removing old positioning.
void resetBackground()
{
  clear();
  imageMode(CORNER);
  image(background, 0, firstBackgroundY);
  image(background, 0, secondBackgroundY);
  
  firstBackgroundY = (firstBackgroundY < height ? firstBackgroundY + 1 : 0);
  secondBackgroundY = (secondBackgroundY < 0 ? secondBackgroundY + 1 : -500);
}

void resetGame()
{
  // Reset the player's score and lives.
  player.reset();
  leftPressed = rightPressed = false;
  
  // Reset the state of each level.
  for(Level l : levels)
  {
    l.reset();
  }
 
  // Set the level pointer to 0.
  levelPointer = 0;
  state = SPLASH;
}