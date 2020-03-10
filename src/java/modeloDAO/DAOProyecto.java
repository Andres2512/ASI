package modeloDAO;

import config.Conexion;
import interfaces.IntProyecto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOProyecto;

public class DAOProyecto implements IntProyecto {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOProyecto Pro = new DTOProyecto();

    @Override
    public List<DTOProyecto> listar() {
        ArrayList<DTOProyecto> listarPro = new ArrayList<>();
        String sql = "call heroku_49e662d46b8ce5c.listarProyecto()";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOProyecto Proy = new DTOProyecto();
                Proy.setId_proyecto(rs.getInt("Id_proyecto"));
                Proy.setCosto(rs.getFloat("Costo"));
                Proy.setDireccion(rs.getString("Direccion"));
                Proy.setFecha_incio(rs.getDate("Fecha_incio"));
                Proy.setFecha_fin(rs.getDate("Fecha_fin"));
                Proy.setAsignacion(rs.getString("Observaciones"));
                Proy.setNombre(rs.getString("Nombre"));
                Proy.setNovedad(rs.getString("Novedades"));
                Proy.setEstadoProyecto(rs.getString("Estado"));
                Proy.setNombre_proyecto(rs.getString("Nombre_proyecto"));
                listarPro.add(Proy);
            }
        } catch (Exception e) {
        }
        return listarPro;
    }
    public static void main(String[] args) {
        DAOProyecto dao = new DAOProyecto();
        for(DTOProyecto dt : dao.listarMensaje(1)){
            System.out.println(dt.getAsignacion());
        }
    }
    public List<DTOProyecto> listarMensaje(int id) {
        List<DTOProyecto> lista = new ArrayList<>();
        String sql = "select * from proyecto join asignacion_recursos on proyecto.Asignacion_recursos_idAsignacion_Recursos = asignacion_recursos.idAsignacion_Recursos\n" +
"			join estados_proyecto on proyecto.Estados_proyecto_Id_estado_proyecto = estados_proyecto.Id_estado_proyecto \n" +
"			join ciudades on proyecto.Ciudades_Id_ciudades = ciudades.Id_ciudades\n" +
"			join novedades on proyecto.Novedades_Id_novedades = novedades.Id_novedades where Id_proyecto ="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOProyecto pq = new DTOProyecto();
                pq.setAsignacion(rs.getString("Observaciones"));
                lista.add(pq);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    
    @Override
    public DTOProyecto list(int Id_proyecto) {
        String sql = "call heroku_49e662d46b8ce5c.listarProyectoId(?)";
        System.out.println("Id proyecto " + Id_proyecto);
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, Id_proyecto);
            rs = ps.executeQuery();
            while (rs.next()) {

                Pro.setId_proyecto(rs.getInt("Id_proyecto"));
                Pro.setCosto(rs.getFloat("Costo"));
                Pro.setDireccion(rs.getString("Direccion"));
                Pro.setFecha_incio(rs.getDate("Fecha_incio"));
                Pro.setFecha_fin(rs.getDate("Fecha_fin"));
                Pro.setAsignacion_recursos_idAsignacion_Recursos(rs.getInt("Asignacion_recursos_idAsignacion_Recursos"));
                Pro.setCiudades_Id_ciudades(rs.getInt("Ciudades_Id_ciudades"));
                Pro.setNovedades_Id_novedades(rs.getInt("Novedades_Id_novedades"));
                Pro.setEstados_proyecto_Id_estado_proyecto(rs.getInt("Estados_proyecto_Id_estado_proyecto"));
                Pro.setNombre_proyecto(rs.getString("Nombre_proyecto"));

                System.out.println("datos consultados" + Pro);
            }
        } catch (Exception e) {
        }
        return Pro;
    }

    @Override
    public boolean add(DTOProyecto pro) {
        boolean flag = false;
        String sql = "call heroku_49e662d46b8ce5c.addProyecto(?,?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            
            ps.setInt(1, pro.getId_proyecto());
            ps.setFloat(2, pro.getCosto());
            ps.setString(3, pro.getDireccion());
            ps.setDate(4, pro.getFecha_incio());
            ps.setDate(5, pro.getFecha_fin());
            ps.setInt(6, pro.getAsignacion_recursos_idAsignacion_Recursos());
            ps.setInt(7, pro.getCiudades_Id_ciudades());
            ps.setInt(8, pro.getNovedades_Id_novedades());
            ps.setInt(9, pro.getEstados_proyecto_Id_estado_proyecto());
            ps.setString(10, pro.getNombre_proyecto());
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    @Override
    public boolean edit(DTOProyecto pro) {
        String sql = "call heroku_49e662d46b8ce5c.editProyecto(?,?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pro.getId_proyecto());
            ps.setFloat(2, pro.getCosto());
            ps.setString(3, pro.getDireccion());
            ps.setDate(4, pro.getFecha_incio());
            ps.setDate(5, pro.getFecha_fin());
            ps.setInt(6, pro.getAsignacion_recursos_idAsignacion_Recursos());
            ps.setInt(7, pro.getCiudades_Id_ciudades());
            ps.setInt(8, pro.getNovedades_Id_novedades());
            ps.setInt(9, pro.getEstados_proyecto_Id_estado_proyecto());
            ps.setString(10, pro.getNombre_proyecto());
            ps.setInt(1, pro.getId_proyecto());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean Eliminar(int Id_proyecto) {
        boolean flag = false;
        String sql="delete from Proyecto where Id_proyecto=?";
//        +Id_proyecto;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setInt(1, Id_proyecto);
            if(ps.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
        return flag;
    }

}
