package interfaces;

import java.util.List;
import modelo.DTOMarca;

public interface IntMarca {
    public List listar();
    public DTOMarca list(int Id_marca);
    public boolean agregar(DTOMarca Marca);
    public boolean editar(DTOMarca Marca);
    public boolean eliminar(int Id_marca);
}
