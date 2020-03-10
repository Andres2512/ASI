package interfaces;

import java.util.List;
import modelo.DTOCiudades;

public interface IntCiudades {

    public List listar();

    public DTOCiudades list(int Id_ciudades);

    public boolean add(DTOCiudades c);

    public boolean edit(DTOCiudades c);

    public boolean Eliminar(int Id_ciudades);
}
