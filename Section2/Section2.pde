int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 0;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket2(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    float counter = levels;
    while(counter > 0){
      float v1xold = v1x;
      float v1yold = v1y;
      v1x = (v1x+v2x)/2;
      v1y = (v1y+v2y)/2;
      v2x = (v2x+v3x)/2;
      v2y = (v2y+v3y)/2;
      v3x = (v1xold+v3x)/2;
      v3y = (v1yold+v3y)/2;
      triangle(v1x,v1y,v2x,v2y,v3x,v3y);
      counter--;
    }
}

void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
  triangle(v1x,v1y,v2x,v2y,v3x,v3y);
  gasketH(levels,v1x,v1y,v2x,v2y,v3x,v3y);
}

void gasketH(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
  if(levels == 0){return;}
  int counter = levels;
  while(counter > 0){
  triangle((v1x+v2x)/2,(v1y+v2y)/2,(v1x+v3x)/2,(v1y+v3y)/2,(v2x+v3x)/2,(v2y+v3y)/2);
  gasketH(counter-1,v1x,v1y,(v1x+v2x)/2,(v1y+v2y)/2,(v1x+v3x)/2,(v1y+v3y)/2);
  gasketH(counter-1,(v1x+v2x)/2,(v1y+v2y)/2,v2x,v2y,(v2x+v3x)/2,(v2y+v3y)/2);
  gasketH(counter-1,(v1x+v3x)/2,(v1y+v3y)/2,(v2x+v3x)/2,(v2y+v3y)/2,v3x,v3y);
  counter--;
  }
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);
  text("Current level: " + levels+ " !",20,40); 

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
 if(levels < 0){levels = 0;}
}
