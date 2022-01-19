import ddf.minim.*;
Minim minim;
AudioPlayer nostalgia;
AudioPlayer daily;
AudioPlayer jazz;
AudioPlayer shutter;
AudioPlayer pong;
import processing.video.*;
Image [] mainImage;

// RandomPop
RandomPop[] random_pops = new RandomPop[6];

Capture cam;
Timer timer1;
Timer timer2;
Timer timer3;
int stage = 0;
int num1 = 0;
int num2 = 0; 
int num3 = 0;
int frame = 1;
int mingu = 0;
int case4timer = 3;
int case5timer = 3;
int case6timer = 10;
int casenum = 0;
int precasenum = 0;
int prex = 0;
int xmove = int(650*0.6);
int ymove = int(400*0.6);
int i = 0; // for taking picture
int j = 0; // for drawing picture in stage6
int tryNummain = 0;
int tryNum = 0;
int numtry = 0;
String inputString; //for e-mail address
PFont nanumGothic;
PFont theme;
PFont bold;
PImage start;
PImage camImage;
PImage how;
PImage choose;
PImage home;
PImage title;
PImage [] img; //저장된 RAW 이미지
PImage camera;
PImage popfie;
PImage selectpop;
PImage vividimg;
PImage pastelimg;
PImage monoimg;
PImage redback;
PImage blueback;
PImage yellowback;
PImage loading;
PImage selectfav;
PImage sendmail;
PImage letter;
PImage reset;
PImage send;
PImage help;
PImage [] eyes;
PImage [] sending;
PImage click2start;
PImage clickhome;
PImage clicksend;
PImage overfav;
PImage overno;
PImage overok;
PImage overpop;
PImage oversend;
PImage popinstruction;
PImage premain;
PImage howto;
PImage caution;

// filter booleans 
boolean vivid = false;
boolean pastel = false;
boolean mono = false;
boolean popinstructionOkay = false;

boolean firstTime;
boolean successSending;

void setup() {
  size(1920, 960);
  timer1 = new Timer(3000);
  timer2 = new Timer(1000);
  timer3 = new Timer(500);
  cam = new Capture(this, 640, 480, 30);
  cam.start();
  start = loadImage("start.png");
  how = loadImage("how.png");
  choose = loadImage("choose.png");

  theme = loadFont("ComicSansMS-Bold-48.vlw");
  bold = loadFont("Calibri-Bold-48.vlw");
  nanumGothic = createFont("NanumGothic", 48);

  home = loadImage("home.png");
  title = loadImage("title.png");
  camera = loadImage("camera.png");
  popfie = loadImage("popfie.png");
  selectpop = loadImage("selectpop.png");
  vividimg = loadImage("vivid.png");
  pastelimg = loadImage("pastel.png");
  monoimg = loadImage("mono.png");
  redback = loadImage("redback.png");
  blueback = loadImage("blueback.png");
  yellowback = loadImage("yellowback.png");
  loading = loadImage("loading.png");
  selectfav = loadImage("selectfav.png");
  sendmail = loadImage("sendmail.png");
  letter = loadImage("letter.png");
  reset = loadImage("reset.png");
  send = loadImage("send.png");
  eyes = new PImage [4]; 
  sending = new PImage [2]; 
  help = loadImage("help.png");
  click2start = loadImage("click2start.png");
  clickhome = loadImage("clickhome.png");
  clicksend = loadImage("clicksend.png");
  overfav = loadImage("overfav.png");
  overno = loadImage("overno.png");
  overok = loadImage("overok.png");
  overpop = loadImage("overpop.png");
  oversend = loadImage("oversend.png");
  popinstruction = loadImage("popinstruction.png");
  premain = loadImage("premain.png");
  howto = loadImage("howto.png");
  caution = loadImage("caution.png");
  for (int i = 1; i < 5; i++) {
    eyes[i-1] = loadImage("eye" + i + ".png");
  }
  for (int i = 0; i < 2; i++) {
    sending[i] = loadImage("sending" + i + ".png");
  }

  minim = new Minim(this);
  nostalgia = minim.loadFile("nostalgia.mp3");
  daily = minim.loadFile("daily.mp3");
  jazz = minim.loadFile("jazz.mp3");
  shutter = minim.loadFile("shutter.mp3");
  pong = minim.loadFile("pong.mp3");
  img = new PImage [1000];
  mainImage = new Image [24];
  inputString = "";
  firstTime = true;
  successSending = false;
  for (int n=0; n<random_pops.length; n++) {
    random_pops[n] = new RandomPop();
    //  colorNums[n] = n;
  }
}

