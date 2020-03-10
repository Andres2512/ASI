package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTONovedades;
import modeloDAO.DAONovedades;

public class CrtNovedades extends HttpServlet {

    String listarNovedades = "vistasNovedades/listarNovedad.jsp";
    String agregarNovedades = "vistasNovedades/agregarNovedad.jsp";
    String editarNovedades = "vistasNovedades/editarNovedad.jsp";
    DTONovedades nov = new DTONovedades();
    DAONovedades dao = new DAONovedades();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtNovedades</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtNovedades at " + request.getContextPath() + "</h1>");
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
            acceso = listarNovedades;
            System.out.println("Esta ingresando al CrtNovedades");
        } else if (action.equalsIgnoreCase("addN")) {
            acceso = agregarNovedades;
        } else if (action.equalsIgnoreCase("Agregar")) {
            boolean validacionFecha = false;
            Date fecha = null;
            try {
                fecha = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("txtFecha"));
                Date fechaActual = new Date();
                if (fechaActual.compareTo(fecha) > 0) {
                    request.getSession().setAttribute("fecha", fecha);
                    response.sendRedirect("vistasCotizacion/error.jsp");
                    return;
                } else {
                    validacionFecha = true;
                }
            } catch (ParseException e) {
                System.out.println(e.getMessage());
            }
            if (validacionFecha) {
                String Novedades = request.getParameter("txtNovedades");
                String Observaciones = request.getParameter("txtObservaciones");
                int Tipo_novedad_Id_tipo_novedad = Integer.parseInt(request.getParameter("txtTipo_novedad_Id_tipo_novedad"));
                java.sql.Date fechaEnviar = new java.sql.Date(fecha.getTime());
                nov.setFecha(fechaEnviar);
                nov.setNovedades(Novedades);
                nov.setObservaciones(Observaciones);
                nov.setTipo_novedad_Id_tipo_novedad(Tipo_novedad_Id_tipo_novedad);
                dao.add(nov);
                acceso = listarNovedades;
            }
        } else if (action.equalsIgnoreCase("Editar")) {
            request.setAttribute("Id_novedades", request.getParameter("Id_novedades"));
            acceso = editarNovedades;
        } else if (action.equalsIgnoreCase("Actualizar")) {
 boolean validacionFecha = false;
            Date fecha = null;
            try {
                fecha = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("txtFecha"));
                Date fechaActual = new Date();
                if (fechaActual.compareTo(fecha) > 0) {
                    request.getSession().setAttribute("fecha", fecha);
                    response.sendRedirect("vistasCotizacion/error.jsp");
                    return;
                } else {
                    validacionFecha = true;
                }
            } catch (ParseException e) {
                System.out.println(e.getMessage());
            }
            if (validacionFecha) {
                String Novedades = request.getParameter("txtNovedades");
                String Observaciones = request.getParameter("txtObservaciones");
                int Tipo_novedad_Id_tipo_novedad = Integer.parseInt(request.getParameter("txtTipo_novedad_Id_tipo_novedad"));
                java.sql.Date fechaEnviar = new java.sql.Date(fecha.getTime());
                nov.setFecha(fechaEnviar);
                nov.setNovedades(Novedades);
                nov.setObservaciones(Observaciones);
                nov.setTipo_novedad_Id_tipo_novedad(Tipo_novedad_Id_tipo_novedad);
                dao.add(nov);
                acceso = listarNovedades;
            }
        } else if (action.equalsIgnoreCase("eliminar")) {
            int Id_novedades = Integer.parseInt(request.getParameter("Id_novedades"));
            nov.setId_novedades(Id_novedades);
            dao.eliminar(Id_novedades);
            acceso = listarNovedades;
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
    }// </editor-fold>

}
