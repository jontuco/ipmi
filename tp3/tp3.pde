//Martino saravi ara - 91595/3
//https://www.youtube.com/watch?v=H4UewBvamUM

PImage referencia;
int a=200;
float g=8;
float b=2;
void setup(){
  size(800,400);
  strokeWeight(5);
  referencia = loadImage("referencia.jpg");
  image(referencia,0,0,400,400);
}

void draw(){
  fondo();
  
  for(int i = 400; i<=600; i+=200){
    for(int f = 0; f<=200; f+=200){
      noFill();
      stroke(colorRed(),g,b);
      a=200;
      for(int l=0; l<=100; l+=10){
        if(a<=0){
          a=0;
        }
        rect(i+l,f+l,a,a);
        a-=20;
      }
    }
  }
  
  
  
  println(mouseX,mouseY,colorRed());
}

void keyPressed(){
  if(key=='a'){
     g=random(40,255);
  }
  if(key=='d'){
     b=random(40,255);
  }
  if(key=='r'){
     g=8;
     b=2;
  }
 
}
