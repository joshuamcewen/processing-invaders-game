// Class to handle the player
public class Player
{
  // Declare images
  PImage current, spriteShoot, spriteLeft, spriteRight;
  
  // Declare and initialise local class variables.
  ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
  
  int x, y, pWidth, pHeight;
  int score = 0;
  int lives = 3;
  
  // Executed when a new Player object is created.
  Player(int x, int y, int pWidth, int pHeight)
  {
    this.x = x;
    this.y = y;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
    
    spriteShoot = loadImage("assets/images/player-shoot.png");
    spriteShoot.resize(pWidth, pHeight);
    
    spriteLeft = loadImage("assets/images/player-left.png");
    spriteLeft.resize(pWidth, pHeight);
    
    spriteRight = loadImage("assets/images/player-right.png");
    spriteRight.resize(pWidth, pHeight);
    
    current = spriteShoot;
  }
  
  // Render the player on screen.
  private void render()
  {
    noStroke();
    imageMode(CENTER);
    image(current, this.x, this.y);
  }
  
  // Change the position of the player.
  private void move()
  {
    if(leftPressed && (x - pWidth/2) >= 5)
    {
      current = spriteLeft;
      x -= 5;
    }
    else if(rightPressed && (x + pWidth/2) <= (width - 5))
    {
      current = spriteRight;
      x+= 5;
    }
  }
  
  // Create a new bullet instance.
  public void shoot()
  {
    current = spriteShoot;
    Bullets.add(new Bullet(x, y - (pHeight/2), 15, 15, -5));
  }
  
  // Remove all instances of bullet.
  public void reset()
  {
    Bullets.clear();
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
  
  private void updateInvaders()
  {
    ArrayList<Invader> Invaders = currentLevel.returnInvaders();
    
    for(int i = Bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = Bullets.get(i);
      
      for(int j = Invaders.size() - 1; j >= 0; j--)
      {
        Invader v = Invaders.get(j);
        
        if(b.y >= (v.y - (v.iHeight/2)) && b.y <= (v.y + (v.iHeight/2)) && b.x >= (v.x - (v.iWidth/2)) && b.x <= (v.x + (v.iWidth/2)))
        {
          Invaders.remove(j);
          Bullets.remove(i);
          score++;
        }
      }
    }
    
    currentLevel.setInvaders(Invaders);
  }
  
  // Call the move and render procedures, updating the player's position on screen.
  public void update()
  {
    
    updateBullets();
    updateInvaders();
    
    move();
    render();
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
}