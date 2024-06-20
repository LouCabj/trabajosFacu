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
public class Director {
    
    private String nombre;
    private int dni;
    private int edad;
    private int antiguedad;
    
    public Director(){
        
    }

    public Director(String nombre, int dni, int edad, int antiguedad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    public String toString() {
        return "Director: " +  nombre + " , dni " + dni + ", edad: " + edad + ", antiguedad: " + antiguedad + " años.";
    }
    
    
    
}
