/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso3;

/**
 *
 * @author javie
 */
public class Fecha {
    
   private String ciudad;
   private int dia;
   
    public Fecha() {
        
        
    }
    
    public Fecha(String ciudad, int dia) {
        
        this.ciudad = ciudad;
        this.dia = dia;
        
    }
   
    public int getDia() {
        return dia;
    }

    public String getCiudad() {
        return ciudad;
    }
   
   
   
}
