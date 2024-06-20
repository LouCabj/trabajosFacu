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
public class Ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Persona[][] m = new Persona[5][8];
        
     //CREAMOS UN VECTOR DE DIAS PARA VER SI HAY DISPONIBILIDAD
        int[] vDias = new int[5];
        
        //inicializar vector
        
        for(int i = 0; i < 5; i++)
            vDias[i] = 0;
        
        
        int dimL = 0;
        int dia;
     //ESTA BIEN USADO EL NOMBRE?   
        String nombre = Lector.leerString();
        
        //CREACION DE LA MATRIZ
        
        while((dimL < 40) && !(nombre.equals("zzz"))) {
            
            Persona p = new Persona();
            p.setDNI(Lector.leerInt());
            p.setEdad(Lector.leerInt());
            p.setNombre(nombre);
            
            System.out.println("¿Qué día quiere sacar turno?");
            dia = Lector.leerInt();
            
            if(vDias[dia] < 8) {
                m[dia][vDias[dia]] = p;
                vDias[dia] = vDias[dia] + 1;   
            } else
                System.out.println("No hay mas turnos disponibles en ese dia");
            
            dimL = dimL + 1;
        }
        
        //RECORRER LA MATRIZ
        int cont = 0;
        int i2 = 0;
        int j2 = 0;
        
        while(cont < dimL){
            System.out.println("La persona del turno " + j2 + " , dia " + i2 + " es " + m[i2][j2].getNombre());
            j2++;
            cont++;
            if(j2 == 8) {
                j2 = 0;
                i2++;
            }
        }
        
    }
    
}
