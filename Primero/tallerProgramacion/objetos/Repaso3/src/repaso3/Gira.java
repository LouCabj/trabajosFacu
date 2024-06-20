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
public class Gira extends Recital{
    
    private String nombreGira;
    private Fecha[] fechas;
    private int dimLFechas;
    private int proximaFecha;
    private int contadorProxFecha = 0;
    
    public Gira(String nombreBanda, int cantidadTemas, String nombreGira, int cantidadFechas) {
        
        super(nombreBanda, cantidadTemas);
        this.nombreGira = nombreGira;
        this.fechas = new Fecha[cantidadFechas];
        this.dimLFechas = 0;
        
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    
    public void agregarFecha(Fecha fecha){
        
        this.fechas[dimLFechas] = fecha;
        dimLFechas = dimLFechas + 1;
        
    }
    
    public void actuar() {
        this.proximaFecha = fechas[contadorProxFecha].getDia();
        System.out.println("Buenas Noches " + fechas[proximaFecha].getCiudad());
        for(int i = 0; i < super.getDimL(); i++) {
            System.out.println("Y ahora tocaremos " + super.mostrarTema(i));
        }
        contadorProxFecha = contadorProxFecha + 1;
    }
    
    
    public int calcularCosto() {
        
        int aux = 0;
        for(int i = 0; i < dimLFechas; i++){
            aux = aux + 30000;
        }
        
        return aux;
        
    }
    
    //LO QUE PUEDO HACER ES CREAR UN SET FECHA ACTUAL PARA LA PROXIMA FECHA ASI NO TIRA ERROR EL CONSTRUCTOR
}
