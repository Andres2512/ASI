
package modelo;

import java.sql.Date;

public class DTONovedades {
    int Id_novedades;
    Date Fecha;
    String Novedades;
    String Observaciones;
    int Tipo_novedad_Id_tipo_novedad;

    public DTONovedades() {
    }

    public DTONovedades(int Id_novedades, Date Fecha, String Novedades, String Observaciones, int Tipo_novedad_Id_tipo_novedad) {
        this.Id_novedades = Id_novedades;
        this.Fecha = Fecha;
        this.Novedades = Novedades;
        this.Observaciones = Observaciones;
        this.Tipo_novedad_Id_tipo_novedad = Tipo_novedad_Id_tipo_novedad;
    }

    public int getId_novedades() {
        return Id_novedades;
    }

    public void setId_novedades(int Id_novedades) {
        this.Id_novedades = Id_novedades;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public String getNovedades() {
        return Novedades;
    }

    public void setNovedades(String Novedades) {
        this.Novedades = Novedades;
    }

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }

    public int getTipo_novedad_Id_tipo_novedad() {
        return Tipo_novedad_Id_tipo_novedad;
    }

    public void setTipo_novedad_Id_tipo_novedad(int Tipo_novedad_Id_tipo_novedad) {
        this.Tipo_novedad_Id_tipo_novedad = Tipo_novedad_Id_tipo_novedad;
    }
    
    
}
