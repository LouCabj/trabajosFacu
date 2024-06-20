/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author javie
 */
public class Triangulo extends Figura {
    
    private int lado1;
    private int lado2;
    private int base;
    private int altura;
    
    public Triangulo(String unCR, String unCL, int lado1, int lado2, int base, int altura){
        
       super(unCR,unCL);
       this.lado1 = lado1;
       this.lado2 = lado2;
       this.base = base;
       this.altura = altura;
        
    }
    
    public double calcularPerimetro() {
        double aux = this.lado1 + this.lado2 + this.base;
        return aux;
    }
    
    public double calcularArea() {
        double aux = this.base * this.altura;
        return aux;
    }
    
    public String toString() {
        
       String aux = super.toString() + "Perimetro: " + this.calcularPerimetro();
       return aux;
    }
    
    
}
