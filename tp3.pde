PImage obra;
int filas;
int pasos;
color colorOscuro = color(31); // color oscuro
color colorClaro = color(240); // color claro

void setup() {
  size(800, 400);
  obra = loadImage("obra.png");
  noStroke();
  //reiniciarVariables();
  filas = 12;
  pasos = 22;
  generarGrilla();
}

void draw() {
  image(obra, 0, 0, 400, 400);
}

void generarGrilla() {
  int centro = int(random(width/2, width)); // centro aleatorio dentro del lado derecho
  int posicionDerecha = centro;
  int posicionIzquierda = centro;

  //lado derecho
  for (int contador = 0; posicionDerecha < width; contador++) {
    int anchoColumna = calcularAnchoColumna(pasos, contador);
    dibujarColumna(posicionDerecha, anchoColumna, contador);
    posicionDerecha += anchoColumna;
  }

  //Lado izquierdo
  for (int contador = 0; posicionIzquierda > width/2; contador++) {
    int anchoColumna = calcularAnchoColumna(pasos, contador + 1); // +1 para empezar desde el segundo lado
    dibujarColumna(posicionIzquierda - anchoColumna, anchoColumna, contador + 1);
    posicionIzquierda -= anchoColumna;
  }
}

void dibujarColumna(int x, int w, int i) {
  int alturaColumna = height / filas;
  for (int j = 0; j < height; j += alturaColumna) {
    if ((i + j / alturaColumna) % 2 == 0) {
      fill(colorClaro);
    } else {
      fill(colorOscuro);
    }
    rect(x, j, w, alturaColumna);
  }
}

void reiniciarVariables() {
  filas = int(random(10, 20));
  pasos = int(random(6, 24));
}

int calcularAnchoColumna(int pasos, int contador) {
  int anchoCompleto = height / filas;
  return anchoCompleto / (max(pasos - contador, 0) + 1);
}

void mouseClicked() {
  reiniciarVariables();
  generarGrilla();
}
