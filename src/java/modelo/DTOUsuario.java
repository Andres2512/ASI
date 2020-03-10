//agrego los metodos un constructor vacio para inicializar el valor de un objeto, el const. con parametros. luego entrada y salida de datos (get y set) 
package modelo;
//obviamente las variables :)
public class DTOUsuario {

    int Id_usuario;
    String Nombres;
    String Apellidos;
    String Numero_celular;
    int Numero_telefono;
    String Correo;
    String Direccion;
    int Roles_Id_roles;
    int Ciudades_Id_ciudades;
    int Proyecto_Id_proyecto;
    String Contrasenia;

    public DTOUsuario() {
    }
    public DTOUsuario(String Correo, String Contrasenia) {
        this.Correo = Correo;
        this.Contrasenia = Contrasenia;
    }

    public DTOUsuario(String Nombres, String Apellidos, String Numero_celular, int Numero_telefono, String Correo, String Direccion) {
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.Numero_celular = Numero_celular;
        this.Numero_telefono = Numero_telefono;
        this.Correo = Correo;
        this.Direccion = Direccion;
    }

    public DTOUsuario(int Id_usuario, String Nombres, String Apellidos, String Numero_celular, int Numero_telefono, String Correo, String Direccion, int Roles_Id_roles, int Ciudades_Id_ciudades, int Proyecto_Id_proyecto, String Contrasenia) {
        this.Id_usuario = Id_usuario;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.Numero_celular = Numero_celular;
        this.Numero_telefono = Numero_telefono;
        this.Correo = Correo;
        this.Direccion = Direccion;
        this.Roles_Id_roles = Roles_Id_roles;
        this.Ciudades_Id_ciudades = Ciudades_Id_ciudades;
        this.Proyecto_Id_proyecto = Proyecto_Id_proyecto;
        this.Contrasenia = Contrasenia;
    }

    public int getId_usuario() {
        return Id_usuario;
    }

    public void setId_usuario(int Id_usuario) {
        this.Id_usuario = Id_usuario;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getNumero_celular() {
        return Numero_celular;
    }

    public void setNumero_celular(String Numero_celular) {
        this.Numero_celular = Numero_celular;
    }

    public int getNumero_telefono() {
        return Numero_telefono;
    }

    public void setNumero_telefono(int Numero_telefono) {
        this.Numero_telefono = Numero_telefono;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public int getRoles_Id_roles() {
        return Roles_Id_roles;
    }

    public void setRoles_Id_roles(int Roles_Id_roles) {
        this.Roles_Id_roles = Roles_Id_roles;
    }

    public int getCiudades_Id_ciudades() {
        return Ciudades_Id_ciudades;
    }

    public void setCiudades_Id_ciudades(int Ciudades_Id_ciudades) {
        this.Ciudades_Id_ciudades = Ciudades_Id_ciudades;
    }

    public int getProyecto_Id_proyecto() {
        return Proyecto_Id_proyecto;
    }

    public void setProyecto_Id_proyecto(int Proyecto_Id_proyecto) {
        this.Proyecto_Id_proyecto = Proyecto_Id_proyecto;
    }

    public String getContrasenia() {
        return Contrasenia;
    }

    public void setContrasenia(String Contrasenia) {
        this.Contrasenia = Contrasenia;
    }

}
