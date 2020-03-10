/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import config.Conexion;
import interfaces.IntViaticos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.DTOViaticos;

/**
 *
 * @author Vannesa
 */
public class DAOViaticos implements IntViaticos {
Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOViaticos via = new DTOViaticos(); 
    
    @Override
    public List listar() {
    ArrayList<DTOViaticos> listViaticos = new ArrayList<>();
    String sql ="select * from viaticos";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()){
                DTOViaticos via = new DTOViaticos();
                 via.setId_viaticos(rs.getInt("id_viaticos"));
                via.setDescripcion_viatico(rs.getString("Descripcion_viatico"));
                via.setTipo_viatico(rs.getString("Tipo_viatico"));
                via.setNombres_trabajador(rs.getString("Nombre_trabajador"));
                //via.setId_usuario(rs.getInt("Id_usuario"));
                via.setValor_viatico(rs.getDouble("valor_viatico"));
                via.setInsertar_evidencia(rs.getString("Insertar_evidencia"));
                
                
                listViaticos.add(via);
            }
        } catch (Exception e) {
            System.out.println("No realiza la consulta para realizar Viaticos");
        }
        return listViaticos;
    }

    @Override
    public DTOViaticos list(int id_viaticos) {
        System.out.println("llegando a viaticos para"+ id_viaticos);
            
        String sql = "select * from Viaticos where id_viaticos=" + id_viaticos;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
          //  DTOViaticos via = new DTOViaticos();
             //   via.setId_usuario(rs.getInt("Id_usuario"));
                
                 via.setId_viaticos(rs.getInt("id_viaticos"));
                 via.setDescripcion_viatico(rs.getString("Descripcion_viatico"));
                via.setTipo_viatico(rs.getString("Tipo_viatico"));
                  via.setNombres_trabajador(rs.getString("nombre_trabajador"));
               // via.setId_usuario(rs.getInt("Id_usuario"));
                via.setValor_viatico(rs.getDouble("valor_viatico"));
                via.setInsertar_evidencia(rs.getString("Insertar_evidencia"));
              
            }
        } catch (Exception e) {
            System.out.println("No se realiza la consulta por el login");
        }
       
        return  via;
    }

    @Override
    public boolean add(DTOViaticos vi) {
//    viaticos INSERT INTO `viaticos`(`id_viaticos`, `Descripcion_viatico`, `Tipo_viatico`, `Nombre_trabajador`, `id_trabajador`, `valor_viatico`, `Insertar_evidencia`) VALUES (4,5,6,7,8,9,5) 
     String sql = "insert into viaticos(id_viaticos,Descripcion_viatico, Tipo_viatico, Nombre_trabajador,id_trabajador,valor_viatico,Insertar_evidencia)values(null,'" + vi.getDescripcion_viatico() + "','" + vi.getTipo_viatico() + "','"+ vi.getNombres_trabajador() + "','"+ vi.getId_usuario() + "','"+ vi.getValor_viatico() + "','"+ vi.getInsertar_evidencia() + "')";
 try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
          
    }  

    @Override
    public boolean edit(DTOViaticos vi) {
        
        System.out.println("llegando datos: " +vi.getDescripcion_viatico());
        
      String sql = "update viaticos set Descripcion_viatico='" + vi.getDescripcion_viatico()+ "',Tipo_viatico='" + vi.getTipo_viatico()+ "',Nombre_trabajador='" + vi.getNombres_trabajador()+ "',valor_viatico='" + vi.getValor_viatico()+"',Insertar_evidencia='" +vi.getInsertar_evidencia()+ "'where id_viaticos=" + vi.getId_viaticos();
        
         System.out.println("sentencia sql--> " + sql);
         try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
       
        }

        return false;
    }

    @Override
    public boolean eliminar(int id_viaticos) {
        String sql = "delete from viaticos where id_viaticos=" + id_viaticos;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("No se realiza la consulta");
        }
        return false;
    }
    
 }
