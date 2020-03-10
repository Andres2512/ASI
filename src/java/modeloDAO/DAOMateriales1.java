package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.DTOMateriales1;

/**
 *
 * @author Daniel Avila
 */
public class DAOMateriales1 {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public boolean cantidadMayorDisponible(int cantidad, int idMaterial) {
        boolean resultado = false;
        String query = "SELECT m.cantidad FROM materiales m WHERE m.id_materiales = " + idMaterial;
        con = cn.getConnection();
        DTOMateriales1 dtoMateriales = null;

        try {
            rs = con.createStatement().executeQuery(query);
            while (rs.next()) {
                dtoMateriales = new DTOMateriales1();
                dtoMateriales.setCantidad(rs.getString("cantidad"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOMateriales1.class.getName()).log(Level.SEVERE, null, ex);
        }
        int cantidadDisponible;
        cantidadDisponible = Integer.parseInt(dtoMateriales.getCantidad());

        if (cantidadDisponible < cantidad) {
            resultado = true;
        }
        return resultado;
    }

    public int actualizarCantidad(DTOMateriales1 dTOMateriales) {
        String querySelect = "SELECT m.cantidad FROM materiales m WHERE m.id_materiales = " + dTOMateriales.getCodigoMaterial();
        String cantidad = "";
        con = cn.getConnection();
        try {

            rs = con.createStatement().executeQuery(querySelect);

            while (rs.next()) {
                cantidad = rs.getString("cantidad");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOMateriales1.class.getName()).log(Level.SEVERE, null, ex);
        }
        String sql = "UPDATE Materiales SET cantidad = ? WHERE Id_materiales = ? ";
        int resultado = 0;
        int cantidadActualizar = Integer.parseInt(cantidad) - Integer.parseInt(dTOMateriales.getCantidad());
        try {
            PreparedStatement preparedStament = con.prepareStatement(sql);
            preparedStament.setString(1, String.valueOf(cantidadActualizar));
            preparedStament.setInt(2, dTOMateriales.getCodigoMaterial());
            resultado = preparedStament.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOMateriales1.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (resultado > 0) {
            insertarDetalleVenta(dTOMateriales);
        }
        return resultado;
    }

    private void insertarDetalleVenta(DTOMateriales1 dTOMateriales) {
        String sql = "INSERT INTO detalle_venta (id_material, cantidad) VALUES(?,?)";
        int cantidad = Integer.parseInt(dTOMateriales.getCantidad());
        try {
            PreparedStatement preparedStament = con.prepareStatement(sql);
            preparedStament.setInt(2, cantidad);
            preparedStament.setInt(1, dTOMateriales.getCodigoMaterial());
            preparedStament.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOMateriales1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
