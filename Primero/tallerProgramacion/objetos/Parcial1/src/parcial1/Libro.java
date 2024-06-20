/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author javie
 */
public class Libro {
    
    private String nombre;
    private String autor;
    private int peso;
    
    public Libro(String nombre, String autor, int peso){
        this.nombre = nombre;
        this.autor = autor;
        this.peso = peso;
    }

    public String getNombre() {
        return nombre;
    }

    public int getPeso() {
        return peso;
    }
    
    public String toString(){
        String aux = "Libro: ";
        aux = aux + this.nombre + ", autor: " + this.autor + " y su peso es " + this.peso;
        return aux;
    }
}
