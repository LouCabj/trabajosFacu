/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author javie
 */
public class DemoHotel {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Hotel trivago = new Hotel(5);
        
        Cliente cliente1 = new Cliente("Lucas", 400, 22);
        Cliente cliente2 = new Cliente("Horacio", 011, 89);
        Cliente cliente3 = new Cliente("Oscar", 39, 200);
        Cliente cliente4 = new Cliente("Mariano", 19, 109);
        Cliente cliente5 = new Cliente("Lautaro", 39, 391);
        
        Cliente cliente6 = new Cliente("Pablo", 19, 108);
        
        trivago.agregarCliente(cliente1, 0);
        trivago.agregarCliente(cliente2, 1);
        trivago.agregarCliente(cliente3, 2);
        trivago.agregarCliente(cliente4, 3);
        trivago.agregarCliente(cliente5, 4);
        
        
      //  trivago.agregarCliente(cliente6, 5);
        
       
    //    System.out.println(trivago.toString());
        
    }
    
}
