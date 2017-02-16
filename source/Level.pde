// Class to manage level behaviour
public class Level
{
  // Declare and initialise local class variables.
  ArrayList Invaders = new ArrayList<Invader>();
  
  int Rows;
  int enemiesPerRow = 9;
  
  // Executed when a new Levels object is created.
  Level(int Rows)
  {
    this.Rows = Rows;
  }
  
  // Procedure to populate Invaders ArrayList.
  public void spawnInvaders()
  {
  }
  
  // Check if the level has been completed and return a t/f value.
  public boolean isComplete()
  {
    return(Invaders.size() == 0 ? true : false);
  }
}