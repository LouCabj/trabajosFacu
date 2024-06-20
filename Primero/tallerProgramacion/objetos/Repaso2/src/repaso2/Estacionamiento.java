/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso2;

/**
 *
 * @author javie
 */
public class Estacionamiento {
    
    private String nombre;
    private String direccion;
    private String horaApertura;
    private String horaCierre;
    private int pisos;
    private int plazas;
    private Auto[][] autos;

    
    public Estacionamiento(String nombre, String direccion) {
        
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = "8:00";
        this.horaCierre = "21:00";
        this.pisos = 5;
        this.plazas = 10;
        autos = new Auto[pisos][plazas];
        
    }
    
    public Estacionamiento(String nombre, String direccion, String horaApertura, String horaCierre, int pisos, int plazas) {
        
        this.nombre = nombre;
        this.direccion = direccion;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.pisos = pisos;
        this.plazas = plazas;
        autos = new Auto[pisos][plazas];
        
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }

    
    public void registrarAuto(Auto a, int piso, int plaza) {
        
        this.autos[piso][plaza] = a;
        
    }
    
    public String obtenerLugar(String patente) {
        String aux = "Auto Inexistente";
        boolean loEncontre = false;
        int i = 0;
        int j = 0;
        
        while((i < pisos) && !(loEncontre)){
            
          while((j < plazas) && !(loEncontre)){
              
            if(autos[i][j].getPatente().equals(patente)){ 
                loEncontre = true;
                aux = "El auto se encuentra en el piso " + i + " plaza " + j;
            }
            j++;
              
          }
          if(j == plazas) {
              j = 0;
              i++;
          }
        }
        
        return aux; 
        
    }
    
    
    public int cantAutos(int plaza) {
        
        int aux = 0;
        
        for(int i = 0; i < pisos; i++) {
            if(autos[i][plaza] != null)
                aux = aux + 1;
        }
        
        return aux;
        
    }
    
    public String toString() {
        
        String aux = "Estacionamiento";
        
        for(int i = 0; i < this.pisos; i++) {
            for(int j = 0; j < this.plazas; j++){
                aux = aux + "Piso " + i + ", Plaza " + j;
                if(autos[i][j] != null)
                    aux = aux + autos[i][j].toString();
                else
                    aux = aux + ": Libre";
            }           
        }
        return aux;
        
    }
    
    
    
    
}
