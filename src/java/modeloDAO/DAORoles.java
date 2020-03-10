package modeloDAO;

import interfaces.IntRol;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTORoles;



public class DAORoles implements IntRol {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTORoles rolModelo=new DTORoles();
    
    @Override
    public List listar() {
        ArrayList<DTORoles> list = new ArrayList<>();
        String sql = "select * from roles";
        try {
            con=cn.getConnection();
            ps=con.prepareCall(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                DTORoles rolh = new DTORoles();
                rolh.setId_roles(rs.getInt("Id_roles"));
                rolh.setNombre(rs.getString("Nombre"));
                list.add(rolh);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public DTORoles list(int Id_roles) {
        String sql = "select * from roles where id_roles=" + Id_roles;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                rolModelo.setId_roles(rs.getInt("Id_roles"));
                rolModelo.setNombre(rs.getString("Nombre"));
                
            }
        } catch (Exception e) {
        }
        return rolModelo;
    }

    @Override
    public boolean add(DTORoles rols) {
        String sql="insert into roles (Id_roles,Nombre) values ('"+rols.getId_roles()+"','"+rols.getNombre()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(DTORoles roled) {
        String sql="update roles set Id_roles='"+roled.getId_roles()+"',Nombre='"+roled.getNombre()+"'where id_roles="+roled.getId_roles();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int Id_roles) {
       String sql="delete from roles where Id_roles="+Id_roles;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    
    

}
