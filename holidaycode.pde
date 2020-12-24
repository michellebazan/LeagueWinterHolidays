SnowMan snowman;
SnowMan person1;
SnowMan person2;
Snowfall snowfall;
Snowflakes snowflakes;
//https://github.com/michellebazan/LeagueWinterHolidays/tree/main/LeagueWinterHolidays
// 1. Declare a PImage variable for the background. Don't initialize it!
PImage background;
void setup(){
  // 2. Set the size of the sketch to at least width=800 and height=600
  size(800,600);
  // 3. Set your PImage variable to the output of the
  //    loadImage() method with "snowBg.jpg" as an input
  background = loadImage("snowBg.jpg");
  // 4. Call your PImage's resize() method with your width and height
  background.resize(800,600);
  // 5. Set the snowman variable to a new SnowMan()
  snowman = new SnowMan();
  person1 = new SnowMan(height / 1000.0, color(#2BFA63), 100, 700);
  person2 = new SnowMan(height / 1500.0, color(#B355C9), 600, 650);
  snowflakes = new Snowflakes();
  snowfall = new Snowfall();
}

void draw(){
  // 6. Call the background() method to display your background image 
  background(background);
  // 7. Call the snow man's drawBody() method
  snowman.drawBody();
  person1.drawBody();
  person2.drawBody();
  // 8. Run the program.
  //    Do you see the body of your snow man?
  //yessss
  // 9. See if you can figure out how to draw the
  //    snow man's eyes, mouth, nose, buttons,
  //    hat, and armsZ
  snowman.drawEyesMouth();
  snowman.drawNose();
  snowman.drawButtons();
  snowman.drawHat();
  snowman.drawArms();
  
  person1.drawEyesMouth();
  person1.drawNose();
  person1.drawButtons();
  person1.drawArms();
  
  person2.drawEyesMouth();
  person2.drawNose();
  person2.drawButtons();
  person2.drawArms();
  
  // 10. Create an object of the Snowfall class in setup
  //     similar to the SnowMan object from 5.
  
  // 11. Call the Snowfall object's draw() method.
  //     Do you see snow falling when you run the code?
  snowfall.draw();
  // 12. Create an object of the Snowflakes class in setup
  //     similar to the SnowMan obect from 5.
  snowflakes.draw();
  // 1)3. Call the Snowflakes object's draw() method.
  //     Do you see snowflakes falling when you run the code?
  snowfall.isWindy = true;
  snowflakes.draw(); //no
  snowflakes.sparkleEnabled = true;

  // EXTRA:
  // * See if you can figure out how to add wind to the falling snow - i think done
  // * See if you can figure out hwo to make the snowflakes sparkle - done
  // * See if you can add snow men of different shapes and sizes

}
