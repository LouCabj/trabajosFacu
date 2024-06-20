/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.Lector;

/**
 *
 * @author javie
 */
public class ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        
        Partido[] vPartido = new Partido[20];
        
        String nombreVisitante = Lector.leerString();
        int dimL = 0;
        
        
        while((dimL < 20) && !(nombreVisitante.equals("zzz"))){
            
            Partido p = new Partido();
            p.setVisitante(nombreVisitante);
            p.setLocal(Lector.leerString());
            p.setGolesLocal(Lector.leerInt());
            p.setGolesVisitante(Lector.leerInt());
            vPartido[dimL] = p;
            dimL++;
            nombreVisitante = Lector.leerString();
        }
        
        int contRiver = 0;
        int contBoca = 0;
        
        for(int i = 0; i < dimL; i++){
            
            if(vPartido[i].getLocal().equals("river")){
                if(vPartido[i].getGolesLocal() > vPartido[i].getGolesVisitante())
                    contRiver = contRiver + 1;
            } else if(vPartido[i].getVisitante().equals("river")){
                if(vPartido[i].getGolesVisitante() > vPartido[i].getGolesLocal())
                    contRiver = contRiver + 1;
            }
            
            if(vPartido[i].getLocal().equals("boca"))
                contBoca = contBoca + vPartido[i].getGolesLocal();
        }
        
    }
    
}
