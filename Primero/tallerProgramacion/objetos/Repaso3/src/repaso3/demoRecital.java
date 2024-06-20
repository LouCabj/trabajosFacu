/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso3;

/**
 *
 * @author javie
 */
public class demoRecital {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        EventoOcasional eve = new EventoOcasional("Iron Weasel", 10, "Show de tv", "Lucas Marchetta", 20);
        Gira gira = new Gira("Rata Blanca", 12, "Fin del mundo", 4);
        
        //4 FECHAS para la gira
        
        Fecha fecha1 = new Fecha("Quilmes", 10);
        Fecha fecha2 = new Fecha("Miami", 23);
        Fecha fecha3 = new Fecha("San Nicolas", 24);
        Fecha fecha4 = new Fecha("Ushuaia", 30);
        
        gira.agregarFecha(fecha1);
        gira.agregarFecha(fecha2);
        gira.agregarFecha(fecha3);
        gira.agregarFecha(fecha4);
        
        gira.agregarTema("Hada y Mago");
        gira.agregarTema("Circulo del Fuego");
        gira.agregarTema("Mujer amante");
        gira.agregarTema("Solo para amarte");
        
        eve.agregarTema("Pull my finger");
        eve.agregarTema("Rock");
        eve.agregarTema("Tractor");
        
        System.out.println(eve.calcularCosto());
        System.out.println(gira.calcularCosto());
        
        eve.actuar();
        gira.actuar();
    }
    
}
