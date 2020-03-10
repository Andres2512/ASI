
package interfaces;

import java.util.List;
import modelo.DTONovedades;


public interface IntNovedades {
     public List listar();

    public DTONovedades list(int Id_novedades);

    public boolean add(DTONovedades nov);

    public boolean edit(DTONovedades nov);

    public boolean eliminar(int Id_novedades);
}
