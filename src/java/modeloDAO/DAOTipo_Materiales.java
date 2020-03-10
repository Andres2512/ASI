package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOTipo_Materiales;
import interfaces.IntTipo_Materiales;

public class DAOTipo_Materiales implements IntTipo_Materiales {
    
    Conexion cn= new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOTipo_Materiales TipoMaterial = new DTOTipo_Materiales();
            
    @Override
    public List listar() {
        ArrayList<DTOTipo_Materiales>List=new ArrayList<>();
        String sql="select * from tipo_materiales";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DTOTipo_Materiales Tipo_mtl = new DTOTipo_Materiales();
                Tipo_mtl.setId_tipo_materiales(rs.getInt("Id_tipo_materiales"));
                Tipo_mtl.setTipo_materiales(rs.getString("Tipo_materiales"));
                Tipo_mtl.setDescripcion(rs.getString("Descripcion"));
                List.add(Tipo_mtl);
            }
        } catch (Exception e) {
        }
        return List;
    }

    @Override
    public DTOTipo_Materiales list(int Id_tipo_materiales) {
        
        String sql="select * from tipo_materiales where Id_tipo_materiales="+Id_tipo_materiales;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                TipoMaterial.setId_tipo_materiales(rs.getInt("Id_tipo_materiales"));
                TipoMaterial.setTipo_materiales(rs.getString("Tipo_materiales"));
                TipoMaterial.setDescripcion(rs.getString("Descripcion"));
            }
        } catch (Exception e) {
        }
        return TipoMaterial;        
    }

    @Override
    public boolean agregar(DTOTipo_Materiales TipoMaterial) {
        String sql="insert into tipo_materiales(Tipo_materiales, Descripcion)values('"+TipoMaterial.getTipo_materiales()+"','"+TipoMaterial.getDescripcion()+"')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean editar(DTOTipo_Materiales TipoMaterial) {
        String sql="update tipo_materiales set Tipo_materiales='"+TipoMaterial.getTipo_materiales()+"', Descripcion='"+TipoMaterial.getDescripcion()+"' where Id_tipo_materiales="+TipoMaterial.getId_tipo_materiales();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int Id_tipo_materiales) {
        String sql="delete from tipo_materiales where Id_tipo_materiales="+Id_tipo_materiales;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public List<DTOTipo_Materiales> separarContenido(String contenido) {
        DTOTipo_Materiales TiMat;
        List<DTOTipo_Materiales> lstTipoMateriales = null;
        try{
            String[] lineas = contenido.split("\n");
            String[] datos;
            int TMId = 0;
            lstTipoMateriales = new ArrayList<DTOTipo_Materiales>();
            for (String linea : lineas){
                if(linea.contains("\r"))
                    linea = linea.substring(0, linea.length()-1);
                datos = linea.split(";");
                TiMat = new DTOTipo_Materiales();
                TiMat.setTipo_materiales(datos[0]);
                TiMat.setDescripcion(datos[1]);
                
                lstTipoMateriales.add(TiMat);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return lstTipoMateriales;
    }

    @Override
    public String cargarContenido(String contenido) {
        int contador = 0;
        List<DTOTipo_Materiales> lstCliente = separarContenido(contenido);
        for(DTOTipo_Materiales TiMat : lstCliente){
            contador++;
            if(agregar(TiMat) == true)
                return "línea " + contador;
        }
        return "OK";
    }
}
