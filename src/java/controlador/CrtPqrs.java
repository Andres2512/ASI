package controlador;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOPqrs;
import modelo.DTOUsuario;
import modeloDAO.DAOPqrs;
import modelo.M_Enviar;
import modeloDAO.DAOUsuario;

public class CrtPqrs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();
        
        DAOPqrs pqrD = new DAOPqrs();
        DTOPqrs pqrsM;
        
        DAOUsuario usD = new DAOUsuario();
        
        if (accion.equalsIgnoreCase("ListarPQRS")) {//                   accion para listar los datos en la tabla PQRS
            for (DTOPqrs pqrs : pqrD.listar()) {
                JsonObject item = new JsonObject();
                item.addProperty("idPQRS", pqrs.getId());
                item.addProperty("nombre", pqrs.getNombres());
                item.addProperty("Email", pqrs.getEmail());
                item.addProperty("mensajee", "<td id='" + pqrs.getId() + "'>'" + pqrs.getMensaje() + "'</td>");
                item.addProperty("mensaje", "<a id='" + pqrs.getId() + "'class=\"btn btn-outline-success btnMensajepqr\" data-toggle=\"modal\" data-target=\"#mo0dalMensajee\" href=\"Usuarion?accion=ListarPQRS&mensajepqrss=" + pqrs.getId() + "\"><i style='color: green' class=\"fas fa-envelope\"></i></a> ");
                item.addProperty("Responder", "<a id='" + pqrs.getId() + "' class=\"btn btn-outline-info btnEditar\" data-toggle=\"modal\" data-target=\"#modalRespuesta\" href=\"#\"><i class=\"far fa-edit\"></i></a> ");
                item.addProperty("Eliminar",  "<a id='" + pqrs.getId() + "' class='btn btn-outline-danger btnEliminar' href='#'><i class=\"far fa-trash-alt\"></i></a>");
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        } 
        else if (accion.equalsIgnoreCase("ListarPQRSMensaje")) {//             accion para mostrar el mensaje dentro de un modal dependiendo el id seleccionado,    haciendo la peticion con ajax
            for (DTOPqrs pqrs : pqrD.listarMensaje(Integer.parseInt(request.getParameter("mensajepqrss")))) {
                JsonObject item = new JsonObject();
                item.addProperty("mensajee", "<td id='" + pqrs.getId() + "'>'" + pqrs.getMensaje() + "'</td>");
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        } 
        else if (accion.equalsIgnoreCase("AgregarPQRS")) {//                  accion para agregar los datos en la tabla PQRS
            pqrsM = new DTOPqrs(request.getParameter("NameP"), request.getParameter("EmailP"), request.getParameter("MessageP"));
            if (pqrD.agregar(pqrsM)) {
                out.println("1");
            } else {
                out.println("0");
            }
        } 
        else if (accion.equalsIgnoreCase("EliminarPQRS")) {//                 accion para eliminar los datos en la tabla PQRS
            int idpqrs = Integer.parseInt(request.getParameter("idpqrs"));
            pqrD.delete(idpqrs);
        } 
        else if (accion.equalsIgnoreCase("responderPqrs")) {//                 accion para eliminar los datos en la tabla PQRS
            M_Enviar email = new M_Enviar();
            String de = "asiahorrosistemainformacion@gmail.com";
            String clave = "asiAHORRO1234567890";
            String para = request.getParameter("para");
            String mensaje = request.getParameter("mensaje");
            String asunto = request.getParameter("asunto");
            boolean resultado = email.enviarCorreo(de, clave, para, mensaje, asunto);
            if (resultado) {
                out.print("1");
            } else {
                out.print("0");
            }
        }else if (accion.equalsIgnoreCase("modalEditarPerfil")) {//              accion para llenar el modal de editar perfil
            JsonObject gson2 = new JsonObject();
            JsonArray array2 = new JsonArray();
            int numeroDocumneto = Integer.parseInt(request.getParameter("numeroDocumentoModalEdit"));
            DAOUsuario mpvd3 = new DAOUsuario();
            DTOUsuario prv3 = (DTOUsuario) mpvd3.list(numeroDocumneto);
            JsonObject item1 = new JsonObject();
            item1.addProperty("primerNombreModal", prv3.getNombres());
            item1.addProperty("segundoNombreModal", prv3.getApellidos());
            item1.addProperty("primerApellidoModal", prv3.getNumero_celular());
            item1.addProperty("segundoApellidoModal", prv3.getNumero_telefono());
            item1.addProperty("celularModal", prv3.getCorreo());
            item1.addProperty("telefonoModal", prv3.getDireccion());
            array2.add(item1);
            gson2.add("datos", array2);
            out.print(gson2.toString());
        }else if (accion.equalsIgnoreCase("ActualizarDatosPerfil")) {//            accion para actualizar los datos en la tabla usuario
            DTOUsuario usuario = new DTOUsuario(request.getParameter("txttPrimerNombre"), request.getParameter("txttSegundoNombreee"), request.getParameter("txttPrimerApellidooo"), Integer.parseInt(request.getParameter("txttSegundoApellido")), request.getParameter("txttCulularrr"), request.getParameter("txttTelefonoo"));
            int numeroDocumento = Integer.parseInt(request.getParameter("numeroDocumnetoPerfil"));
            if (usD.editProfile(usuario, numeroDocumento)) {
                out.println("1");
            } else {
                out.println("0");
            }
        } if (accion.equalsIgnoreCase("cambioContrasena")) {
            String contrasenaa = request.getParameter("txtvalidacionContrasenaaaa");
            contrasenaa = contrasenaa;
            DTOUsuario usss = (DTOUsuario) usD.contrasena(Integer.parseInt(request.getParameter("cedulaIngreso")));
            if (usss.getContrasenia().equalsIgnoreCase(contrasenaa)) {
                out.println("1");
            } else {
                out.println("0");
            }
        } if (accion.equalsIgnoreCase("nuevaContrasena")) {
            String contraseñaNueva = request.getParameter("txtcontraseñaNueva");
            if (usD.cambiarClave(Integer.parseInt(request.getParameter("cedulaIngresoooo")), contraseñaNueva)) {
                out.println("1");
            } else {
                out.println("0");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
