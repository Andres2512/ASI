
package modelo;

import java.io.InputStream;


public class DTOViaticos {
    int id_viaticos;
    String Descripcion_viatico;
    String Tipo_viatico;
    String Nombres_trabajador;
    int Id_usuario; 
    Double valor_viatico;
    String Insertar_evidencia;

    public DTOViaticos() {
    }

    public int getId_viaticos() {
        return id_viaticos;
    }

    public void setId_viaticos(int id_viaticos) {
        this.id_viaticos = id_viaticos;
    }

    public String getDescripcion_viatico() {
        return Descripcion_viatico;
    }

    public void setDescripcion_viatico(String Descripcion_viatico) {
        this.Descripcion_viatico = Descripcion_viatico;
    }

    public String getTipo_viatico() {
        return Tipo_viatico;
    }

    public void setTipo_viatico(String Tipo_viatico) {
        this.Tipo_viatico = Tipo_viatico;
    }

    public String getNombres_trabajador() {
        return Nombres_trabajador;
    }

    public void setNombres_trabajador(String Nombres_trabajador) {
        this.Nombres_trabajador = Nombres_trabajador;
    }

    public int getId_usuario() {
        return Id_usuario;
    }

    public void setId_usuario(int Id_usuario) {
        this.Id_usuario = Id_usuario;
    }

    public Double getValor_viatico() {
        return valor_viatico;
    }

    public void setValor_viatico(Double valor_viatico) {
        this.valor_viatico = valor_viatico;
    }

    public String getInsertar_evidencia() {
        return Insertar_evidencia;
    }

    public void setInsertar_evidencia(String Insertar_evidencia) {
        this.Insertar_evidencia = Insertar_evidencia;
    }

  
   
   
        }