// Invader with quick fire.
public class InvaderSniper extends Invader
{
  /*
  *  Constructor executed when new instance of InvaderSniper is created.
  */
  InvaderSniper(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    leftSprites = sniperLeftSprites;
    rightSprites = sniperRightSprites;
    
    // Default the initially used sprite set to those facing left.
    currentSprites = leftSprites;
  }
  
  /*
  *  Fire a bullet (new instance) with an increased bullet velocity (3x).
  */
  @Override
  public void shoot()
  {
      bullets.add(new Bullet(x, y + (iHeight/2), 15, 15, 15));
  }
}