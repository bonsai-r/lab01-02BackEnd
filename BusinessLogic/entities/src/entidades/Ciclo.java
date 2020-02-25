package entidades;

public class Ciclo {

    private Integer numero;
    private Integer anio;
    private String fecha_inicio;
    private String fecha_finalizacion;
  
    public Ciclo() {
        anio = 0;
        numero = 0;
        fecha_inicio = "";
        fecha_finalizacion = "";
    }

    public Ciclo(Integer numero, Integer anio, String fecha_inicio, String fecha_finalizacion) {
        this.numero = numero;
        this.anio = anio;
        this.fecha_inicio = fecha_inicio;
        this.fecha_finalizacion = fecha_finalizacion;
    }

    public Integer getNumero() {
        return numero;
    }

    public void setNumero(Integer numero) {
        this.numero = numero;
    }

    public Integer getAnio() {
        return anio;
    }

    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_finalizacion() {
        return fecha_finalizacion;
    }

    public void setFecha_finalizacion(String fecha_finalizacion) {
        this.fecha_finalizacion = fecha_finalizacion;
    }

    

    @Override
    public String toString() {
        return "Ciclo{ anio=" + anio + ", numero=" + numero + ", fecha_inicio=" + fecha_inicio + ", fecha_fin=" + fecha_finalizacion + '}';
    }
}
