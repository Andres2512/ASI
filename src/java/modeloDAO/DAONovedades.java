
package modeloDAO;

import config.Conexion;
import interfaces.IntNovedades;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.DTONovedades;


public class DAONovedades implements IntNovedades{
   Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTONovedades nov = new DTONovedades(); 
    
    @Override
    public List listar() {

        ArrayList<DTONovedades> listnovedades = new ArrayList<>();
        String sql = "select * from novedades";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTONovedades nov = new DTONovedades();
                nov.setId_novedades(rs.getInt("Id_novedades"));
                nov.setFecha(rs.getDate("Fecha"));
                nov.setNovedades(rs.getString("Novedades"));
                nov.setObservaciones(rs.getString("Observaciones"));
                nov.setTipo_novedad_Id_tipo_novedad(rs.getInt("Tipo_novedad_Id_tipo_novedad"));
               
                listnovedades.add(nov);

            }

        } catch (SQLException e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return listnovedades;

    }

    @Override
    public DTONovedades list(int Id_novedades) {
        String sql = "select * from novedades where Id_novedades=" +Id_novedades;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                nov.setId_novedades(rs.getInt("Id_novedades"));
                nov.setFecha(rs.getDate("Fecha"));
                nov.setNovedades(rs.getString("Novedades"));
                nov.setObservaciones(rs.getString("Observaciones"));
                nov.setTipo_novedad_Id_tipo_novedad(rs.getInt("Tipo_novedad_Id_tipo_novedad"));
            
            }

        } catch (Exception e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return nov;

    }

    @Override
    public boolean add(DTONovedades nov) {
        String sql = "insert into novedades(Fecha, Novedades, Observaciones, Tipo_novedad_Id_tipo_novedad)values('" + nov.getFecha() + "','" + nov.getNovedades() + "','" + nov.getObservaciones() + "','"+ nov.getTipo_novedad_Id_tipo_novedad() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean edit(DTONovedades nov) {
        String sql = "update novedades set Fecha='" + nov.getFecha() + "',Novedades='" + nov.getNovedades()+ "',Observaciones='" + nov.getObservaciones()+ "',Tipo_novedad_Id_tipo_novedad='" + nov.getTipo_novedad_Id_tipo_novedad() + "'where Id_novedades=" + nov.getId_novedades();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean eliminar(int Id_novedades) {

        String sql = "delete from novedades where Id_novedades=" + Id_novedades;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("No se realiza la consulta");
        }
        return false;
    }
  
}
