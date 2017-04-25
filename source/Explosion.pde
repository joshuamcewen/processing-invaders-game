// Class to handle death animations/events.
class Explosion {
  
  PImage sprite;
  // Declare and initialise local class variables.
  int x, y, eWidth, eHeight, duration;
  
  // Local timer to display explosion for limited time.
  int timer = 0;
  
  /*
  *  Constructor executed when new instance of Explosion is created.
  */
  Explosion(int x, int y, int eWidth, int eHeight, int duration) 
  {
    this.x = x;
    this.y = y;
    this.eWidth = eWidth;
    this.eHeight = eHeight;
    this.duration = duration;
   
    explosion.resize(eWidth, eHeight);
  }
  
  private void render()
  {
    imageMode(CENTER);
    image(explosion, x, y);
  }
  
  private void update()
  {
    if(timer <= duration)
    {
      if(timer % 10 != 0)
      {
        render();
      }
    }
    
    timer++;
  }
}