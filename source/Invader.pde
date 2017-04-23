// Default invader behaviour.
public class Invader
{
  PImage[] leftSprites, rightSprites, currentSprites;
  int spritePointer;
  // Declare and initialise local class variables.
  ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
  
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
  
  // Executed when a new Invader object is created.
  Invader(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    this.x = defaultX = x;
    this.y = y;
    this.iWidth = iWidth;
    this.iHeight = iHeight;
    this.ySpeed = ySpeed;
    this.spritePointer = (int)random(5);
  }
  
  // Render the invader on screen.
  protected void render()
  {
    imageMode(CENTER);
    image(currentSprites[spritePointer], this.x, this.y);
    
    // Every 10 frames...
    if(timer % 10 == 0) 
    {
      spritePointer = (spritePointer < currentSprites.length - 2 ? spritePointer + 1 : 0);
    }
  }
  
  // Change the position of the invader.
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
  
  // Create a new bullet instance.
  public void shoot()
  {
      Bullets.add(new Bullet(x, y + (iHeight/2), 15, 15, 5));
  }
  
  private void updateBullets()
  {
    for(int i = Bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = Bullets.get(i);
      
      if(b.y >= (player.returnPosY() - (player.returnHeight()/2)) && b.y <= (player.returnPosY() + (player.returnHeight()/2)) && b.x >= (player.returnPosX() - (player.returnWidth()/2)) && b.x <= (player.returnPosX() + (player.returnWidth()/2)))
      {
        player.decrementLives();
        Bullets.remove(i);
      }
      if(b.isVisible())
      {
        b.update();
      }
      else
      {
        Bullets.remove(i);
      }
    }
  }
  
  public void explode()
  {
    explosionVisible = true;
    deathExplosion = new Explosion(x, y, iWidth, iHeight, 20);
  }
  
  public boolean isVisible()
  {
    return visible;
  }
  
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