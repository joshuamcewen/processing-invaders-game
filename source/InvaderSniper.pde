// Invader with occassional fire.
public class InvaderSniper extends Invader
{
  // Executed when a new InvaderHeavy object is created.
  InvaderSniper(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    leftSprites = sniperLeftSprites;
    rightSprites = sniperRightSprites;
    
    currentSprites = leftSprites;
  }
  
  @Override
  public void shoot()
  {
      Bullets.add(new Bullet(x, y + (iHeight/2), 15, 15, 15));
  }
}