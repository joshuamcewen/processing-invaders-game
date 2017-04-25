// Invader with frequent fire.
public class InvaderAssault extends Invader
{
  /*
  *  Constructor executed when new instance of InvaderAssault is created.
  */
  InvaderAssault(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    leftSprites = assaultLeftSprites;
    rightSprites = assaultRightSprites;
    
    // Default the initially used sprite set to those facing left.
    currentSprites = leftSprites;
  }
}