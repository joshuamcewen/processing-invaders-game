// Class to manage level behaviour
public class Level
{
  // Declare and initialise local class variables.
  ArrayList<Invader> Invaders = new ArrayList<Invader>();
  
  int Rows;
  int enemiesPerRow = 9;
  boolean Rendered = false;
  
  // Executed when a new Levels object is created.
  Level(int Rows)
  {
    this.Rows = Rows;
    spawnInvaders();
  }
  
  // Procedure to populate Invaders ArrayList.
  public void spawnInvaders()
  {
    Invaders.add(new Invader(100, 100, 22, 10));
    Invaders.add(new Invader(150, 100, 50, 10));
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