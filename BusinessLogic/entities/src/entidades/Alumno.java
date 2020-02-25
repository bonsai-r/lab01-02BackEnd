package entidades;

import java.util.ArrayList;

public class Alumno {
    
    private String cedula;
    private String nombre;
    private String telefono;
    private String email;
    private String codigo_carrera;
    private ArrayList<Grupo> grupos;

    public Alumno(String cedula, String nombre, String telefono, String email, String codigo_carrera, ArrayList<Grupo> grupos ) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
        this.codigo_carrera = codigo_carrera;
        this.grupos = grupos; 
    }

    public Alumno() {
        this.cedula = "";
        this.nombre = "";
        this.telefono = "";
        this.email = "";
        this.codigo_carrera = "";
        this.grupos = new ArrayList<Grupo>(); 
    }

    public ArrayList getGrupos() {
        return grupos;
    }

    public void setGrupos(ArrayList Grupos) {
        this.grupos = Grupos;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCodigo_carrera() {
        return codigo_carrera;
    }

    public void setCodigo_carrera(String codigo_carrera) {
        this.codigo_carrera = codigo_carrera;
    }
    
    @Override
    public String toString() {
        return "Alumno{" + "cedula=" + cedula+ ", nombre=" + nombre + ", telefono=" + telefono + ", email=" + email +  ", carrera=" + codigo_carrera + '}';
    }
}
