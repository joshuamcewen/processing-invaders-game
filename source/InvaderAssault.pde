// Invader with frequent fire.
public class InvaderAssault extends Invader
{
  // Executed when a new InvaderAssault object is created.
  InvaderAssault(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    leftSprites = assaultLeftSprites;
    rightSprites = assaultRightSprites;
    
    currentSprites = leftSprites;
  }
}