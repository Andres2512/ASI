package modelo;

import java.sql.Date;

public class DTOProyecto {

    int Id_proyecto;
    float Costo;
    String Direccion;
    Date Fecha_incio;
    Date Fecha_fin;
    int Asignacion_recursos_idAsignacion_Recursos;
    int Ciudades_Id_ciudades;
    int Novedades_Id_novedades;
    int Estados_proyecto_Id_estado_proyecto;
    String asignacion;
    String Nombre;
    String estadoProyecto;
    String novedad;
    String Nombre_proyecto;

    public DTOProyecto() {
    }

    public DTOProyecto(int Id_proyecto, float Costo, String Direccion, Date Fecha_incio, Date Fecha_fin, int Asignacion_recursos_idAsignacion_Recursos, int Ciudades_Id_ciudades, int Novedades_Id_novedades, int Estados_proyecto_Id_estado_proyecto, String asignacion, String Nombre, String estadoProyecto, String novedad, String Nombre_proyecto) {
        this.Id_proyecto = Id_proyecto;
        this.Costo = Costo;
        this.Direccion = Direccion;
        this.Fecha_incio = Fecha_incio;
        this.Fecha_fin = Fecha_fin;
        this.Asignacion_recursos_idAsignacion_Recursos = Asignacion_recursos_idAsignacion_Recursos;
        this.Ciudades_Id_ciudades = Ciudades_Id_ciudades;
        this.Novedades_Id_novedades = Novedades_Id_novedades;
        this.Estados_proyecto_Id_estado_proyecto = Estados_proyecto_Id_estado_proyecto;
        this.asignacion = asignacion;
        this.Nombre = Nombre;
        this.estadoProyecto = estadoProyecto;
        this.novedad = novedad;
        this.Nombre_proyecto = Nombre_proyecto;
    }

    public int getId_proyecto() {
        return Id_proyecto;
    }

    public void setId_proyecto(int Id_proyecto) {
        this.Id_proyecto = Id_proyecto;
    }

    public float getCosto() {
        return Costo;
    }

    public void setCosto(float Costo) {
        this.Costo = Costo;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public Date getFecha_incio() {
        return Fecha_incio;
    }

    public void setFecha_incio(Date Fecha_incio) {
        this.Fecha_incio = Fecha_incio;
    }

    public Date getFecha_fin() {
        return Fecha_fin;
    }

    public void setFecha_fin(Date Fecha_fin) {
        this.Fecha_fin = Fecha_fin;
    }

    public int getAsignacion_recursos_idAsignacion_Recursos() {
        return Asignacion_recursos_idAsignacion_Recursos;
    }

    public void setAsignacion_recursos_idAsignacion_Recursos(int Asignacion_recursos_idAsignacion_Recursos) {
        this.Asignacion_recursos_idAsignacion_Recursos = Asignacion_recursos_idAsignacion_Recursos;
    }

    public int getCiudades_Id_ciudades() {
        return Ciudades_Id_ciudades;
    }

    public void setCiudades_Id_ciudades(int Ciudades_Id_ciudades) {
        this.Ciudades_Id_ciudades = Ciudades_Id_ciudades;
    }

    public int getNovedades_Id_novedades() {
        return Novedades_Id_novedades;
    }

    public void setNovedades_Id_novedades(int Novedades_Id_novedades) {
        this.Novedades_Id_novedades = Novedades_Id_novedades;
    }

    public int getEstados_proyecto_Id_estado_proyecto() {
        return Estados_proyecto_Id_estado_proyecto;
    }

    public void setEstados_proyecto_Id_estado_proyecto(int Estados_proyecto_Id_estado_proyecto) {
        this.Estados_proyecto_Id_estado_proyecto = Estados_proyecto_Id_estado_proyecto;
    }

    public String getAsignacion() {
        return asignacion;
    }

    public void setAsignacion(String asignacion) {
        this.asignacion = asignacion;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getEstadoProyecto() {
        return estadoProyecto;
    }

    public void setEstadoProyecto(String estadoProyecto) {
        this.estadoProyecto = estadoProyecto;
    }

    public String getNovedad() {
        return novedad;
    }

    public void setNovedad(String novedad) {
        this.novedad = novedad;
    }

    public String getNombre_proyecto() {
        return Nombre_proyecto;
    }

    public void setNombre_proyecto(String Nombre_proyecto) {
        this.Nombre_proyecto = Nombre_proyecto;
    }
    

}
