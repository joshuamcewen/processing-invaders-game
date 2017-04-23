// Invader with frequent fire.
public class InvaderAssault extends Invader
{
  // Executed when a new InvaderAssault object is created.
  InvaderAssault(int x, int y, int iWidth, int iHeight, int ySpeed)
  {
    super(x, y, iWidth, iHeight, ySpeed);
    
    leftSprites = new PImage[5];
    leftSprites[0] = loadImage("assets/images/assault-left1.png");
    leftSprites[1] = loadImage("assets/images/assault-left2.png");
    leftSprites[2] = loadImage("assets/images/assault-left3.png");
    leftSprites[3] = loadImage("assets/images/assault-left4.png");
    leftSprites[4] = loadImage("assets/images/assault-left5.png");
    
    for(int i = 0; i < leftSprites.length; i++)
    {
      leftSprites[i].resize(iWidth, iHeight);
    }
    
    rightSprites = new PImage[5];
    rightSprites[0] = loadImage("assets/images/assault-right1.png");
    rightSprites[1] = loadImage("assets/images/assault-right2.png");
    rightSprites[2] = loadImage("assets/images/assault-right3.png");
    rightSprites[3] = loadImage("assets/images/assault-right4.png");
    rightSprites[4] = loadImage("assets/images/assault-right5.png");
    
    for(int i = 0; i < rightSprites.length; i++)
    {
      rightSprites[i].resize(iWidth, iHeight);
    }
    
    current = leftSprites;
  }
}