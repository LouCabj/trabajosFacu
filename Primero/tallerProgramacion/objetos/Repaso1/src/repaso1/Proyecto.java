/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso1;

/**
 *
 * @author javie
 */
public class Proyecto {
    
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private int dimL;
    private Investigador[] investigadores = new Investigador[50];
    
    
    
    public Proyecto(String nombre, int codigo, String nombreDirector) {
        
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        this.dimL = 0;
    }
    
    public void agregarInvestigador(Investigador inv) {
         
      if(dimL < 50) {
          investigadores[dimL] = inv;
          dimL++;
      }
    }
    
    public double dineroTotalOtorgado() {
        
        double aux = 0;
                
        for(int i = 0; i < dimL; i++) {
            aux = aux + investigadores[i].montoSubsidios();
        }
        return aux;
        
    }
    
    public void otorgarSubsidio(String nombre) {
        
        boolean loEncontre = false;
        int i = 0;
        
        while((i < dimL) && (loEncontre == false)) {
            
            if(investigadores[i].getNombre().equals(nombre)){
                loEncontre = true;
                investigadores[i].otorgarSubsidios();
            }
            i++;
                
        }
        
    }
    
    
    public String toString() {
        
        String aux = "Nombre del proyecto: " + this.nombre + ", director: " + this.nombreDirector + 
                      ", codigo: " + this.codigo + ", dinero total del proyecto: " + dineroTotalOtorgado();
        
        for(int i = 0; i < dimL; i++) {
            
            aux = aux + "Investigador " + i + investigadores[i].toString();
            
        }
        
        return aux;
                      
        
    }
    
    
    
    
}
