// Class to manage level behaviour
public class Level
{
  // Declare and initialise local class variables.
  ArrayList<Invader> Invaders = new ArrayList<Invader>();
  
  int rows;
  int enemiesPerRow = 9;
  boolean Rendered = false;
  
  // Executed when a new Levels object is created.
  Level(int rows)
  {
    this.rows = rows;
    spawnInvaders();
  }
  
  // Procedure to populate Invaders ArrayList.
  public void spawnInvaders()
  {
    // Set initial values for the X and Y positions of the invaders.
    int x = 50;
    int y = 60;
    
    // For each row, execute the contents of the loop.
    for(int i = 0; i < rows; i++)
    {
      // Based on the number of enemies per row, create an invader.
      for(int j = 0; j < enemiesPerRow; j++)
      {
        Invaders.add(new Invader(x, y, 28, 28));
        x += 50;
      }
      
      x = 50;
      y+= 50;

    }
  }
  
  // Check if the level has been completed and return a t/f value.
  public boolean isComplete()
  {
    return(Invaders.size() == 0 ? true : false);
  }
  
  public void changeState()
  {
    Rendered = (Rendered ? false : true);
  }
  
  public boolean returnRendered()
  {
    return Rendered;
  }
  
  public void update()
  {
    for(Invader v : Invaders)
    {
      v.update();
    }
  }
}