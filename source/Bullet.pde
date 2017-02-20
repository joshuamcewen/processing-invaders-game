// Bullet handling class
public class Bullet
{
  // Declare local class variables.
  int x, y, bWidth, bHeight;
  float velocity;
  
  // Executed when a new Bullet object is created.
  Bullet(int x, int y, int bWidth, int bHeight, float velocity)
  {
    this.x = x;
    this.y = y;
    this.bWidth = bWidth;
    this.bHeight = bHeight;
    this.velocity = velocity;
  }
  
  // Render the bullet on screen.
  private void render()
  {
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(x, y, bWidth, bHeight);
  }
  
  // Change the position of the bullet based on its velocity.
  private void move()
  {
    y += velocity;
  }
  
  public boolean isVisible()
  {
    return (y - (bHeight/2) > 0 && y + (bHeight/2) < height);
  }
  
  // Call the move and render procedures, updating the bullet's position on screen.
  public void update()
  {
    move();
    render();
  }
  
}