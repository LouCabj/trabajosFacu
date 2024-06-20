/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author javie
 */
public class ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        
        //Numero de filas 8 y 4 columnas
        
     int edificio[][] = new int[8 + 1][4 + 1];
     
     /*INICIALIZAR MATRIZ EN 0*/
     
     for(int i = 1; i < 9; i++){
         for(int j = 1; j < 5; j++)
             edificio[i][j] = 0;
     }    
         
     
     /*LLEGADA DE PERSONAS*/
     
     int oficina = 1 + GeneradorAleatorio.generarInt(4);
     int piso = 1 + GeneradorAleatorio.generarInt(9); 
     
     while(piso != 9){
         edificio[piso][oficina] = edificio[piso][oficina] + 1;
         oficina = 1 + GeneradorAleatorio.generarInt(4);            //EN EL INCISO UNO PUEDE SUPONER QUE EN REALIDAD SE ESTA PIDIENDO QUE SE USE EL LECTOR
         piso = 1 + GeneradorAleatorio.generarInt(9);
     }
     
     
     /*INFORMAR LAS PERSONAS EN CADA OFICINA*/
     
     for(int i = 1; i < 9; i++){
        for(int j = 1; j < 5; j++)
            System.out.println("La cantidad de personas que asistieron al piso " + i + " oficina " + j + " fueron " + edificio[i][j]);
    }
     
     
        
        
    }
    
}
