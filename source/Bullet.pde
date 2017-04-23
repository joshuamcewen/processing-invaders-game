// Bullet handling class
public class Bullet
{
  PImage bulletSprite;
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
    
    bulletSprite = (velocity > 0 ? loadImage("assets/images/bullet-down.png") : loadImage("assets/images/bullet-up.png"));
    bulletSprite.resize(bWidth, bHeight);
  }
  
  /**
  *  Renders the bullet on screen by drawing the bullet sprite.
  */
  private void render()
  {
    imageMode(CENTER);
    image(bulletSprite, this.x, this.y);
  }
  
  /**
  *  Moves the bullet along the Y axis by the amount - velocity.
  */
  private void move()
  {
    y += velocity;
  }
  
  /**
  *  Returns the visibilty of the bullet on screen as a boolean.
  *
  *  @return    true/false whether the bullet is visible or not.
  */
  public boolean isVisible()
  {
    return (y - (bHeight/2) > 0 && y + (bHeight/2) < height);
  }
  
  /**
  *  Calls the move and render procedures, updating the bullet on screen.
  */
  public void update()
  {
    move();
    render();
  }
  
}