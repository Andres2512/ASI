package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOMarca;
import modeloDAO.DAOMarca;

public class CtrMarca extends HttpServlet {

    String listar = "vistasMarca/listarMarca.jsp";
    String agregar = "vistasMarca/agregarMarca.jsp";
    String editar = "vistasMarca/editarMarca.jsp";
    
    DTOMarca mrca = new DTOMarca();
    DAOMarca mrcaDAO = new DAOMarca();
    
    int Id_marcas;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrMarca</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrMarca at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listarMarca")) {
            acceso = listar;
        }else if (action.equalsIgnoreCase("agregarMarca")) {
            acceso = agregar;
        } else if (action.equalsIgnoreCase("btnAgregarMrca")) {
            String Nombre = request.getParameter("txtNombre");
            mrca.setNombre(Nombre);

            mrcaDAO.agregar(mrca);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editarMarca")) {
            request.setAttribute("Id_marca", request.getParameter("Id_marca"));
            acceso = editar;
        } else if (action.equalsIgnoreCase("btnActualizarMrca")) {
            int Id_marca = Integer.parseInt(request.getParameter("txtId_marca"));
            String Nombre = request.getParameter("txtNombre");
            mrca.setId_marca(Id_marca);
            mrca.setNombre(Nombre);
            
            mrcaDAO.editar(mrca);
            acceso = listar;
        }
        else if(action.equalsIgnoreCase("eliminarMarca")){
            int Id_marca = Integer.parseInt(request.getParameter("Id_marca"));
            mrca.setId_marca(Id_marca);
            
            mrcaDAO.eliminar(Id_marca);
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
