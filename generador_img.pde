import processing.opengl.*;
import java.util.Map;

void setup() {
  
  size(1070, 1000,P3D);
  frameRate(60);
  
}
HashMap<Integer,int[][]> colors = new HashMap<Integer,int[][]>();
int[][] backgroud = {{23, 11, 50}};
int[][] p1 = {{147, 84, 118},{110, 79, 115}};
int[][] p2 = {{86, 243, 196}, {255, 200, 200}};
int[][] p3 = {{108, 164, 172}, {108, 131, 133}};
int[][] p4 = {{236, 224, 209}, {165, 61, 14}};
int[][] p5 = {{255, 135, 136}, {140, 175, 85}};

int paleta = (int)random(1, 6);
int indexColor1 = (int)random(0,2);
int indexColor2 = indexColor1 == 1 ? 0 : 1;
   
void draw() {
  colors.put(0, backgroud);
  colors.put(1, p1); //paleta 1
  colors.put(2, p2); //paleta 2
  colors.put(3, p3); //paleta 3
  colors.put(4, p4); //paleta 4
  colors.put(5, p5); //paleta 5
  background(colors.get(0)[0][0],colors.get(0)[0][1],colors.get(0)[0][2]);

  noFill();
  int centro = 0;
  float radio = 50;
  float radioAuxiliar = 20;
  float multiplicadorRuido = 0;
  float anchoPuntos = 1.3;
  for (float i = 0;i < 900*PI; i += PI/200) {
    pushMatrix();
    translate(500, 500);
    
    strokeWeight(anchoPuntos);
    point(centro+radio*cos(i)+(noise(i)*multiplicadorRuido), centro+radio*sin(i)+(noise(i)*multiplicadorRuido));
    
    if (radio <= 62 ){
      stroke(colors.get(paleta)[indexColor2][0],colors.get(paleta)[indexColor2][1],colors.get(paleta)[indexColor2][2]);
      if (i % 20*PI < 0.01){
        radio+= 2;
      }
    }else if (radio <= 80){
      stroke(colors.get(paleta)[indexColor1][0],colors.get(paleta)[indexColor1][1],colors.get(paleta)[indexColor1][2]);
      if (i % 20*PI < 0.01){
        radio+= 3;
        anchoPuntos = 1.2;
      }
    }else if (radio <= 110){
      stroke(colors.get(paleta)[indexColor2][0],colors.get(paleta)[indexColor2][1],colors.get(paleta)[indexColor2][2]);
      if (i % 20*PI < 0.03){
        radio+= 2;
        anchoPuntos = 1.9;
      }
    }else if (radio <= 160){
      stroke(colors.get(paleta)[indexColor1][0],colors.get(paleta)[indexColor1][1],colors.get(paleta)[indexColor1][2]);
      if (i % 20*PI < 0.03){
        radio+= 8;
        anchoPuntos = 2.5;
      }
    }else if (radio == 168.0){
      stroke(colors.get(paleta)[indexColor2][0],colors.get(paleta)[indexColor2][1],colors.get(paleta)[indexColor2][2]);
      radio += radioAuxiliar;
      multiplicadorRuido = 15;
      anchoPuntos = 1;
    }else if (radio < 200){
      stroke(colors.get(paleta)[indexColor1][0],colors.get(paleta)[indexColor1][1],colors.get(paleta)[indexColor1][2]);
      centro = -8;
      if (i % 20*PI < 0.03){
        radio+= 6;
        multiplicadorRuido += 2.3;
        if (anchoPuntos >= 0.2) anchoPuntos -= 0.05;
      }
    }else if(radio < 220){
      stroke(colors.get(paleta)[indexColor2][0],colors.get(paleta)[indexColor2][1],colors.get(paleta)[indexColor2][2]);
      if (i % 20*PI < 0.03){
        radio+= 3;
        multiplicadorRuido = 15.3;
        anchoPuntos = 2.3;
      }
    }else if(radio < 280){
      stroke(colors.get(paleta)[indexColor1][0],colors.get(paleta)[indexColor1][1],colors.get(paleta)[indexColor1][2]);
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
      stroke(colors.get(paleta)[indexColor2][0],colors.get(paleta)[indexColor2][1],colors.get(paleta)[indexColor2][2]);
      centro = -14;
      if (i % 20*PI < 0.03){
        radio+= 3;
        multiplicadorRuido = 15.3;
        anchoPuntos = 2.5;
      }
    }else{
      stroke(colors.get(paleta)[indexColor1][0],colors.get(paleta)[indexColor1][1],colors.get(paleta)[indexColor1][2]);
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
