PImage foto;

void setup(){
  size(800,400);
  background(#E89898);
  foto = loadImage ("foto.jpg");
}

void draw(){
  //imagen
  image (foto,0,0,400,400);
  
  //cajón
  stroke(0);
  strokeWeight(1);
  fill(0);  //#675422
  rect(459,0,231,266);                        //sombra fondo
  fill(#DEC962); //color claro
  quad(459,266,690,266,775,372,415,372);      //suelo madera clara
  fill(#675422);                              //oscurito
  rect(775,0,25,400);                         //frente listón dx
  
  fill(#DEC962); //claro
  quad(690,0,775,0,775,372,690,266);           //pared dx madera clara
  fill(#E0D288);
  rect(400,0,15,400);                        //frente listón sx
  fill(#241E0D); //oscurito fondo
  quad(415,0,459,0,459,266,415,372);         //sombra semioscura pared sx
  
  
  fill(#DEC962);
  rect(415,372,360,28);                    //frente listón
  
  fill(#675422);
  quad(459,266,690,266,716,299,415,372);   //sombra clara suelo
  noStroke();
  quad(690,0,716,0,716,299,690,266);       //sombra clara pared dx
  triangle(716,102,716,0,775,0);           //sombra clara pared dx
  
  fill(0); //oscurito fondo
  quad(439,0,459,0,459,266,439,296);    //sombra pared sx
  triangle(415,372,459,234,459,266);    //sombra pared sx
  triangle(415,372,459,266,677,266);  //sombra suelo
  
  fill(#64511F,60);
  ellipse(643,130,60,90);       //luz fondo
  ellipse(595,62,30,140);       //luz fondo
  
  //ajo
  strokeWeight(0);
  fill(#F597EA);
  ellipse(491,89,60,53);
  triangle(474,67,490,49,504,65);
  fill(#6A3E57);
  rect(485,23,10,33);
  fill(#F0DFE9,220);
  rect(485,23,7,33);
  strokeWeight(3);
  stroke(#F0DFE9,220);
  line(489,54,486,64);
  line(489,54,496,67);
  line(484,55,478,62);
  noStroke();
  fill(#A02C6F,170);
  ellipse(485,96,19,39);
  ellipse(502,97,12,32);
  ellipse(515,90,9,30);
  ellipse(466,89,10,30);
  fill(#EBCEF0,250);
  quad(475,93,487,64,494,87,485,105);
  quad(462,80,480,60,474,81,469,87);
  quad(497,91,493,69,500,69,505,84);
  triangle(499,63,510,65,520,85);
  stroke(#BFB0C1);
  strokeWeight(3);
  line(467,106,477,112);
  line(477,112,485,114);
  noStroke();
  //fill(#761A50,100);
  fill(0,70);
  ellipse(509,108,50,50);
  
  
  
  //sogas
  stroke(#9B652C);
  strokeWeight(3);
  noFill();
  ellipse(571,144,10,30);
  ellipse(564,159,10,30);
  stroke(#F0E5BF);
  strokeWeight(3);
  line(570,0,570,159);
  line(491,0,491,22);
  line(485,47,495,41);
  bezier(495,41,500,40,500,50,507,50);
  strokeWeight(1);
  line(569,103,561,94);
  line(568,104,561,108);
  line(568,94,564,89);
  line(569,129,564,136);
  line(564,136,561,133);
  stroke(#9B652C);
  strokeWeight(2);
  line(571,0,571,159);
  
  //sombra limón
  noStroke();
  fill(0);
 triangle(646,340,659,318,688,320);
  //fill(0,120);
  triangle(642,341,666,314,686,321);
  
  //lineas madera
  stroke(#B48A1F,110);
  strokeWeight(3);
  line(525,326,543,327);
  line(546,327,615,321);
  line(497,338,543,335);
  line(546,335,615,329);
  line(437,361,534,358);
  noFill();
  triangle(589,342,697,329,755,357);
  line(430,367,768,364);
  triangle(536,357,561,350,587,356);
  line(595,358,765,362);
  strokeWeight(2);
  line(606,302,584,303);
  line(566,310,605,309);
  
  stroke(#4B3514);
  line(778,0,781,400);
  line(783,0,786,400);
  line(793,0,790,400);
  line(805,0,795,400);
  
  stroke(#957521,150);
  strokeWeight(2);
  line(410,0,409,262);
  line(409,262,401,400);
  line(404,0,404,264);
  line(404,264,402,320);
  
  stroke(#B48A1F,150);
  line(417,378,774,377);
  line(417,386,774,381);
  line(417,394,774,385);
  line(548,400,774,389);
  
  stroke(#B48A1F,150);
  line(409,361,406,399);
  
  stroke(#5D431B,120);
  line(727,261,728,147);
  line(748,0,745,109);
  line(755,0,755,72);
  line(773,76,770,100);
  line(765,79,770,100);
  line(770,100,770,129);
  
  stroke(#7C571F);
  //line(745,109);
  //line(755,72);
  stroke(#3E2C10,200);
  line(733,51,733,71);
  
  stroke(#B48A1F,50);
  strokeWeight(1.5);
  line(700,0,700,271);
  line(705,0,705,271);
  line(714,0,714,271);
  strokeWeight(2);

  line(728,0,728,147);
  line(738,77,737,279);
  line(745,109,745,278);
  line(755,72,755,278);
  line(764,133,764,353);
  
  //limón fondo
  stroke(#CECB85);
  ellipseMode(CENTER);
  fill(#EEF233);
  ellipse(670,299,57,50);
  fill(#D5D825);
  stroke(255);  
  ellipse(671,287,50,46);
  stroke(255);
  strokeWeight(2);
  line(668,282,655,270);
  line(670,280,664,265);
  line(673,286,687,302);
  stroke(255);
  strokeWeight(1);
  line(669,285,658,285);
  line(670,286,665,305);
  stroke(#8B6C1C,200);
  strokeWeight(2);
  line(675,283,679,273);
  line(672,288,672,299);
  stroke(255);
  fill(255);
  ellipse(672,284,8,8);
  
  //limon pequeño frente
  strokeWeight(2);
  fill(#EFF247);
  ellipseMode(CENTER);
  stroke(#CECB85);
  ellipse(637,307,60,68);
  stroke(255);
  strokeWeight(2);
  fill(#CBCB79);
  //rect(629,271,33,59); //geometrizacion posicion final  (usando println para trasladar las posiciones de la imagen original al lienzo de la imagen artificial)
  pushMatrix();
  ellipseMode(CORNERS);  //me pareció más facil este modo porque partí de un rectangulo al rededor de la ellipse 
  rotate(-PI/10); //hago una rotacion para inclinar la ellipse
  //ellipse(614-mouseX,271+mouseY,647-mouseX,330+mouseY); //moviendo la ellipse calculo que con la rotscion tengo que restar 108 en X y sumarle 186 en Y a las coordenadas de la ellipse para que esté inclinada pero en su sitio
  stroke(255);
  ellipse(506,457,539,516); //ellipse definitiva 
  //rotate(PI/50); //anulo la rotación
  popMatrix();
  stroke(255);
  strokeWeight(2);
  line(635,274,642,292);
  line(647,275,642,292);
  line(641,293,631,293);
  strokeWeight(1);
  line(646,306,657,327);
  noStroke();
  ellipseMode(CENTER);
  fill(0,100);
  ellipse(617,303,3,8);
  fill(255);
  ellipse(643,293,5,10);
  ellipse(646,304,5,5);
  
 
  //limon grande frente
  
  
//ellipseMode(CORNERS);
  
  pushMatrix();
  translate(600,200);
  rotate(PI/11);
  fill(#9D9D31);
    rect(118,23,70,75,30,35,50,50);

  ellipse(158,74,70,70);
  fill(#F6FA3F);
  ellipse(156,72,70,70);
    fill(#A7944E,50);
  ellipse(156,72,70,70);

  //fill(#9D9D31);
  //rect(118,23,70,75,30,35,50,50);
  fill(#F6FA3F);
  rect(115,23,70,75,30,35,50,50);
  fill(#A7944E,50);
  //ellipse(156,72,70,70);
  rect(115,23,70,75,30,35,50,50);
  popMatrix();
  fill(0,25);
  triangle(712,335,734,335,726,344);
  triangle(739,275,742,296,754,284);
  noStroke();
  fill(#9D9D31);
  //ellipse(730,265,767,340);  //sombra lateral
  fill(#F6FA3F);
  //ellipse(693,260,767,345);  //cuerpo
  fill(#A7944E,50);           
  //ellipse(693,260,767,345);  //cuerpo transparencia
  ellipseMode(CENTER);
  fill(255,235);
  pushMatrix();
  //rotate
  ellipse(718,298,40,63);
  fill(#BEBF8D,230);
  ellipse(718,290,13,22);
  fill(#BEBF8D,180);
  ellipse(718,295,27,40);
  popMatrix();
  fill(#9D9D31);
  ellipse(759,307,30,30);
  fill(#F6FA3F);
  ellipse(758,305,30,30);
  
  //manzana
  noFill();
  strokeWeight(3);
  stroke(255);  
  strokeWeight(0);
  ellipseMode(CENTER);
  fill(#832530);
  ellipse(570,182,82,60);
  noStroke();
  fill(#1F0606);
  arc(560,213,98,108,HALF_PI,PI+QUARTER_PI+1);
  fill(255,0,0);
  ellipse(558,194,70,70);
  fill(240,0,0);
  ellipse(578,194,70,70);
  ellipse(560,248,45,45);
  ellipse(571,213,82,90);
  fill(255,230);
  ellipse(554,194,18,13);       //reflejo
  fill(#81171B);
  ellipse(595,205,35,85);       //sombra dx sup
  fill(#1F0606);
  ellipse(601,205,30,75);              //sombra oscura dx sup
  triangle(590,233,572,271,610,239);               //sombra oscura dx inf
  fill(0);
  rect(564,150,4,7);           //cabo
  noStroke();
  fill(#761A47,120);
  ellipse(586,249,30,30);    //sombra pequeña dx inf
  
  noFill();
  stroke(#D8464B);
  strokeWeight(2);
  //bezier(546,154,524,179,579,135,605,168);
  bezier(550,156,529,182,579,132,605,165);
  

  
  noStroke();
  fill(0,70);
  ellipse(593,261,68,60);   //sombra dx inf

  
  
  
}

void mouseClicked(){
  println (mouseX,mouseY);

}
