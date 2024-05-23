//Ara Martino Saravi
//Legajo 91595/3
/*por ahora si dos piezas se superponen, osea si arrastramos una pieza a donde ya hay otra, se van a unir sin remedio. Esto ya esta solucionado, o por lo menos 
ha mejorado, ahora he sumado una boolean */

PImage fondoE1, libro, pieza1, pieza2, pieza3, pieza4, sombras, fondoE2, ojos, boca, nubeAtras2a3, nubeMedio2a3, nubeDelante2a3, fondoE3, fondoE4;

boolean colocada1 = true, colocada2 = true, colocada3 = true, colocada4 = true;        //colocada sirve para que cuando ap1=ac1 entonces p1 ya no pueda moverse porque para que sus coordenadas varien necesita que se cumpla ap1, ac1 y c1(colocada1), la condicion para que pieza1 se mueva es que la pieza no esté colocada 

/* he usado variables float porque habia diseñado el boceto en posiciones impares y al usar imageMode(CENTER) las coordenadas no son numeros enteros. en realidad se, o mejor 
dicho, creo que al ejecutarse el programa los parametros de coordenadas se van a redondear a numeros enteros. igualmente como quiero practicar con otras funciones y variables
por ahora lo voy a dejar así para aprovechar el tiempo y sacarle partido al tp y tratar de entender cosas que no domino mucho y me parecen mas productivas en terminos formativos */

float posX1 = 558.5;                              //posicion coordenada X de la pieza 1
float posY1 = 145;                                //posicion en Y de la pieza 1

float posX2 = 61.5;                              
float posY2 = 389;                              

float posX3 = 89.5;                              
float posY3 = 110.5;                              

float posX4 = 532.3;                              
float posY4 = 324.5;                              

boolean ap1, ap2, ap3, ap4;                                      //area de la pieza 1, para poder interpretar cuando se esta dentro de cada pieza

boolean resuelto1, resuelto2, resuelto3, resuelto4;                        //cuando las cuatro variaboes se vuelven true se puede interpretar que el puzble esta completo y asi pasar al estado 2

//parpadeo texto estado 1
float alphaTextoE1 = 0;  /* esta variable la he creado dspues de la variable alphaTextoE2, y ahora he leido que cuando se trata de hacer fades es mejor usar numeros flotantes para que 
                           sea mas fluido, así que lo quiero poner en practica y ver que resultados da */
int direcctionAlphaE1 = +1;   /* antes estaba tratando de hacer un loop para aumentar y disminuior la transparencia usando boolen y la lógica true false, pero no estaba dando resultado hasta que me aconsejaron usar otro metodo, multiplicar la direccion 
                                del cambio de transparencia sumandole direcctionAlphaE1 y haceindo que su valor cambie de positivo a negativo entre los valores que quiero, 0 y 175, multiplicando direcctionAlphaE1 por -1, para volverlo negativo en el limite 175 y positivo en 0.
                                me interesa mucho saber si este metodo es correcto y claro */
                                /* wow wow, ya se porque no estaba lograndolo con bolean, no lo he puesto en practica pero antes estaba haciendo una signacion en la condicion de un if cuando tenia que hacer una comparacion, estaba usando = en lugar de ==, un pequeño pero crucial error por no atender a la diferencia */
//transicion entre el estado 1 y 2
int time = 0;                                   //esta variable de tiempo empieza a sumar cuandop se completa el puzble y participa como condicion para los ejectos de transicion entre estado 1 y 2 cambiando sus transparencias

    //podriamos declarar todos los int en un uno solo siempre y cuando no se les asigne un valor 
int opacidadFondoE1 = 255;                               //parametro alfa de la funcion tint hecha variable, cuando se completa el puzble el valor alfa decrece hasta cero que es la maxima transparencia a la que va a llegar el estado 1
int transicion = 0;                               //parametro alfa de la imagen de fondo del estado 2
int transparenciaB = 30;                         //esto es el parametro de transparencia en el fill de la base del puzble
int transparenciaC = 255;                         //esto es el parametro de transparencia en el stroke del marco de base del puzble

