/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author javie
 */
public class Hotel {
    
    private Habitacion[] habitaciones;
    private int capacidad;
    
    public Hotel(int capacidad){
        
        this.habitaciones = new Habitacion[capacidad];
        this.capacidad = capacidad;
        
    }
    
    public void agregarCliente(Cliente c, int x){
        
        Habitacion habitacion = new Habitacion();
        habitacion.setCliente(c);
        habitacion.setEstaOcupado(true);
        habitaciones[x] = habitacion;
        
        
    }
    
    public void aumentarCosto(double costo) {
        
        for(int i = 0; i < capacidad; i++)
            habitaciones[i].setCostoNoche(habitaciones[i].getCostoNoche() + costo);
        
    }

 
    
    String aux = "Hotel";
    
    public String toString() {
        
        for(int i = 0; i < capacidad ; i++) {
            
            aux = aux + "{Habitacion " + i + " costo: " + habitaciones[i].getCostoNoche() + " , ";
            if(habitaciones[i].isEstaOcupado())
                aux = aux + " ocupado " + habitaciones[i].getCliente();
            else
                aux = aux + " libre";
            
        }
        return aux;
        
    }

    
    
    
    
    
    
    
    

    
    
    
    
    
    
}
