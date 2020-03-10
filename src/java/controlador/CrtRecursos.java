package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTORecursos;
import modeloDAO.DAORecursos;

public class CrtRecursos extends HttpServlet{

    String listar = "vistasRecursos/listarecursos.jsp";
    String agregar = "vistasRecursos/agregarecursos.jsp";
    String editar = "vistasRecursos/editarecursos.jsp";
    DTORecursos re = new DTORecursos();
    DAORecursos dao = new DAORecursos();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtRecursos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtRecursos at " + request.getContextPath() + "</h1>");
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
            acceso = listar;
            System.out.println("Esta ingresando al CrtRecursos");
        } else if (action.equalsIgnoreCase("add")) {
            acceso = agregar;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String Fecha = request.getParameter("txtFecha");
            String Cantidad = request.getParameter("txtCantidad");
            String Observaciones = request.getParameter("txtObservaciones");
            
            re.setFecha(Date.valueOf(Fecha));
            re.setCantidad(Cantidad);
            re.setObservaciones(Observaciones);
            dao.add(re);
            acceso = listar;

        } else if (action.equalsIgnoreCase("Editar")) {
            request.setAttribute("idAsignacion_Recursos", request.getParameter("idAsignacion_Recursos"));
            acceso=editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            
            int idAsignacion_Recursos = Integer.parseInt(request.getParameter("txtidAsignacion_Recursos"));
            String Fecha = request.getParameter("txtFecha");
            String Cantidad = request.getParameter("txtCantidad");
            String Observaciones = request.getParameter("txtObservaciones");
            
            re.setIdAsignacion_Recursos(idAsignacion_Recursos);
            re.setFecha(Date.valueOf(Fecha));
            re.setCantidad(Cantidad);
            re.setObservaciones(Observaciones);
            
            dao.edit(re);
            acceso = listar;
        }
        else if (action.equalsIgnoreCase("eliminar")){
        int idAsignacion_Recursos=Integer.parseInt(request.getParameter("idAsignacion_Recursos"));
        re.setIdAsignacion_Recursos(idAsignacion_Recursos);
        dao.eliminar(idAsignacion_Recursos);
        acceso=listar;
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
