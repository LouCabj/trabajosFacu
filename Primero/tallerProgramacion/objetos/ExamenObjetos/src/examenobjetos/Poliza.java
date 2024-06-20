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
public class Poliza {
    
    private double cuotaMensual;
    private double sumaAsegurada;
    private String tipoSeguro;
    private Cliente cliente;
    
    public Poliza(double cuotaMensual, double sumaAsegurada, String tipoSeguro, Cliente cliente){
        
        this.cuotaMensual = cuotaMensual;
        this.sumaAsegurada = sumaAsegurada;
        this.tipoSeguro = tipoSeguro;
        this.cliente = cliente;
        
    }
    
    
    public int getDniCliente(){
        
        return this.cliente.getDni();
        
    }
    
    public double getCuotaMensual(){
        
        return this.cuotaMensual;
    }
    
    
    
}
