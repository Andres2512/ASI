package controlador;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOCotizacion;
import modelo.DTOProyecto;
import modelo.Email;
import modeloDAO.DAOCotizacion;
import modeloDAO.DAOProyecto;
import modeloDAO.daoEmail;

public class PedirCorreos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();
       daoEmail dao = new daoEmail();
        if (accion.equalsIgnoreCase("ListarP")) {                      
            for (Email emaill : dao.listarCorreo()) {
                JsonObject item4 = new JsonObject();
                item4.addProperty("correos", emaill.getCorreos() + ";");
                array.add(item4);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        }else if (accion.equalsIgnoreCase("ListarPQRSMensaje")) {//             accion para mostrar el mensaje dentro de un modal dependiendo el id seleccionado,    haciendo la peticion con ajax
            DAOProyecto pqD = new DAOProyecto();
            for (DTOProyecto pqrs : pqD.listarMensaje(Integer.parseInt(request.getParameter("mensajepqrss")))) {
                JsonObject item = new JsonObject();
                item.addProperty("mensajee", "<td id='" + pqrs.getId_proyecto() + "'>'" + pqrs.getAsignacion() + "'</td>");
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
        }else if (accion.equalsIgnoreCase("ListarDescripcionCotiz")) {//             accion para mostrar el mensaje dentro de un modal dependiendo el id seleccionado,    haciendo la peticion con ajax
            DAOCotizacion pqD = new DAOCotizacion();
            for (DTOCotizacion pqrs : pqD.listarDescripcionCoti(Integer.parseInt(request.getParameter("mensajepqrss")))) {
                JsonObject item = new JsonObject();
                item.addProperty("mensajeeee", "<td id='" + pqrs.getId_cotizacion() + "'>'" + pqrs.getDescripcion() + "'</td>");
                array.add(item);
            }
            gson.add("datos", array);
            out.print(gson.toString());
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
