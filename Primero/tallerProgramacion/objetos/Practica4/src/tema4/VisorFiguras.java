/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author javie
 */

   public class VisorFiguras {
    
    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura[] vector;

     public VisorFiguras(){
        
         this.vector = new Figura[5];
         this.guardadas = 0;
         
    }
     
    public void guardarFigura(Figura f) {
        
        if(quedaEspacio()) {
            vector[guardadas] = f;
            guardadas++;
        }  
    }
    
    public boolean quedaEspacio() {
        boolean aux = false;
        if(guardadas < capacidadMaxima)
            aux = true;
        
        return aux;
    }
     
    public String mostrar(){
        
        String aux = " ";
        
        for(int i = 0; i < guardadas; i++) {
            
             aux = aux + "; " + vector[i].toString();
            
        }
        
        return aux;
    }
    
    
    public int getGuardadas() {
        return guardadas;
    }    
}
