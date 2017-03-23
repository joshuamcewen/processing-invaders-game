// Class to manage level behaviour
public class Level
{
  // Declare and initialise local class variables.
  Invader[][] Invaders;
  
  int rows, ySpeed;
  int columns = 8;
  boolean Rendered = false;
  
  // Executed when a new Levels object is created.
  Level(int rows, int ySpeed)
  {
    this.rows = rows;
    this.ySpeed = ySpeed;
    Invaders = new Invader[columns][rows];
    
    spawnInvaders();
  }
  
  // Procedure to populate Invaders ArrayList.
  public void spawnInvaders()
  {
    // Set initial values for the X and Y positions of the invaders.
    int x = 80;
    int y = 60;
    
    // For each row, execute the contents of the loop.
    for(int r = 0; r < rows; r++)
    {
      // Based on the number of enemies per row, create an invader.
      for(int c = 0; c < columns; c++)
      {
        Invaders[c][r] = new InvaderAssault(x, y, 35, 35, ySpeed);
        x += 50;
      }
      
      x = 80;
      y+= 50;
    }
  }
  
  public boolean returnRendered()
  {
    return Rendered;
  }
  
  public void changeState()
  {
    Rendered = (Rendered ? false : true);
  }
  
  public Invader[][] returnInvaders()
  {
    return Invaders;
  }
  
  public void setInvaders(Invader[][] Invaders)
  {
    this.Invaders = Invaders;
  }
  
  // Check if the level has been completed and return a t/f value.
  public boolean isComplete()
  { 
    for(int r = 0; r < rows; r++)
    {
      // Based on the number of enemies per row, create an invader.
      for(int c = 0; c < columns; c++)
      {
        if(Invaders[c][r].isVisible())
        {
          return false;
        }
      }
    }
    return true;
  }
  
  private void checkCollisions()
  {
    // Retrieve the player's bullets
    ArrayList<Bullet> Bullets = player.returnBullets();
    
    // For each bullet...
    for(int i = Bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = Bullets.get(i);
      
      // Check each individual invader to see if a collision has occurred with this bullet instance
      for(int r = 0; r < rows; r++)
      {
        for(int c = 0; c < columns; c++)
        {
          // If the invader is visible and the bullet is within its boundaries, hide the invader (dead) and remove the bullet.
          // Also increment the score.
          if(Invaders[c][r].isVisible() && b.y >= (Invaders[c][r].returnPosY() - (Invaders[c][r].returnHeight()/2)) && b.y <= (Invaders[c][r].returnPosY() + (Invaders[c][r].returnHeight()/2)) && b.x >= (Invaders[c][r].returnPosX() - (Invaders[c][r].returnWidth()/2)) && b.x <= (Invaders[c][r].returnPosX() + (Invaders[c][r].returnWidth()/2)))
          {
            Invaders[c][r].setVisible(false);
            Bullets.remove(i);
            player.incrementScore();
          }
        }
      }
    }
  }
  
  public void update()
  { 
    // Call the update method for each individual Invader.
    for(int r = 0; r < rows; r++)
    {
      for(int c = 0; c < columns; c++)
      {
        Invaders[c][r].update();
      }
    }
    
    // Update Invaders after collision detection method called
    checkCollisions();
  }
}