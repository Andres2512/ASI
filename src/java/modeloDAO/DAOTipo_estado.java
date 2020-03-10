package modeloDAO;

import config.Conexion;
import interfaces.IntTipo_estado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOTipo_estado;

public class DAOTipo_estado implements IntTipo_estado {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOTipo_estado TEModelo = new DTOTipo_estado();

    @Override
    public List listar() {
        ArrayList<DTOTipo_estado> listarte = new ArrayList<>();
        String sql = "select * from Tipo_estado";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOTipo_estado te = new DTOTipo_estado();
                te.setId_tipo_estado(rs.getInt("Id_tipo_estado"));
                te.setEstado(rs.getString("Estado"));
                te.setObservacion(rs.getString("Observacion"));
                listarte.add(te);
            }
        } catch (Exception e) {
        }
        return listarte;
    }

    @Override
    public DTOTipo_estado list(int Id_tipo_estado) {
        String sql = "select * from tipo_estado where Id_tipo_estado=" + Id_tipo_estado;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                TEModelo.setId_tipo_estado(rs.getInt("Id_tipo_estado"));
                TEModelo.setEstado(rs.getString("Estado"));
                TEModelo.setObservacion(rs.getString("Observacion"));
            }
        } catch (Exception e) {
        }
        return TEModelo;
    }

    @Override
    public boolean add(DTOTipo_estado te) {
        String sql = "insert into Tipo_estado  (Id_tipo_estado,Estado,Observacion) values ('" + te.getId_tipo_estado() + "','" + te.getEstado() + "','" + te.getObservacion() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean edit(DTOTipo_estado te) {
        String sql = "update Tipo_estado set Id_tipo_estado='" + te.getId_tipo_estado() + "',Estado='" + te.getEstado() + "',Observacion='" + te.getObservacion() + "' where Id_tipo_estado=" + te.getId_tipo_estado();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int Id_tipo_estado) {
        String sql = "delete from Tipo_estado where Id_tipo_estado=" + Id_tipo_estado;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}
