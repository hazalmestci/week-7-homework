import processing.pdf.*;
PImage img;

void setup() {
  size(500, 660);
  beginRecord(PDF, "portrait1.pdf");
  img = loadImage("portrait.jpg");
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255);
  
  int widthStep = 2;
  int heightStep = 15;
  
  for (int i = 0; i < width; i+=widthStep) {
    for (int j = 0; j < height; j+=heightStep) {
      color c = img.get(i, j);
      
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
      float brightness = (r+g+b)/3;

      float w = map(brightness,0,255,10,0);
      float h = map(brightness,0,255,40,0);
      
      pushMatrix();
      translate(i,j);
      fill(c);
      rotate(i*2+j*2+radians(frameCount+2));
      rect(10, 0, w/4, h);
      popMatrix();
    }
  }
}
void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}
}