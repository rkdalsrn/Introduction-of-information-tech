class RandomPop {
  //PImage img;
  //Capture cam;
  //int colorNum;
  color[] vividDotColors
    = {#00AAEE, #D91D81, #FF4075, #3EA731, #66699D, #9F00FF};

  color[] vividBackColors
    = {#FFE302, #FFDCA0, #FFBA52, #FEE303, #FFFF02, #FDFD96};

  color[] pastelDotColors
    = {#619196, #8B5353, #F39402 , #53B080, #E46C6D, #6F97A8};
  
  color[] pastelBackColors
    = {#DDEFEF, #DCD3FF, #F2F2F2, #F3FFE3, #FBE4FF, #C6A376};

  //RandomPop(PImage img_) {
  //  img = img_;
  //  colorNum=0;
  //  //colorNum = (int)random(0, 10);
  //}

  RandomPop() {
  }

  //RandomPop(Capture cam_) {
  //  img = cam_;
  //  colorNum=0;
  //  //colorNum = (int)random(0, 10);
  //}

  void vividPop(PImage img, int colorNum) {
    fill(vividBackColors[colorNum]);
    rect(0, 0, img.width, img.height);
    for (int x=0; x<img.width; x+=4) {
      for (int y=0; y<img.height; y+=4) {
        color c = img.pixels[y*img.width+x];
        float br = brightness(c);
        float r = red(c);
        float g = green(c);
        float b = blue(c);
        float pixelsize = 6-(br/40)+(r/100-g/255-b/255);
        if (pixelsize<=1) pixelsize=1;
        if (pixelsize>=6) pixelsize=6;
        fill(vividDotColors[colorNum]);
        ellipse(x+3, y+3, pixelsize, pixelsize);
      }
    }
  }


  void monoPop(PImage img, int colorNum) {
    fill(pastelBackColors[colorNum]);
    rect(0, 0, img.width, img.height);
    for (int x=0; x<img.width; x+=4) {
      for (int y=0; y<img.height; y+=4) {
        color c = img.pixels[y*img.width+x];
        float br = brightness(c);
        float r = red(c);
        float g = green(c);
        float b = blue(c);
        float pixelsize = 6-(br/40)+(r/100-g/255-b/255);
        if (pixelsize<=1) pixelsize=1;
        if (pixelsize>=6) pixelsize=6;
        float gray = 0.2999*r + 0.587*g + 0.114*b;
        fill(gray, gray, gray);
        ellipse(x+3, y+3, pixelsize, pixelsize);
      }
    }
  }

  void pastelPop(PImage img, int colorNum) {
    fill(pastelBackColors[colorNum]);
    rect(0, 0, img.width, img.height);
    for (int x=0; x<img.width; x+=4) {
      for (int y=0; y<img.height; y+=4) {
        color c = img.pixels[y*img.width+x];
        float br = brightness(c);
        float r = red(c);
        float g = green(c);
        float b = blue(c);
        float pixelsize = 6-(br/40)+(r/100-g/255-b/255);
        if (pixelsize<=1) pixelsize=1;
        if (pixelsize>=6) pixelsize=6;
        fill(pastelDotColors[colorNum]);
        ellipse(x+3, y+3, pixelsize, pixelsize);
      }
    }
  }
}
