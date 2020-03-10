
package modelo;

public class DTOTipo_estado {
     int Id_tipo_estado;
     String Estado;
     String Observacion;
     
     public DTOTipo_estado (){
     
     }
     
     public DTOTipo_estado(int Id_tipo_estado,String Estado,String Observacion){
     this.Id_tipo_estado = Id_tipo_estado;
     this.Estado = Estado;
     this.Observacion = Observacion;
     }

    public int getId_tipo_estado() {
        return Id_tipo_estado;
    }

    public void setId_tipo_estado(int Id_tipo_estado) {
        this.Id_tipo_estado = Id_tipo_estado;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }
             
    
}
