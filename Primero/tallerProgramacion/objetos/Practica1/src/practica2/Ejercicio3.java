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
public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Persona[][] m = new Persona[5][8];
        
        int i = 0;
        int j = 0;
        int dimL = 0;
     //ESTA BIEN USADO EL NOMBRE?   
        String nombre = Lector.leerString();
        
        //CREACION DE LA MATRIZ
        
        while((i < 5) && !(nombre.equals("zzz"))) {
            Persona p = new Persona();
            p.setDNI(Lector.leerInt());
            p.setEdad(Lector.leerInt());
            p.setNombre(nombre);
            m[i][j] = p;
            j++;
            dimL = dimL + 1;
            if(j == 8) {
                i++;
                j = 0;
            }    
        }
        
        //RECORRER LA MATRIZ
        int cont = 0;
        int i2 = 0;
        int j2 = 0;
        
        while(cont < dimL){
            System.out.println("La persona del turno " + j + " , dia " + i + " es " + m[i2][j2].getNombre());
            j2++;
            cont++;
            if(j2 == 8) {
                j2 = 0;
                i2++;
            }
        }
        
    }
    
}
