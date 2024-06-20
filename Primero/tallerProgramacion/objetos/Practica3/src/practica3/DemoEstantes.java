/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author javie
 */
public class DemoEstantes {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Estante estante = new Estante();
        
        Autor autor1 = new Autor("Hernan Garcia");
        Autor autor2 = new Autor("Sofia Macagno");
        Autor autor3 = new Autor("Horacio Bermudez");
        
        
        Libro libro1 = new Libro("Perfume", "Ed Rodriguez", autor1, "1");
        Libro libro2 = new Libro("Mujercitas", "Ed Marchetta", autor2, "2");
        Libro libro3 = new Libro("La esquina", "Ed Rodriguez", autor3, "3");
        Libro libro4 = new Libro("Orzuelo", "Ed Marchetta", autor1, "4");
        Libro libro5 = new Libro("Criminal", "Ed Marchetta", autor3,"5");
        
        estante.agregarLibro(libro1);
        estante.agregarLibro(libro2);
        estante.agregarLibro(libro3);
        estante.agregarLibro(libro4);
        estante.agregarLibro(libro5);
        
        System.out.println(estante.devolverLibro("Mujercitas"));;
        
        EstanteDos estanteDos = new EstanteDos(13);
        
        
    }
    
}