int posXFC3 = 640;
int posXFC2 = 640;
int posXFC1 = 640;

//estado 2
int parpadeo = 0;                               //parametro alfa del tint de la imagen con los ojos del caballero
int sonrisa = 0;
int alphaTextoE2 = 0;
String textoE2 = "El Caballero Inexistente, escrito por Italo Calvino, es una fábula que explora la identidad y la paradoja de la existencia. La historia sigue a Agilulfo, un caballero cuya armadura está hueca y cuya voz metálica proviene de su yelmo cerrado.";
int escribirTextoE2 = 0;  /*este parametro define el final del segmento de la cadena string (textoE2.substing(0,escribirTextoE2)), es decir que en cada frame funciona como limite del
                           segmento de cadena, haciendo que el final del segmento aumente, en cada frame se va a dibujar/ejecutar un caracter de la cadena hasta completr todo el string */
//maquina de tipeo
boolean tipeo;  //se vuelve verdadero 1 vez por segundo
int frecuenciaTipeo = 0;
int tiempoTipeo=0;

//transicion entre el estado 2 y 3
float alphaCielo2a3=0;
float alphaTexto1T2a3=0;
float alphaTexto2T2a3=0;


//estado 3
boolean estado3;
int alphaFondoE3=0;
int alphaTextoE3=0;
                   
String textoE3 = "Sin embargo, la paradoja\nde ser amado y\nreconocido por otros\na pesar de no ser real\nlo lleva a cuestionar su\npropósito en el mundo.";
int escribirTextoE3 = 0;

boolean estado4;

//estado 4
float alphaFondoE4 = 0;
String textoE4 = "La novela plantea preguntas filosóficas sobre la autenticidad y el significado de ser humano. Los personajes, como Agilulfo y Bradamante, nos invitan a reflexionar sobre la naturaleza de la identidad y la creencia en nuestra propia existencia.";
int escribirTextoE4 = 0;
int alphaTextoE4 = 255;
void setup(){
  size(640,480);
//estado 1
  fondoE1 = loadImage ("fondoE1.png");
  libro = loadImage ("libro.png");
  pieza1 = loadImage ("pieza1.png");
  pieza2 = loadImage ("pieza2.png");
  pieza3 = loadImage ("pieza3.png");
  pieza4 = loadImage ("pieza4.png");
  sombras = loadImage ("sombras.png");//esto es un detallito
//estado 2 + transicion entre estado 1 y 2
  fondoE2 = loadImage ("fondoE2.png");//caballero a caballo, fondo morado
  ojos = loadImage ("ojos.png");
  boca = loadImage ("boca.png");
//transicion entre el estado 2 y 3
    //son las nubes, tienen un nombre que nada que ver 
  nubeAtras2a3 = loadImage ("nubeAtras2a3.png");
  nubeMedio2a3 = loadImage ("nubeMedio2a3.png");
  nubeDelante2a3 = loadImage ("nubeDelante2a3.png");
  fondoE3 = loadImage ("fondoE3.png");
  fondoE4 = loadImage ("fondoE4.png");
}

