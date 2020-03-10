package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOTipo_Herramientas;
import modeloDAO.DAOTipo_Herramientas;

public class CtrTipo_Herramientas extends HttpServlet {

    String listar = "vistasTipo_Herramientas/listarTipo_Herramientas.jsp";
    String agregar = "vistasTipo_Herramientas/agregarTipo_Herramientas.jsp";
    String editar = "vistasTipo_Herramientas/editarTipo_Herramientas.jsp";
    
    DTOTipo_Herramientas Tipo_hta = new DTOTipo_Herramientas();
    DAOTipo_Herramientas Tipo_htaDAO = new DAOTipo_Herramientas();

    int Id_tipo_herramientas;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrTipo_Herramientas</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrTipo_Herramientas at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listarTipo_Herramientas")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("agregarTipo_Herramientas")) {
            acceso = agregar;
        } else if (action.equalsIgnoreCase("btnAgregarTipoHta")) {
            String Tipo_herramientas = request.getParameter("txtTipo_herramientas");
            String Descripcion = request.getParameter("txtDescripcionHta");
            Tipo_hta.setTipo_herramientas(Tipo_herramientas);
            Tipo_hta.setDescripcion(Descripcion);

            Tipo_htaDAO.agregar(Tipo_hta);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editarTipo_Herramientas")) {
            request.setAttribute("Id_tipo_herramientas", request.getParameter("Id_tipo_herramientas"));
            acceso = editar;
        } else if (action.equalsIgnoreCase("btnActualizarTipoHta")) {
            Id_tipo_herramientas = Integer.parseInt(request.getParameter("txtId_tipo_herramientas"));
            String Tipo_herramientas = request.getParameter("txtTipo_herramientas");
            String Descripcion = request.getParameter("txtDescripcionHta");
            Tipo_hta.setId_tipo_herramientas(Id_tipo_herramientas);
            Tipo_hta.setTipo_herramientas(Tipo_herramientas);
            Tipo_hta.setDescripcion(Descripcion);

            Tipo_htaDAO.editar(Tipo_hta);
            acceso = listar;
        } else if(action.equalsIgnoreCase("eliminarTipo_Herramientas")){
            Id_tipo_herramientas = Integer.parseInt(request.getParameter("Id_tipo_herramientas"));
            Tipo_hta.setId_tipo_herramientas(Id_tipo_herramientas);
            
            Tipo_htaDAO.eliminar(Id_tipo_herramientas);
            acceso = listar;
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
