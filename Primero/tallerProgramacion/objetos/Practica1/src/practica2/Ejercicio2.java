/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author javie
 */
public class Ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        //CARGA DEL VECTOR
        
        Persona[] vector = new Persona[15];
        
        GeneradorAleatorio.iniciar();
        int edad = GeneradorAleatorio.generarInt(99);
        int dimL = 0;
        
        while((edad != 0) && (dimL < 15)){
            Persona p = new Persona();
            p.setEdad(edad);
            p.setDNI(GeneradorAleatorio.generarInt(4000));
            p.setNombre(GeneradorAleatorio.generarString(20));
            vector[dimL] = p;
            dimL++;
            edad = GeneradorAleatorio.generarInt(99);
        }
        
        //INCISO A Y B
        
        int contEdad = 0;
        int dniMax = -1;
        Persona pMax = new Persona();
        
        for(int i = 0; i < dimL; i++) {
            
            if(vector[i].getEdad() > 65)
                contEdad = contEdad + 1;
            if(vector[i].getDNI()> dniMax) {
                dniMax = vector[i].getDNI();
                pMax = vector[i];
            }   
            
        }
        
        System.out.println("La cantidad de personas con edad mayor a 65 son " + contEdad);
        System.out.println("La pèrsona con mayor dni es " + pMax.toString());
        
    }
    
}
