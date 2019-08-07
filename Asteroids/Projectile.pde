

class Projectile {
  private double xPos;
  private double yPos;
  private double xVol;
  private double yVol;
  
  // Determines how long projectile has existed
  private double counter;
  
  // Map Properties
  int size_num = 800;
  
  Projectile(double ixpos, double iypos, double iangle) {
    xPos = ixpos;
    yPos = iypos;
    xVol = cos(radians((float)(iangle))) * 5;
    yVol = sin(radians((float)(iangle))) * 5;
    counter = 0;
  }
  
  public int getX() {
    return (int)(xPos);
  }
  public int getY() {
    return (int)(yPos);
  }
  public int getCounter() {
    return (int)(counter);
  }
  
  public void update() {
    // Adds the horizontal and vertical velocity components to projectile position
    xPos += xVol;
    yPos += yVol;
    
    // Screen wrapping conditions
    if(xPos < 0) {
      xPos = size_num;
    }
    if(yPos < 0) {
      yPos = size_num;
    }
    if(xPos > size_num) {
      xPos = 0;
    }
    if(yPos > size_num) {
      yPos = 0;
    }
    
    // Increases the main counter for projectile life span 
    counter++;
    reDraw();
  }
  
  public void reDraw() {
    ellipse((float)(xPos), (float)(yPos), 2.0, 2.0);
  }
  
  
}
  
