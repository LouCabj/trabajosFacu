/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

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
        
        //CINCO CLIENTES
        //TIENEN QUE CALIFICAR DEL 1 AL 10
        //CUATRO ASPECTOS 
        
        
        //plantear hacer una matriz donde las filas sean los cinco clientes y cada columna la calificacion del aspecto
        
        int[][] calificaciones = new int[5 + 1][4];
        
        /*CARGAR LAS CALIFICACIONES*/
        
        for(int i = 1; i < 6; i++){
            for(int j = 0; i < 4; i++)
                calificaciones[i][j] = Lector.leerInt();
        }
        
        //SACAR EL PROMEDIO
        
        int cont = 0;
        double promedio;
        int aspectos = 4;
        
        for(int j = 0; j < aspectos; j++){
            for(int i = 1; i < 6; i++)
                cont = cont + calificaciones[i][j];
            promedio = cont / aspectos;
            System.out.println("El promedio del aspecto " + j + " es de " + promedio);
            cont = 0;
        }
        
    }
    
}
