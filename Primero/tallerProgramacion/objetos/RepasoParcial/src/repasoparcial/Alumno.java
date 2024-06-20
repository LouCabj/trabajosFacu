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
public class Alumno {
    
    private int dni;
    private String nombre;
    private String lugarResidencia;
    
    public Alumno(int dni, String nombre, String lugarResidencia){
        this.dni = dni;
        this.nombre = nombre;
        this.lugarResidencia = lugarResidencia;
    }

    public String getLugarResidencia() {
        return lugarResidencia;
    }
    
    public String toString(){
        String aux = "El alumno de nombre " + nombre + " cuyo dni es " + dni + " vive en " + lugarResidencia;
        return aux;
    }
    
}
