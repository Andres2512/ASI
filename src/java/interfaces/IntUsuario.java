package interfaces;

import java.util.List;

import modelo.DTOUsuario;

public interface IntUsuario {

    public List listar();

    public DTOUsuario list(int Id_usuario);

    public boolean add(DTOUsuario usu);

    public boolean edit(DTOUsuario usu);

    public boolean eliminar(int Id_usuario);
    
    public boolean addTrabajador(DTOUsuario usu);
}
