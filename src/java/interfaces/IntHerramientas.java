package interfaces;

import java.util.List;
import modelo.DTOHerramientas;

public interface IntHerramientas {
    public List listar();
    public DTOHerramientas list(int Id_herramientas);
    public boolean agregar(DTOHerramientas Herramienta);
    public boolean editar(DTOHerramientas Herramienta);
    public boolean eliminar(int Id_herramientas);
    
    public List buscar(String buscaH);
}
