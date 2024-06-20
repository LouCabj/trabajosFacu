/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author javie
 */
public class Paciente {
    
    private String nombre;
    private boolean tieneObraSocial;
    private double costoSesion;
    
    
    public Paciente(String nombre, boolean tieneObraSocial, double costoSesion){
        this.nombre = nombre;
        this.tieneObraSocial = tieneObraSocial;
        this.costoSesion = costoSesion;
    }

    public String getNombre() {
        return nombre;
    }
    
    
    
    
}
