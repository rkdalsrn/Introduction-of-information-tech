Stage mystage;

PImage img0;

int stage;
float rot = 0;
int secNow;
int minNow;
boolean first;

int secondnow;
int minutenow;

int score = 0;
int goal = 10;

int mingux = -999;
int minguy = -999;
int[] savemingux = new int[goal];
int[] saveminguy = new int[goal];
int size = 0;

float mingu = 30;
int minguX = 100;
int minguY = 50;

boolean firstEvent = false;

boolean firstgame = true;

void setup() {
  size(800, 450);
  mystage = new Stage();
  background(255);
  img0 = loadImage("info.png");
}

void draw() {
  background(255);

  switch(stage) {
  case 0: 
    background(255);
    mingux = -999;
    minguy = -999;
    size = 0;
    mingu = 30;
    minguX = 100;
    minguY = 50;
    firstEvent = false;
    firstgame = true;
    first = true;
    for (int i = 0; i < goal; i++) {
      savemingux[i] = -999;
      saveminguy[i] = -999;
    }

    int widthRect = 290;
    int heightRect = 80;
    int x1 = (width-widthRect)/2;
    int y1 = (height-heightRect)/2;
    int x2 = (width+widthRect)/2;
    int y2 = (height+heightRect)/2;
    boolean startButton1 = buttonUI1(x1, y1, x2, y2, 255, 0, 0);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("GameStart!", x1/2+x2/2, y1/2+y2/2+15);
    int x11 = (width-90)/2;
    int y11 = (height + heightRect + 10)/2;
    int x21 = (width+90)/2;
    int y21 = (height + heightRect + 100)/2;
    boolean helpButton = buttonUI(x11, y11, x21, y21, 255, 0, 0);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("?", x11/2+x21/2, y11/2+y21/2+20);
    if (startButton1 && !helpButton)  stage = 1;
    else if(!startButton1 && helpButton)  stage = 5;
    else stage = 0;
    //if (helpButton)  stage = 5;
    //else stage = 0;
    break;
  case 1: 
    //stage1
    //if (first == true) {
    //  secNow = second();
    //  minNow = minute();
    //  first = false;
    //}
    //int lefttime = (second() + minute()*60 - secNow - minNow*60);
    //if (lefttime > 1) {
    //  stage = 4;
    //}
    //pushMatrix();
    //noCursor();
    //translate(width/2, height/2);
    //rotate(rot);
    //makeCircle(0, 0);
    //popMatrix();
    //rot += PI/60;
    mystage.case1();
    break;
  case 2:
    //stage2
    //background(255);
    //if (firstgame) {
    //  secondnow = second();
    //  minutenow = minute();
    //}
    //firstgame = false;
    //int time = minute()*60 + second() - minutenow * 60 - secondnow;
    //restartButtonUI();
    //if (second()%2 == 0 && frameCount%20 == 1) {
    //  mingux=int(random(100, width-100));
    //  minguy=int(random(100, height-50));
    //  size = int(random(10, 30));
    //}
    //drawchar(mingux, minguy, 0);
    //if ((mouseX-mingux)*(mouseX-mingux) + (mouseY-minguy)*(mouseY-minguy) < size*size) {
    //  if (mousePressed) {
    //    savemingux[score] = mingux;
    //    saveminguy[score] = minguy;
    //    mingux=int(random(0, width));
    //    minguy=int(random(0, height));
    //    size = int(random(10, 30));
    //    score++;
    //  }
    //}
    //for (int i = 0; i < goal; i++) {
    //  drawchar(savemingux[i], saveminguy[i], 255);
    //}
    //fill(0);
    //textSize(30);
    //textAlign(CENTER);
    //text("Score:" + score + " //  Time:" + time, width/2, 30);
    //finished();
    //if (time > 20)  stage = 6;
    mystage.case2();
    break;
  case 3:
    //stage3
    //fill(0);
    //textSize(30);
    //textAlign(CENTER);
    //text("congratulation!!", width/2, height/2);
    //restartButtonUI();
    mystage.case3();
    break;
  case 4:
    //stage4
    //background(0);
    //fill(0, 0, 0, 0);
    //stroke(255);
    //strokeWeight(4);
    //ellipse(minguX, minguY, mingu, mingu);
    //line(minguX-mingu/2, minguY, minguX+mingu/2, minguY);
    //line(minguX, minguY-mingu/2, minguX, minguY+mingu/2);
    //if (minguX > 550) {
    //  stage = 2;
    //}
    //mingu = mingu + 1;   
    //minguX += 2;  
    //minguY += 1;
    //if (mingu < 20)  stage = 2;
    mystage.case4();
    break;
  case 5:
    //stage5
    //background(255);
    //img0.resize(600, 320);
    //image(img0, 100, 20);
    //int widthRect1 = 290;
    //int heightRect1 = 80;
    //int x12 = (width-widthRect1)/2;
    //int y12 = (height-heightRect1 + 320)/2;
    //int x22 = (width+widthRect1)/2;
    //int y22 = (height+heightRect1+320)/2;
    //boolean startButton1 = buttonUI(x12, y12, x22, y22, 255, 0, 0);
    //fill(255);
    //textSize(50);
    //textAlign(CENTER);
    //text("GameStart!", x12/2+x22/2, y12/2+y22/2+15);
    //if (startButton1)  stage = 1;
    //else stage = 5;
    mystage.case5();
    break;
  case 6:
    //stage6
    //background(255);
    //fill(0);
    //textSize(30);
    //textAlign(CENTER);
    //text("Failed!!", width/2, height/2);
    //restartButtonUI();
    mystage.case6();
    break;
  default:
    break;
  }
  fill(0, 0, 0, 0);
  stroke(0);
  strokeWeight(4);
  ellipse(mouseX, mouseY, 30, 30);
  line(mouseX-15, mouseY, mouseX+15, mouseY);
  line(mouseX, mouseY-15, mouseX, mouseY+15);
}

boolean buttonUI1(int x1, int y1, int x2, int y2, int redval, int greenval, int blueval) {
  rectMode(CORNERS);
  stroke(0);
  strokeWeight(1);
  fill(redval, greenval, blueval, 150);
  rect(x1, y1, x2, y2);
  if ((mouseX > x1) && (mouseX < x2) && (mouseY > y1) && (mouseY < y2)) {
    fill(redval, greenval, blueval);
    rect(x1, y1, x2, y2);
    if (mousePressed)  return true;
  }
  return false;
}
