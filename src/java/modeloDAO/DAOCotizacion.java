package modeloDAO;

import config.Conexion;
import interfaces.IntCotizacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOCotizacion;

public class DAOCotizacion implements IntCotizacion {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOCotizacion c = new DTOCotizacion();


    @Override
    public DTOCotizacion list(int Id_cotizacion) {
        String sql = "select * from Cotizacion where Id_cotizacion=" + Id_cotizacion;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId_cotizacion(rs.getInt("Id_cotizacion"));
                c.setFecha_cotizacion(rs.getString("Fecha_cotizacion"));
                c.setNombreMaterial(rs.getString("nombreMaterial"));
                c.setDescripcion(rs.getString("Descripcion"));
                c.setCantidad(rs.getInt("cantidad"));
                c.setValorUnitario(rs.getFloat("valorUnitario"));
                c.setValor_total(rs.getInt("Valor_total"));
                c.setIdProyecto(rs.getInt("Proyecto_Id_proyecto"));
            }
        } catch (Exception e) {
        }
        return c;
    }

    @Override
    public boolean add(DTOCotizacion coti) {
        boolean flag = false;
        String sql = "call addCotizacion(?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, coti.getNombreMaterial());
            ps.setString(2, coti.getDescripcion());
            ps.setInt(3, coti.getCantidad());
            ps.setFloat(4, coti.getValorUnitario());
            ps.setInt(5, coti.getIdProyecto());
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
 
    @Override
    public boolean edit(DTOCotizacion coti) {
        boolean flag = false;
        String sql = "call editCotizacion(?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, coti.getId_cotizacion());
            ps.setString(2, coti.getNombreMaterial());
            ps.setString(3, coti.getDescripcion());
            ps.setInt(4, coti.getCantidad());
            ps.setFloat(5, coti.getValorUnitario());
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
   
    @Override
    public boolean Eliminar(int Id_cotizacion) {
        boolean flag = false;
        String sql = "delete from Cotizacion where Id_cotizacion=" + Id_cotizacion;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if(ps.executeUpdate()==1){
                flag =  true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    @Override
    public List<DTOCotizacion> listarCotizacion(int Id_cotizacion) {
        List<DTOCotizacion> listarCotizacion = new ArrayList<>();
        String sql = "select * from Cotizacion where Proyecto_Id_proyecto=" + Id_cotizacion;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOCotizacion c = new DTOCotizacion();
                c.setId_cotizacion(rs.getInt("Id_cotizacion"));
                c.setFecha_cotizacion(rs.getString("Fecha_cotizacion"));
                c.setNombreMaterial(rs.getString("nombreMaterial"));
                c.setDescripcion(rs.getString("Descripcion"));
                c.setCantidad(rs.getInt("cantidad"));
                c.setValorUnitario(rs.getFloat("valorUnitario"));
                c.setValor_total(rs.getInt("Valor_total"));
                c.setIdProyecto(rs.getInt("Proyecto_Id_proyecto"));
                listarCotizacion.add(c);
            }
        } catch (Exception e) {
        }
        return listarCotizacion;
    }
//   public static void main(String[] args) {
//        DAOCotizacion dao = new DAOCotizacion();
//        for (DTOCotizacion coti : dao.listarDescripcionCoti(1)) {
//            System.out.println(coti.getDescripcion());
//        }
//    }

    public List<DTOCotizacion> listarDescripcionCoti(int id) {
        List<DTOCotizacion> lista = new ArrayList<>();
        String sql = "select * from Cotizacion where Id_cotizacion=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOCotizacion pq = new DTOCotizacion();
                pq.setDescripcion(rs.getString("Descripcion"));
                lista.add(pq);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    public static void main(String[] args) {
        DAOCotizacion dao = new DAOCotizacion();
        DTOCotizacion cot = dao.sumaValorTotalCoti(1);
        System.out.println(cot.getValorFinalId());
    }
    public DTOCotizacion sumaValorTotalCoti(int Id_cotizacion) {
        String sql = "select sum(Valor_total)  as sumaId  from cotizacion where Proyecto_Id_proyecto = " + Id_cotizacion;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setValorFinalId(rs.getInt("sumaId"));
            }
        } catch (Exception e) {
        }
        return c;
    }
}
