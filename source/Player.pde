// Class to handle the player
public class Player
{
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
  }
  
  // Render the player on screen.
  private void render()
  {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(this.x, this.y, this.pWidth, this.pHeight);
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
    Bullets.add(new Bullet(x, y, 5, 10, -5));
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
}