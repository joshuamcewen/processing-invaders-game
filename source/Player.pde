// Class to handle the player
public class Player
{
  // Declare images
  PImage[] sprites;
  int spritePointer;
  
  // Declare and initialise local class variables.
  ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
  
  int x, y, pWidth, pHeight;
  int score = 0;
  int lives = 5;
  
  // Timer for movement initialised.
  int timer = 0;
  
  // Executed when a new Player object is created.
  Player(int x, int y, int pWidth, int pHeight, PImage sprites[])
  {
    this.x = x;
    this.y = y;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    
    this.sprites = sprites;
    
    for(int i = 0; i < this.sprites.length; i++)
    {
      this.sprites[i].resize(pWidth, pHeight);
    }
    
    spritePointer = 0;
  }
  
  // Render the player on screen.
  private void render()
  {
    imageMode(CENTER);
    image(sprites[spritePointer], this.x, this.y);
    
    // Every 10 frames...
    if(timer % 10 == 0) 
    {
      spritePointer = (spritePointer < sprites.length - 2 ? spritePointer + 1 : 0);
    }
  }
  
  // Change the position of the player.
  private void move()
  {
    if(leftPressed && (x - pWidth/2) >= 5)
    {
      x -= 5;
    }
    else if(rightPressed && (x + pWidth/2) <= (width - 5))
    {
      x+= 5;
    }
  }
  
  // Create a new bullet instance.
  public void shoot()
  {
    Bullets.add(new Bullet(x, y - (pHeight/2), 15, 15, -5));
  }
  
  // Remove all instances of bullet.
  public void reset()
  {
    Bullets.clear();
    this.score = 0;
    this.lives = 5;
  }
  
  private void updateBullets()
  {
    for(int i = Bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = Bullets.get(i);
      
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
  
  // Call the move and render procedures, updating the player's position on screen.
  public void update()
  {
    
    updateBullets();
    
    // Timer incremented unambiguously (milliseconds).
    this.timer++;
    move();
    render();
  }
  
  // Return bullets ArrayList
  public ArrayList<Bullet> returnBullets()
  {
    return Bullets;
  }
  
  // Return the player's current score.
  public int returnScore()
  {
    return score;
  }
  
  // Return the player's life count.
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
  
  public void decrementLives()
  {
    lives--;
  }
  
  public void incrementScore()
  {
    score++;
  }
}