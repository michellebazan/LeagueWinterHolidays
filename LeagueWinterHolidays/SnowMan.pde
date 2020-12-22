public class SnowMan {
  int x;
  int y;
  color bodyColor;
  color inverted;
  float scale;
  
  int radiusBot = int(175 * scale);
  int radiusMid = int(140 * scale);
  int radiusTop = int(100 * scale);
  int offsetBot = this.y - radiusBot - 20;
  int offsetMid = offsetBot - (radiusBot);
  int offsetTop = offsetMid - (2*radiusTop);
  
  public SnowMan() {
    this.scale = height / 800.0;    // scale 1 for height = 800
    this.x = width/2;  // centered
    this.y = height;   // bottom of screen
    this.bodyColor = color(#FFFFFF);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }
  
  public SnowMan(int bodyColor){
    this.scale = height / 800.0;
    this.x = width/2;  // centered
    this.y = height;   // bottom of screen
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }
  
  public SnowMan(int bodyColor, int x, int y) {
    this.scale = height / 800.0;
    this.x = x;
    this.y = y;
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }
  
  public SnowMan(float scale, int bodyColor){
    this.scale = scale;
    this.x = width/2;  // centered
    this.y = height;   // bottom of screen
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }
  
  public SnowMan(float scale, int bodyColor, int x, int y) {
    this.scale = scale;
    this.x = x;
    this.y = y;
    this.bodyColor = color(bodyColor);
    this.inverted = color(255 - red(bodyColor), 255 - green(bodyColor), 255 - blue(bodyColor));
  }

  public void drawBody(){
    push();
    
    noStroke();
    radiusBot = int(175 * scale);
    radiusMid = int(140 * scale);
    radiusTop = int(100 * scale);
    offsetBot = this.y - radiusBot - 20;
    offsetMid = offsetBot - (radiusBot);
    offsetTop = offsetMid - (2*radiusTop);
    fill(this.bodyColor);
    ellipse(this.x, offsetBot, 2.15*radiusBot, 2*radiusBot);
    ellipse(this.x, offsetMid, 2.15*radiusMid, 2*radiusMid);
    ellipse(this.x, offsetTop, 2*radiusTop, 2*radiusTop);
    
    pop();
  }
  
  public void drawNose(){
    push();
    
    float noseHeight = 0.2 * radiusTop;
    float noseLength = 1.2 * radiusTop;
    
    fill(#FFA500);
    triangle(x, offsetTop, x, offsetTop + noseHeight, x + noseLength, offsetTop);
     
    pop();
  }
  
  public void drawEyesMouth(){
    push();
    
    float radiusEyes = 0.25 * radiusTop; 
    
    // Inverted color
    fill(inverted);
    ellipse(x - (radiusTop/4), offsetTop - (radiusTop/4), radiusEyes, radiusEyes);
    ellipse(x + (radiusTop/4), offsetTop - (radiusTop/4), radiusEyes, radiusEyes);
    
    float radiusSmile = 1.25 * radiusTop;
    float smileWidth = 0.15 * radiusTop;
    
    noFill();
    stroke(inverted);
    strokeWeight(smileWidth);
    arc(x, offsetTop, radiusSmile, radiusSmile, PI/4, 3*PI/4, OPEN);
    
    pop();
  }
  
  public void drawHat(){
    push();
    
    float brimWidth = 2.5 * radiusTop;
    float brimHeight = 0.3 * radiusTop;
    float topWidth = 0.5 * brimWidth;
    float topHeight = radiusTop;
    
    fill(1);
    rect(x - brimWidth/2, offsetTop - radiusTop, brimWidth, brimHeight);
    rect(x - topWidth/2, offsetTop - radiusTop - topHeight, topWidth, topHeight);
    
    pop();
  }
  
  public void drawArms(){
    push();
    
    float armY = offsetMid - (0.3 * radiusMid);
    float leftArmX =  x - (0.9 * radiusMid);
    float rightArmX = x + (0.9 * radiusMid);
    float armLength = 1.0 * radiusMid;
    float armWidth =  0.1 * radiusMid;
    
    stroke(#4C322B);
    strokeWeight(armWidth);
    strokeCap(ROUND);
    line(leftArmX, armY ,leftArmX - armLength, offsetMid - (radiusMid)); 
    line(rightArmX, armY ,rightArmX + armLength, offsetMid - (radiusMid)); 
    
    pop();
  }
  
  public void drawButtons(){
    push();
    
    float buttonSize = 0.25 * radiusMid;
    
    stroke(inverted);
    strokeWeight(buttonSize);
    
    point(x, offsetMid);
    point(x, offsetMid - (0.5 * radiusMid));
    point(x, offsetMid + (0.5 * radiusMid));
    
    pop();
  }
}
