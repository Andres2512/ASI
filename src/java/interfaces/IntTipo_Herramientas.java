package interfaces;

import java.util.List;
import modelo.DTOTipo_Herramientas;

public interface IntTipo_Herramientas {
    public List listar();
    public DTOTipo_Herramientas list(int Id_tipo_herramientas);
    public boolean agregar(DTOTipo_Herramientas TipoHerramienta);
    public boolean editar(DTOTipo_Herramientas TipoHerramienta);
    public boolean eliminar(int Id_tipo_herramientas);
}
