package modelo;

public class DTOListarusuario {

    int id_usuario;
    String nombre;
    String apellido;
    String celular;
    int telefono;
    String correo;
    String direccion;
    String rol;
    String ciudad;
    int id_proyecto;

    public DTOListarusuario(int id_usuario, String nombre, String apellido, String celular, int telefono, String correo, String direccion, String rol, String ciudad, int id_proyecto) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.celular = celular;
        this.telefono = telefono;
        this.correo = correo;
        this.direccion = direccion;
        this.rol = rol;
        this.ciudad = ciudad;
        this.id_proyecto = id_proyecto;
    }

    public DTOListarusuario() {
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(int id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

}
