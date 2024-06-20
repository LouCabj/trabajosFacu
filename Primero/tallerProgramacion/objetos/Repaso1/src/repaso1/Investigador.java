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
public class Investigador {
    
    private String nombre;
    private int categoria;
    private String especialidad;
    private int dimL;
    private Subsidio[] subsidios = new Subsidio[5];
    
    
    public Investigador(String nombre, int categoria, String especialidad) {
        
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.dimL = 0;
        
    }

    public String getNombre() {
        return nombre;
    }
    
    
    
    
    public double montoSubsidios(){
        
        double aux = 0;
        for(int i = 0; i < dimL; i++){
            if(subsidios[i].isEstaOtorgado() == true)
                aux = aux + subsidios[i].getMontoPedido();
        }
        return aux;
    }
    
    public void agregarSubsidio(Subsidio sub) {
        //LOS INDICES DE LOS VECTORES HAN SIDO INICIALIZADOS AUTOMATICAMENTE EN NULL AL MOMENTO DE SU CREACION
        if(this.dimL < 5) {
            subsidios[dimL] = sub;
            dimL++;
        }  
    }
    
    public void otorgarSubsidios() {
        
        for(int i = 0; i < dimL; i++) 
           subsidios[i].otorgar();
    }
    
    
    public String toString() {
        
        String aux = "{Nombre " + this.nombre  + ", categoria " + this.categoria + ", especialidad: " + this.especialidad +
                     "Dinero otorgado: " + montoSubsidios() + "}";
        
        return aux;
    }
    
    
}
