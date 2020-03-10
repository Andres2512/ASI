
package modeloDAO;

import config.Conexion;
import interfaces.IntListarusuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import modelo.DTOListarusuario;

public class DAOListarusuario implements IntListarusuario{
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOListarusuario lu = new DTOListarusuario();

    @Override
    public List listar() {
        ArrayList<DTOListarusuario> ListarUsuario =new ArrayList<>();
        String sql="select u.Id_usuario,u.Nombres,u.Apellidos,u.Numero_celular,"
                + "u.Numero_telefono,u.Correo,u.Direccion,r.Nombre,c.Nombre,"
                + "p.Id_proyecto from usuario u inner join ciudades c on u.Ciudades_Id_ciudades= c.Id_ciudades "
                + "inner join roles r on u.Roles_Id_roles=r.Id_roles inner join proyecto p on p.Id_proyecto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOListarusuario lstusu = new DTOListarusuario();
                lstusu.setId_usuario(rs.getInt("Id_usuario"));
                lstusu.setNombre(rs.getString("Nombres"));
                lstusu.setApellido(rs.getString("Apellidos"));
                lstusu.setCelular(rs.getString("Numero_celular"));
                lstusu.setTelefono(rs.getInt("Numero_telefono"));
                lstusu.setCorreo(rs.getString("Correo"));
                lstusu.setDireccion(rs.getString("Direccion"));
                lstusu.setRol(rs.getString("r.Nombre"));
                lstusu.setCiudad(rs.getString("c.Nombre"));
                lstusu.setId_proyecto(rs.getInt("Id_proyecto"));
                
                ListarUsuario.add(lstusu);
                
            }
        } catch (Exception e) {
        }
        return  ListarUsuario;
    }

    @Override
    public DTOListarusuario list(int Id_usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(DTOListarusuario usu) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(DTOListarusuario usu) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int Id_usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
 
    
}
