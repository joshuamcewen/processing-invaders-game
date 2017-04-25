/* 
*  Programming Assignment
*  @author Joshua McEwen
*/

/* 
*  Variable Declaration
*  Players/Invaders
*/

Player player;
Invader keyAssault, keySniper;

PImage background, deathImage, completeImage, explosion, bulletUpSprite, bulletDownSprite;
PImage[] playerSprites, assaultLeftSprites, assaultRightSprites, sniperLeftSprites, sniperRightSprites;


// Game states 

final int SPLASH = 0;
final int PLAYING = 1;
final int DEAD = 2;
final int FINISH = 3;

int state = SPLASH;

// Splash screen and appearance 

PFont fontMono;
int firstBackgroundY, secondBackgroundY;
int splashSize = 15;


// Levels and monitoring 

ArrayList<Level> levels = new ArrayList<Level>();
int timer = 0;

// Keep track of the current level. 
Level currentLevel;
int levelPointer = 0;

// Track hiscore. 
int hiScore = 0;

boolean leftPressed, rightPressed;


/*
*  Setup on program compilation.
*/
void setup()
{
  // Canvas configuration 
  
  size(500, 500);
  
  firstBackgroundY = 0;
  secondBackgroundY = -500;
  
  // Load in font assets 
  fontMono = createFont("assets/fonts/mono.ttf", 30);
  textFont(fontMono);
  
  deathImage = loadImage("assets/images/explosion.png");
  deathImage.resize(100, 100);
  
  completeImage = loadImage("assets/images/player-1.png");
  completeImage.resize(100, 100);
  
  // Load in all sprites 
  
  bulletUpSprite = loadImage("assets/images/bullet-up.png");
  bulletDownSprite = loadImage("assets/images/bullet-down.png");
  background = loadImage("assets/images/background.png");
  explosion = loadImage("assets/images/explosion.png");
  
  // Initially display the background images.
  resetBackground();
  
  // Load in all sprite assets once using the loadSprites method. 
  // Multiple sprites loaded in and returned as an array.
  
  playerSprites = loadSprites("player-", 5, 60, 60);
  
  assaultLeftSprites = loadSprites("assault-left", 5, 35, 35);
  assaultRightSprites = loadSprites("assault-right", 5, 35, 35);
  
  sniperLeftSprites = loadSprites("sniper-left", 5, 35, 35);
  sniperRightSprites = loadSprites("sniper-right", 5, 35, 35);
  
  
  
  // Create instances of the player and invaders. Invaders will act
  // as items for a key on the splash screen.
  
  player = new Player(width/2, height - 50, 60, 60);
  
  keyAssault = new InvaderAssault(100, height/2 + 70, 50, 50, 0);
  keySniper = new InvaderSniper(width - 150, height/2 + 70, 50, 50, 0);
  
   
  // Create level objects for the game.
  // Level(rows, ySpeed)
  
  levels.add(new Level(2, 360));
  levels.add(new Level(3, 180));
  levels.add(new Level(4, 150));
  levels.add(new Level(4, 100));
}

void draw()
{
  // Increment the timer and update the background.
  timer++;
  resetBackground();
  
  // Depending on the state of the game, switch between the different
  // screen methods. Defaults to the splash screen.
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

/*
*  Handles key press events.
*/
void keyPressed()
{
  // Depending on the state of the game, allow different keys to trigger
  // methods and events.
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
      // When playing, arrow key pressed are monitored by booleans for 
      // smooth movement.
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
      
      // Return to splash screen and reset key variables if the 'm'
      // menu key is pressed.
      if(key == 'm')
      {
        resetGame();
      }
      break;
    case DEAD:
    case FINISH:
      // In the case of completion/death, c will also trigger a game reset.
      if(key == 'c' || key == 'C')
      {
        resetGame();
      }
      break;
  }
}

