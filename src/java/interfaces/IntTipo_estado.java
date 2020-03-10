package interfaces;

import java.util.List;
import modelo.DTOTipo_estado;

public interface IntTipo_estado {
    public List listar();

    public DTOTipo_estado list(int Id_tipo_estado);

    public boolean add(DTOTipo_estado c);

    public boolean edit(DTOTipo_estado c);

    public boolean Eliminar(int Id_ciudades);
}
