import java.util.List;
import java.util.Collections;
import java.util.Arrays;

ArrayList<Edificio> edificios = new ArrayList<Edificio>();
int area_minima = 3000;
int tamanio_pantalla = 600;
int lados_edificios=3;
float mov = 0;
float altura = 0;
color color1 = #03045E;
color color2 = #0077B6;
color color3 = #00B4D8;
color color4 = #90E0EF;
color color5 = #CAF0F8;
color[] colores = new color[5];
void setup()
{
  colores[0] = #03045E;
  colores[1] = #0077B6;
  colores[2] = #00B4D8;
  colores[3] = #90E0EF;
  colores[4] = #CAF0F8;
  Integer[] intArray = { 0,1, 2, 3, 4};
  List<Integer> intList = Arrays.asList(intArray);
  Collections.shuffle(intList);
  intList.toArray(intArray);
  for(int i= 0; i<5;i++){
    color aux = colores[i];
    colores[i] = colores[intArray[i]];
    colores[intArray[i]] = aux;
  }
  size(500, 500,P3D);
  

  int division = int(random(10,50)); 
  lados_edificios = tamanio_pantalla/division;
   
  for(int i=0;i<division;i++){
    for(int j=0;j<division;j++){
       
      Edificio edificio = new Edificio(lados_edificios*i,lados_edificios*j);
      edificios.add(edificio);
    }
  }
  
  frameRate(10);
}

void draw()
{
   background(0,0,255);
   translate(-255,720);
   scale(1.9);
   rotateX(radians(-155));
   rotateY(radians(0));
   rotateZ(radians(0));
   directionalLight(51, 102, 126, 0 , 0, 1);
   ambientLight(51, 102, 126);
   edificios.forEach((edificio) -> {
        
        pushMatrix();
        altura = (sin((edificio.x+mov)*PI/8)*exp((edificio.y+5)/300)*50)+100; 
        stroke(0);
        if(altura>220){
          
          fill(colores[0]);
        }
        else if(altura>150){
          fill(colores[1]);
        }
        else if(altura>100){
          fill(colores[2]);
        }
        else if(altura>50){
          fill(colores[3]);
        }
        else {
          fill(colores[4]);
        }
        translate(edificio.x, edificio.y);
        box(lados_edificios, lados_edificios, altura);
        popMatrix();
    });
      if (mov>2000){
      mov = 0;
      }
      mov+= PI/4; 
 
}



 
