// Invader with larger bullets.
public class InvaderHeavy extends Invader
{
  // Executed when a new InvaderHeavy object is created.
  InvaderHeavy(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
  }
  
  @Override
  protected void render()
  {
    fill(255, 0, 0);
    rect(x, y, iWidth, iHeight);
  }
  
}