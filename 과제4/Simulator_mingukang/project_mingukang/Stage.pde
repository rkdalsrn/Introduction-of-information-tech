class Stage {
  Stage() {
    first = true;
    for (int i = 0; i < goal; i++) {
      savemingux[i] = -999;
      saveminguy[i] = -999;
    }
  }
  
  void case1(){
    if (first == true) {
      secNow = second();
      minNow = minute();
      first = false;
    }
    int lefttime = (second() + minute()*60 - secNow - minNow*60);
    if (lefttime > 1) {
      stage = 4;
    }
    pushMatrix();
    noCursor();
    translate(width/2, height/2);
    rotate(rot);
    makeCircle(0, 0);
    popMatrix();
    rot += PI/60;
  }
  
  void case2(){
    background(255);
    if (firstgame) {
      secondnow = second();
      minutenow = minute();
    }
    firstgame = false;
    int time = minute()*60 + second() - minutenow * 60 - secondnow;
    restartButtonUI();
    if (second()%2 == 0 && frameCount%20 == 1) {
      mingux=int(random(100, width-100));
      minguy=int(random(100, height-50));
      size = int(random(10, 30));
    }
    drawchar(mingux, minguy, 0);
    if ((mouseX-mingux)*(mouseX-mingux) + (mouseY-minguy)*(mouseY-minguy) < size*size) {
      if (mousePressed) {
        savemingux[score] = mingux;
        saveminguy[score] = minguy;
        mingux=int(random(0, width));
        minguy=int(random(0, height));
        size = int(random(10, 30));
        score++;
      }
    }
    for (int i = 0; i < goal; i++) {
      drawchar(savemingux[i], saveminguy[i], 255);
    }
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("Score:" + score + " //  Time:" + time, width/2, 30);
    finished();
    if (time > 20)  stage = 6;
  }
  
  void case3(){
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("congratulation!!", width/2, height/2);
    restartButtonUI();
  }
  
  void case4(){
    background(0);
    fill(0, 0, 0, 0);
    stroke(255);
    strokeWeight(4);
    ellipse(minguX, minguY, mingu, mingu);
    line(minguX-mingu/2, minguY, minguX+mingu/2, minguY);
    line(minguX, minguY-mingu/2, minguX, minguY+mingu/2);
    if (minguX > 550) {
      stage = 2;
    }
    mingu = mingu + 1;   
    minguX += 2;  
    minguY += 1;
    if (mingu < 20)  stage = 2;
  }
  
  void case5(){
    background(255);
    img0.resize(600, 320);
    image(img0, 100, 20);
    int widthRect1 = 290;
    int heightRect1 = 80;
    int x12 = (width-widthRect1)/2;
    int y12 = (height-heightRect1 + 320)/2;
    int x22 = (width+widthRect1)/2;
    int y22 = (height+heightRect1+320)/2;
    boolean startButton1 = buttonUI(x12, y12, x22, y22, 255, 0, 0);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("GameStart!", x12/2+x22/2, y12/2+y22/2+15);
    if (startButton1)  stage = 1;
    else stage = 5;
  }
  
  void case6(){
    background(255);
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("Failed!!", width/2, height/2);
    restartButtonUI();
  }
}

void restartButtonUI() {
  boolean restartButton = buttonUI(700, 0, 800, 40, 100, 200, 200);
  if (restartButton) {
    first = true;
    stage = 0;
  }
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text("Restart!", width-45, 25);
}

boolean buttonUI(int x1, int y1, int x2, int y2, int redval, int greenval, int blueval) {
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

void makeCircle(int x, int y) {
  strokeWeight(8);
  for (int i = 0; i < 360; i++) {
    stroke(sin(PI/180*i)*255, cos(PI/180*i)*255, tan(PI/180*i)*255);
    point(15*sin(PI/180*i), 15*cos(PI/180*i));
  }
}

void drawchar(int x, int y, int col) {
  pushMatrix();
  translate(x, y);
  scale(0.5);
  stroke(0);
  fill(col, 100, 100);
  ellipse(0, 0, 50, 50);
  fill(0);
  ellipse(-15, -10, 15, 25);
  fill(0);
  ellipse(15, -10, 15, 25);
  line(0, -25, -10, -35);
  line(0, -25, 10, -35);
  popMatrix();
}

void finished() {
  if (score >= goal)  stage = 3;
}
