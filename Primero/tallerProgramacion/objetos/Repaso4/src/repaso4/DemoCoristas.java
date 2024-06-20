/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso4;

/**
 *
 * @author javie
 */
public class DemoCoristas {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Director director = new Director("Oscar Navarro", 40000, 60, 23);
        Director director2 = new Director("Marcos Aurelio", 300, 23, 3);
        
        CoroHileras coroHileras = new CoroHileras("Mayonesa",director, 3, 3);
        CoroSemicircular coroSemicircular = new CoroSemicircular("Mayo Frances",director2, 10);
        
        //Coristas para el de hileras, serian nueve
        Corista cor1 = new Corista("Lucas Marchetta", 200, 20, 2);
        Corista cor2 = new Corista("Matias Guzman", 300, 21, 3);
        Corista cor3 = new Corista("Pablo Marquez", 4044, 23, 4);
        Corista cor4 = new Corista("Lula Pullisic", 30000, 40, 5);
        
        //SE TESTEA PRIMERO SI FUNCIONA EL DE SI ESTA LLENO
        
        coroHileras.agregarCorista(cor1);
        coroHileras.agregarCorista(cor2);
        coroHileras.agregarCorista(cor3);
        coroHileras.agregarCorista(cor4);
        
        Corista cor5 = new Corista("Paulino Perez", 40000, 50, 6);
        Corista cor6 = new Corista("Rodrigo Eguillor", 400000, 70, 7);
        Corista cor7 = new Corista("Luciano Perez", 50000, 54, 8);
        Corista cor8 = new Corista("Luciano Machado", 70000, 55, 9);
        Corista cor9 = new Corista("Paulo Machado", 200, 20, 10);
        
        coroHileras.agregarCorista(cor5);
        coroHileras.agregarCorista(cor6);
        coroHileras.agregarCorista(cor7);
        coroHileras.agregarCorista(cor8);
        
        coroHileras.agregarCorista(cor9);
        
        
        System.out.println(coroHileras.estaLleno());
        
        
        
        
    }
    
}
