

class Projectile {
  private double xPos;
  private double yPos;
  private double xVol;
  private double yVol;
  
  // Determines how long projectile will exist
  private double counter;
  
  Projectile(double ixpos, double iypos, double iangle) {
    xPos = ixpos;
    yPos = iypos;
    xVol = cos(radians((float)(iangle))) * 5;
    yVol = sin(radians((float)(iangle))) * 5;
    counter = 0;
  }
  
  public void update() {
    // Adds the horizontal and vertical velocity components to projectile position
    xPos += xVol;
    yPos += yVol;
    
    // Increases the main counter for projectile life span
    counter++;
    reDraw();
  }
  
  public void reDraw() {
    ellipse((float)(xPos), (float)(yPos), 10.0, 10.0);
  }
  
  
}
  
