package modeloDAO;

import java.sql.PreparedStatement;
import config.Conexion;
import interfaces.IntLogin;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.DTOLogin;
import modelo.DTOUsuario;

public class DAOLongin implements IntLogin {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
     public boolean validar(DTOUsuario user) {
        boolean flag = false;
        String sql = "select * from usuario where Correo=? and contrasenia=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getCorreo());
            ps.setString(2, user.getContrasenia());
            rs = ps.executeQuery();
            if (rs.absolute(1)) {
                flag = true;
            }
        } catch (Exception e) {
            System.out.println("La consulta no se realizo exitosamente para iniciar sesión");
        }
        return flag;
    }
    public static void main(String[] args) {
        DAOLongin dao = new DAOLongin();
        DTOUsuario dato = dao.list("jdcuellar41@misena.edu.co");
        System.out.println(dato.getId_usuario());
    }
    public DTOUsuario list(String Correo) {
        String sql = "SELECT * FROM `usuario` WHERE Correo = ?" ;
        DTOUsuario usu = new DTOUsuario();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, Correo);
            rs = ps.executeQuery();
            while (rs.next()) {
                usu.setCorreo(rs.getString("Correo"));
                usu.setId_usuario(rs.getInt("Id_usuario"));
                usu.setContrasenia(rs.getString("contrasenia"));
                usu.setRoles_Id_roles(rs.getInt("Roles_Id_roles"));
                usu.setNombres(rs.getString("Nombres"));
                usu.setApellidos(rs.getString("Apellidos"));
            }
        } catch (Exception e) {
        }
        return usu;
    }

    @Override
    public int validar(DTOLogin lo) {
        int r = 0;
        String sql = "select * from usuario where Correo=? and contrasenia=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, lo.getCorreo());
            ps.setString(2, lo.getContrasenia());
            System.out.println("contraseña" + lo.getContrasenia());
            rs = ps.executeQuery();

            while (rs.next()) {
                r = r + 1;
                lo.setCorreo(rs.getString("Correo"));
                lo.setContrasenia(rs.getString("contrasenia"));
                lo.setIDrol(rs.getInt("Roles_Id_roles"));
                lo.setNombres(rs.getString("Nombres"));
                lo.setApellidos(rs.getString("Apellidos"));
            }
            if (r == 1) {
                return 1;
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("No mames, siempre error nunca inerror");
        }
        return 0;
    }

    public boolean validarCorreo(String email) {
        String sql = "Select * from usuario where Correo = ?";
        boolean resultado = false;
        try {
            con = cn.getConnection();
            PreparedStatement prepareStatement = con.prepareStatement(sql);
            prepareStatement.setString(1, email);

            ResultSet resultSet = prepareStatement.executeQuery();
            if (resultSet.next()) {
                resultado = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOLongin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resultado;
    }

    public int actualizaContrasenia(String contrasenia, String correo) {
        con = cn.getConnection();
        String sql = "update usuario set contrasenia = ? where correo = ?";
        PreparedStatement ps;
        int executeUpdate = 0;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, contrasenia);
            ps.setString(2, correo);
            executeUpdate = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOLongin.class.getName()).log(Level.SEVERE, null, ex);

        }
        return executeUpdate;
    }
}
