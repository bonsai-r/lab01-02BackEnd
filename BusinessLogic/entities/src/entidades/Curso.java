package entidades;

public class Curso {
    
    private String codigo;
    private String codigo_carrera;
    private String nombre;
    private Integer creditos;
    private Integer horas_semanales;

    public Curso() {
        codigo = new String();
        codigo_carrera = new String();
        nombre = new String();
        creditos = 1;
        horas_semanales = 1;
    }

    public Curso(String codigo_curso, String codigo_carrera, String nombre, Integer creditos, Integer horas_semanales) {
        this.codigo = codigo_curso;
        this.codigo_carrera = codigo_carrera;
        this.nombre = nombre;
        this.creditos = creditos;
        this.horas_semanales = horas_semanales;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo_curso) {
        this.codigo = codigo_curso;
    }

    public String getCodigo_carrera() {
        return codigo_carrera;
    }

    public void setCodigo_carrera(String codigo_carrera) {
        this.codigo_carrera = codigo_carrera;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getCreditos() {
        return creditos;
    }

    public void setCreditos(Integer creditos) {
        this.creditos = creditos;
    }

    public Integer getHoras_semanales() {
        return horas_semanales;
    }

    public void setHoras_semanales(Integer horas_semanales) {
        this.horas_semanales = horas_semanales;
    }

    @Override
    public String toString() {
        return "Curso{" + "codigo_curso=" + codigo + ", codigo_carrera=" + codigo_carrera + ", nombre=" + nombre + ", creditos=" + creditos + ", horas_semanales=" + horas_semanales + '}';
    }   
}
