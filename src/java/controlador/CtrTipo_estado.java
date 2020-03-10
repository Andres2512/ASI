package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOTipo_estado;
import modeloDAO.DAOTipo_estado;

public class CtrTipo_estado extends HttpServlet {

    //Ruta donde se encuentras las vistas
    String listarTe = "VistasTipo_Estado/ListarTipo_Estado.jsp";
    String AddTe = "VistasTipo_Estado/AddTipo_Estado.jsp";
    String EditTe = "VistasTipo_Estado/EditTipo_Estado.jsp";
    DTOTipo_estado t = new DTOTipo_estado();
    DAOTipo_estado dao = new DAOTipo_estado();
    int Id_tipo_estado;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //Para aceptar caracteres especiales
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrTipo_estado</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrTipo_estado at " + request.getContextPath() + "</h1>");
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
            acceso = listarTe;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = AddTe;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String Estado = request.getParameter("txtestado");
            String Observacion = request.getParameter("txtobservacion");
            t.setEstado(Estado);
            t.setObservacion(Observacion);
            dao.add(t);
            acceso = listarTe;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("Id_tipo_estado", request.getParameter("Id_tipo_estado"));
            acceso = EditTe;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            Id_tipo_estado = Integer.parseInt(request.getParameter("txtId_tipo_estado"));
            String Estado = request.getParameter("txtestado");
            String Observacion = request.getParameter("txtobservacion");

            t.setId_tipo_estado(Id_tipo_estado);
            t.setEstado(Estado);
            t.setObservacion(Observacion);

            dao.edit(t);
            acceso = listarTe;
        } else if (action.equalsIgnoreCase("eliminar")) {
            Id_tipo_estado = Integer.parseInt(request.getParameter("Id_tipo_estado"));
            t.setId_tipo_estado(Id_tipo_estado);
            dao.Eliminar(Id_tipo_estado);
            acceso = listarTe;
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
