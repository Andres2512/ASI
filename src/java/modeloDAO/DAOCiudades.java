
package modeloDAO;

import config.Conexion;
import interfaces.IntCiudades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOCiudades;

public  class DAOCiudades implements IntCiudades {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOCiudades CModelo = new DTOCiudades();

    @Override
    public List listar() {
        ArrayList<DTOCiudades> listarCui = new ArrayList<>();
        String sql = "select * from Ciudades";
        
        try {
            con = cn.getConnection();
            ps= con.prepareStatement(sql);
            rs = ps.executeQuery(); 
            while (rs.next()){
            DTOCiudades cui = new DTOCiudades();
            cui.setId_ciudades(rs.getInt("Id_ciudades"));
            cui.setNombre(rs.getString("Nombre"));
            listarCui.add(cui);
            }
        } catch (Exception e) {
        }
        return listarCui;
    }

    @Override
    public DTOCiudades list(int Id_ciudades) {
        String sql = "select * from Ciudades where Id_ciudades="+ Id_ciudades;
        
        try {
            con = cn.getConnection();
            ps= con.prepareStatement(sql);
            rs = ps.executeQuery(); 
            while (rs.next()){
                
            CModelo.setId_ciudades(rs.getInt("Id_ciudades"));
            CModelo.setNombre(rs.getString("Nombre"));
            }
        } catch (Exception e) {
        }
        return CModelo;
    }

    @Override
    public boolean add(DTOCiudades c) {
       String sql="insert into Ciudades (Id_ciudades,Nombre) values ('"+c.getId_ciudades()+"','"+c.getNombre()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(DTOCiudades c) {
        String sql="update Ciudades set Id_ciudades='"+c.getId_ciudades()+"',Nombre='"+c.getNombre()+"' where Id_ciudades="+c.getId_ciudades();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int Id_ciudades) {
        String sql="delete from Ciudades where Id_ciudades="+Id_ciudades;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
}
