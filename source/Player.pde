// Class to handle the player
public class Player
{
  // Declare and initialise local class variables.
  ArrayList<Bullet> Bullets = new ArrayList<Bullet>();
  
  int x, y, pWidth, pHeight;
  int score = 0;
  int lives = 3;
  
  // Executed when a new Player object is created.
  Player(int x, int y, int pWidth, int pHeight)
  {
    this.x = x;
    this.y = y;
    this.pWidth = pWidth;
    this.pHeight = pHeight;
  }
  
  // Render the player on screen.
  private void render()
  {
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(this.x, this.y, this.pWidth, this.pHeight);
  }
  
  // Change the position of the player.
  private void move()
  {
    if(leftPressed && (x - pWidth/2) >= 5)
    {
      x -= 5;
    }
    else if(rightPressed && (x + pWidth/2) <= (width - 5))
    {
      x+= 5;
    }
  }
  
  // Create a new bullet instance.
  public void shoot()
  {
  }
  
  // Call the move and render procedures, updating the player's position on screen.
  public void update()
  {
    move();
    render();
  }
  
  // Return the player's current score.
  public int returnScore()
  {
    return score;
  }
  
  // Return the player's life count.
  public int returnLives()
  {
    return lives;
  }
}