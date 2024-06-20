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
public class CoroHileras extends Coros {
    
    private Corista[][] coristas;
    private int i;
    private int j;
    private int dimI;
    private int dimJ;
    
    public CoroHileras(String nombre,Director director, int i, int j) {
        
        super(nombre,director);
        this.coristas = new Corista[i][j];
        this.i = i;
        this.j = j;
        this.dimI = 0;
        this.dimJ = 0;
        
    }
    
    public void agregarCorista(Corista cor){
        
        
        if(dimI < this.i) 
            coristas[dimI][dimJ] = cor;
        else
            System.out.println("Esta lleno el coro");
        if(dimJ + 1 < this.j){
            dimJ++;
        }else{
            dimJ = 0;
            dimI++;
            }
        }        
    
    public boolean estaLleno(){
        
        boolean aux;
        
        if(coristas[this.i - 1][this.j - 1] != null)
            aux = true;
        else
            aux = false;
        
        return aux;
        
    }
    
    public boolean estaBienFormado(){ //LA CONSIGNA DICE QUE SE PRESUPONE LLENO
        
        boolean aux;
        boolean estaOrdenado = true;
        int a = 0;
        int b = 0;
        
        //SE PRESUPONE QUE LA COLUMNA ES LA LLAMADA HILERA [i] [j]
        
        
            
        while((a + 1 < this.j) && (estaOrdenado)) {
                   if(!(coristas[0][a].getTonoFundamental() > coristas[0][a + 1].getTonoFundamental()))
                       estaOrdenado = false;                    
            while((b + 1 < this.i) && (estaOrdenado)) {
                    if (!(coristas[b][a].getTonoFundamental() == coristas[b+1][a].getTonoFundamental()))
                        estaOrdenado = false;         
               }
               b++;
            b = 0;
            a++; 
        }    
           
        aux = estaOrdenado;
        return aux;
        
    }
    
    public String toString(){
        
        int a = 0;
        int b = 0;
        
        String aux = super.toString();
        while(a < this.i){
            while(b < this.j){
                aux = aux + "corista: " + coristas[a][b].toString(); //por que un while?
                b++;
            }
            b = 0;
            a++;
        }
        
        return aux;
        
    }
    

}



