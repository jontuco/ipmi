void fondo(){
  
  pushMatrix();
  translate(400,0);
  int cuadradoSize = 200; // Tamaño del cuadrado
  // Define los colores para cada sector
  int c1 = color(63,240,255); // celeste
  int c2 = color(249,86,241); // rosa
  int c3 = color(0, 200, 0); // Verde
  int c4 = color(200, 200, 0); // Amarillo
  int c5 = color(245,137,3); // naranja
  
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      float x = i * cuadradoSize;
      float y = j * cuadradoSize;
      
      for (int px = 0; px < cuadradoSize; px++) {
        for (int py = 0; py < cuadradoSize; py++) {
          float inter = map(dist(px, py, cuadradoSize/2, cuadradoSize/2), 0, cuadradoSize/2, 0, 1);
          int c;
          if (i == 0 && j == 0) {
            c = lerpColor(c1, c2, inter);
          } else if (i == 0 && j == 1) {
            c = lerpColor(c3, c2, inter);
          } else if (i == 1 && j == 0) {
            c = lerpColor(c2, c4, inter);
          } else {
            c = lerpColor(c1, c5, inter);
          }
          stroke(c);
          point(x + px, y + py);
        }
      }
    }
  }
  popMatrix();
}
