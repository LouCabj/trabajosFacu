/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso3;

/**
 *
 * @author javie
 */
public abstract class Recital {
    
    private String nombreBanda;
    private String[] temas;
    private int dimL;
    
    public Recital(String nombreBanda, int cantidadTemas) {
        
        this.nombreBanda = nombreBanda;
        this.temas = new String[cantidadTemas];
        this.dimL = 0;
    }

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getDimL() {
        return dimL;
    }
    
    
    
    public String mostrarTema(int i) {
        
        return this.temas[i];
        
    }
    
    public void agregarTema(String tema) {
        
        temas[dimL] = tema;
        this.dimL = this.dimL + 1;
    }
    
    public void actuar() {
        
        for(int i = 0; i < dimL; i++){
            System.out.println("Y ahora tocaremos " + mostrarTema(i));
        }
        
    }
    
    public abstract int calcularCosto();
    
    
    
}