/*
*  Handles key release events.
*/
void keyReleased()
{
  switch(state)
  {
    case PLAYING:
      // Arrow key presses determine the value of booleans used to track
      // the presses.
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

/*
*  Handles the splash screen mechanics.
*/
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
  
  // Display hiScore
  textAlign(LEFT);
  fill(255, 255, 102);
  textSize(splashSize);
  text("HiScore: " + hiScore, 15, 30);
  
  // Display title
  textAlign(CENTER);
  fill(255);
  textSize(30);
  text("Sea Hawks", width/2, 100);
  
  // Display instructions
  textSize(15);
  text("Press SPACE while in game to fire at the enemies.\n Clear each screen to progress to the next level.\n You have 5 lives. Use ← → ↑ ↓ to move.", width/2, height/2 - 85);
  
  fill(178, 255, 102);
  textSize(splashSize);
  text("Press SPACE to begin", width/2, height/2);
  
  // Display enemy key (invader objects and text)
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
  
  textSize(12);
  textAlign(LEFT);
  text("2017 Joshua McEwen", 20, height - 10);
}

/*
*  Handles the level screen mechanics.
*/
void playScreen()
{
  textSize(14);
  fill(255);
  // Display level name.
  textAlign(LEFT);
  text("Level " + (levelPointer + 1), 10, 20);
  
  // Display player score.
  textAlign(CENTER);
  text("Score: " + player.returnScore(), width/2, 20);
  
  // Display hiScore.
  textAlign(CENTER);
  text("HiScore: " + hiScore, width/2, 40);
  
  // Display player lives.
  textAlign(RIGHT);
  text("Lives: " + player.returnLives(), width - 10, 20);
  
  // Display menu prompt
  textAlign(LEFT);
  text("'m' = quit", 20, height - 10);
  
  // Is the player dead?
  if(player.returnLives() <= 0)
  {
    setHiscore(player.returnScore());
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
    setHiscore(player.returnScore());
    state = FINISH;
  }

  player.update();
}

/*
*  Set a new hiScore if applicable.
*
*  @param   playerScore  The achieved score of the player from the current game.
*/
void setHiscore(int playerScore)
{
  if(playerScore > hiScore)
  {
    hiScore = player.returnScore();
  }
}

/*
*  Handles the death screen mechanics.
*/
void deathScreen()
{ 
  
  textAlign(LEFT);
  fill(255, 255, 102);
  textSize(splashSize);
  text("HiScore: " + hiScore, 15, 30);
  
  imageMode(CENTER);
  image(deathImage, width/2, 120);
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  
  text("You died... Unlucky", width/2, height/2 - 40);
  text("Your score: " + player.returnScore(), width/2, height/2);
  
  textSize(14);
  text("Press 'c' to go back to the splash screen.", width/2, (height/2 + 40));
}

// Handles the game completion screen mechanics.
void completeScreen()
{
  
  textAlign(LEFT);
  fill(255, 255, 102);
  textSize(splashSize);
  text("HiScore: " + hiScore, 15, 30);
  
  imageMode(CENTER);
  image(completeImage, width/2, 120);
  
  fill(255);
  textAlign(CENTER);
  textSize(20);
  
  text("You completed the game!", width/2, height/2 - 40);
  text("Your score: " + player.returnScore(), width/2, height/2);
  
  textSize(14);
  text("Press 'C' to go back to the splash screen.", width/2, (height/2 + 40));
}

/*
*  Returns an array of resized sprites.
*
*  @param   name      The name of image sprite prefixing sequence number.
*  @param   number    The number of sprites that are to be loaded.
*  @param   newWidth  The new width of the sprites.
*  @param   newHeight The new height of the sprites.
*  @return            PImage array of sprites. 
*/

PImage[] loadSprites(String name, int number, int newWidth, int newHeight)
{
  PImage[] sprites = new PImage[number];
  
  for(int i = 0; i < number; i++)
  {
    sprites[i] = loadImage("assets/images/" + name + (i + 1) + ".png");
    sprites[i].resize(newWidth, newHeight);
  }
  
  return sprites;
}

/*
*  Clears the background and positions the images accordingly, updating when called.
*/
void resetBackground()
{
  clear();
  imageMode(CORNER);
  image(background, 0, firstBackgroundY);
  image(background, 0, secondBackgroundY);
  
  firstBackgroundY = (firstBackgroundY < height ? firstBackgroundY + 1 : 0);
  secondBackgroundY = (secondBackgroundY < 0 ? secondBackgroundY + 1 : -500);
}

/*
*  Resets key game variables such as the player's lives, key presses and level
*  mechanics.
*/
void resetGame()
{
  // Reset the player's score and lives.
  player.reset();
  leftPressed = rightPressed = false;
  
  // Reset the state of each level.
  for(Level l : levels)
  {
    l.spawnInvaders();
  }
 
  // Set the level pointer to 0.
  levelPointer = 0;
  state = SPLASH;
}