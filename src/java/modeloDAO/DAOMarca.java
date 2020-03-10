package modeloDAO;

import config.Conexion;
import interfaces.IntMarca;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOMarca;

public class DAOMarca implements IntMarca{
    
    Conexion cn= new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOMarca marca = new DTOMarca();
    
    @Override
    public List listar() {
        ArrayList<DTOMarca>List=new ArrayList<>();
        String sql="select * from marca";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DTOMarca mrca = new DTOMarca();
                mrca.setId_marca(rs.getInt("Id_marca"));
                mrca.setNombre(rs.getString("Nombre"));
                List.add(mrca);
            }
        } catch (Exception e) {
        }
        return List;
    }

    @Override
    public DTOMarca list(int Id_marca) {
        String sql="select * from marca where Id_marca="+Id_marca;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                marca.setId_marca(rs.getInt("Id_marca"));
                marca.setNombre(rs.getString("Nombre"));
            }
        } catch (Exception e) {
        }
        return marca;       
    }

    @Override
    public boolean agregar(DTOMarca Marca) {
        String sql="insert into marca(Nombre)values('"+Marca.getNombre()+"')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editar(DTOMarca Marca) {
        String sql="update marca set Nombre='"+Marca.getNombre()+"' where Id_marca="+Marca.getId_marca();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int Id_marca) {
        String sql="delete from marca where Id_marca="+Id_marca;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
