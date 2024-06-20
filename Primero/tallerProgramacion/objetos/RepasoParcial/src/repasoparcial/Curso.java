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
public class Curso {
    
    private String descripcion;
    private Turno turnoOnline;
    private Turno turnoPresencial;
    
    
    public Curso(String descripcion, Turno turnoOnline, Turno turnoPresencial){
        
        this.descripcion = descripcion;
        this.turnoOnline = turnoOnline;
        this.turnoPresencial = turnoPresencial;
        
        
    }
    
    public void agregarAlumno(Alumno alumno){
        if(alumno.getLugarResidencia().equals("La plata"))
            turnoPresencial.agregar(alumno);
        else
            turnoOnline.agregar(alumno);
    }
    
    public double gananciaNeta(){
        double aux = 0;
        aux = aux + turnoPresencial.gananciaNeta() + turnoOnline.gananciaNeta();
        return aux;
    }
    
    
    public String toString(){
        String aux = "";
        aux = aux + this.descripcion;
        aux = aux + "El curso tiene una ganancia mensual neta de " + this.gananciaNeta();
        aux = aux + turnoOnline.toString();
        aux = aux + " Mientras que el turno presencial: " + turnoPresencial.toString();
        
        return aux;
    }
    
    public boolean esRentable(){
        boolean aux;
        if(gananciaNeta() > 800000)
            aux = true;
        else
            aux = false;
        
        return aux;
    }
}
