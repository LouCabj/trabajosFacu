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
public class Entrenador extends Empleado {
    
    private int campeonatosGanados;
    
    public Entrenador(String nombre, double sueldoBasico, int antigüedad, int campeonatosGanados){
        
        super(nombre, sueldoBasico, antigüedad);
        this.campeonatosGanados = campeonatosGanados;
        
    }
    
    public double calcularEfectividad() {
        
       double aux = getAntigüedad() / this.campeonatosGanados;
       return aux;
        
    }
    
    public double calcularSueldoACobrar() {
        
        double aux = super.calcularSueldoACobrar();
        
        if(this.campeonatosGanados > 1) {
            if(this.campeonatosGanados <= 4)
                aux = aux + 5000;
            else if((this.campeonatosGanados >= 5) && (this.campeonatosGanados <= 10))
                aux = aux + 30000;
            else
                aux = aux + 50000;
        
        }
        
        return aux;
        
    }
    
    public String toString() {
        
        return super.toString();
        
    }
    
}
