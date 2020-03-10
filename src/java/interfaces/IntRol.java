package interfaces;


import java.util.List;
import modelo.DTORoles;

public interface IntRol {
    public List listar();
    public DTORoles list(int Id_roles);
    public boolean add (DTORoles rol);
    public boolean edit(DTORoles rol);
    public boolean Eliminar (int Id_roles);
}
