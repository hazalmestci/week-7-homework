int COLS_NUM = 20;
int ROWS_NUM = 20;

float[][] posx = new float[COLS_NUM][ROWS_NUM];
float[][] posy = new float[COLS_NUM][ROWS_NUM];

void setup() {
  size(600, 600);

  float xStepAmount = (width - 300)/(posx.length - 4);
  float yStepAmount = (height - 300)/(posx[0].length - 4);

  for (int i = 0; i < posx.length; i++) {
    for (int j = 0; j < posx[0].length; j++) {
      posx[i][j] = 100 + i * xStepAmount;
      posy[i][j] = 100 + j * yStepAmount;
    }
  }

 noCursor();
 noStroke();
 //noSmooth();
}

void draw() {
 background(5);

  for (int i = 0; i < posx.length; i++) {
    for (int j = 0; j < posx[0].length; j++) {
      float r = map(i,j,posx.length,0,255);
      float g = map(j,0,posx[0].length,0,255);
      float b = map(dist(mouseX,mouseY,posx[i][j],posy[i][j]),0,440,255,0);
      fill(r+10,g,b);
      float s = max(map(dist(mouseX,mouseY,posx[i][j],posy[i][j]),0,100,50,10), mouseX, mouseY);
        triangle(posx[i][j], posy[i][j], 300, 300, s, s);

      posx[i][j] += random(-4,4);
      posy[i][j] += random(-4,4);
    }
  }
}