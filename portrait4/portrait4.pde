import processing.pdf.*;
PImage img;

void setup() {
  size(660, 990);
  beginRecord(PDF, "portrait4.pdf");
  img = loadImage("portrait.jpg");
  noSmooth();
  stroke(255);
  noFill();
}

void draw() {
  noStroke(); 
  fill(0,50);
  rect(0,0,width,height);
  stroke(255);
  int widthStep = 2;
  int heightStep = 2;
  
  for (int i = 0; i <= height; i += heightStep) {
    beginShape();
    for (int j = 0; j <= width; j += widthStep) {
      
      color c = img.get(j, i);
      //color c = img.get(int(j + (sin(radians(frameCount+i+j))*5)), i);
      //color c = img.get(int(j + (sin(radians(frameCount+i+j))*10)), i);
      
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float brightness = (r+g+b)/3;

      float offset = map(brightness, 0, 255, 50, 10);

      //stroke(map(brightness,0,255,150,255));
      
      curveVertex(j, i-offset);
    }
    endShape();
  }
}
void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}
}