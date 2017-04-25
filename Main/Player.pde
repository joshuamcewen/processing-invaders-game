// Class to handle the player
public class Player
{
  // Declare images
  PImage[] sprites;
  int spritePointer;
  
  // Declare and initialise local class variables.
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
  int x, y, pWidth, pHeight;
  int score = 0;
  int lives = 5;
  
  // Timer for movement initialised.
  int timer = 0;
  
  /*
  *  Constructor executed when new instance of Player is created.
  */
  Player(int x, int y, int pWidth, int pHeight)
  {
    this.x = x;
    this.y = y;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    
    for(int i = 0; i < playerSprites.length; i++)
    {
      playerSprites[i].resize(pWidth, pHeight);
    }
    
    spritePointer = 0;
  }
  
  /*
  *  Renders the player sprite on screen, updating frames using the spritePointer.
  */
  private void render()
  {
    imageMode(CENTER);
    image(playerSprites[spritePointer], this.x, this.y);
    
    // Every 10 frames increment the sprite pointer or reset it to 0.
    if(timer % 10 == 0) 
    {
      spritePointer = (spritePointer < playerSprites.length - 2 ? spritePointer + 1 : 0);
    }
  }
  
  /*
  *  Changes the position of the the player (see x) based on key press booleans.
  */
  private void move()
  {
    // Left and right boundaries taken into account.
    if(leftPressed && (x - pWidth/2) >= 5)
    {
      x -= 5;
    }
    else if(rightPressed && (x + pWidth/2) <= (width - 5))
    {
      x+= 5;
    }
  }
  
  /*
  *  Fires a bullet (new bullet instance) with a negative Y velocity.
  */
  public void shoot()
  {
    bullets.add(new Bullet(x, y - (pHeight/2), 15, 15, -5));
  }
  
  /*
  *  Removes all bullet instances and resets score/life counters.
  */
  public void reset()
  {
    bullets.clear();
    this.score = 0;
    this.lives = 5;
  }
  
  /*
  *  Updates the positions of player bullets on screen.
  */
  private void updateBullets()
  {
    // For each Bullet instance in the bullets ArrayList, update if visible.
    for(int i = bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = bullets.get(i);
      
      if(b.isVisible())
      {
        b.update();
      }
      else
      {
        bullets.remove(i);
      }
    }
  }
  
  // Call the move and render procedures, updating the player's position on screen.
  public void update()
  {
    
    updateBullets();
    
    // Timer incremented unambiguously (milliseconds).
    this.timer++;
    move();
    render();
  }
  
  /*
  *  Return the ArrayList of bullets to bet altered/updated elsewhere.
  *
  *  @return    ArrayList of Bullet types for the player.
  */
  public ArrayList<Bullet> returnBullets()
  {
    return bullets;
  }
  
  /*
  *  Functions to return the various attributes of an invader object.
  */
  
  public int returnScore()
  {
    return score;
  }
  
  public int returnLives()
  {
    return lives;
  }
  
  public int returnPosX()
  {
    return x;
  }
  
   public int returnPosY()
  {
    return y;
  }
  
  public int returnWidth()
  {
    return pWidth;
  }
  
  public int returnHeight()
  {
    return pHeight;
  }
  
  
  /*
  *  Decrements the lives property.
  */
  public void decrementLives()
  {
    lives--;
  }
  
  /*
  *  Increments the score property.
  */
  public void incrementScore()
  {
    score++;
  }
}