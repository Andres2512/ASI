
package interfaces;

import java.util.List;
import modelo.DTOCotizacion;


public interface IntCotizacion {
  
    public List listarCotizacion(int Id_cotizacion);
    public DTOCotizacion list(int Id_cotizacion);
    public boolean add (DTOCotizacion coti);
    public boolean edit(DTOCotizacion coti);
    public boolean Eliminar (int Id_cotizacion);
}
