package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOTipo_Materiales;
import modeloDAO.DAOTipo_Materiales;

public class CtrTipo_Materiales extends HttpServlet {

    String listar = "vistasTipo_Materiales/listarTipo_Materiales.jsp";
    String agregar = "vistasTipo_Materiales/agregarTipo_Materiales.jsp";
    String editar = "vistasTipo_Materiales/editarTipo_Materiales.jsp";

    DTOTipo_Materiales Tipo_mtl = new DTOTipo_Materiales();
    DAOTipo_Materiales Tipo_mtlDAO = new DAOTipo_Materiales();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrTipo_Materiales</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrTipo_Materiales at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listarTipo_Materiales")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("agregarTipo_Materiales")) {
            acceso = agregar;
        } else if (action.equalsIgnoreCase("btnAgregarTipoMtl")) {
            String Tipo_materiales = request.getParameter("txtTipo_materiales");
            String Descripcion = request.getParameter("txtDescripcionMtl");
            Tipo_mtl.setTipo_materiales(Tipo_materiales);
            Tipo_mtl.setDescripcion(Descripcion);

            Tipo_mtlDAO.agregar(Tipo_mtl);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editarTipo_Materiales")) {
            request.setAttribute("Id_tipo_materiales", request.getParameter("Id_tipo_materiales"));
            acceso = editar;
        } else if (action.equalsIgnoreCase("btnActualizarTipoMtl")) {
            int Id_tipo_materiales = Integer.parseInt(request.getParameter("txtId_tipo_materiales"));
            String Tipo_materiales = request.getParameter("txtTipo_materiales");
            String Descripcion = request.getParameter("txtDescripcionMtl");
            Tipo_mtl.setId_tipo_materiales(Id_tipo_materiales);
            Tipo_mtl.setTipo_materiales(Tipo_materiales);
            Tipo_mtl.setDescripcion(Descripcion);

            Tipo_mtlDAO.editar(Tipo_mtl);
            acceso = listar;
        }
        else if(action.equalsIgnoreCase("eliminarTipo_Materiales")){
            int Id_tipo_materiales = Integer.parseInt(request.getParameter("Id_tipo_materiales"));
            Tipo_mtl.setId_tipo_materiales(Id_tipo_materiales);
            
            Tipo_mtlDAO.eliminar(Id_tipo_materiales);
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
    }// </editor-fold>

}
