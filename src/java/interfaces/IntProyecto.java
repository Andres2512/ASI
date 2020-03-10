
package interfaces;

import java.util.List;
import modelo.DTOProyecto;


public interface IntProyecto {
    public List listar ();
    public DTOProyecto list(int Id_proyecto);
    public boolean add (DTOProyecto pro);
    public boolean edit (DTOProyecto pro);
    public boolean Eliminar (int Id_proyecto); 
    
}
