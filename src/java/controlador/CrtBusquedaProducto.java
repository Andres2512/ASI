package controlador;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.DTOMateriales1;
import modeloDAO.DAORecursos;

public class CrtBusquedaProducto extends HttpServlet {

    DAORecursos dAORecursos = new DAORecursos();
    List<DTOMateriales1> listadoAgregados = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BusquedaProducto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BusquedaProducto at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        int codigoMaterial = Integer.parseInt(request.getParameter("codigo"));
        DTOMateriales1 dtom = dAORecursos.materialesPorCodigo(codigoMaterial);
        listadoAgregados.add(dtom);

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listaAgregados", listadoAgregados);
        sesion.setMaxInactiveInterval(60 * 5); // 5 minutes
        request.getRequestDispatcher("Productos/Materiales.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nombreProducto = request.getParameter("nombreProducto");
        List<DTOMateriales1> listaMateriales = dAORecursos.materialesPorNombre(nombreProducto);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("</head>");
            out.println("<body>");
            out.println("<table class=table table-hover'>");
            out.println("<thead><tr>");
            out.println("<th scope='col'>Nombre</th>");
            out.println("<th scope='col'>Operaciones</th></tr>");
            out.println("</thead>");
            for (DTOMateriales1 dTOMaterial : listaMateriales) {

                out.println("<tbody>");
                out.println("<tr>");
                out.println("<td>");
                out.println("" + dTOMaterial.getNombre() + "");
                out.println("</td>");
                out.println("<td>");
                out.println("<a href=" + request.getContextPath() + "/CrtBusquedaProducto?codigo=" + dTOMaterial.getCodigoMaterial() + "><i class=\"fa fa-plus\"></i> Agregar</a>");
                out.println("</td>");
                out.println("</tr>");
                out.println("</tbody>");
            }
            out.println("</table>");
        }

        /*@Override
         public String getServletInfo() {
         return "Short description";

        /*@Override
         public String getServletInfo() {
         return "Short description";
         }// </editor-fold>*/
    }
}
