/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4;

/**
 *
 * @author javie
 */
public class Trabajador extends Persona{
    
    private String labor;
    
    
    public Trabajador() {
        
        
    }
    
    public Trabajador(String nombre, int dni, int edad, String labor){
        
        super(nombre, dni, edad);
        this.labor = labor;
        
    }

    public String getLabor() {
        return labor;
    }

    public void setLabor(String labor) {
        this.labor = labor;
    }
    
    
    public String toString() {
        
        return super.toString() + "Soy " + getLabor();
        
    }
    
    
    
  
}
