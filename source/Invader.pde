// Default invader behaviour.
public class Invader
{
  // Declare and initialise local class variables.
  //ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
  
  int x, defaultX, y, iWidth, iHeight, ySpeed;
  
  // Timer for movement initialised.
  int timer = 0;
 
  // Constants for invader movement, left and right.
  final int LEFT = 0;
  final int RIGHT = 1;
  
  int direction = LEFT;
  
  // Executed when a new Invader object is created.
  Invader(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    this.x = defaultX = x;
    this.y = y;
    this.iWidth = iWidth;
    this.iHeight = iHeight;
    this.ySpeed = ySpeed;
  }
  
  // Render the invader on screen.
  protected void render()
  {
    fill(0, 255, 0);
    rect(x, y, iWidth, iHeight);
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
      }
    }
    else if(direction == RIGHT)
    {
      x += 1;
      if(x >= defaultX + 20)
      {
        direction = LEFT;
      }
    }
    
    // Move downwards every X milliseconds depending on value of ySpeed set in the level class.
    if(timer % ySpeed == 0)
    {
      y += 50;
    }
  }
  
  // Create a new bullet instance.
  public void shoot()
  {
  }
  
  // Call the move and render procedures, updating the invader's position on screen.
  public void update()
  {
    // Timer incremented unambiguously (milliseconds).
    this.timer++;
    
    move();
    render();
  }
}