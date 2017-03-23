// Invader with occassional fire.
public class InvaderSniper extends Invader
{
  // Executed when a new InvaderHeavy object is created.
  InvaderSniper(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
  }
 
  @Override
  protected void render()
  {
    fill(0, 0, 255);
    rect(x, y, iWidth, iHeight);
  }
}