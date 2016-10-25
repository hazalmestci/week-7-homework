import processing.pdf.*;
PImage img;

void setup() {
  size(660, 990);
  beginRecord(PDF, "portrait2.pdf");
  img = loadImage("portrait.jpg");
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255);
  
  int widthStep = 8;
  int heightStep = 8;
  
  for (int i = 0; i < width; i+=widthStep) {
    for (int j = 0; j < height; j+=heightStep) {
      color c = img.get(i, j);
      
      
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
     float brightness = (r+g+b)/3;
      fill(r, g, b);
      
      float s = map(brightness,0,255,3,0);
      
      triangle(i, j, i-(random(20,50)), j-(random(18,58)), i+(random(110,150)), j-(random(33,68)));
    }
  }
}
void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}
}