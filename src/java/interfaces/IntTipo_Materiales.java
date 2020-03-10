package interfaces;

import java.util.List;
import modelo.DTOTipo_Materiales;

public interface IntTipo_Materiales {
    public List listar();
    public DTOTipo_Materiales list(int Id_tipo_materiales);
    public boolean agregar(DTOTipo_Materiales TipoMaterial);
    public boolean editar(DTOTipo_Materiales TipoMaterial);
    public boolean eliminar(int Id_tipo_materiales);
    public List<DTOTipo_Materiales> separarContenido(String contenido);
    public String cargarContenido(String contenido);
}
