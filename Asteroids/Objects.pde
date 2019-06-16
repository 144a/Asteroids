
int scale = 1;

// Handles all asteroids as seperate objects, which have their respective velocities and directions
class Objects {
  private double xPos;
  private double yPos;
  private double xVol;
  private double yVol;
  private double angle;
  
  // Map Properties
  int size_num = 800;
  
  // 3 sizes, should scale fairly easily
  private int size;
  
  Objects(int isize, double ixpos, double iypos) {
    xPos = ixpos;
    yPos = iypos;
    size = isize;
    
    // Generates random angle for asteroid
    angle = (int)(random(360));
    
    // Creates permenant horizontal and vertical velocity
    xVol = (double)((4 - size) * (.9) * cos(radians((float)(angle))));
    yVol = (double)((4 - size) * (.9) * sin(radians((float)(angle))));
    
  }
  
  Objects(int isize, double ixpos, double iypos,  double iangle) {
    xPos = ixpos;
    yPos = iypos;
    size = isize;
    
    // Generates random angle for asteroid to modify original by only 45 degrees as most
    angle = iangle + (45 - (int)(random(90)));
    
    // Creates permenant horizontal and vertical velocity
    xVol = (double)((4 - size) * (.9) * cos(radians((float)(angle))));
    yVol = (double)((4 - size) * (.9) * sin(radians((float)(angle))));
    
  }
  
  public int getX() {
    return (int)(xPos);
  }
  public int getY() {
    return (int)(yPos);
  }
  
  public boolean checkCollision(double iXpos, double iYpos) {
    // if(sqrt((float)((xPos * xPos) + (yPos * yPos))) >= 
    return true;
  }
  
  public void update() {
    
    // Adds the horizontal and vertical velocity components to asteroid's position
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
    
    reDraw();
  }
  
  public void reDraw() {
    stroke(255);
    ellipse((float)(xPos), (float)(yPos), (float)(size * 25), (float)(size * 25));
    
    // Velocity component visualization
    stroke(255, 0, 0);
    line((float)xPos, (float)yPos, (float)xPos, (float)(yVol * 5 + yPos));
    stroke(255, 0, 0);
    line((float)xPos, (float)yPos, (float)(xVol * 5 + xPos), (float)yPos);
    stroke(0, 255, 0);
    line((float)xPos, (float)yPos, (float)(xVol * 5 + xPos), (float)((float)(yVol * 5 + yPos)));
  }
  
}
