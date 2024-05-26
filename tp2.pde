PImage fondo, imagen1, imagen2, imagen3;
PFont fuente;
int pantalla, tiempo, diametro;
boolean presentacionIniciada;
float textX, textY;

void setup() {
  size(640, 480);
  fondo = loadImage("portada.jpg");
  fuente = createFont("SansSerif", 24);
  textFont(fuente);
  textSize(24);
  textAlign(LEFT, TOP);
  imagen1 = loadImage("slide1.jpg");
  imagen2 = loadImage("slide2.jpg");
  imagen3 = loadImage("slide3.png");
  tiempo = 0;
  pantalla = -1; // Pantalla inicial
  diametro = width / 10;
  presentacionIniciada = false;
  textX = -width; // Inicializar fuera de la pantalla
  textY = height / 2;
}

void draw() {
  background(0);

  if (pantalla == -1) {
    // Pantalla inicial con botón para comenzar
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    image(fondo, 0, 0, width, height);
    text("Presentación de Rebelión en la Granja", width / 2, height / 3);
    textSize(24);
    text("Haga click para comenzar", width / 2, height / 2);
    return;
  }

  if (presentacionIniciada) {
    switch (pantalla) {
      case 0:
        mostrarSlide(imagen1, "Rebelión en la Granja es una novela escrita por George Orwell en 1945.");
        break;
      case 1:
        mostrarSlide(imagen2, "La historia es una alegoría de la Revolución Rusa y del régimen soviético.");
        break;
      case 2:
        mostrarSlide(imagen3, "Los personajes principales son los cerdos, quienes lideran la rebelión.");
        break;
      case 3:
        // Botón de reinicio
        background(50);
        textSize(32);
        textAlign(CENTER, CENTER);
        fill(255);
        text("Fin de la presentación", width / 2, height / 3);
        textSize(24);
        text("Haga click para reiniciar", width / 2, height / 2);
        return;
    }

    // Animar el cursor
    fill(255, 0, 0);
    noStroke();
    ellipse(mouseX, mouseY, 20, 20);

    tiempo++;
    if (tiempo >= 300) {
      tiempo = 0;
      pantalla++;
      textX = -width; // Reiniciar posición del texto para la siguiente slide
      if (pantalla > 3) {
        pantalla = 3;
      }
    }
  }
}

void mouseClicked() {
  if (pantalla == -1) {
    // Iniciar la presentación
    pantalla = 0;
    presentacionIniciada = true;
    tiempo = 0;
  } else if (pantalla == 3) {
    // Reiniciar la presentación
    pantalla = 0;
    tiempo = 0;
  }
}

void mostrarSlide(PImage img, String texto) {
  image(img, 0, 0, width, height);

  // Animación de entrada del texto
  textX += 5; // Velocidad de entrada del texto
  if (textX > 50) {
    textX = 50; // Fijar el texto en su posición final
  }

  fill(255);
  textSize(24);
  textAlign(LEFT, TOP);
  text(texto, textX, textY, width - 100, height - 100); // Ajustar el texto dentro de los márgenes
}
