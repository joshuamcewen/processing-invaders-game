// Invader with occassional fire.
public class InvaderSniper extends Invader
{
  PImage current, sniperLeft, sniperRight;
  // Executed when a new InvaderHeavy object is created.
  InvaderSniper(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    sniperLeft = loadImage("assets/images/scuba2-left.png");
    sniperLeft.resize(iWidth, iHeight);
    
    sniperRight = loadImage("assets/images/scuba2-right.png");
    sniperRight.resize(iWidth, iHeight);
    
    current = sniperLeft;
  }
 
  @Override
  protected void render()
  {
    imageMode(CENTER);
    image(current, this.x, this.y);
  }
  
  @Override
  protected void move()
  {
    super.move();
    switch(super.direction)
    {
      case LEFT:
        current = sniperLeft;
        break;
      case RIGHT:
        current = sniperRight;
        break;
    }
  }
}