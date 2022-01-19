void setup() { 
  size(1000, 600);
}  
void draw() {
  noStroke();
  fill(0);
  triangle(0,0,0,80,200,0);
  
  fill(236, 230, 204);
  beginShape();
  vertex(200,0);
  vertex(0,80);
  vertex(0,600);
  vertex(1000,600);
  vertex(1000,0);
  endShape(CLOSE);
  
  strokeWeight(1);  
  stroke(206, 185, 165);
  fill(236, 230, 204, 0);
  beginShape();
  vertex(500,80);
  vertex(1000,40);
  vertex(1000,600);
  vertex(0,600);
  vertex(0,300);
  endShape(CLOSE);
  
  strokeWeight(1);  
  stroke(206, 185, 165);
  fill(128,128,128);
  beginShape();
  vertex(500,80);
  vertex(1000,40);
  vertex(1000,0);
  vertex(470,45);
  vertex(0,250);
  vertex(0,300);
  endShape(CLOSE);
  
  noStroke();
  fill(150, 100, 100);
  quad(500, 80, 500, 180, 0, 500, 0, 300);

  noStroke();
  fill(150, 100, 100);
  quad(500, 80, 500, 180, 1000, 180, 1000, 40);
  
  stroke(0);
  fill(150, 100, 100);
  quad(800, 500, 1000, 500, 1000, 400, 800, 400);
  quad(850, 350, 1000, 350, 1000, 400, 800, 400);
  
  stroke(0);
  line(500, 80, 500, 180);
  
  stroke(0,0,255,150);
  line(950, 370, 950, 250);
  line(930, 370, 920, 270);
  line(900, 370, 900, 250);
  line(940, 370, 950, 240);

  stroke(139,0,255, 100);
  strokeWeight(10);
  fill(255,255,255,0);
  ellipse(100, 600, 1000, 600);
  stroke(50,0 , 200, 100);
  ellipse(100, 600, 1020, 620);
  stroke(0 ,0 ,255, 100);
  ellipse(100, 600, 1040, 640);
  stroke(0,255,0, 100);
  ellipse(100, 600, 1060, 660);
  stroke(255, 255,0, 100);
  ellipse(100, 600, 1080, 680);
  stroke(255,100,0, 100);
  ellipse(100, 600, 1100, 700);
  stroke(255,0 ,0, 100);
  ellipse(100, 600, 1120, 720);
}
