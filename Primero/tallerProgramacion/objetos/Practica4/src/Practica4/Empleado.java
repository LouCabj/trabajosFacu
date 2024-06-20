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
public abstract class Empleado  {
    
    private String nombre;
    private double sueldoBasico;
    private int antigüedad;

    public Empleado(String nombre, double sueldoBasico, int antigüedad){    
        setNombre(nombre);
        setSueldoBasico(sueldoBasico);
        setAntigüedad(antigüedad);
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntigüedad() {
        return antigüedad;
    }

    public void setAntigüedad(int antigüedad) {
        this.antigüedad = antigüedad;
    }
   
    
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar() {
        
        double plus = (getSueldoBasico() * 10) / 100;
        double aux = getSueldoBasico() + plus * getAntigüedad();
        return aux;
        
    }

    public String toString() {
        return "Empleado: " + this.getNombre() + ", sueldo a cobrar: " + calcularSueldoACobrar() + ", efectividad: " + calcularEfectividad();
    }
    
    
    
}
