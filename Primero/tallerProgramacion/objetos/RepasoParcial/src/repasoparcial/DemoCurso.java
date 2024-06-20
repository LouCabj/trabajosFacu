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
public class DemoCurso {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Turno turnoO = new Turno(4,"Martin Cavalieri", 300000, 50000);
        Turno turnoP = new Turno(4,"Horacio Guarani", 400000, 70000);
        
        Alumno alum1 = new Alumno(40000, "Lucas", "Quilmes");
        Alumno alum2 = new Alumno(50000, "Matias", "La plata");
        Alumno alum3 = new Alumno(60000, "Horacio", "Villa Luro");
        Alumno alum4 = new Alumno (400345, "Esteban", "La plata");
        
        Alumno alum5 = new Alumno(100002, "Mateo", "Ezpeleta");
        Alumno alum6 = new Alumno(101110, "Luka", "La plata");
        Alumno alum7 = new Alumno(100000, "Stuart", "Avellaneda");
        
        
        Curso cur = new Curso("Manualidades", turnoO, turnoP);
        
        
        cur.agregarAlumno(alum1);
        cur.agregarAlumno(alum2);
        cur.agregarAlumno(alum3);
        cur.agregarAlumno(alum4);
        cur.agregarAlumno(alum5);
        cur.agregarAlumno(alum6);
        cur.agregarAlumno(alum7);
        
        
        System.out.println(cur.toString());
    }
    
}
