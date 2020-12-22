class Snowfall {
  ArrayList<Snow> snowfall;
  int snowLevel = 0;
  int minSnowSize = 1;
  int maxSnowSize = 10;
  boolean isWindy = false;
  int amountSnowFallen = 0;
  color snowColor;
  
  public Snowfall(){
    snowfall = new ArrayList<Snow>();
    
    // Initial snowfall
    for (int i=100; i>= 0; i--) {
      addSnow(i);
    }
    
    this.snowColor = #FFFFFF;
  }
  
  public void setSnowColor(color snowColor){
    this.snowColor = snowColor;
  }
  
  public void setWind(boolean isWindy){
    this.isWindy = isWindy;
  }
  
  // Add additional snow!
  public void addSnow(int id){
    float x = random(width);
    float y = random(0);
    float size = random(minSnowSize, maxSnowSize);
    snowfall.add( new Snow(x, y, id, size) );
  }
  
  public void draw(){
    push();
    
    fill(this.snowColor);
    
    // Draw snow on ground
    ellipse(width/2, height, width, 80 + snowLevel);

    if (amountSnowFallen != 0 && amountSnowFallen % 50 == 0) {
      snowLevel += 1;
    }
    
    // Draw snow particles
    for (Snow snow : snowfall) {
      snow.draw(this.isWindy);
    }
    
    // Remove snow at the bottom if necessary
    for( int i = snowfall.size() - 1; i >= snowfall.size(); i-- ){
      Snow particle = snowfall.get(i);
      
      if( particle.y > height ){
        snowfall.remove(particle);
        amountSnowFallen++;
      }
    }
    
    if( frameCount % 2 == 0 ){
      addSnow(frameCount);
    }
    
    pop();
  }
}

class Snow {
  float x;
  float y;
  int id;
  float size;

  Snow( float x, float y, int id, float size ) {
    this.x = x;
    this.y = y;
    this.id = id;
    this.size = size;
  }

  void draw(boolean isWindy) {
    y += cos( ( (id * 25) - frameCount ) / 50) * 0.5 + 1;

    if ( isWindy ) {
      x += sin( ( (id * 9) + frameCount ) / 50) * 2;
    }

    // Draw snow!
    noStroke();
    arc(x, y, size, size, 0, 7);
  }
}
