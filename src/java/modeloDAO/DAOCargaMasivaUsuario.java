package modeloDAO;

import config.Conexion;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Daniel Avila
 */
public class DAOCargaMasivaUsuario {

    Conexion cn = new Conexion();
    Connection connection;
    PreparedStatement ps;

    public boolean cargaMasivaMarca(String archivo) {
        boolean flag = false;
        Scanner input;
        try {
            input = new Scanner(new File(archivo));
            input.useDelimiter(",|\n");
            ps = cn.getConnection().prepareStatement("INSERT INTO usuario(Nombres,Apellidos,Numero_celular,Numero_telefono,Correo,Direccion,Roles_Id_roles,Ciudades_Id_ciudades,Proyecto_Id_proyecto,contrasenia) values (?,?,?,?,?,?,?,?,?,?)");
            while (input.hasNext()) {
                String Nombres = input.next();
                String Apellidos = input.next();
                String Numero_celular = input.next();
                String Numero_telefono = input.next();
                String Correo = input.next();
                String Direccion = input.next();
                String Roles_Id_roles = input.next();
                String Ciudades_Id_ciudades = input.next();
                String Proyecto_Id_proyecto = input.next();
                String contrasenia = input.next();

                ps.setString(1, Nombres);
                ps.setString(2, Apellidos);
                ps.setString(3, Numero_celular);
                ps.setInt(4, Integer.parseInt(Numero_telefono));
                ps.setString(5, Correo);
                ps.setString(6, Direccion);
                ps.setInt(7, Integer.parseInt(Roles_Id_roles));
                ps.setInt(8, Integer.parseInt(Ciudades_Id_ciudades));
                ps.setInt(9, Integer.parseInt(Proyecto_Id_proyecto));
                ps.setString(10, contrasenia);
                if(ps.executeUpdate()==1){
                    flag = true;
                }
            }

        } catch (FileNotFoundException | SQLException ex) {
            Logger.getLogger(DAOCargaMasivaDatos.class.getName()).log(Level.SEVERE, null, ex);
        }
return flag;
    }

}

