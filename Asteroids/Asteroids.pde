// Player initialization
Ship player = new Ship();

// Array for all projectiles (bullets)
// Max of 4 Projectiles on screen
Projectile[] projArr = new Projectile[4];

// Array to hold all objects on screen
Objects[] objArr = new Objects[30];

// Needed for determining key presses
boolean isVelInc, isRotLeft, isRotRight, isFiring;

// Button timer to limit shooting to within only a few frames
int fireTimer = 0;

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
  int i = 0;
  boolean added = false;
  while(i < projArr.length && !(added)) {
    if(projArr[i] == null) {
      projArr[i] = new Projectile(player.getX(), player.getY(), player.getAngle());
      added = true;
    }
    i++;
  }
}

// Determines collision between projectiles and objects
public void updateProjectiles() {
  // println("r");
  for(int n = 0; n < projArr.length; n++) {
    if(projArr[n] != null) {
      
      // Run through and check for both collision and life cycle counter
      // Update the Projectile object array accordingly
      int j = 0;
      while(projArr[n] != null && j < objArr.length && objArr[j] != null) {
        if(objArr[j].checkCollision(projArr[n].getX(), projArr[n].getY())) {
          projArr[n] = null;
          objArr[j] = null;
          // Needs to handle generating small asteroids from larger ones 
        } else {
          if(projArr[n].getCounter() > 60) {
            projArr[n] = null;
          }
        }
        j++;
      }
      if(projArr[n] != null) {
        projArr[n].update();
      }
    }
  }
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
  // Adds to Button timer to allow for individual shots
  if(isFiring && fireTimer == 0) {
    fireTimer = 20;
    updateFiring();
  }
  
  // Decreases Button Timer
  if(fireTimer > 0) {
    fireTimer--;
  }
  
  // Updates ship
  player.update();
  
  // Updates both position and collision for objects
  updateObjects();
  
  // Determines collision between projectiles and objects
  updateProjectiles();
  
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
