
package interfaces;

import java.util.List;
import modelo.DTORecursos;

public interface crudrecursos {

    public List listar();

    public DTORecursos list(int idAsignacion_Recursos);

    public boolean add(DTORecursos re);

    public boolean edit(DTORecursos re);

    public boolean eliminar(int idAsignacion_Recursos);
}
