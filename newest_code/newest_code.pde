

int score = 0;

float rectX = 200;
float rectY = 450;
float rectW = 100;
float rectH = 20;

float rectspeed = 4.3;

boolean links = false;
boolean rechts = false;

int numBalls = 5; 
Ball[] balls = new Ball[numBalls];

void setup() {
  size(500, 500);
  
  for (int i = 0; i < numBalls; i++) {
    boolean bonusBall = (random(0,1) > 0.5);
    println(bonusBall);
    balls[i] = new Ball(bonusBall);
    balls[i].reset();
  }

}
void keyPressed() {
  if (key == 'a') {
    links = true;
  }
  if (key == 'd') {
    rechts = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    links = false;
  }
  if (key == 'd') {
    rechts = false;
  }
}

void draw() {
  background(200, 200, 200);
 
  for (int i = 0; i < numBalls; i++) {
    
    Ball ball = balls[i];
    ball.update();
    ball.render();
    
    if (ball.y > height) {
      ball.reset();
    }
    
    if (ball.x > rectX && ball.x < rectX + rectW && ball.y > rectY) {
      ball.reset();
      if (ball.bonus) {
        score += 2; 
      } else {
        score += 1; 
      }
    }
  }

    
    

  if (links == true) {
    rectX -= rectspeed;
  }

  if (rechts == true) {
    rectX += rectspeed;
  }

  rect(rectX, rectY, rectW, rectH);
  fill(255, 255, 255);
  textSize(32);
  text("Score: " + score, 10, 30);

  if (score >= 20) {
    println("win");
    background(0, 128, 0);
  textSize(50);
  text("winner", 200, 250);
  }
}

class Ball {
  float x;
  float y;
  float speed;
  float diameter; 
  boolean bonus;
  
  Ball(boolean bonus) {
    this.bonus=bonus;
    this.diameter = random(20, 60);
  }
  
  void update() {
    y = y + speed;
  }
  
  
  Ball(float diameter) {
    this.diameter = diameter;
  }
  
  void render() {
     if (bonus) {
      fill(17, 0, 255);
    } else {
      fill(255, 255, 255); 
    }
    ellipse(x, y, diameter, diameter);
  } 
  
  void reset() {
    y = 0;
    x = random(25, 475);
    speed = random(3, 6);
    diameter = random(20, 60);
  }
}
