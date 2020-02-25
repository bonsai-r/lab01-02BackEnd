package entidades;

public class Carrera {
    
    private String codigo;
    private String nombre;
    private String titulo;

    public Carrera() {
        codigo = new String();
        nombre = new String();
        titulo = new String();
    }

    public Carrera(String codigo_carrera, String nombre, String titulo) {
        this.codigo = codigo_carrera;
        this.nombre = nombre;
        this.titulo = titulo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo_carrera) {
        this.codigo = codigo_carrera;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    @Override
    public String toString() {
        return "Carrera{" + "codigo=" + codigo + ", nombre=" + nombre + ", titulo=" + titulo + '}';
    }
}
