/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

public class VisorMainFiguras {
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();

        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");

        visor.guardarFigura(c1);
        visor.guardarFigura(r);
        visor.guardarFigura(c2);
        
        System.out.println(visor.mostrar());

        System.out.println(visor.getGuardadas());
        
    }
}    
    