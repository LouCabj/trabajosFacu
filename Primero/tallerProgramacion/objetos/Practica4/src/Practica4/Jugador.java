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
public class Jugador extends Empleado{
    
    private int partidosJugados;
    private int golesAnotados;
    
    
    
    public Jugador(String nombre, double sueldoBasico, int antigüedad, int partidosJugados, int golesAnotados) {
    
        super(nombre, sueldoBasico, antigüedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }
    
    public double calcularEfectividad() {
        
        int aux = this.partidosJugados / this.golesAnotados;
        return aux;
        
    }
    
    public double calcularSueldoACobrar() {
        
       double aux = super.calcularSueldoACobrar();
        
       if(calcularEfectividad() > 0.5)
             aux = aux + getSueldoBasico();
      
       return aux;
            
    }
    
    public String toString() {
        return super.toString();
    }
}
