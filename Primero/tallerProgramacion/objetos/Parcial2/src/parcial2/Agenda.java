/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcial2;

/**
 *
 * @author javie
 */
public class Agenda {
    
    private Paciente[][] horarios;
    private int dias;
    private int turnos;
    
    
    public Agenda(){
        
        this.horarios = new Paciente[5][6];
        this.dias = 5;
        this.turnos = 6;
    }
    
    public void agregarPaciente(Paciente paciente, int d, int t){
        this.horarios[d][t] = paciente;
    }
    
    public void liberarPaciente(String paciente){
        for(int i = 0; i < dias; i++){
            for(int j = 0; j < turnos; j++){
                if(horarios[i][j].getNombre().equals(paciente))
                    horarios[i][j] = null;
            }
        }
    }
    
    
    public boolean tieneTurno(String paciente, int d){
        
    }
}
