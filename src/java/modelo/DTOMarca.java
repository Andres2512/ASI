package modelo;

public class DTOMarca {
    int Id_marca;
    String Nombre;

    public DTOMarca() {
    }

    public DTOMarca(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getId_marca() {
        return Id_marca;
    }

    public void setId_marca(int Id_marca) {
        this.Id_marca = Id_marca;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    
}
