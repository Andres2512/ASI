package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import interfaces.IntMateriales;
import java.util.List;
import modelo.DTOMateriales;

public class DAOMateriales implements IntMateriales{
    
    Conexion cn= new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOMateriales Material = new DTOMateriales();
    
    @Override
    public List<DTOMateriales> listar() {
        ArrayList<DTOMateriales>List=new ArrayList<>();
        String sql="select * from materiales";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DTOMateriales mtl = new DTOMateriales();
                mtl.setId_materiales(rs.getInt("Id_materiales"));
                mtl.setNombre(rs.getString("Nombre"));
                mtl.setDescripcion(rs.getString("Descripcion"));
                mtl.setPrecio(rs.getString("Precio"));
                mtl.setCantidad(rs.getInt("Cantidad"));
                mtl.setMarca_Id_marca(rs.getInt("Marca_Id_marca"));
                mtl.setTipo_materiales_Id_tipo_materiales(rs.getInt("Tipo_materiales_Id_tipo_materiales"));
                List.add(mtl);
            }
        } catch (Exception e) {
        }
        return List;
    }

    @Override
    public DTOMateriales list(int Id_materiales) {
        String sql="select * from materiales where Id_materiales="+Id_materiales;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Material.setId_materiales(rs.getInt("Id_materiales"));
                Material.setNombre(rs.getString("Nombre"));
                Material.setDescripcion(rs.getString("Descripcion"));
                Material.setPrecio(rs.getString("Precio"));
                Material.setCantidad(rs.getInt("Cantidad"));
                Material.setMarca_Id_marca(rs.getInt("Marca_Id_marca"));
                Material.setTipo_materiales_Id_tipo_materiales(rs.getInt("Tipo_materiales_Id_tipo_materiales"));
            }
        } catch (Exception e) {
        }
        return Material;
    }

    @Override
    public boolean agregar(DTOMateriales Material) {
        boolean flag = false;
        String sql="insert into materiales(Nombre, Descripcion, Precio, Cantidad, Marca_Id_marca, Tipo_materiales_Id_tipo_materiales)values('"+Material.getNombre()+"','"+Material.getDescripcion()+"','"+Material.getPrecio()+"','"+Material.getCantidad()+"','"+Material.getMarca_Id_marca()+"','"+Material.getTipo_materiales_Id_tipo_materiales()+"')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if(ps.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
        }

        return flag;
    }

    @Override
    public boolean editar(DTOMateriales Material) {
        boolean flag = false;
        String sql="update materiales set Nombre='"+Material.getNombre()+"', Descripcion='"+Material.getDescripcion()+"', Precio='"+Material.getPrecio()+"', Cantidad='"+Material.getCantidad()+"', Marca_Id_marca='"+Material.getMarca_Id_marca()+"', Tipo_materiales_Id_tipo_materiales='"+Material.getTipo_materiales_Id_tipo_materiales()+"' where Id_materiales="+Material.getId_materiales();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            if(ps.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    @Override
    public boolean eliminar(int Id_materiales) {
        boolean flag = false;
        String sql="delete from materiales where Id_materiales="+Id_materiales;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            if(ps.executeUpdate()==1){
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

    @Override
    public List buscar(String buscaM) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
//    public static void main(String[] args) {
//        DAOMateriales dao = new DAOMateriales();
//        for(DTOMateriales dto : dao.implementosEscasos()){
//            System.out.println(dto.getCantidad());
//        }
//    }
    public ArrayList<DTOMateriales> implementosEscasos() {
        ArrayList<DTOMateriales> listar = new ArrayList<>();
        String sql = "select Cantidad, Nombre from materiales where Cantidad <=20";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOMateriales i = new DTOMateriales();
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
        String sql = "select Cantidad from materiales where Cantidad <=20";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOMateriales i = new DTOMateriales();
                i.setCantidad(rs.getInt("Cantidad"));
                flag = true;
            }
        } catch (Exception e) {
        } 
        return flag;
    }
    
     public boolean restaImplemento(DTOMateriales in, int id) {
        boolean flag = false;
        String sql = "call quitarImplemento(?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, in.getSumarImplemento());
            ps.setInt(2, id);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
    public static void main(String[] args) {
         DAOMateriales dao = new DAOMateriales();
         System.out.println(dao.sumaImplemento(new DTOMateriales(10), 1));
    }
    public boolean sumaImplemento(DTOMateriales in, int id) {
        boolean flag = false;
        String sql = "call AgregarImplemento(?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, in.getSumarImplemento());
            ps.setInt(2, id);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
    
}
