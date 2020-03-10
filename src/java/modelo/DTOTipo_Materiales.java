package modelo;

import java.util.ArrayList;
import java.util.List;

public class DTOTipo_Materiales {
    int Id_tipo_materiales;
    String Tipo_materiales, Descripcion;

    public DTOTipo_Materiales() {
    }

    public DTOTipo_Materiales(String Tipo_materiales, String Descripcion) {
        this.Tipo_materiales = Tipo_materiales;
        this.Descripcion = Descripcion;
    }

    public int getId_tipo_materiales() {
        return Id_tipo_materiales;
    }

    public void setId_tipo_materiales(int Id_tipo_materiales) {
        this.Id_tipo_materiales = Id_tipo_materiales;
    }

    public String getTipo_materiales() {
        return Tipo_materiales;
    }

    public void setTipo_materiales(String Tipo_materiales) {
        this.Tipo_materiales = Tipo_materiales;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
}    