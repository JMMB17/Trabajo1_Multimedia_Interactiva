void setup() {
  size(1000, 1000, P3D);
  background(0);
  img=loadImage("mi Imagen.png");
  
}
PImage img;
float angle = 0;
void draw() {
  print(frameRate+"\n");
  pushMatrix();
  
  translate(width/2, height/2);
  rotate(frameCount*0.012);
  image(img, -img.width/2+35, -img.height/2);  // dibuja la imagen en el centro
  angle += 1;  // incrementa el ángulo para la siguiente rotación
  popMatrix();
}
