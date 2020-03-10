package modelo;

public class DTOPqrs {
    private int id;
    private String nombres;
    private String email;
    private String mensaje;

    public DTOPqrs() {
    }

    public DTOPqrs(String nombres, String email, String mensaje) {
        this.nombres = nombres;
        this.email = email;
        this.mensaje = mensaje;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
}
