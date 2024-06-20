/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examenobjetos;

/**
 *
 * @author javie
 */
public class Cliente {
    
    private String nombre;
    private String apellido;
    private int dni;
    
    public Cliente(String nombre,String apellido,int dni){
        
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        
    }

    public int getDni() {
        return dni;
    }
    
    
    
    
    
}
