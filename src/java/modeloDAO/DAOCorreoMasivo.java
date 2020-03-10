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
import modelo.DTOCorreoMasivo;

/**
 *
 * @author Daniel Avila
 */
public class DAOCorreoMasivo {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<DTOCorreoMasivo> obtenerCorreos() {
        List<DTOCorreoMasivo> lista = new ArrayList<>();
        String query = "SELECT u.Nombres, u.Apellidos, u.Correo FROM usuario u ";
        con = cn.getConnection();
        try {
            rs = con.createStatement().executeQuery(query);
            DTOCorreoMasivo correoMasivo;
            while (rs.next()) {
                correoMasivo = new DTOCorreoMasivo();
                correoMasivo.setNombre(rs.getString("Nombres"));
                correoMasivo.setApellido(rs.getString("Apellidos"));
                correoMasivo.setCorreo(rs.getString("Correo"));
                lista.add(correoMasivo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCorreoMasivo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;
    }
}
