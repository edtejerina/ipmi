
PImage berenjena;

void setup(){

  size(800, 400);
  background(255);
  berenjena = loadImage("berenjena.jpeg");
}


void draw(){


  background(134, 75, 151);
  image(berenjena, 0, 0, 400, 400);
  
  //Divisor inferior
  fill(140, 70, 140);
  rectMode(CORNER);
  rect(400, 318, 400, 90);
  
  //tallo
  stroke(92, 130, 22);
  strokeWeight(15);
  line(584, 77, 637, 39);
  
  
  //cuerpo principal
  noStroke();
  fill(28, 4, 28);
  ellipse(577, 219, 170, 300);
  ellipse(571, 250, 200, 260);
  
  //hojas
  fill(104, 130, 116);
  triangle(555, 76, 623, 89, 582, 121);
  triangle(592, 81, 631, 97, 619, 121);
  triangle(544, 81, 587, 74, 557, 106);
  triangle(537, 86, 553, 86, 528, 106);
  triangle(620, 101, 636, 105, 635, 121);
  triangle(526, 96, 532, 91, 534, 100);
  triangle(577, 72, 526, 96, 634, 102);
  ellipse(559, 84, 27,20);
  ellipse(570, 76, 27,15);
  ellipse(591, 79, 27,15);
  ellipse(607, 89, 27,15);
  ellipse(582, 77, 27,15);
  ellipse(601, 83, 27,15);
  ellipse(545, 87, 15,15);
  ellipse(536, 93, 10,10);
  ellipse(621, 95, 10, 10);
  ellipse(630, 106, 10, 10);

  //parte superior del tallo
  rectMode(CENTER);
  fill(72, 41, 23);
  rect(635, 40, 20, 24, 28);
}
