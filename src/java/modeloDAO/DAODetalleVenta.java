package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.DTOCotizacion;
import modelo.DTODetalleVenta;

/**
 *
 * @author Daniel Avila
 */
public class DAODetalleVenta {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<DTODetalleVenta> detalleVentas() {
        List<DTODetalleVenta> lista = new ArrayList<>();
        String query = "SELECT m.Nombre, m.Precio, dv.cantidad FROM materiales m join detalle_venta dv on dv.id_material = m.Id_materiales";
        con = cn.getConnection();
        DTODetalleVenta detalleDto;

        try {
            rs = con.createStatement().executeQuery(query);
            while (rs.next()) {
                detalleDto = new DTODetalleVenta();
                detalleDto.setNombre(rs.getString("nombre"));
                detalleDto.setPrecio(rs.getDouble("precio"));
                detalleDto.setCantidad(rs.getInt("cantidad"));
                double total = detalleDto.getCantidad() * detalleDto.getPrecio();
                detalleDto.setTotal(total);
                lista.add(detalleDto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAODetalleVenta.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return lista;
    }
}
