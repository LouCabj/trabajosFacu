/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repasoparcial;

/**
 *
 * @author javie
 */
public class Turno {
    
    private String nombreDocente;
    private double sueldoDocente;
    private double cuota;
    private Alumno[] alumnos;
    private int dimL = 0;
    
    
    public Turno(int capacidad, String nombreDocente, double sueldoDocente, double cuota){
      
        this.alumnos = new Alumno[capacidad];
        this.dimL = 0;
        this.nombreDocente = nombreDocente;
        this.cuota = cuota;
        this.sueldoDocente = sueldoDocente;
        
    }
    
    public void agregar(Alumno alumno){
        this.alumnos[dimL] = alumno;
        this.dimL = this.dimL + 1;
    }
    
    public double gananciaNeta(){
        double aux = 0;
            aux = aux + ((dimL * cuota) - sueldoDocente);
        return aux;
    }
    
    public String toString(){
        String aux = "";
        for(int i = 0; i < dimL; i++){
            aux = aux + "Alumno " + i;
            aux = aux + alumnos[i].toString();
        }
        return aux;
    }
}
