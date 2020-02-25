package entidades;

import java.util.ArrayList;

public class Grupo {
    
    private Integer numero;
    private String codigo_curso;
    private Integer numero_ciclo;
    private String horario;
    private String cedula_profesor;
    private ArrayList<Alumno> estudiantes;

    public Grupo() {
        this.numero = 0;
        this.codigo_curso = "";
        this.numero_ciclo = 0;
        this.horario = "";
        this.cedula_profesor = "";
        this.estudiantes = new ArrayList<Alumno>();
    }

    public Grupo(Integer numero, String codigo_curso, Integer numero_ciclo, String horario, String cedula_profesor, ArrayList<Alumno> estudiantes) {
        this.numero = numero;
        this.codigo_curso = codigo_curso;
        this.numero_ciclo = numero_ciclo;
        this.horario = horario;
        this.cedula_profesor = cedula_profesor;
        this.estudiantes = estudiantes;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public String getCodigo_curso() {
        return codigo_curso;
    }

    public void setCodigo_curso(String codigo_curso) {
        this.codigo_curso = codigo_curso;
    }

    public Integer getNumero_ciclo() {
        return numero_ciclo;
    }

    public void setNumero_ciclo(Integer numero_ciclo) {
        this.numero_ciclo = numero_ciclo;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getCedula_profesor() {
        return cedula_profesor;
    }

    public void setCedula_profesor(String cedula_profesor) {
        this.cedula_profesor = cedula_profesor;
    }

    public ArrayList<Alumno> getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(ArrayList<Alumno> estudiantes) {
        this.estudiantes = estudiantes;
    }

    
    @Override
    public String toString() {
        return "Grupo{" + "codigo_curso=" + codigo_curso +  ", no_ciclo=" + numero_ciclo + '}';
    }   
}
