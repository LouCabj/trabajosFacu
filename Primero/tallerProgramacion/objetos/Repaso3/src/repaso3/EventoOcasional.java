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
public class EventoOcasional extends Recital {
    
    private String motivo;
    private String contratante;
    private int diaEvento;
    
    public EventoOcasional(String nombreBanda, int cantidadFechas, String motivo, String contratante, int diaEvento) {
        
       super(nombreBanda, cantidadFechas);
       this.motivo = motivo;
       this.contratante = contratante;
       this.diaEvento = diaEvento;
        
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratante() {
        return contratante;
    }

    public void setContratante(String contratante) {
        this.contratante = contratante;
    }

    public void setDiaEvento(int diaEvento) {
        this.diaEvento = diaEvento;
    }
    
    
    
    public void actuar() {
        
        if(motivo == "Show de beneficiencia") {
            System.out.println("Recuerden colaborar con " + getContratante());
        }else if(motivo == "Show de tv") {
            System.out.println("Saludos amigos televidentes");
        }else if(motivo == "Show privado")
            System.out.println("Un feliz cumpleaños para " + getContratante());
        
        
        super.actuar();
    }
    
    public int calcularCosto(){
        
        int aux = 0;
        if(this.motivo == "Show de tv")
            aux = 50000;
        else if(this.motivo == "150000")
            aux = 150000;
        
        return aux;
    }
}
