import processing.pdf.*;

PImage img;

void setup() {
  size(660, 990);
  beginRecord(PDF, "movingpixels.pdf");
  img = loadImage("portrait.jpg");
  noStroke();
  
}

void draw() {
  background(255);
  
  int widthStep = 20;
  int heightStep = 20;
  
  for (int i = 0; i < width; i+=widthStep) {
    for (int j = 0; j < height; j+=heightStep) {
      color c = img.get(i, j);
      
     
      
       float r = red(c);
      float g = green(c);
      float b = blue(c);
      
     float brightness = (r+g+b)/3;
      fill(r, g, b, brightness+200);
      // fill(c);
      
      ellipse(i, j, random(15,80), 15);
    }
  }}
  
  void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}

}