void draw(){
//estado1
  //background(0);
    //fondo estado 1 + libro + rect./lienzo puzle(con stroke) 
  imageMode(CORNER);
  tint(255,opacidadFondoE1);
  image (fondoE1,0,0,640,480);
  imageMode(CENTER);
  image(libro,320,240.5,300,463);    //libro
  rectMode(CENTER);
  strokeWeight(15);
  stroke(#7AA06A,transparenciaC);
  fill (0,transparenciaB);
    // + logica puzle(traslado de piezas/anti-superposicion/colocar si correcto(true)/esta asiciado como condicioon(false) para la transicion entre e 1 y 2 y el eestado 2)
  rect(width/2,292.5,150,219);    //puzble base
  push();  //push() y pop() hacen que los atributos de estilo solo se apliquen entre su inicio y su final, pero no anula las ordenes de estilo anterioriores(por fuerar del push()) a no ser que volvamos a declarar una orden de estilo del mismo tipo antes o dentro del push pop si queremos que solo se aplique ahi
    // + texto estado 1, fadeLoop
  textAlign(CENTER);
  textSize(25);
  fill (255,alphaTextoE1);
  text("COMPLETA\nEL PUZBLE\nPARA\nAVANZAR",width/2,250);//\n hace lo mismo que <br> en html, es como un punto e a capo
  pop();
    // + las cuatro piezas del puzle
  image(pieza1,posX1, posY1 ,75,110);   //pieza1           
  image(pieza2,posX2,posY2,75,110);    //pieza2
  image(pieza3,posX3,posY3,75,109);
  image(pieza4,posX4,posY4,75,109); 
    // + sombras
  image(sombras,width/2,height/2,640,480);
    //transicion entre estado 1 y 2
    //estado 2
  imageMode(CORNER);
  tint(255,transicion);
  image(fondoE2,0,1,640,480);
  tint(255,parpadeo);
  image(ojos,0,0,640,480);
  tint(255,sonrisa);
  image(boca,0,0,640,480);
    // + texto estado 2 + maquina de tipeo
  textSize(25);
  fill(255,alphaTextoE2);
  textAlign(LEFT);  //con left el primer caracter aparece a 5 pixeles de su coordenada en x, con right el ultimo caracter aparece con su lado derecho a -12 pixeles de distancia de su coordenada en x. esto en este textSize(72) en 640, 480
  rectMode(CORNER);  //autoconsejo, siempre usar rectMode(CORNER) si voy a escribir dentro de un area de texto, osea con ancho y largo
  text(textoE2.substring(0,escribirTextoE2),30,32,530,400);  //okay, creo que ya entiendo como se acomoda el area de texto, hasta donde entiendo se basa en la ejecucion de un rectangulo, que no se ve pero funciona de limites. Las coordenadas del texto entonces esta sujeta a las coordenadas del "rectangulo", la direccion del rectangulo y del texto depende de left o right, pero su posicion depende de rectMode(), usando el modo CORNER aprovechamos que textAlign(top) se ejecuta por defecto, entonces el texto empieza a escribirse con el primer caracter encajado en la esquina superior izquierda del rectangulo  osea que hay que colocarlas como si las coordenadas del texto estuvieran dentro de un translate delimitado por el tamaño del rectangulo, el "translate" se define, hasta donde yo intuyo, segun el modo de coordenadas del objeto rect, que produce las cordenadas de tamaño del area del texto, osea que    dependen de rectMode(), textAlign determina como se escribe, al usar la caja de texto se aplica el modo top por defecto
    //transicion al estado 3
  noStroke();
  fill(#6DE4F0,alphaCielo2a3);
  rect(0,0,640,480);
    // + nubes transicion entre estado 2 y 3
  tint(255,255);
  image (nubeAtras2a3,posXFC3,0,1920,188);
  image (nubeMedio2a3,posXFC2,0,1920,188);
  image (nubeDelante2a3,posXFC1,0,1920,188);
    // + texto entre el estado 2 y 3
  push();
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  fill(#1E72A5,alphaTexto1T2a3);
  tint(255);
  textSize(30);
  text("A pesar de su inexistencia física, Agilulfo\n lucha valientemente en el ejército de Carlomagno.",width/2,height/2-30,640,480);
  fill(#1E72A5,alphaTexto2T2a3);
  text("Durante una batalla, conoce a Bradamante, una amazona, y se enamora de ella. ",width/2,height/2-30,640,480); 
  pop();
    //estado 3 + texto estado 3
  tint(#BBBFC1,alphaFondoE3);
  rectMode(CENTER);
  image (fondoE3,0,0,640,480);
  rectMode(CORNER);
  textSize(30);
  fill(255,alphaTextoE3);
  tint(255,alphaTextoE3);    //declarar float
  text(textoE3.substring(0,escribirTextoE3),15,41);              //hacer string
    //estado4
  rectMode(CENTER);
  tint(255,alphaFondoE4);
  image(fondoE4,0,0,640,480);
  fill(255,alphaTextoE4);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  textSize(25);
  text(textoE4.substring(0,escribirTextoE4),width/2,height/2,382,282);
  
  
//logica estado 1
    //fadeLoop + desaparecer texto si se coloca una pieza
  if(resuelto1==false && resuelto2==false && resuelto3==false && resuelto4==false){  //desaparecer texto si se coloca una pieza
    alphaTextoE1+=direcctionAlphaE1;  //fadeLoop,suma 2 por cada frame hasta que se ejecute la condicional que sigue
    if (alphaTextoE1<=0 || alphaTextoE1>=175){  //fadeLoop,establezco los limites del loop
      direcctionAlphaE1*=-1;  //fadeLoop,cambio de sentido 
    }
  }else{
    alphaTextoE1-=3;  //desaparecer texto si se coloca una pieza
    if(alphaTextoE1<=0){  //estoy constantemente usando esta practica porque tengo entendido que es util para que la compu no acumule procesos de calculo, creo que es una buena practica, pero no se si esta es la forma adecuada de aplicarlo porque siento que estoy escribiendo muchas lineas de codigo cada vez que quiero alijerar el programa
      alphaTextoE1=0;
    }
  }
    //logic puzble
    // + anula la condicion para poder mover cada pieza una vez colocada, condicion de movimiento
  if (resuelto1){
    colocada1 = false;
  }
  if (resuelto2){
    colocada2 = false;
  }
  if (resuelto3){
    colocada3 = false;
  }
  if (resuelto4){
    colocada4 = false;
  }
   // + verdadero cunado el mouse esta sobre una pieza, condicion de movimiento
  boolean ap1 =                                                  //area pieza1
    mouseX > posX1-75/2 && mouseX < posX1+75/2 &&
    mouseY > posY1-110/2 && mouseY < posY1+110/2;
    
  boolean ap2 =                                                  //area pieza2
    mouseX > posX2-75/2 && mouseX < posX2+75/2 &&
    mouseY > posY2-110/2 && mouseY < posY2+110/2;
 
  boolean ap3 =
    mouseX > posX3-75/2 && mouseX < posX3+75/2 &&
    mouseY > posY3-109/2 && mouseY < posY3+109/2;
  
  boolean ap4 =
    mouseX > posX4-75/2 && mouseX < posX4+75/2 &&
    mouseY > posY4-109/2 && mouseY < posY4+109/2;
    // + movimiento de las piezas, interactividad
  if ( mousePressed && ap1 && colocada1){                                     //arrastar la pieza1 a otra posición 
    posX1 = mouseX;
    posY1 = mouseY;
    ap2 = false;     //esta asignacion hace que no se fusionen las piezas al superponerlas,eso está resuelto, pero en consecuencio ahora hay una jerarquia entre piezas, la pieza 1 siempre va a estar privilegiada para moverse aunque se este dentro del area de otra pieza, la jerarquia es lineal, pieza1, pieza2, pieza3, pieza4.
    ap3 = false;     //esta cosa está jodiendome, jajaja a cada solucion me devuelve un problema, ahora cuando ya hay una pieza colocada en el puzble, si es de jerarquia mayor, hace que no pueda arrastrar ninguna pieza por delante de la ya colocada, tengo que hacer que cuando se coloque la pieza se anule la condicion de jerarquia
    ap4 = false;
  }
  if ( mousePressed && ap2 && colocada2){
    posX2 = mouseX;
    posY2 = mouseY;
    ap1 = false;
    ap3 = false;
    ap4 = false;
  }
  if ( mousePressed && ap3 && colocada3){
    posX3 = mouseX;
    posY3 = mouseY;
    ap1 = false;
    ap2 = false;
    ap4 = false;
  }
  if ( mousePressed && ap4 && colocada4){
    posX4 = mouseX;
    posY4 = mouseY;
    ap1 = false;
    ap2 = false;
    ap3 = false;
  }
    // + verdadero cuando el mouse esta sobre cada hueco del lienzo del puzle, condicion para colocar la pieza
  boolean ac1 =                                                   //area correcta para la pieza1
      mouseX > width/2-150/2 && mouseX < width/2 &&
      mouseY > 292.5-219/2 && mouseY < 292.5;
      
  boolean ac2 =                                                   //area correcta para la pieza2
      mouseX > width/2 && mouseX < width/2+150/2 &&
      mouseY > 292.5-219/2 && mouseY < 292.5;
      
  boolean ac3 =                                                   //area correcta para la pieza3
    mouseX > width/2-150/2 && mouseX < width/2 &&
    mouseY > 292.5 && mouseY < 292.5+219/2;
      
  boolean ac4 =                                                   //area correcta para la pieza4
    mouseX > width/2 && mouseX < width/2+150/2 &&
    mouseY > 292.5 && mouseY < 292.5+219/2;
    // + colocar la pieza, anular el movimiento de la pieza colocada
  if (ap1 && ac1){                                            //coloca la pieza 1 si el area de la pieza1 y el area correcta para la pieza1 coinciden, osea cuando arrasstramos la pieza1 a la posicion correcta (area correcta para la pieza1) se coloca automaticamente
    posX1 = width/2-150/4;
    posY1 = 292.5-219/4;
    resuelto1 = true;
  }
  if (ap2 && ac2){          //coloca la pieza 2
    posX2 = width/2+150/4; 
    posY2 = 292.5-219/4;
    resuelto2 = true;
  }      
  if (ap3 && ac3){          //coloca la pieza 2
    posX3 = width/2-150/4;
    posY3 = 292.5+219/4;
    resuelto3 = true;
  }
  if (ap4 && ac4){          //coloca la pieza 2
    posX4 = width/2+150/4;
    posY4 = 292.5+219/4;
    resuelto4 = true;
  }
//el tiempo empieza cuando se resluelve el pizble, 1 segundo en tiempo real
  if ( resuelto1 && resuelto2 && resuelto3 && resuelto4){
    if(frameCount%60 == 0){  //esto es importante, el signo "%" significa multiplo, se leeria si el numero de frames ejecutados por el programa tienen un valor que sea multiplo de 60(osea 60 frames porque el primer multiplo de 60 es 60,el segundo multiplo de 60 es 120 pero para caundo es 120 la condicion del tiempo ya esta activa y en el frame 120 time devuelve el numero que multiplicado por sesenta da el numero de frames ejecutados. es decir, que en el frame 60 se va a dar la condicion frameCount>=%60 para que time empieze a sumar de a 1 cada sesenta frames, pero no es una suma de 1 en 1, es un calculo donde lo que se esta respondiendo es la pregunta que numeros multiplicados por 60 dan como resultado otro multiplo de 60, es deci 1 porque 1*60=60 que es multiplo de sesenta, 2 porque 2*60=120 que es multiplo de 60..., hasta donde entiendo no toma a 1 como el primer multiplo de 60 porque todos los numeros enteros son multiplos de si mismo)
    time++;
    }
  }
//transicio entre estado 1 y 2
  if(time>=1){
    transparenciaB-=2;                //aca deberia haber unificado las variables en una sola
    transparenciaC-=2;
    opacidadFondoE1-=2;
    transicion+=2;
    if(transparenciaB<=0){   
      transparenciaB=0;
    }
    if(transparenciaC<=0){
      transparenciaC=0;
    }
    if( opacidadFondoE1<=0){
      opacidadFondoE1=0;
    }
    if(transicion>=255){       
    transicion=255; 
    }
  }
//logica estado 2
    //fade on texto estado 2
  if(time>2 && time<18){
    alphaTextoE2++;
    if(alphaTextoE2>=0){
    alphaTextoE2=255;
    }
    //maquina de tipeo+cuentagotas/temporizador
    if(frameCount%3 == 0){  //añado el cuentagotas/temporizador porque no quiero usar framerate porque sino el frameCount%60 que marca el tiempo se desajustaria
      tiempoTipeo++;           //este tiempo aumenta en 1 cada 0,33 segundos
    }  //maquina de tipeo
    if(tiempoTipeo-frecuenciaTipeo==1){
    //logica tipeo
      tipeo=true;  //hago que su velocidad asociada a framerate pase a estar condicionada por frameCount%3
      frecuenciaTipeo=tiempoTipeo;
      if(escribirTextoE2<textoE2.length() && tipeo){      //el sufijo length devuelve el valor del largo del string (no del substring)
        escribirTextoE2++;  
      }
    }
    //face off al texto, 
  }else if(time>=18){      //esta en un else if porque sino se ejecutaba la orden anterior de alphaTextoE2=255
    alphaTextoE2-=2;
    if(alphaTextoE2<=0){
      alphaTextoE2=0;
    }
  }
    //logica parpadeo
  if(time>=6 && time<=7){  //on
    parpadeo+=2;
    if(parpadeo>=255){
      parpadeo=255;
    }
  }else if (time>7 && time<13){  //off
    parpadeo-=3;
    if (parpadeo<=0){
      parpadeo=0;
    }
  }else if(time>=13 && time<15){  //on
    parpadeo+=3;
    if (parpadeo>=255){
      parpadeo=255;
    }
  }else{  //off a partir del segundo 15    
    parpadeo--;
    if (parpadeo<=0){
      parpadeo=0;
    }
  }
//transicion entre estado 2 y 3
    //las nubes empiezan a moverse
  if(time>=20){ 
    posXFC3=posXFC3-1;
    posXFC2=posXFC2-2;
    posXFC1=posXFC1-3;
  }
    //fade fondo azul 
  if(time>=20 && time<=30){  //fade on
    alphaCielo2a3+=2;
    if(alphaCielo2a3>=255){
      alphaCielo2a3=255;
    }
  }else if(time>37){  //off
    alphaCielo2a3--;
    if (alphaCielo2a3<=0){
      alphaCielo2a3=0;
    }
  }
    //fade texto 1 entre el estado 2 y 3
  if(time>=23 && time<27){  //fade on
    alphaTexto1T2a3+=2;
      if(alphaTexto1T2a3>=255){        //creo que aca esto me esta bloqueando el fade off
        alphaTexto1T2a3=255;
      }
  }else if(time>=27){  //fade off
    alphaTexto1T2a3-=2;
    if(alphaTexto1T2a3<=0){        //creo que aca esto me esta bloqueando el fade off
      alphaTexto1T2a3=0;
    }
  }
    //fade texto 2 entre el estado 2 y 3
  if(time>=29 && time<33){
    alphaTexto2T2a3+=2;
    if(alphaTexto2T2a3>=255){
      alphaTexto2T2a3=255;
    }
  }else if(time>=33){
    alphaTexto2T2a3-=2;
    if(alphaTexto2T2a3==0){
      alphaTexto2T2a3=0;
    }
  }
//logica estado 3
  if(time>=37){
    estado3=true;
  } 
  if(estado3){
        //reinicio de la maquina de tipeo y del cronometro
    tiempoTipeo=0;
    frecuenciaTipeo=0;
    if(time>=37 && time<48){
      alphaFondoE3+=2;
      if(alphaFondoE3>=255){
          alphaFondoE3=255;
      }
    }
    if(time>=39 && time<47){
      alphaTextoE3+=2;
      if(alphaTextoE3>=255){
        alphaTextoE3=255;
      }
      if(frameCount%3 == 0){  //añado el cuentagotas/temporizador porque no quiero usar framerate porque sino el frameCount%60 que marca el tiempo se desajustaria
        tiempoTipeo++;           //este tiempo aumenta en 1 cada 0,33 segundos
      }  //maquina de tipeo
      if(tiempoTipeo-frecuenciaTipeo==1){
      //logica tipeo
        tipeo=true;  //hago que su velocidad asociada a framerate pase a estar condicionada por frameCount%3
        frecuenciaTipeo=tiempoTipeo;
        if(escribirTextoE3<textoE3.length() && tipeo){      //el sufijo length devuelve el valor del largo del string (no del substring)  
        escribirTextoE3++;
        }
      }
//transicion entre el estado 3 y 4
    }else if(time>=47){
      alphaTextoE3-=2;
      if(alphaTextoE3<=0){
        alphaTextoE3=0;
      }
      if(time>=48){
        alphaFondoE3-=2;
        alphaFondoE4+=2;
        if(alphaFondoE3<=0){
          alphaFondoE3=0;
        }
        if(alphaFondoE4>=255){
          alphaFondoE4=255;
          estado4=true;
        }
      }
    }
  }
//logica estado 4
  if(estado4){
    tiempoTipeo=0;
    frecuenciaTipeo=0;
    if(frameCount%3 == 0){  //añado el cuentagotas/temporizador porque no quiero usar framerate porque sino el frameCount%60 que marca el tiempo se desajustaria
        tiempoTipeo++;           //este tiempo aumenta en 1 cada 0,33 segundos
      }  //maquina de tipeo
    if(tiempoTipeo-frecuenciaTipeo==1){
      //logica tipeo
      tipeo=true;  //hago que su velocidad asociada a framerate pase a estar condicionada por frameCount%3
      frecuenciaTipeo=tiempoTipeo;
      if(escribirTextoE4<textoE4.length() && tipeo){      //el sufijo length devuelve el valor del largo del string (no del substring)  
      escribirTextoE4++;
      }
    }
    if(time>=64){
      alphaTextoE4-=2;
      if(alphaTextoE4<=0){
        alphaTextoE4=0;
      }
    }
  }

  
//pantalla final
  if(time>66){
      //texto final
    textAlign(CENTER,CENTER);
    fill(255);
    text("continuará...",width/2,height/2);
      //boton de reinicio
    if(time>67){
      rectMode(CENTER);
      fill(124);
      rect(width/2,height/2+74,100,40);
      ellipse(width/2+50,height/2+74,40,40);
      ellipse(width/2-50,height/2+74,40,40);
      fill(255,0,0);
      textAlign(CENTER,CENTER);
      textSize(25);
      fill(255);
      text("reiniciar",width/2,height/2+74);
        //logica de reinicio  
      if(mousePressed && (dist(mouseX,mouseY,width/2+50,height/2+74)<40 || dist(mouseX,mouseY,width/2-50,height/2+74)<40 || (mouseX>width/2-50 && mouseX<width/2+50 && mouseY>height/2+74-10 && mouseY<height/2+74+10))){
        resuelto1 = false;
        posX1 = 558.5;                              
        posY1 = 145;
        resuelto2 = false;
        posX2 = 61.5;
        posY2 = 389;
        resuelto3 = false;
        posX3 = 89.5;
        posY3 = 110.5;
        resuelto4 = false;
        posX4 = 532.5;
        posY4 = 324.5;
      
        colocada1=true;   //reseteo la condicion necesaria para mover la pieza1
        colocada2=true;
        colocada3=true;
        colocada4=true;
      
        opacidadFondoE1 = 255;
        transicion = 0;
        transparenciaB = 100;
        transparenciaC = 255;

        parpadeo = 0;
        sonrisa = 255;
      
        alphaTextoE1 = 0;
        alphaTextoE2 = 0;
      
        posXFC3 = 640;
        posXFC2 = 640;
        posXFC1 = 640;
      
        time = 0;
      
        escribirTextoE2 = 0;
        frecuenciaTipeo = 0;
        tiempoTipeo=0;

        estado3 = false;
      
        alphaCielo2a3=0;
        alphaTexto1T2a3=0;
        alphaTexto2T2a3=0;
        alphaFondoE3=0;
        alphaTextoE3=0;
        escribirTextoE3=0;
        alphaFondoE4=0;
        escribirTextoE4=0;
        estado4=false;
        alphaTextoE4 = 255;
      }
    }
  }
  println (alphaTextoE3, alphaFondoE3, "coor.X:", mouseX, "coor.Y:", mouseY, "resuelto1:", resuelto1, "ap1:", ap1, "colocada1;", colocada1, "opacidad fondo estado 1:", opacidadFondoE1);
  println("transicion:", transicion, "time:", time, "parpadeo:", parpadeo, "sonrisa:", sonrisa, "alphaTextoE2:", alphaTextoE2);
  println("alphaCielo2a3:", alphaCielo2a3, "estado3:", estado3, "alphaTexto1T2a3:", alphaTexto1T2a3);
}
