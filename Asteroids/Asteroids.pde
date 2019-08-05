// Player initialization
Ship player = new Ship();

// Array for all projectiles (bullets)
// Max of 4 Projectiles on screen
Projectile[] projArr = new Projectile[4];

// Array to hold all objects on screen
Objects[] objArr = new Objects[30];

// Needed for determining key presses
boolean isVelInc, isRotLeft, isRotRight, isFiring;


public void setup() {
  size(800,800);
  for(int i = 0; i < 10; i++) {
    objArr[i] = new Objects(1, 300, 350);
  }
}

public void draw() {
  updateScreen();
  
}

// Adds an additional projectile to an array, using ships current position and rotation
public void updateFiring() {
  
}

// Determines collision between projectiles and objects
public void updateProjectiles() {
  
}

// Checks for collision between objects and updates objects position
public void updateObjects() {
  for(int i = 0; i < objArr.length; i++) {
    if(objArr[i] != null && objArr[i].checkCollision(player.getX(), player.getY())) {
      // delay(1000);
      // Will be replaced with life counter and game restart
      exit();
    } else if(objArr[i] != null) {
      objArr[i].update();
    }
    
  }
}


public void updateScreen() {
  background(0);
  delay(10);
  
  // Checks for Key presses and modifies ship properties
  if(isVelInc) {
    player.incVelocity();
  }
  if(isRotLeft) {
    player.incAngle();      
  }
  if(isRotRight) {
    player.decAngle();      
  }
  if(isFiring) {
    updateFiring();
  }
  
  // Updates ship
  player.update();
  
  // Updates both position and collision for objects
  updateObjects();
  
  // Determines collision between projectiles and objects
  
  // println(test.checkCollision(player.getX(), player.getY()));
}

void keyPressed() {
  setMove(key, true);
  
}
 
void keyReleased() {
  setMove(key, false);
}

// Handles multiple key presses at once, allowing for increasing both velocity and angle at the same time;
boolean setMove(int k, boolean b) {
  switch (k) {
  case 's':
    return isRotLeft = b;
  case 'a':
    return isRotRight = b;
  case 'k':
    return isVelInc = b;
  case 'l':
    return isFiring = b;
  default:
    return b;
  }
}
