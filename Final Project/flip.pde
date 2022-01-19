PImage flip(PImage cam){
  PImage buffer1 = new PImage(cam.width, cam.height);
  PImage buffer = new PImage(cam.width, cam.height);
  for(int i=0; i<cam.pixels.length; i++){
     buffer1.pixels[i] = cam.pixels[i]; 
  }
  for(int x=0; x<cam.width; x++){
    for(int y=0; y<cam.height; y++){
      buffer.pixels[y*cam.width+x] = buffer1.pixels[y*cam.width+(cam.width-x-1)];
    }
  }
  return buffer;
}
