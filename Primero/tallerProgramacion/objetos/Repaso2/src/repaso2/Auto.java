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
public class Auto {
    
    private String nombreDueño;
    private String patente;
    
    public Auto() {
        
        
        
    }
    
    public Auto(String nombreDueño, String patente) {
        
        this.nombreDueño = nombreDueño;
        this.patente = patente;
        
    }

    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "nombreDue\u00f1o=" + nombreDueño + ", patente=" + patente + '}';
    }
    
    
    
    
}
