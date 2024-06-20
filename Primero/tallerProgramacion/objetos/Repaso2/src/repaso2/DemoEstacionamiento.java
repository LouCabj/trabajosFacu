/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso2;

/**
 *
 * @author javie
 */
public class DemoEstacionamiento {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Estacionamiento est = new Estacionamiento("AutoPark", "Villa Luzuriaga 393", "10:00", "21:00", 3, 3);
        
        Auto auto1 = new Auto("Lucas Marchetta", "AAA");
        Auto auto2 = new Auto("Marcos Aurelio", "BBB");
        Auto auto3 = new Auto("Rodrigo Gomez", "CCC");
        Auto auto4 = new Auto("Lucas Gomez", "DDD");
        Auto auto5 = new Auto("Matias Oscar", "EEE");
        Auto auto6 = new Auto("Paulino Ortiz", "FFF");
        
        est.registrarAuto(auto1, 0, 0);
        est.registrarAuto(auto2, 0, 1);
        est.registrarAuto(auto3, 0, 2);
        
        est.registrarAuto(auto4, 2, 0);
        est.registrarAuto(auto5, 2, 1);
        est.registrarAuto(auto6, 2, 2);
        
        System.out.println(est.cantAutos(2));
        System.out.println(est.toString());
        
    }
    
}
