package controlador;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOCotizacion;
import modeloDAO.DAOCotizacion;

public class C_Cotizacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String accion = request.getParameter("accion");
        JsonObject gson = new JsonObject();
        JsonArray array = new JsonArray();

//  ******************************************  CRUD PARA LA TABLA DE INVENTARIO "ADMINISTRADOR"    ***********************************************************************************************************************        
            DAOCotizacion dao = new DAOCotizacion();
            DTOCotizacion c = new DTOCotizacion();
            if (accion.equalsIgnoreCase("ListarCotizacion")) {//                    ACCION PARA LISTAR LOS DATOS EN LA TABLA INVENTARIO
                for (DTOCotizacion invent : dao.listarCotizacion(Integer.parseInt(request.getParameter("idCotizacion")))) {
                    JsonObject item = new JsonObject();
                    item.addProperty("getId_cotizacion", invent.getId_cotizacion());
                    item.addProperty("getNombreMaterial", invent.getNombreMaterial());
                    item.addProperty("getCantidad", invent.getCantidad());
                    item.addProperty("getValorUnitario", invent.getValorUnitario());
                    item.addProperty("getValor_total", invent.getValor_total());
                    item.addProperty("getFecha_cotizacion", invent.getFecha_cotizacion());
                    item.addProperty("Descripcion", "<a class=\"btn btn-primary btnMensajeAsignacion\" style=\"color: #fff\" data-toggle=\"modal\" data-target=\"#modalMensajee\" href=\"#\"><i class=\"far fa-folder-open\"></i></a>");
                    item.addProperty("Editar", "<a id='" + invent.getId_cotizacion() + "' class=\"btn btn-warning btnEditar\" style=\"color: #fff\" id=\"<%=Cotizacion.getId_cotizacion()%>\" data-toggle=\"modal\" data-target=\"#modalEditar\"><i class=\"fas fa-edit\"></i></a>");
                    item.addProperty("Eliminar", "<a id='" + invent.getId_cotizacion() + "' class=\"btn btn-danger btnEliminar\" style=\"color: #fff\" id=\"ejemplo\" target=\"\"><i class=\"fas fa-trash-alt\"></i></a> ");
                    array.add(item);
                }
                gson.add("datos", array);
                out.print(gson.toString());
            } else if (accion.equalsIgnoreCase("Agregar")) {
//            boolean validacionFecha = false;
//            Date fecha = null;
//            try {
//                fecha = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("txtfecoti"));
//                Date fechaActual = new Date();
//                if (fechaActual.compareTo(fecha) > 0) {
//                    request.getSession().setAttribute("fecha", fecha);
////                    response.sendRedirect("vistasCotizacion/error.jsp");
//                    return;
//                } else {
//                    validacionFecha = true;
//                }
//            } catch (ParseException e) {
//                System.out.println(e.getMessage());
//            }
//            if (validacionFecha) {
            c.setNombreMaterial(request.getParameter("txtnombre"));
            c.setDescripcion(request.getParameter("txtdes"));
            c.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            c.setValorUnitario(Float.parseFloat(request.getParameter("txtvaltorUnitario")));
            c.setIdProyecto(Integer.parseInt(request.getParameter("txtpidp")));
            if (dao.add(c)) {
                out.print("1");
            } else {
                out.print("0");
            }
//            }
        } else if (accion.equalsIgnoreCase("editarCotizacionModal")) {//           Accion para llenar el modal de editar perdil jugador
            JsonObject gson2 = new JsonObject();
            JsonArray array2 = new JsonArray();
            DTOCotizacion invent = (DTOCotizacion) dao.list(Integer.parseInt(request.getParameter("idCotizacionModal")));
            JsonObject item = new JsonObject();
            item.addProperty("getId_cotizacion", invent.getId_cotizacion());
            item.addProperty("getNombreMaterial", invent.getNombreMaterial());
            item.addProperty("getCantidad", invent.getCantidad());
            item.addProperty("getValorUnitario", invent.getValorUnitario());
            item.addProperty("getValor_total", invent.getValor_total());
            item.addProperty("getFecha_cotizacion", invent.getFecha_cotizacion());
            item.addProperty("getDescripcion", invent.getDescripcion());
            array2.add(item);
            gson2.add("datos", array2);
            out.print(gson2.toString());

        }else if (accion.equalsIgnoreCase("valorFinalId")) {//           Accion para llenar el modal de editar perdil jugador
            JsonObject gson2 = new JsonObject();
            JsonArray array2 = new JsonArray();
            DTOCotizacion invent = (DTOCotizacion) dao.sumaValorTotalCoti(Integer.parseInt(request.getParameter("valorFinalId")));
            JsonObject item = new JsonObject();
            item.addProperty("getValorFinalId", invent.getValorFinalId()+"$");
            array2.add(item);
            gson2.add("datos", array2);
            out.print(gson2.toString());

        } else if (accion.equalsIgnoreCase("Actualizar")) {
            c.setId_cotizacion(Integer.parseInt(request.getParameter("txtidcoti")));
            c.setNombreMaterial(request.getParameter("txtnombre"));
            c.setDescripcion(request.getParameter("txtdes"));
            c.setCantidad(Integer.parseInt(request.getParameter("txtCantidad")));
            c.setValorUnitario(Float.parseFloat(request.getParameter("txtvaltorUnitario")));
            if (dao.edit(c)) {
                out.print("1");
            } else {
                out.print("0");
            }
        } else if (accion.equalsIgnoreCase("EliminarCotizacion")) {//           ACCION PARA ELIMINAR LOS DATOS EN LA TABLA INVENTARIO
            int idCotizacion = Integer.parseInt(request.getParameter("idCotizacion"));
            if (dao.Eliminar(idCotizacion)) {
                out.print("1");
            } else {
                out.print("0");
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
