/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso1;

/**
 *
 * @author javie
 */
public class Demo1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        Proyecto pro = new Proyecto("Zero", 2, "Horacio Guarani");
        
        Investigador inv1 = new Investigador("Lucas Marchetta", 3, "Algebra");
        Investigador inv2 = new Investigador("Sofia Macagno", 2, "Sociologia");
        Investigador inv3 = new Investigador("Pablo Ortiz", 1, "Hidraulica");
        
        pro.agregarInvestigador(inv1);
        pro.agregarInvestigador(inv2);
        pro.agregarInvestigador(inv3);
        
        Subsidio sub1 = new Subsidio(300, "Investigacion");
        Subsidio sub2 = new Subsidio(200, "Objetivos cumplidos");
        
        Subsidio sub3 = new Subsidio(400, "Avances");
        Subsidio sub4 = new Subsidio(500,"Organizacion");
        
        Subsidio sub5 = new Subsidio(800, "Acuarelas");
        Subsidio sub6 = new Subsidio(150, "Herramientas");
        /*---------------------------*/
        
        inv1.agregarSubsidio(sub1);
        inv1.agregarSubsidio(sub2);
        
        inv2.agregarSubsidio(sub3);
        inv2.agregarSubsidio(sub4);
        
        inv3.agregarSubsidio(sub5);
        inv3.agregarSubsidio(sub6);
        
        pro.otorgarSubsidio("Lucas Marchetta");
        
        
        System.out.println(pro.toString());
        
        
    }
    
}
