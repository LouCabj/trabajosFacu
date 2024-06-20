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
 * @author Alumno
 */
public class ejercicio3 {
    
    public static void main(String[] args) {
        int matriz[][] = new int[5][5];
    
        
        /*INICIALIZAR MATRIZ*/
        for(int i = 0; i <= 4; i++){
            for(int j = 0; j <= 4; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
        }
        
        /*TRABAJAR CON LA MATRIZ*/
        
        int cont = 0;
        int contDos = 0;
        int[] sumaJ = new int [5];
        
        for(int i = 0; i <= 4; i++){
            for(int j = 0; j <= 4; j++){
                cont = cont + matriz[i][j];
                contDos = contDos + matriz[j][i];
                System.out.println(matriz[i][j]);
            }
            sumaJ[i] = contDos;
            System.out.println("FILA ESCRITA");
            System.out.println("El contenido de la fila uno suma " + cont);
        }
        
        for(int i = 0; i<=4; i++)
            System.out.println(sumaJ[i]);
        
        
        /*INCISO ULTIMO*/
        
        int i = 0;
        int j = 0;
        boolean loEncontre = false;
        int fila = 0;
        int columna = 0;
        int numBuscar;
        
        numBuscar = Lector.leerInt();
        
        while(i <= 4 && !loEncontre){
            while(j <= 4 && !loEncontre){
                if(matriz[i][j] == numBuscar){
                    loEncontre = true;
                    fila = i;
                    columna = j;
                    j++;
                }    
            }
            i++;
        }
        
        if(!loEncontre)
            System.out.println("NO SE ENCONTRO EL ELEMENTO");
        else
            System.out.println("El elemento se encuentra en la fila " + fila + " columna " + columna);
    }
    
    
    
}
