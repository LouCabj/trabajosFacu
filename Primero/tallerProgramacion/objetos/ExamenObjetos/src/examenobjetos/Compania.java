/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package examenobjetos;

/**
 *
 * @author javie
 */
public class Compania {
    
    private Poliza[][] polizas;
    private int[] dimL;
    
    
    public Compania(int cantidad){
        
        this.polizas = new Poliza[25][cantidad];
        for(int i = 0; i < 25; i++)
            dimL[i] = 0;
        
    }
    
    
    
    public void agregarPoliza(int año, Poliza pol){
        
        polizas[año][dimL[año]] = pol;
        
    }
    
    
    public int cantPolizas(int año, int dni){
        
        int aux = 0;
        for(int i = 0; i < dimL[año]; i++){
            
            if(polizas[año][dimL[año]].getDniCliente() == dni)
                aux = aux + 1;
            
        }
        
        return aux;
        
        
    }
    
    public int añoMayorPolizas(String tipo){
        
        int añoMayor = 0;
        int cant = 0;
        int max = -1;
        
        for(int i = 0; i < 25; i++){
            for(int j = 0; j < dimL[i]; j++){
                if(polizas[i][j].equals(tipo))
                    cant = cant + 1;
            }
            if(cant >= max){
                añoMayor = i;
                max = cant;
            }
            
            cant = 0;
        }
        
        return añoMayor;
        
        
    }
    
    
    public String toString(double cuotaMensual){
        
        String aux = "";
        for(int i = 0; i < 25; i++){
            for(int j = 0; j < dimL[i]; j++){
                if(polizas[i][j].getCuotaMensual() >= cuotaMensual)
                    aux = aux + polizas[i][j].toString();
            }
        }
        
        return aux;
        
    }
    
}
