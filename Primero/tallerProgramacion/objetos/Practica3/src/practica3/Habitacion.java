/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author javie
 */
public class Habitacion {
        
    private double costoNoche;
    private boolean estaOcupado;
    private Cliente cliente;
    
    public Habitacion(){
        
        this.costoNoche = GeneradorAleatorio.generarInt(6000 + 2000); //PREGUNTAR EL GENERADOR ALEATORIO ENTRE RANGOS
        this.estaOcupado = false;
        
    }

    public double getCostoNoche() {
        return costoNoche;
    }

    public void setCostoNoche(double costoNoche) {
        this.costoNoche = costoNoche;
    }

    public boolean isEstaOcupado() {
        return estaOcupado;
    }
    
    
    public void setEstaOcupado(boolean estaOcupado) {
        this.estaOcupado = estaOcupado;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Cliente getCliente() {
        return cliente;
    }
    
    
    
    
    
    
    
}
