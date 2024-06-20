/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso4;


public abstract class Coros {
    
    private String nombre;
    private Director director;
    
    
    public Coros(String nombre, Director director) {
        
        this.nombre = nombre;
        this.director = director;
    }
    
    
    public String toString() {
        
        String aux = this.nombre + ":";
        
        aux = aux + director.toString();
        
        return aux;
        
        
    }
    
    public abstract boolean estaLleno();
   
    public abstract void agregarCorista(Corista cor);
    
    public abstract boolean estaBienFormado();
}
