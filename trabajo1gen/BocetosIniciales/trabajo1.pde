int OFF_MAX = 1200;
ArrayList<Edificio> edificios = new ArrayList<Edificio>();
int area_minima = 3000;
int tamanio_pantalla = 600;
int lados_edificios=3;

void setup()
{
  color color1 = #DCE6EC;
  color color2 = #852D87;
  color color3 = #354291;
  color color4 = #E98726;
  color color5 = #D92F30;
  color randomColor = color(0,0,0);
  size(500, 500,P3D);
  
  directionalLight(255, 255, 255, -1, 1, 0);
  ambientLight(200, 200, 200);
  int division = int(random(10,25)); 
  lados_edificios = tamanio_pantalla/division;
   
  for(int i=0;i<division;i++){
    for(int j=0;j<division;j++){
       switch(int(random(5))) {
        case 0: 
          randomColor = color1;
          break;
        case 1: 
          randomColor = color2;
          break;
        case 2: 
          randomColor = color3;
          break;
        case 3: 
          randomColor = color4;
          break;
        case 4: 
          randomColor = color5;
          break;
}
      Edificio edificio = new Edificio(lados_edificios*i,lados_edificios*j,randomColor);
      edificios.add(edificio);
    }
  }
  
  frameRate(20);
}

void draw()
{
   translate(50,100);
   background(234,226,183);
   rotateX(radians(30));
   rotateY(radians(0));
   rotateZ(radians(0));
   scale(0.7);
   edificios.forEach((edificio) -> {
        pushMatrix();
        stroke(0);
        fill(edificio.colorEdificio);
        translate(edificio.x, edificio.y);
        edificio.modificar_altura();
        box(lados_edificios, lados_edificios, edificio.altura_actual);
        popMatrix();
    });
       

}



 