void draw() {
  switch(stage) {
  case 0: //메인화면
    imageMode(CORNER);
    if (firstTime) {
      image(premain, 0, 0);
      if (tryNummain>0) {
        if (tryNummain > 24) {
          for (int m = 0; m<24; m++) {
            mainImage[m].display();
          }
        } else {
          for (int m = 0; m<tryNummain; m++) {
            mainImage[m].display();
          }
        }
      }
      image(popfie, 720, 343);
      image(click2start, 851, 857);
      firstTime = false;
    }
    break;
  case 1: //게임 방법
    if (firstTime) {
      imageMode(CORNER);
      image(howto, 0, 0);
      firstTime = false;
    }
    break;

  case 2: //필터 선택
    background(43);
    imageMode(CORNER);
    image(selectpop, 685, 93);
    image(vividimg, 141, 271);
    image(pastelimg, 720, 271);
    image(monoimg, 1299, 271);
    int x = 0;
    if ((mouseX>=141) && (mouseX<=620) && (mouseY>=271) && (mouseY<=816))  x = 141 - 46;
    if ((mouseX>=720) && (mouseX<=1199) && (mouseY>=271) && (mouseY<=816))  x = 720 - 46;
    if ((mouseX>=1299) && (mouseX<=1778) && (mouseY>=271) && (mouseY<=816))  x = 1299 - 46;
    if (prex != x) {
      pong.pause();
      pong.rewind();
      pong.play();
    }
    prex = x;
    if (x != 0)  image(overpop, x, 224);
    break;

  case 3: //사진 촬영
    if (firstTime) {
      imageMode(CORNER);
      image(redback, 0, 0);
      firstTime = false;
    }
    noStroke();
    rectMode(CORNER);
    if (mono==true) {
      jazz.play();
      fill(200);
      rect(0, 0, width/3, height/2);
      fill(110);
      rect(width/3, 0, width/3, height/2);
      fill(237);
      rect(width*2/3, 0, width/3, height/2);
      fill(80);
      rect(0, height/2, width/3, height/2);
      fill(180);
      rect(width/3, height/2, width/3, height/2);
      fill(140);
      rect(width*2/3, height/2, width/3, height/2);
    } else if (vivid==true) {
      nostalgia.play();
      fill(#FFEE31);
      rect(0, 0, width/3, height/2);
      fill(#FF9C31);
      rect(width/3, 0, width/3, height/2);
      fill(#02A503);
      rect(width*2/3, 0, width/3, height/2);
      fill(#40A7EA);
      rect(0, height/2, width/3, height/2);
      fill(#A948FF);
      rect(width/3, height/2, width/3, height/2);
      fill(#FF4A40);
      rect(width*2/3, height/2, width/3, height/2);
    } else if (pastel==true) {
      daily.play();
      fill(#FFC9DE);
      rect(0, 0, width/3, height/2);
      fill(#ACE7FF);
      rect(width/3, 0, width/3, height/2);
      fill(#B5B9FF);
      rect(width*2/3, 0, width/3, height/2);
      fill(#FFABAB);
      rect(0, height/2, width/3, height/2);
      fill(#FFF4C6);
      rect(width/3, height/2, width/3, height/2);
      fill(#8FFCC6);
      rect(width*2/3, height/2, width/3, height/2);
    }
    if (cam.available()) cam.read();
    camImage = flip(cam);
    imageMode(CORNER);
    image(camImage, width*num3/3, height*num2/2);
    image(camera, width*num3/3, height*num2/2);
    if (timer1.isFinished()) {
      shutter.rewind();
      shutter.play();
      img[i] = cam.get(0, 0, 640, 480);
      img[i] = flip(img[i]);
      //img.save("images/image"+frame+".png");
      //frame ++;
      i++;
      if (num1 < 2) {
        num1 ++;
        num3 = num1;
        timer1.startTimer();
        firstTime = true;
      } else if (num1 >= 2 && num1 < 5) {
        num1 ++;
        num2 = 1;
        num3 = num1 - 3;
        timer1.startTimer();
        firstTime = true;
      } else if (num1 == 5) {
        stage = 4;
        firstTime = true;
        jazz.pause();
        jazz.rewind();
        nostalgia.pause();
        nostalgia.rewind();
        daily.pause();
        daily.rewind();
      }
    }
    fill(#FF5F5F, 255-(millis()-timer2.savedTime)/5);
    ellipse(519 + width*num3/3, 39+height*num2/2, 17, 17);
    if (timer2.isFinished()) {
      timer2.startTimer();
    }
    fill(255, 255, 255, 200);
    textFont(nanumGothic, 100);
    textAlign(CENTER);
    text((4000-(millis()-timer1.savedTime))/1000, 320 + width*num3/3, 260 +height*num2/2);
    imageMode(CORNER);
    image(home, 1795, 835);
    break;

  case 4: //로딩화면
    if (firstTime) {
      image(blueback, 0, 0);
      image(eyes[mingu], 900, 385);
      image(loading, 842, 526);
      mingu++;
      firstTime = false;
    }
    if (frameCount%30 == 0) {
      case4timer = case4timer-1;
      image(eyes[mingu], 900, 385);
      if (mingu >= 3)  mingu = 0;
      else  mingu++;
      if (case4timer < 0) {
        firstTime = true;
        mingu = 0;
        stage = 5;
      }
    }
    break;

  case 5://사진변환
    if (firstTime) {
      background(255);
      imageMode(CORNER);
      for (int n=0; n<6; n++) {
        pushMatrix();
        if (vivid) {
          if (n<3) translate(n*width/3, 0);
          else translate((n-3)*width/3, height/2);
          //random_pops[n].roundPop(img[n], colorNums[n]);
          random_pops[n].vividPop(img[j+n], n);
          //image(img[n], 0, 0);
          popMatrix();
        } else if (pastel) {
          if (n<3) translate(n*width/3, 0);
          else translate((n-3)*width/3, height/2);
          random_pops[n].pastelPop(img[j+n], n);
          //image(img[n], 0, 0);
          popMatrix();
        } else if (mono) {
          if (n<3) translate(n*width/3, 0);
          else translate((n-3)*width/3, height/2);
          //random_pops[n].roundPop(img[n], colorNums[n]);
          random_pops[n].monoPop(img[j+n], n);
          //image(img[n], 0, 0);
          popMatrix();
        }
      }
      firstTime = false;
    }
    if (frameCount%30 == 0) {
      case5timer = case5timer-1;
      if (case5timer < 0) {
        saveFrame("popfie" + tryNum + ".png");
        PImage mingu1 = loadImage("popfie" + tryNum + ".png");
        img[j] = mingu1.get(0, 0, 640, 480);
        img[j+1] = mingu1.get(640, 0, 640, 480);
        img[j+2] = mingu1.get(1280, 0, 640, 480);
        img[j+3] = mingu1.get(0, 480, 640, 480);
        img[j+4] = mingu1.get(640, 480, 640, 480);
        img[j+5] = mingu1.get(1280, 480, 640, 480);
        firstTime = true;
        stage = 6;
      }
    }
    break;

  case 6: //메인 사진 선택
    image(yellowback, 0, 0);
    image(selectfav, 684, 117);
    image(home, 1795, 835);
    imageMode(CORNER);
    PImage mingu = loadImage("popfie" + tryNum + ".png");
    mingu.resize(int(width*0.6), int(height*0.6));
    image(mingu, xmove, ymove);
    //image(img[j], 0+xmove, 0+ymove);
    //image(img[j+1], width/3+xmove, 0+ymove);
    //image(img[j+2], width*2/3+xmove, 0+ymove);
    //image(img[j+3], 0+xmove, height/2+ymove);
    //image(img[j+4], width/3+xmove, height/2+ymove);
    //image(img[j+5], width*2/3+xmove, height/2+ymove);
    if ((mouseX>=xmove) && (mouseX<xmove+width/3*0.6) && (mouseY>=ymove) && (mouseY<ymove+height/2*0.6) ) {
      image(overfav, xmove-37, ymove-37, 460, 365);
      casenum = 1;
    }
    if ((mouseX>=xmove+width/3*0.6) && (mouseX<xmove+width*2/3*0.6) && (mouseY>=ymove) && (mouseY<ymove+height/2*0.6) ) {
      image(overfav, xmove+width/3*0.6-37, ymove-37, 460, 365);
      casenum = 2;
    }
    if ((mouseX>=xmove+width*2/3*0.6) && (mouseX<xmove+width*0.6) && (mouseY>=ymove) && (mouseY<ymove+height/2*0.6) ) {
      image(overfav, xmove+width*2/3*0.6-37, ymove-37, 460, 365);
      casenum = 3;
    }
    if ((mouseX>=xmove) && (mouseX<xmove+width/3*0.6) && (mouseY>=ymove+height/2*0.6) && (mouseY<ymove+height*0.6) ) {
      image(overfav, xmove-37, ymove+height/2*0.6-37, 460, 365);
      casenum = 4;
    }
    if ((mouseX>=xmove+width/3*0.6) && (mouseX<xmove+width*2/3*0.6) && (mouseY>=ymove+height/2*0.6) && (mouseY<ymove+height*0.6) ) {
      image(overfav, xmove+width/3*0.6-37, ymove+height/2*0.6-37, 460, 365);
      casenum = 5;
    }
    if ((mouseX>=xmove+width*2/3*0.6) && (mouseX<xmove+width*0.6)  && (mouseY>=ymove+height/2*0.6) && (mouseY<ymove+height*0.6) ) {
      image(overfav, xmove+width*2/3*0.6-37, ymove+height/2*0.6-37, 460, 365);
      casenum = 6;
    }
    if (precasenum != casenum) {
      pong.pause();
      pong.rewind();
      pong.play();
    }
    precasenum = casenum;
    break;
  case 7: //popinstruction 
    image(popinstruction, 0, 0);
    image(img[numtry + j], 733, 244, 450, 335);
    //mainImage[tryNum].displaywithokay();
    if (mouseX>=692 && mouseX<=692+87 && mouseY>=841 && mouseY<=841+30) {
      image(overok, 675, 824);
    } else if (mouseX>=1129 && mouseX<=1129+110 && mouseY>=841 && mouseY<=841+30) {
      image(overno, 1112, 824);
    }
    break;
  case 8: // sending mail
    background(43);
    image(sendmail, 654, 123);
    image(letter, 440, 244);
    //image(reset, 1290, 251);
    if (mouseX>1370 && mouseX<1440 && mouseY>253 && mouseY<323) {
      image(oversend, 1370, 253);
    } else  image(send, 1370, 253);
    image(home, 1795, 835);

    scale(0.5);
    PImage mingu2 = loadImage("popfie" + tryNum + ".png");
    image(mingu2, 0 + 960, 0 + 670);
    //image(img[j], 0 + 960, 0 + 670);
    //image(img[j+1], width/3 + 960, 0 + 670);
    //image(img[j+2], width*2/3 + 960, 0 + 670);
    //image(img[j+3], 0 + 960, height/2 + 670);
    //image(img[j+4], width/3 + 960, height/2 + 670);
    //image(img[j+5], width*2/3 + 960, height/2 + 670);
    scale(2);

    fill(0);
    textFont(nanumGothic, 56);
    textSize(30);
    textAlign(CORNER);
    text(inputString, 550, 295);
    if (inputString.length() == 0) {
      if (frameCount%20<10)  text("|", 550, 295);
      else text("", 550, 295);
    }
    break;
  case 9:
    image(sending[0], 0, 0);
    image(caution, 606, 770);
    if (timer3.isFinished()) {
      if (firstTime) {
        sendMail(inputString, "popfie" + tryNum +".png");
        firstTime = false;
      }
    }
    if (successSending) {
      firstTime = true;
      ++tryNum;
      j = j+6;
      if (popinstructionOkay) {
        ++tryNummain;
      }
      gohome();
    }
    break;
  }
}

void mousePressed() {
  switch(stage) {
  case 0:
    firstTime = true;
    stage ++;
    break;
  case 1:
    firstTime = true;
    stage ++;
    break;
  case 2:
    if ((mouseX>=141) && (mouseX<=620) && (mouseY>=271) && (mouseY<=816)) {
      firstTime = true;
      vivid = true;
      stage = 3;
      timer1.startTimer();
      timer2.startTimer();
    }
    if ((mouseX>=720) && (mouseX<=1199) && (mouseY>=271) && (mouseY<=816)) {
      firstTime = true;
      pastel = true;
      stage = 3;
      timer1.startTimer();
      timer2.startTimer();
    }
    if ((mouseX>=1299) && (mouseX<=1778) && (mouseY>=271) && (mouseY<=816)) {
      firstTime = true;
      mono = true;
      stage = 3;
      timer1.startTimer();
      timer2.startTimer();
    }
    break;
  case 3:
    if ((mouseX>=1795) && (mouseX<=1893) && (mouseY>=835) && (mouseY<=933)) {
      image(clickhome, 1795, 835);
      jazz.pause();
      jazz.rewind();
      daily.pause();
      daily.rewind();
      nostalgia.pause();
      nostalgia.rewind();
      gohome();
      i = i - i%6;
      /*stage = 0;
       music.pause();
       music.rewind();
       case4timer = 3;
       case5timer = 3;
       case6timer = 10;
       num1 = 0;
       num2 = 0;
       num3 = 0;*/
    }
    break;
  case 6:
    if ((mouseX>=1795) && (mouseX<=1893) && (mouseY>=835) && (mouseY<=933)) {
      image(clickhome, 1795, 835);
      i = i - 6;
      gohome();
    }
    if ((mouseX>=xmove) && (mouseX<xmove+width/3*0.6) && (mouseY>=ymove) && (mouseY<ymove+height/2*0.6) ) {
      firstTime = true;
      stage = 7;
      //mainImage[tryNum] = new Image(tryNum*6, tryNum);
      img[tryNum*6].save("images/image"+0+".png");
      img[tryNum*6] = loadImage ("images/image"+0+".png");
      numtry = 0;
    }
    if ((mouseX>=xmove+width/3*0.6) && (mouseX<xmove+width*2/3*0.6) && (mouseY>=ymove) && (mouseY<ymove+height/2*0.6) ) {
      firstTime = true;
      stage = 7;
      //mainImage[tryNum] = new Image(tryNum*6+1, tryNum);
      img[tryNum*6+1].save("images/image"+1+".png");
      img[tryNum*6+1] = loadImage ("images/image"+1+".png");
      numtry = 1;
    }
    if ((mouseX>=xmove+width*2/3*0.6) && (mouseX<xmove+width*0.6) && (mouseY>=ymove) && (mouseY<ymove+height/2*0.6) ) {
      firstTime = true;
      stage = 7;
      //mainImage[tryNum] = new Image(tryNum*6+2, tryNum);
      img[tryNum*6+2].save("images/image"+2+".png");
      img[tryNum*6+2] = loadImage ("images/image"+2+".png");
      numtry = 2;
    }
    if ((mouseX>=xmove) && (mouseX<xmove+width/3*0.6) && (mouseY>=ymove+height/2*0.6) && (mouseY<ymove+height*0.6) ) {
      firstTime = true;
      stage = 7;
      //mainImage[tryNum] = new Image(tryNum*6+3, tryNum);
      img[tryNum*6+3].save("images/image"+3+".png");
      img[tryNum*6+3] = loadImage ("images/image"+3+".png");
      numtry = 3;
    }
    if ((mouseX>=xmove+width/3*0.6) && (mouseX<xmove+width*2/3*0.6) && (mouseY>=ymove+height/2*0.6) && (mouseY<ymove+height*0.6) ) {
      firstTime = true;
      stage = 7;
      //mainImage[tryNum] = new Image(tryNum*6+4, tryNum);
      img[tryNum*6+4].save("images/image"+4+".png");
      img[tryNum*6+4] = loadImage ("images/image"+4+".png");
      numtry = 4;
    }
    if ((mouseX>=xmove+width*2/3*0.6) && (mouseX<xmove+width*0.6)  && (mouseY>=ymove+height/2*0.6) && (mouseY<ymove+height*0.6) ) {
      firstTime = true;
      stage = 7;
      //mainImage[tryNum] = new Image(tryNum*6+5, tryNum);
      img[5].save("images/image"+5+".png");
      img[5] = loadImage ("images/image"+5+".png");
      numtry = 5;
    }
    break;
  case 7:  //popinstruction
    if (mouseX>=692 && mouseX<=692+87 && mouseY>=841 && mouseY<=841+30) {
      popinstructionOkay = true;
      if (tryNummain >= 24) {
        for (int i = 0; i < 23; i++) {
          mainImage[i] = new Image(mainImage[i+1].k, i);
        }
        mainImage[23] = new Image(numtry + j, 23);
      } else  mainImage[tryNummain] = new Image(numtry + j, tryNummain);
      stage = 8;
    } else if (mouseX>=1129 && mouseX<=1129+110 && mouseY>=841 && mouseY<=841+30) {
      popinstructionOkay = false;
      stage = 8;
    }
    break;
  case 8:
    //if (mouseX>1290 && mouseX<1364 && mouseY>251 && mouseY<325) {
    //  firstTime = true;
    //  inputString = "";
    //}
    if (mouseX>1370 && mouseX<1440 && mouseY>253 && mouseY<323) {
      image(clicksend, 1370, 253);
      firstTime = true;
      stage = 9;
      timer3.startTimer();
    }
    if ((mouseX>=1795) && (mouseX<=1893) && (mouseY>=835) && (mouseY<=933)) {
      firstTime = true;
      image(clickhome, 1795, 835);
      ++tryNum;
      j = j+6;
      if (popinstructionOkay) {
        ++tryNummain;
      }
      gohome();
    }
    break;
  }
}

void keyTyped() {
  if (key == BACKSPACE)  inputString= inputString.substring(0, max(0, inputString.length()-1));
  else  inputString += str(key);
  firstTime = true;
}

void gohome() {
  stage = 0;
  num1 = 0;
  num2 = 0;
  num3 = 0;
  frame = 1;
  case4timer = 3;
  case5timer = 3;
  case6timer = 10;
  inputString = "";
  firstTime = true;

  casenum = 0;
  precasenum = 0;
  prex = 0;

  successSending = false;
  vivid = false;
  pastel = false;
  mono = false;
}
