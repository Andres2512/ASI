package modelo;

public class DTOTipo_Herramientas {
    int Id_tipo_herramientas;
    String Tipo_herramientas, Descripcion;
    
    public DTOTipo_Herramientas() {
    }

    public DTOTipo_Herramientas(String Tipo_herramientas, String Descripcion) {
        this.Tipo_herramientas = Tipo_herramientas;
        this.Descripcion = Descripcion;
    }

    public int getId_tipo_herramientas() {
        return Id_tipo_herramientas;
    }

    public void setId_tipo_herramientas(int Id_tipo_herramientas) {
        this.Id_tipo_herramientas = Id_tipo_herramientas;
    }

    public String getTipo_herramientas() {
        return Tipo_herramientas;
    }

    public void setTipo_herramientas(String Tipo_herramientas) {
        this.Tipo_herramientas = Tipo_herramientas;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    
}
