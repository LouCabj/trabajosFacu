/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso4;

/**
 *
 * @author javie
 */
public class Corista {
    
    private String nombre;
    private int dni;
    private int edad;
    private int tonoFundamental;
    
    public Corista() {
        
    }
    
    public Corista(String nombre,int dni, int edad, int tonoFundamental){
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.tonoFundamental = tonoFundamental;
    }

    public int getTonoFundamental() {
        return tonoFundamental;
    }

    public String toString() {
        return "nombre: " + nombre + ", dni: " + dni + ", edad: " + edad + ", tonoFundamental: " + tonoFundamental;
    }
    
    
    
}
