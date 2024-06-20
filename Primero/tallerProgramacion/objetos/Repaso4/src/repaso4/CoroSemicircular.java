 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso4;

/**
 *
 * @author javie
 */
public class CoroSemicircular extends Coros{
 
    private Corista[] coristas;
    private int dimF;
    private int dimL;
    
    
    public CoroSemicircular(String nombre,Director director, int dimF) {
        
        super(nombre,director);
        this.coristas = new Corista[dimF];
        this.dimF = dimF;
        this.dimL = 0;
        
    }
    
    public void agregarCorista(Corista cor) {
        if(dimL < this.dimF)
            coristas[dimL] = cor;
        this.dimL++;
    }
    
    
    public boolean estaLleno(){
        
        boolean aux;
        if(this.dimL == this.dimF)
            aux = true;
        else
            aux = false;
        
        return aux;
        
    }
    
    public boolean estaBienFormado(){
        
        boolean aux;
        int i = 0;
        boolean estaOrdenado = true;
        
        while((i < dimL) && (estaOrdenado)) {
            if(i + 1 < dimL){
                if(!(coristas[i].getTonoFundamental() > coristas[i+1].getTonoFundamental()))
                    estaOrdenado = false;
            }
            i++;
        }
        
        aux = estaOrdenado;
        return aux;
    }
    
    public String toString() {
        
        String aux = super.toString();
        
        for(int i = 0; i < dimL; i++) {
            aux = aux + "Corista " + i + ": " + coristas[i].toString();
        }
        return aux;     
    }
}
