package modeloDAO;

import config.Conexion;
import modelo.Email;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class daoEmail {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    public List<Email> listarCorreo() {
        List<Email> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario ";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(new Email(rs.getString("Correo")));
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public static void main(String[] args) {
        daoEmail dao = new daoEmail();
        for (Email ema : dao.listarCorreo()) {
            System.out.println(ema.getCorreos());
        }
    }
}
