import processing.pdf.*;

PImage img;

int x = 0;
int y = 0;
float rot = 0;

void setup() {
  size(660, 822);
    beginRecord(PDF, "pixelportraitmoving.pdf");
  img = loadImage("portrait.jpg");
  noStroke();

}

void draw() {
  background(255);
  
  int widthStep = 14;
  int heightStep = 14;
  
  for (int i = 0; i < width; i+=widthStep) {
    for (int j = 0; j < height; j+=heightStep) {
      color c = img.get(i, j);
      fill(c);
       rot+=0.5;
       x+=0.5;
  translate(x,y);
  rotate(radians(rot)); 
      ellipse(i, j, mouseX, mouseY);
 
    
    }
  }
   if (x > width) {
    x = 1;
    y += 1; }
}

void keyPressed () {
   if(key=='Q') {
    endRecord();
    exit();
}
}