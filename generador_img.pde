import processing.opengl.*;

void setup() {
  
  size(1070, 1000,P3D);
  frameRate(60);
}

int[][] colors = {{23, 11, 50},{147, 84, 118},{110, 79, 115}};
int indexColor1 = 0; 
int indexColor2 = 1;

void draw() {
  background(colors[0][0],colors[0][1],colors[0][2]);
  noFill();
  int centro = 0;
  float radio = 50;
  float radioAuxiliar = 20;
  float multiplicadorRuido = 0;
  float anchoPuntos = 1.3;
  
  if(frameCount % 15 == 0){
    indexColor1 = (int)random(0,2);
    if (indexColor1 == 0){
      indexColor2 = 1;
    }else{
      indexColor2 = 0;
    }
    
  }
  
  for (float i = 0;i < 900*PI; i += PI/200) {
    pushMatrix();
    translate(500, 500);
    //rotate(frameCount*0.15);
    
    
    strokeWeight(anchoPuntos);
    point(centro+radio*cos(i)+(noise(i)*multiplicadorRuido), centro+radio*sin(i)+(noise(i)*multiplicadorRuido));
    
    if (radio <= 62 ){
      stroke(colors[2][0],colors[2][1],colors[2][2]);
      if (i % 20*PI < 0.01){
        radio+= 2;
      }
    }else if (radio <= 80){
      stroke(colors[1][0],colors[1][1],colors[1][2]);
      if (i % 20*PI < 0.01){
        radio+= 3;
        anchoPuntos = 1.2;
      }
    }else if (radio <= 110){
      stroke(colors[2][0],colors[2][1],colors[2][2]);
      if (i % 20*PI < 0.03){
        radio+= 2;
        anchoPuntos = 1.9;
      }
    }else if (radio <= 160){
      stroke(colors[1][0],colors[1][1],colors[1][2]);
      if (i % 20*PI < 0.03){
        radio+= 8;
        anchoPuntos = 2.5;
      }
    }else if (radio == 168.0){
      stroke(colors[2][0],colors[2][1],colors[2][2]);
      radio += radioAuxiliar;
      multiplicadorRuido = 15;
      anchoPuntos = 1;
    }else if (radio < 200){
      stroke(colors[1][0],colors[1][1],colors[1][2]);
      centro = -8;
      if (i % 20*PI < 0.03){
        radio+= 6;
        multiplicadorRuido += 2.3;
        if (anchoPuntos >= 0.2) anchoPuntos -= 0.05;
      }
    }else if(radio < 220){
      stroke(colors[2][0],colors[2][1],colors[2][2]);
      if (i % 20*PI < 0.03){
        radio+= 3;
        multiplicadorRuido = 15.3;
        anchoPuntos = 2.3;
      }
    }else if(radio < 280){
      stroke(colors[1][0],colors[1][1],colors[1][2]);
      centro = -22;
      if(radio < 223) anchoPuntos = 2.2;
      
      if (i % 20*PI < 0.03){
        radio += 12;
        multiplicadorRuido += 5;
        if (anchoPuntos >= 0.2){
          anchoPuntos -= 0.05;
        }
      }
    }else if(radio < 295){
      stroke(colors[2][0],colors[2][1],colors[2][2]);
      centro = -14;
      if (i % 20*PI < 0.03){
        radio+= 3;
        multiplicadorRuido = 15.3;
        anchoPuntos = 2.5;
      }
    }else{
      stroke(colors[1][0],colors[1][1],colors[1][2]);
      centro = -22;
      if(radio < 298) anchoPuntos = 1.95;
      
      if (i % 20*PI < 0.03){
        radio += 12;
        multiplicadorRuido += 5;
        if (anchoPuntos >= 0.2){
          anchoPuntos -= 0.05;
        }
      }
    }
    popMatrix();
  }
  save("mi Imagen.png");
  
} 
