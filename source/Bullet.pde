// Bullet handling class
public class Bullet
{
  // Declare local class variables.
  int x, y, bWidth, bHeight;
  
  // Executed when a new Bullet object is created.
  Bullet(int x, int y, int bWidth, int bHeight)
  {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
  }
  
  // Render the bullet on screen.
  private void render()
  {
  }
  
  // Change the position of the bullet based on its velocity.
  private void move()
  {
  }
  
  // Call the move and render procedures, updating the bullet's position on screen.
  public void update()
  {
    move();
    render();
  }
  
}