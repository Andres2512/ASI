package modelo;

public class DTOCotizacion {

    int Id_cotizacion;
    String Fecha_cotizacion;
    String nombreMaterial;
    String Descripcion;
    int cantidad;
    Float valorUnitario;
    float Valor_total;
    int idProyecto;
    int valorFinalId;
    
    public DTOCotizacion() {

    }

    public DTOCotizacion(String Fecha_cotizacion, String nombreMaterial, String Descripcion, int cantidad, Float valorUnitario, float Valor_total) {
        this.Fecha_cotizacion = Fecha_cotizacion;
        this.nombreMaterial = nombreMaterial;
        this.Descripcion = Descripcion;
        this.cantidad = cantidad;
        this.valorUnitario = valorUnitario;
        this.Valor_total = Valor_total;
    }

    public int getValorFinalId() {
        return valorFinalId;
    }

    public void setValorFinalId(int valorFinalId) {
        this.valorFinalId = valorFinalId;
    }

    public int getId_cotizacion() {
        return Id_cotizacion;
    }

    public void setId_cotizacion(int Id_cotizacion) {
        this.Id_cotizacion = Id_cotizacion;
    }

    public String getFecha_cotizacion() {
        return Fecha_cotizacion;
    }

    public void setFecha_cotizacion(String Fecha_cotizacion) {
        this.Fecha_cotizacion = Fecha_cotizacion;
    }

    public String getNombreMaterial() {
        return nombreMaterial;
    }

    public void setNombreMaterial(String nombreMaterial) {
        this.nombreMaterial = nombreMaterial;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Float getValorUnitario() {
        return valorUnitario;
    }

    public void setValorUnitario(Float valorUnitario) {
        this.valorUnitario = valorUnitario;
    }

    public float getValor_total() {
        return Valor_total;
    }

    public void setValor_total(float Valor_total) {
        this.Valor_total = Valor_total;
    }

    public int getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(int idProyecto) {
        this.idProyecto = idProyecto;
    }
}
