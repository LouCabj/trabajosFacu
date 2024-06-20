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
public class Estante {
    
    private Libro[] vector = new Libro[20];
    private int dimL = 0;
    
    public Estante(){
        
        
    }
    
    public int devolverCantLibros() {
        
        return this.dimL;
        
    }
    
    public boolean estaLleno() {
        
        boolean aux;
        
        if(this.dimL == 20)
            aux = true;
        else
            aux = false;
        
        return aux;
    }
    
    public void agregarLibro(Libro unLibro) {
        
        if(this.dimL < 20) {
            this.vector[this.dimL] = unLibro;
            dimL = dimL + 1;
        } else
            System.out.println("ESTANTE LLENO");
        
    }
    
    public Libro devolverLibro(String titulo){
        boolean loEncontre = false;
        int i = 0;
        Libro aux = null;
        while((i < dimL) && !(loEncontre)) {
            if(vector[i].getTitulo().equals(titulo))
                loEncontre = true;
                aux = vector[i];
            i++;
        }
        return aux;
    }
    
    
    
}
