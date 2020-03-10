
package interfaces;

import java.util.List;
import modelo.DTOListarusuario;


public interface IntListarusuario {
    
    public List listar();
    public DTOListarusuario list(int Id_usuario);

    public boolean add(DTOListarusuario usu);

    public boolean edit(DTOListarusuario usu);

    public boolean eliminar(int Id_usuario);
}
