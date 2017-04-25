// Class to manage level behaviour
public class Level
{
  // Declare and initialise local class variables.
  Invader[][] invaders;
  
  int rows, ySpeed;
  int columns = 8;
  boolean rendered = false;
  
  /*
  *  Constructor executed when new instance of Level is created.
  */
  Level(int rows, int ySpeed)
  {
    this.rows = rows;
    this.ySpeed = ySpeed;
    invaders = new Invader[columns][rows];
    
    spawnInvaders();
  }
  
  /*
  *  Populate the invaders array using 2D arrays.
  */
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
        if(random(1) >= 0.3)
        {
          invaders[c][r] = new InvaderAssault(x, y, 35, 35, ySpeed);
        }
        else 
        {
          invaders[c][r] = new InvaderSniper(x, y, 35, 35, ySpeed);
        }
        x += 50;
      }
      
      x = 80;
      y+= 50;
    }
  }
  
  /*
  *  Returns the render state of the level.
  *
  *  @return    true/false whether the level is rendered or not.
  */
  public boolean returnRendered()
  {
    return rendered;
  }
  
  /*
  *  Changes the render state of the level.
  */
  public void changeState()
  {
    rendered = (rendered ? false : true);
  }
  
  /*
  *  Return the 2D array of invader objects for this level.
  */
  public Invader[][] returnInvaders()
  {
    return invaders;
  }
  
  /*
  *  Sets the 2D array of invader objects for this level.
  */
  public void setInvaders(Invader[][] invaders)
  {
    this.invaders = invaders;
  }
  
  
  /*
  *  Checks whether or not the level has been completed. If so,
  *  return true.
  *
  *  @return    true/false whether the level is complete or not.
  */
  public boolean isComplete()
  { 
    for(int r = 0; r < rows; r++)
    {
      // Based on the number of enemies per row, create an invader.
      for(int c = 0; c < columns; c++)
      {
        if(invaders[c][r].isVisible())
        {
          return false;
        }
      }
    }
    return true;
  }
  
  /*
  *  Checks for collisions and updates bullet/invader objects accordingly.
  */
  private void checkCollisions()
  {
    // Retrieve the player's bullets
    ArrayList<Bullet> bullets = player.returnBullets();
    
    // For each bullet...
    for(int i = bullets.size() - 1; i >= 0; i--)
    {
      Bullet b = bullets.get(i);
      
      // Check each individual invader to see if a collision has occurred with this bullet instance
      for(int r = 0; r < rows; r++)
      {
        for(int c = 0; c < columns; c++)
        {
          // If the invader is visible and the bullet is within its boundaries, hide the invader (dead) and remove the bullet.
          // Also increment the score.
          if(invaders[c][r].isVisible() && b.y >= (invaders[c][r].returnPosY() - (invaders[c][r].returnHeight()/2)) && b.y <= (invaders[c][r].returnPosY() + (invaders[c][r].returnHeight()/2)) && b.x >= (invaders[c][r].returnPosX() - (invaders[c][r].returnWidth()/2)) && b.x <= (invaders[c][r].returnPosX() + (invaders[c][r].returnWidth()/2)))
          {
            invaders[c][r].setVisible(false);
            invaders[c][r].explode();
            bullets.remove(i);
            player.incrementScore();
          }
        }
      }
    }
  }
  
  /*
  *  Updates all invader objects for the level.
  */
  public void update()
  { 
    // Check for collissions.
    checkCollisions();
    
    // Call the update method for each individual Invader.
    for(int r = 0; r < rows; r++)
    {
      for(int c = 0; c < columns; c++)
      {
        invaders[c][r].update();
        if(invaders[c][r].returnPosY() >= height - 50)
        {
          state = DEAD;
        }
      }
    }
  }
}