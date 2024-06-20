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
public class DemoBarrio {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        Persona horacio = new Persona("horacio", 400, 40);
        Trabajador lucas = new Trabajador("lucas", 30, 22,"carpintero");
        
        System.out.println(horacio.toString());
        System.out.println(lucas.toString());
        
    }
    
}
