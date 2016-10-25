import processing.pdf.*;
PImage img;
float size;

void setup() {
  size(660, 990);
  beginRecord(PDF, "portrait3.pdf");
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
      
     float brightness = (r+g+b)/10;
      fill( r, g, b, brightness+100);  
      // fill(c);
      size= map(brightness, 0, 255, 30, 200);
      ellipse(i, j, size, size);
    }
  }
}
void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}
}