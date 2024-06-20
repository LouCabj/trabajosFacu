/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial1;

/**
 *
 * @author javie
 */
public class Estanteria {
    
    private Libro[][] estanteria;
    private int estantes;
    private int libros;
    
    public Estanteria(int estantes, int libros){
        
        this.estanteria = new Libro[estantes][libros]; //LA MATRIZ INICIALIZA TODOS SUS INDICES EN NULL AUTOMATICAMENTE.
        this.estantes = estantes;
        this.libros = libros;
    }
    
    
    public void agregarLibros(Libro libro, int n, int m ){
        
        estanteria[n][m] = libro;
        
    }
    
    
    public Libro sacarLibro(String titulo){
        
        int n = 0;
        int m = 0;
        boolean loEncontre = false;
        Libro libro = null;
        
        while((n < estantes) && !(loEncontre)){
            while((m < libros) &&!(loEncontre)){
                if(estanteria[n][m].getNombre().equals(titulo)){
                    loEncontre = true;
                    libro = estanteria[n][m];
                    estanteria[n][m] = null;
                }
                m++;
            }
            m = 0;
            n++;      
        }
        
        return libro;
    }
    
    public Libro libroPesado(){
        
        Libro libroMax = null;
        int pesoMaximo = -1;
        
        for(int n = 0; n < this.estantes; n++){
            for(int m = 0; m < this.libros; m++){
                if(estanteria[n][m].getPeso() >= pesoMaximo){
                    pesoMaximo = estanteria[n][m].getPeso();
                    libroMax = estanteria[n][m];
                }    
            }
        }
        
        return libroMax;
        
    }    
    
    
}
