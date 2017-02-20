// Default invader behaviour.
public class Invader
{
  // Declare and initialise local class variables.
  //ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
  
  int x, y, iWidth, iHeight;
  
  // Executed when a new Invader object is created.
  Invader(int x, int y, int iWidth, int iHeight)
  {
    this.x = x;
    this.y = y;
    this.iWidth = iWidth;
    this.iHeight = iHeight;
  }
  
  // Render the invader on screen.
  private void render()
  {
    fill(0, 255, 0);
    rect(x, y, iWidth, iHeight);
  }
  
  // Change the position of the invader.
  private void move()
  {
  }
  
  // Create a new bullet instance.
  public void shoot()
  {
  }
  
  // Call the move and render procedures, updating the invader's position on screen.
  public void update()
  {
    move();
    render();
  }
}