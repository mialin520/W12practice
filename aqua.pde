/* @pjs preload="0.png,1.png,2.png,3.png,bgImage.png,btn_0.png,btn_1.png,net.png,turtle.png"; */


final int GAME_RUN = 0;
final int GAME_WIN = 1;
final int GAME_LOSE = 2;

int gameState = 0;

// background, control button
PImage bgImg ;
PFont myFont;

Net net;
Timer timer;

// variables for the fish
PImage img ;
float w, h, x, y, xSpeed, ySpeed ;

Fish fish1, fish2;

void setup() {
  size(800, 600) ;

  // loading bg, control button
  bgImg = loadImage("img/bgImage.png") ;
  myFont = createFont("Arial", 48); 
  
  // create a fish
  fish1 = new Fish();
  fish1.makeFish();
  fish2 = new Fish();
  fish2.makeFish();
  
  net = new Net();
  timer = new Timer(15);
}


void draw() {
  
  switch(gameState) {
    case GAME_RUN:
    // show the bg, control button
    image(bgImg, 0, 0, width, height) ;
  
    // move the fish
    fish1.swim(); 
    fish2.swim();
    // display the fish
    fish1.display();
    fish2.display();
    
    
    net.move();
    net.display();
    
    timer.update();
    timer.displayUI();
    if(timer.isTimeUp()) gameState = GAME_LOSE;
    break;
    
    case GAME_WIN:
    image(bgImg, 0, 0, width, height) ;
    drawText("You win!", #8BFFDB);
    break;
    
    case GAME_LOSE:
    drawText("GAME OVER", #ff0000);
    break;
  }
}


void drawText(String s, color textColor){
  textFont(myFont);
  textAlign(CENTER, CENTER);
  // shadow
  fill(0, 120);
  text(s, width / 2 + 3, height / 2 + 3);
  // text
  fill(textColor);
  text(s, width / 2, height / 2);
}

void mouseClicked() {
  net.drop(mouseX);
}
