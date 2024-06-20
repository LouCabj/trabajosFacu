/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "5" + "="+ tabla2[5]);
        
        /*-----------------------*/
        
        int num = GeneradorAleatorio.generarInt(12);
        while(num != 11) {
            System.out.println("2x" + "num" + "=" + tabla2[num]);
            num = GeneradorAleatorio.generarInt(12);
        }
        
        
        /*------ejercicio2----------*/
        
       int corte = 15;
       double [] tabla3 = new double[corte];
       int j;
       
       for (j = 0; j <= corte; j++)
           tabla3[j] = Lector.leerDouble();
       
       double acumulador = 0;
       
       for(int f = 0; f <= corte; f++)
           acumulador = acumulador + tabla3[f];
       
        double promedio = acumulador/corte;
        System.out.println("La altura promedio es " + promedio);
        
        
       int cont = 0; 
       for(int a = 0; a <= corte; a++){
           if(tabla2[a] > promedio)
               cont = cont + 1;
        }       
        System.out.println("La cantidad de jugadores por encima del promedio es " + cont);
    }
    
}
