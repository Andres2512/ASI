package modeloDAO;

import config.Conexion;
import interfaces.IntUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.DTOUsuario;

/**
 * aqui tengo lo que es la logica del negocio y heredo de la interfax por medio
 * del (implements) *
 */
public class DAOUsuario implements IntUsuario {

    /**
     * tambien está la Conexion a la BD, creo el metodo preparedstatement para
     * mantener las consultas sin tener en cuenta los parametros; luego creo el
     * resultset para obtener los resultados de la consulta y por ultimo
     * instancio la clase daopara traer los datos
     */
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOUsuario u = new DTOUsuario();

    @Override
    public List listar() {
        /**
         * creo la consulta de la tabla en la BD, prevengo las excepciones que
         * se realizan en la ejecucion con el TRY y con el CATCH especifico la
         * accion que va a ocurrir, en este caso las excepciones del TRY luego
         * creo un bucle (while) para ejecutar la sentencia mientras sea
         * verdadera, con el metodo get guardo los datos que obtengo a traves
         * del set y tengo un retorno listUsuario*
         */
        ArrayList<DTOUsuario> listUsuario = new ArrayList<>();
        String sql = "select * from usuario";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                DTOUsuario usu = new DTOUsuario();
                usu.setId_usuario(rs.getInt("Id_usuario"));
                usu.setNombres(rs.getString("Nombres"));
                usu.setApellidos(rs.getString("Apellidos"));
                usu.setNumero_celular(rs.getString("Numero_celular"));
                usu.setNumero_telefono(rs.getInt("Numero_telefono"));
                usu.setCorreo(rs.getString("Correo"));
                usu.setDireccion(rs.getString("Direccion"));
                usu.setRoles_Id_roles(rs.getInt("Roles_Id_roles"));
                usu.setCiudades_Id_ciudades(rs.getInt("Ciudades_Id_ciudades"));
                usu.setProyecto_Id_proyecto(rs.getInt("Proyecto_Id_proyecto"));
                usu.setContrasenia(rs.getString("contrasenia"));
                listUsuario.add(usu);

            }

        } catch (SQLException e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return listUsuario;

    }

    @Override
    public DTOUsuario list(int Id_usuario) {
        String sql = "select * from usuario where Id_usuario=" + Id_usuario;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                u.setId_usuario(rs.getInt("Id_usuario"));
                u.setNombres(rs.getString("Nombres"));
                u.setApellidos(rs.getString("Apellidos"));
                u.setNumero_celular(rs.getString("Numero_celular"));
                u.setNumero_telefono(rs.getInt("Numero_telefono"));
                u.setCorreo(rs.getString("Correo"));
                u.setDireccion(rs.getString("Direccion"));
                u.setRoles_Id_roles(rs.getInt("Roles_Id_roles"));
                u.setCiudades_Id_ciudades(rs.getInt("Ciudades_Id_ciudades"));
                u.setProyecto_Id_proyecto(rs.getInt("Proyecto_Id_proyecto"));
                u.setContrasenia(rs.getString("contrasenia"));

            }

        } catch (Exception e) {
            System.out.println("No realiza la consulta para realizar login");
        }
        return u;

    }

    @Override
    public boolean add(DTOUsuario usu) {
        int rol = 2;

        String sql = "insert into usuario(Nombres, Apellidos, Numero_celular, Numero_telefono, Correo, Direccion, Roles_Id_roles, Ciudades_Id_ciudades, Proyecto_Id_proyecto, Contrasenia)values('" + usu.getNombres() + "','" + usu.getApellidos() + "','" + usu.getNumero_celular() + "','" + usu.getNumero_telefono() + "','" + usu.getCorreo() + "','" + usu.getDireccion() + "','" + rol + "','" + usu.getCiudades_Id_ciudades() + "','" + usu.getProyecto_Id_proyecto() + "','" + usu.getContrasenia() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean edit(DTOUsuario usu) {
        String sql = "update usuario set Nombres='" + usu.getNombres() + "',Apellidos='" + usu.getApellidos() + "',Numero_celular='" + usu.getNumero_celular() + "',Numero_telefono='" + usu.getNumero_telefono() + "',Correo='" + usu.getCorreo() + "',Direccion='" + usu.getDireccion() + "',Roles_Id_roles='" + usu.getRoles_Id_roles() + "',Ciudades_Id_ciudades='" + usu.getCiudades_Id_ciudades() + "',Proyecto_Id_proyecto='" + usu.getProyecto_Id_proyecto() + "',Contrasenia='" + usu.getContrasenia() + "'where Id_usuario=" + usu.getId_usuario();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
        }

        return false;
    }

    @Override
    public boolean eliminar(int Id_usuario) {

        String sql = "delete from usuario where Id_usuario=" + Id_usuario;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("No se realiza la consulta");
        }
        return false;
    }

    /* public static void main(String[] args) {
        DAOUsuario dao = new DAOUsuario();
        
        dao.eliminar(0000000001);
    }
     */
    @Override
    public boolean addTrabajador(DTOUsuario usu) {

        String sql = "insert into usuario(Nombres, Apellidos, Numero_celular, Numero_telefono, Correo, Direccion, Roles_Id_roles, Ciudades_Id_ciudades, Proyecto_Id_proyecto)values('" + usu.getNombres() + "','" + usu.getApellidos() + "','" + usu.getNumero_celular() + "','" + usu.getNumero_telefono() + "','" + usu.getCorreo() + "','" + usu.getDireccion() + "','" + usu.getRoles_Id_roles() + "','" + usu.getCiudades_Id_ciudades() + "','" + usu.getProyecto_Id_proyecto() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }

        return false;
    }

    public boolean editProfile(DTOUsuario usu, int cedula) {
        boolean flag = false;
        String sql = "update usuario set Nombres=?,Apellidos=?,Numero_celular=?,Numero_telefono=?,Correo=?,Direccion=? where Id_usuario =" + cedula;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getNombres());
            ps.setString(2, usu.getApellidos());
            ps.setString(3, usu.getNumero_celular());
            ps.setInt(4, usu.getNumero_telefono());
            ps.setString(5, usu.getCorreo());
            ps.setString(6, usu.getDireccion());
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }
    // VALIDAR SI LA CONTRASEÑA ES LA DE LA BASE DE DATOS 
    public DTOUsuario contrasena(int cedula){
        DTOUsuario usu = new DTOUsuario();
        String sql = "select contrasenia from usuario where Id_usuario = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cedula);
            rs = ps.executeQuery();
            while(rs.next()){
                usu.setContrasenia(rs.getString("contrasenia"));
            }
        } catch (Exception e) {
        }
        return usu;
    }
    public boolean cambiarClave( int cedula, String contrasena){
        boolean flag = false;
        String sql = "update usuario set contrasenia = ? where Id_usuario = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, contrasena);
            ps.setInt(2, cedula);
            if(ps.executeUpdate() == 1){
                flag = true;
            }
        } catch (Exception e) {
        }
        return flag;
    }

}
