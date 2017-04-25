// Default invader behaviour.
public class Invader
{
  PImage[] leftSprites, rightSprites, currentSprites;
  int spritePointer;
  // Declare and initialise local class variables.
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
  // On death
  Explosion deathExplosion;
  boolean explosionVisible = false;
  
  int x, defaultX, y, iWidth, iHeight, ySpeed;
  
  // Timer for movement initialised.
  int timer = 0;
 
  // Constants for invader movement, left and right.
  final int LEFT = 0;
  final int RIGHT = 1;
  
  int direction = LEFT;
  
  boolean visible = true;
  
  /*
  *  Constructor executed when new instance of Invader is created.
  */
  Invader(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    this.x = defaultX = x;
    this.y = y;
    this.iWidth = iWidth;
    this.iHeight = iHeight;
    this.ySpeed = ySpeed;
    
    // Start with a random spritePointer value to differentiate the animations.
    this.spritePointer = (int)random(5);
  }
  
  /*
  *  Renders the invader sprite on screen, updating frames using the spritePointer.
  */
  protected void render()
  {
    imageMode(CENTER);
    // Uses the spritePointer to determine which asset to use.
    image(currentSprites[spritePointer], this.x, this.y);
    
    // Every 10 frames increment the sprite pointer or reset it to 0.
    if(timer % 10 == 0) 
    {
      spritePointer = (spritePointer < currentSprites.length - 2 ? spritePointer + 1 : 0);
    }
  }
  
  /*
  *  Changes the position of the invader both, X and Y and updates the sprite set used based
  *  on this.
  */
  protected void move()
  {
    if(direction == LEFT)
    {
      x -= 1;
      if(x <= defaultX - 20)
      {
        direction = RIGHT;
        currentSprites = rightSprites;
      }
    }
    else if(direction == RIGHT)
    {
      x += 1;
      if(x >= defaultX + 20)
      {
        direction = LEFT;
        currentSprites = leftSprites;
      }
    }
    
    // Move downwards every X milliseconds depending on value of ySpeed set in the level class.
    if(ySpeed != 0 && timer % ySpeed == 0)
    {
      y += 50;
    }
  }
  
  /*
  *  Fires a bullet (new bullet instance) from the current position of the invader/jet.
  */
  public void shoot()
  {
      bullets.add(new Bullet(x, y + (iHeight/2), 15, 15, 5));
  }
  
  /*
  *  Updates each bullet instance for the corresponding invader and removes based on visibility.
  */
  private void updateBullets()
  {
    for(int i = bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = bullets.get(i);
      
      if(b.y >= (player.returnPosY() - (player.returnHeight()/2)) && b.y <= (player.returnPosY() + (player.returnHeight()/2)) && b.x >= (player.returnPosX() - (player.returnWidth()/2)) && b.x <= (player.returnPosX() + (player.returnWidth()/2)))
      {
        player.decrementLives();
        bullets.remove(i);
      }
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
  
  /*
  *  Creates a new instance of explosion in the position of the invader. 
  */
  public void explode()
  {
    explosionVisible = true;
    deathExplosion = new Explosion(x, y, iWidth, iHeight, 20);
  }
  
  /*
  *  Returns the visibility of the invader.
  *
  *  @return    true/false whether the invader is visible or not.
  */
  public boolean isVisible()
  {
    return visible;
  }
  
  
  /*
  *  Set the visibility of the invader.
  */
  public void setVisible(boolean visible)
  {
    this.visible = visible;
  }
  
  // Call the move and render procedures, updating the invader's position on screen.
  public void update()
  { 
    if(isVisible())
    {
     if(random(100) < 0.25)
     {
       shoot();
     }
    
     // Timer incremented unambiguously (milliseconds).
     this.timer++;
     move();
     render(); 
   }
   
   if(explosionVisible) 
   {
     deathExplosion.update();
   }
    
    updateBullets();
  }
  
  /*
  *  Functions to return the various attributes of an invader object.
  */
  
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
    return iWidth;
  }
  
  public int returnHeight()
  {
    return iHeight;
  }
}