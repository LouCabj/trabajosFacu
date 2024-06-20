/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso1;

/**
 *
 * @author javie
 */
public class Subsidio {
    
    private double montoPedido;
    private String motivo;
    private boolean estaOtorgado = false;
    
    public Subsidio(double montoPedido, String motivo) {
        
        this.montoPedido = montoPedido;
        this.motivo = motivo;
        
    }
    
    public boolean isEstaOtorgado() {
        return estaOtorgado;
    }

    
    
    public double getMontoPedido() {
        return montoPedido;
    }

    private void setEstaOtorgado(boolean estaOtorgado) {
        this.estaOtorgado = estaOtorgado;
    }
    
    public void otorgar() {
        setEstaOtorgado(true);
    }
    
    
    
}
