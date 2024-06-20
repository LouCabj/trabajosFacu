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
public class DemoClub {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Jugador messi = new Jugador("Messi", 30000, 30, 40, 20);
        Entrenador mou = new Entrenador("Mourinho", 10000, 10, 2);
        
        
        
        System.out.println(messi.toString());
        System.out.println(mou.toString());
    }
    
}
