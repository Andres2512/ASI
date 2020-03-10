
package modelo;

import java.sql.Date;

public class DTORecursos {
   int idAsignacion_Recursos;
   Date Fecha;
   String Cantidad;
   String Observaciones;

    public DTORecursos() {
    }

    public DTORecursos(int idAsignacion_Recursos, Date Fecha, String Cantidad, String Observaciones) {
        this.idAsignacion_Recursos = idAsignacion_Recursos;
        this.Fecha = Fecha;
        this.Cantidad = Cantidad;
        this.Observaciones = Observaciones;
    }

    public int getIdAsignacion_Recursos() {
        return idAsignacion_Recursos;
    }

    public void setIdAsignacion_Recursos(int idAsignacion_Recursos) {
        this.idAsignacion_Recursos = idAsignacion_Recursos;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getObservaciones() {
        return Observaciones;
    }

    public void setObservaciones(String Observaciones) {
        this.Observaciones = Observaciones;
    }
   
   
}
