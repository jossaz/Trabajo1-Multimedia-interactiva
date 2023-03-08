public class Edificio
{
  public int x;
  public int y;
  public int altura_1;
  public int altura_actual;
  public int altura_2;
  public int estado;
  public color colorEdificio;
  
  public Edificio(int x, int y,color colorEdificio)
  {
    this.x=x;
    this.y=y;
    altura_1 = int(random(10, 120));
    altura_2 = int(random(altura_1+2, 700));
    altura_actual = int(random(altura_1+1,altura_2-1));
    this.colorEdificio= colorEdificio;
    estado = int(random(0,1));
    
  }
  
  public void modificar_altura(){
    //crecimiento
    if(estado == 1){
      if(altura_actual>altura_2){
        estado = 0;
        altura_actual-=int(random(1,15));
      }else{
        altura_actual+=int(random(1,15));
      }
      
    }//Decrecimiento
    else{
      if(altura_actual < altura_1){
        estado = 1;
        altura_actual+=int(random(1,15));
      }else{
        altura_actual-=int(random(1,15));
      }
    }
  }
  
  
}
