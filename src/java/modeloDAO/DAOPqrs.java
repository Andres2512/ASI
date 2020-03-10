package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOPqrs;

public class DAOPqrs {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String sql;

    public static void main(String[] args) {
        DAOPqrs dao = new DAOPqrs();
        System.out.println(dao.agregar(new DTOPqrs("federico", "fernando951005@hotmail.com", "asdxsdsad")));
    }

    public List<DTOPqrs> listar() {
        ArrayList<DTOPqrs> lista = new ArrayList<>();
        sql = "select * from pqrs";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOPqrs pqrs = new DTOPqrs();
                pqrs.setId(rs.getInt("idPqrs"));
                pqrs.setNombres(rs.getString("nombres"));
                pqrs.setEmail(rs.getString("email"));
                pqrs.setMensaje(rs.getString("mensaje"));
                lista.add(pqrs);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public List<DTOPqrs> listarMensaje(int id) {
        List<DTOPqrs> lista = new ArrayList<>();
        sql = "select mensaje from pqrs where idPqrs =" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOPqrs pqrs = new DTOPqrs();
                pqrs.setMensaje(rs.getString("mensaje"));
                lista.add(pqrs);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public boolean agregar(DTOPqrs p) {
        boolean flag = false;
        sql = "insert into pqrs (nombres, email, mensaje) values (?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombres());
            ps.setString(2, p.getEmail());;
            ps.setString(3, p.getMensaje());
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    public boolean delete(int idPQRS) {
        boolean flag = false;
        sql = "delete from pqrs where idPqrs=" + idPQRS;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
}
