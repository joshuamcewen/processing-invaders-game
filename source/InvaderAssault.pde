// Invader with frequent fire.
public class InvaderAssault extends Invader
{
  PImage current, assaultLeft, assaultRight;
  // Executed when a new InvaderAssault object is created.
  InvaderAssault(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    assaultLeft = loadImage("assets/images/scuba-left.png");
    assaultLeft.resize(iWidth, iHeight);
    
    assaultRight = loadImage("assets/images/scuba-right.png");
    assaultRight.resize(iWidth, iHeight);
    
    current = assaultLeft;
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
        current = assaultLeft;
        break;
      case RIGHT:
        current = assaultRight;
        break;
    }
  }
}