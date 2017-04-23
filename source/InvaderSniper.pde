// Invader with occassional fire.
public class InvaderSniper extends Invader
{
  // Executed when a new InvaderHeavy object is created.
  InvaderSniper(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    leftSprites = new PImage[5];
    leftSprites[0] = loadImage("assets/images/sniper-left1.png");
    leftSprites[1] = loadImage("assets/images/sniper-left2.png");
    leftSprites[2] = loadImage("assets/images/sniper-left3.png");
    leftSprites[3] = loadImage("assets/images/sniper-left4.png");
    leftSprites[4] = loadImage("assets/images/sniper-left5.png");
    
    for(int i = 0; i < leftSprites.length; i++)
    {
      leftSprites[i].resize(iWidth, iHeight);
    }
    
    rightSprites = new PImage[5];
    rightSprites[0] = loadImage("assets/images/sniper-right1.png");
    rightSprites[1] = loadImage("assets/images/sniper-right2.png");
    rightSprites[2] = loadImage("assets/images/sniper-right3.png");
    rightSprites[3] = loadImage("assets/images/sniper-right4.png");
    rightSprites[4] = loadImage("assets/images/sniper-right5.png");
    
    for(int i = 0; i < rightSprites.length; i++)
    {
      rightSprites[i].resize(iWidth, iHeight);
    }
    
    current = leftSprites;
  }
  
  @Override
  public void shoot()
  {
      Bullets.add(new Bullet(x, y + (iHeight/2), 15, 15, 15));
  }
}