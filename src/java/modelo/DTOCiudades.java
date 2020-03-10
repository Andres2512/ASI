package modelo;

public class DTOCiudades {
    int Id_ciudades;
    String Nombre;
    
    public DTOCiudades(){
    
    }

    public DTOCiudades(int Id_ciudades, String Nombre) {
        this.Id_ciudades = Id_ciudades;
        this.Nombre = Nombre;
    }

    public int getId_ciudades() {
        return Id_ciudades;
    }

    public void setId_ciudades(int Id_ciudades) {
        this.Id_ciudades = Id_ciudades;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
}
