package modeloDAO;

import interfaces.IntHerramientas;
import java.util.List;
import java.sql.*;
import java.util.*;
import config.Conexion;
import modelo.DTOHerramientas;

public class DAOHerramientas implements IntHerramientas {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOHerramientas Herramienta = new DTOHerramientas();

    @Override
    public List<DTOHerramientas> listar() {
        ArrayList<DTOHerramientas> List = new ArrayList<>();
        String sql = "select * from herramientas";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOHerramientas hta = new DTOHerramientas();
                hta.setId_herramientas(rs.getInt("Id_herramientas"));
                hta.setNombre(rs.getString("Nombre"));
                hta.setDescripcion(rs.getString("Descripcion"));
                hta.setPrecio(rs.getInt("Precio"));
                hta.setCantidad(rs.getInt("Cantidad"));
                hta.setTipo_herramientas_Id_tipo_herramientas(rs.getInt("Tipo_herramientas_Id_tipo_herramientas"));

                List.add(hta);
            }
        } catch (Exception e) {
        }
        return List;
    }

    @Override
    public DTOHerramientas list(int Id_herramientas) {
        String sql = "select * from herramientas where Id_herramientas=" + Id_herramientas;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Herramienta.setId_herramientas(rs.getInt("Id_herramientas"));
                Herramienta.setNombre(rs.getString("Nombre"));
                Herramienta.setDescripcion(rs.getString("Descripcion"));
                Herramienta.setPrecio(rs.getInt("Precio"));
                Herramienta.setCantidad(rs.getInt("Cantidad"));
                Herramienta.setTipo_herramientas_Id_tipo_herramientas(rs.getInt("Tipo_herramientas_Id_tipo_herramientas"));
            }
        } catch (Exception e) {
        }
        return Herramienta;
    }

    @Override
    public boolean agregar(DTOHerramientas Herramienta) {
        boolean flag = false;
        String sql = "insert into herramientas(Nombre, Descripcion, Precio, Cantidad, Tipo_herramientas_Id_tipo_herramientas)values('" + Herramienta.getNombre() + "','" + Herramienta.getDescripcion() + "','" + Herramienta.getPrecio() + "','" + Herramienta.getCantidad() + "','" + Herramienta.getTipo_herramientas_Id_tipo_herramientas() + "')";
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

    @Override
    public boolean editar(DTOHerramientas Herramienta) {
        boolean flag = false;
        String sql = "update herramientas set Nombre='" + Herramienta.getNombre() + "', Descripcion='" + Herramienta.getDescripcion() + "', Precio='" + Herramienta.getPrecio() + "', Cantidad='" + Herramienta.getCantidad() + "', Tipo_herramientas_Id_tipo_herramientas='" + Herramienta.getTipo_herramientas_Id_tipo_herramientas() + "' where Id_herramientas=" + Herramienta.getId_herramientas();
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

    @Override
    public boolean eliminar(int Id_herramientas) {
        boolean flag = false;
        String sql = "delete from herramientas where Id_herramientas=" + Id_herramientas;
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

    @Override
    public List buscar(String buscaH) {
        List<DTOHerramientas> List = new ArrayList<>();
        String sql;
        sql = "select * from herramientas where Id_herramientas like '%" + buscaH + "%' or Nombre like '%" + buscaH + "%' or Descripcion like '%" + buscaH + "%' or Precio like '%" + buscaH + "%' or Cantidad like '%" + buscaH + "%' or Tipo_herramientas_Id_tipo_herramientas like '%" + buscaH + "%'";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOHerramientas hta = new DTOHerramientas();
                hta.setId_herramientas(rs.getInt("Id_herramientas"));
                hta.setNombre(rs.getString("Nombre"));
                hta.setDescripcion(rs.getString("Descripcion"));
                hta.setPrecio(rs.getInt("Precio"));
                hta.setCantidad(rs.getInt("Cantidad"));
                hta.setTipo_herramientas_Id_tipo_herramientas(rs.getInt("Tipo_herramientas_Id_tipo_herramientas"));

                List.add(hta);
            }
        } catch (Exception e) {
        }
        return List;
    }
    
     public ArrayList<DTOHerramientas> implementosEscasos() {
        ArrayList<DTOHerramientas> listar = new ArrayList<>();
        String sql = "select Cantidad, Nombre from herramientas where Cantidad <=20";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOHerramientas i = new DTOHerramientas();
                i.setNombre(rs.getString("Nombre"));
                i.setCantidad(rs.getInt("Cantidad"));
                listar.add(i);
            }
        } catch (Exception e) {
        } 
        return listar;
    }

//    public static void main(String[] args) {
//        InventarioDao dao = new InventarioDao();
//        System.out.println(dao.implementosEscasosAlerta());
//        System.out.println(peD.sumaImplemento(new M_Inventario( 10), 1));
//    }
//public static void main(String[] args) {
//        DAOMateriales dao = new DAOMateriales();
//        System.out.println(dao.implementosEscasosAlerta());
//    }
    public boolean implementosEscasosAlerta() {
        boolean flag = false;
        String sql = "select Cantidad from herramientas where Cantidad <=20";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOHerramientas i = new DTOHerramientas();
                i.setCantidad(rs.getInt("Cantidad"));
                flag = true;
            }
        } catch (Exception e) {
        } 
        return flag;
    }
    
     public boolean restaImplemento(DTOHerramientas in, int id) {
        boolean flag = false;
        String sql = "call quitarImplementoHerra(?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, in.getSumaImplementos());
            ps.setInt(2, id);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
    public static void main(String[] args) {
         DAOHerramientas dao = new DAOHerramientas();
         System.out.println(dao.sumaImplemento(new DTOHerramientas(10), 1));
    }
    public boolean sumaImplemento(DTOHerramientas in, int id) {
        boolean flag = false;
        String sql = "call AgregarImplementoHerr(?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, in.getSumaImplementos());
            ps.setInt(2, id);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
    

}
