import processing.pdf.*;
PImage img;

void setup() {
  size(660, 990);
  beginRecord(PDF, "portrait6.pdf");
  img = loadImage("portrait.jpg");
  //noStroke();
  
}

void draw() {
  background(255);
  
  int widthStep = 10;
  int heightStep = 10;
  
  for (int i = 0; i < width; i+=widthStep) {
    for (int j = 0; j < height; j+=heightStep) {
      color c = img.get(i, j);
      fill(c);
      ellipse(i, j, 15, 15);
    }
  }
}
void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}
}