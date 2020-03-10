package modeloDAO;

import config.Conexion;
import java.sql.*;
import java.util.*;
import modelo.DTOTipo_Herramientas;

import interfaces.IntTipo_Herramientas;

public class DAOTipo_Herramientas implements IntTipo_Herramientas{
    
    Conexion cn= new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOTipo_Herramientas TipoHerramienta = new DTOTipo_Herramientas();
            
    @Override
    public List listar() {
        ArrayList<DTOTipo_Herramientas>List=new ArrayList<>();
        String sql="select * from tipo_herramientas";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DTOTipo_Herramientas Tipo_hta = new DTOTipo_Herramientas();
                Tipo_hta.setId_tipo_herramientas(rs.getInt("Id_tipo_herramientas"));
                Tipo_hta.setTipo_herramientas(rs.getString("Tipo_herramientas"));
                Tipo_hta.setDescripcion(rs.getString("Descripcion"));
                List.add(Tipo_hta);
            }
        } catch (Exception e) {
        }
        return List;
    }

    @Override
    public DTOTipo_Herramientas list(int Id_tipo_herramientas) {
        
        String sql="select * from tipo_herramientas where Id_tipo_herramientas="+Id_tipo_herramientas;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                TipoHerramienta.setId_tipo_herramientas(rs.getInt("Id_tipo_herramientas"));
                TipoHerramienta.setTipo_herramientas(rs.getString("Tipo_herramientas"));
                TipoHerramienta.setDescripcion(rs.getString("Descripcion"));
            }
        } catch (Exception e) {
        }
        return TipoHerramienta;        
    }

    @Override
    public boolean agregar(DTOTipo_Herramientas TipoHerramienta) {
        String sql="insert into tipo_herramientas(Tipo_herramientas, Descripcion)values('"+TipoHerramienta.getTipo_herramientas()+"','"+TipoHerramienta.getDescripcion()+"')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean editar(DTOTipo_Herramientas TipoHerramienta) {
        String sql="update tipo_herramientas set Tipo_herramientas='"+TipoHerramienta.getTipo_herramientas()+"', Descripcion='"+TipoHerramienta.getDescripcion()+"' where Id_tipo_herramientas="+TipoHerramienta.getId_tipo_herramientas();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int Id_tipo_herramientas) {
        String sql="delete from tipo_herramientas where Id_tipo_herramientas="+Id_tipo_herramientas;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
