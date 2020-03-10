package interfaces;

import java.util.List;
import modelo.DTOMateriales;

public interface IntMateriales {
    public List listar();
    public DTOMateriales list(int Id_materiales);
    public boolean agregar(DTOMateriales Material);
    public boolean editar(DTOMateriales Material);
    public boolean eliminar(int Id_materiales);
    
    public List buscar(String buscaM);
}
