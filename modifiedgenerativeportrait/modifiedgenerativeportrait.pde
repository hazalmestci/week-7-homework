import processing.pdf.*;

PImage img;

void setup() {
  size(660, 990);
  beginRecord(PDF, "portrait1.pdf");
  img = loadImage("portrait.jpg");
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255);
  
  int widthStep = 6;
  int heightStep = 6;
  
  for (int i = 0; i < width; i+=widthStep-2) {
    for (int j = 0; j < height; j+=heightStep) {
      color c = img.get(i, j);
      
      
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      
     float brightness = (r+g+b)/3;
      fill(r, g, b);
      
      float s = map(brightness,0,255,6,0);
      
      rect(i, j, 9, s);
    }
  }
}
  
void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}
}