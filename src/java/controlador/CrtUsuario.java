package controlador;
/** bueno aca tengo los redireccionamientos de las vistas, las peticiones(doget) y heredo las propiedades, metodos, atributos y funcionalidades de los servlets
 tambien implemente la condicion if else, para que se encargue de validar la informacion ingresada por el usuario, y un else if, para comprobar si es verdadera o falsa la informacion
 **/
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOUsuario;
import modeloDAO.DAOUsuario;

public class CrtUsuario extends HttpServlet {
String listarusuario = "VistasAdmin/listarUsuario.jsp";
    String listar = "VistasAdmin/listar.jsp";
    String agregar = "VistasAdmin/agregar.jsp";
    String editar = "VistasAdmin/editar.jsp";
    String Login="vistasLogin/login.jsp";
    String listarEmpleado = "vistaEmpleado/listarEmpleado.jsp";
    String agregarEmpleado = "vistaEmpleado/agregarEmpleado.jsp";
    String editarEmpleado = "vistaEmpleado/editarEmpleado.jsp";
    
    
    DTOUsuario usu = new DTOUsuario();
    DAOUsuario dao = new DAOUsuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";

        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listarusuario;
            System.out.println("Esta ingresando al CrtUsuario ");
        } else if (action.equalsIgnoreCase("add")) {
            acceso = agregar;
        } else if(action.equalsIgnoreCase("addEmpleado")) {
            acceso= agregarEmpleado;
        }
        else if (action.equalsIgnoreCase("Agregar")) {
            
            String Nombre = request.getParameter("txtNombre");
            String Apellidos = request.getParameter("txtApellidos");
            String Celular = request.getParameter("txtCelular");
            String Numero_telefono = request.getParameter("txtTelefono");
            String Correo = request.getParameter("txtCorreo");
            String Direccion = request.getParameter("txtDireccion");
            String Rol = request.getParameter("txtRol");
            String Ciudad = request.getParameter("txtCiudad");
            String Proyecto = request.getParameter("txtProyecto");
            String Contrasenia = request.getParameter("txtContrasenia");
    
            usu.setNombres(Nombre);
            usu.setApellidos(Apellidos);
            usu.setNumero_celular(Celular);
            usu.setNumero_telefono(Integer.parseInt(Numero_telefono));
            usu.setCorreo(Correo);
            usu.setDireccion(Direccion);
            usu.setRoles_Id_roles(Integer.parseInt(Rol));
            usu.setCiudades_Id_ciudades(Integer.parseInt(Ciudad));
            usu.setProyecto_Id_proyecto(Integer.parseInt(Proyecto));
            usu.setContrasenia(Contrasenia);
            dao.addTrabajador(usu);                           
           
            acceso = listarEmpleado;

        }else if(action.equalsIgnoreCase("AgregarLogin")){
            
            String Nombre = request.getParameter("txtNombre");
            String Apellidos = request.getParameter("txtApellidos");
            String Celular = request.getParameter("txtCelular");
            String Numero_telefono = request.getParameter("txtTelefono");
            String Correo = request.getParameter("txtCorreo");
            String Direccion = request.getParameter("txtDireccion");
            String Rol = request.getParameter("txtRol");
            String Ciudad = request.getParameter("txtCiudad");
            String Proyecto = request.getParameter("txtProyecto");
            String Contrasenia = request.getParameter("txtContrasenia");
                        
            usu.setNombres(Nombre);
            usu.setApellidos(Apellidos);
            usu.setNumero_celular(Celular);
            usu.setNumero_telefono(Integer.parseInt(Numero_telefono));
            usu.setCorreo(Correo);
            usu.setDireccion(Direccion);
            usu.setRoles_Id_roles(Integer.parseInt(Rol));
            usu.setCiudades_Id_ciudades(Integer.parseInt(Ciudad));
            usu.setProyecto_Id_proyecto(Integer.parseInt(Proyecto));
            usu.setContrasenia(Contrasenia);
            dao.addTrabajador(usu);
            
            acceso = Login;
            
        } else if (action.equalsIgnoreCase("Editar")) {
            request.setAttribute("Id_usuario", request.getParameter("Id_usuario"));
            acceso=editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            
            int id_usuario = Integer.parseInt(request.getParameter("txtId_usuario"));
            String Nombre = request.getParameter("txtNombre");
            String Apellidos = request.getParameter("txtApellidos");
            String Celular = request.getParameter("txtCelular");
            String Numero_telefono = request.getParameter("txtTelefono");
            String Correo = request.getParameter("txtCorreo");
            String Direccion = request.getParameter("txtDireccion");
            String Rol = request.getParameter("txtRol");
            String Ciudad = request.getParameter("txtCiudad");
            String Proyecto = request.getParameter("txtProyecto");
            String Contrasenia = request.getParameter("txtContrasenia");
            
            usu.setId_usuario(id_usuario);
            usu.setNombres(Nombre);
            usu.setApellidos(Apellidos);
            usu.setNumero_celular(Celular);
            usu.setNumero_telefono(Integer.parseInt(Numero_telefono));
            usu.setCorreo(Correo);
            usu.setDireccion(Direccion);
            usu.setRoles_Id_roles(Integer.parseInt(Rol));
            usu.setCiudades_Id_ciudades(Integer.parseInt(Ciudad));
            usu.setProyecto_Id_proyecto(Integer.parseInt(Proyecto));
            usu.setContrasenia(Contrasenia);
            
            dao.edit(usu);
            
            acceso = listarusuario;
            
        }else if (action.equalsIgnoreCase("eliminar")){
        int id_usuario=Integer.parseInt(request.getParameter("Id_usuario"));
        usu.setId_usuario(id_usuario);
        dao.eliminar(id_usuario);
        acceso=listarusuario;
        }
       

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
