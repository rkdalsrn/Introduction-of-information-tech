class Image {
  int k;
  int l;
  
  Image(int _k, int _l) {
    k = _k;
    l = _l;
  }
  void display() {
    imageMode(CORNER);
    image(img[k], 0,height/4*l,width/6, height/4);
    if(l>3 && l<=7) {
    imageMode(CORNER);
    image(img[k], width/6,height/4*(l-4),width/6, height/4);
    } else if (l>7 && l<=11) {
    imageMode(CORNER);
    image(img[k], width/6*2,height/4*(l-8),width/6, height/4);
    } else if (l>11 && l<=15) {
    imageMode(CORNER);
    image(img[k], width/6*3,height/4*(l-12),width/6, height/4);
    } else if (l>15 && l<=19) {
    imageMode(CORNER);
    image(img[k], width/6*4,height/4*(l-16),width/6, height/4);
    } else if (l>19 && l<=23) {
    imageMode(CORNER);
    image(img[k], width/6*5,height/4*(l-20),width/6, height/4);
    }
  }
  void displaywithokay(){
    imageMode(CORNER);
    image(img[k], 733, 244, 450, 335);
  }
}
