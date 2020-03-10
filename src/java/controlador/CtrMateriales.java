package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOMateriales;
import modeloDAO.DAOMateriales;

public class CtrMateriales extends HttpServlet {
    
    String listar = "vistasMateriales/listarMateriales.jsp";
    String agregar = "vistasMateriales/agregarMateriales.jsp";
    String editar = "vistasMateriales/editarMateriales.jsp";

    DTOMateriales mtl = new DTOMateriales();
    DAOMateriales mtlDAO = new DAOMateriales();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrMateriales</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrMateriales at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listarMateriales")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("agregarMateriales")) {
            acceso = agregar;
        } else if (action.equalsIgnoreCase("btnAgregarMtl")) {
            String Nombre = request.getParameter("txtNombre");
            String Descripcion = request.getParameter("txtDescripcionMtl");
            String Precio = request.getParameter("txtPrecio");
            int Cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            int Marca_Id_marca = Integer.parseInt(request.getParameter("txtMarca_Id_marca"));
            int Tipo_materiales_Id_tipo_materiales = Integer.parseInt(request.getParameter("txtTipo_materiales_Id_tipo_materiales"));
            mtl.setNombre(Nombre);
            mtl.setDescripcion(Descripcion);
            mtl.setPrecio(Precio);
            mtl.setCantidad(Cantidad);
            mtl.setMarca_Id_marca(Marca_Id_marca);
            mtl.setTipo_materiales_Id_tipo_materiales(Tipo_materiales_Id_tipo_materiales);

            mtlDAO.agregar(mtl);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editarMateriales")) {
            request.setAttribute("Id_materiales", request.getParameter("Id_materiales"));
            acceso = editar;
        } else if (action.equalsIgnoreCase("btnActualizarMtl")) {
            int Id_materiales = Integer.parseInt(request.getParameter("txtId_materiales"));
            String Nombre = request.getParameter("txtNombre");
            String Descripcion = request.getParameter("txtDescripcionMtl");
            String Precio = request.getParameter("txtPrecio");
            int Cantidad = Integer.parseInt(request.getParameter("txtCantidad"));
            int Marca_Id_marca = Integer.parseInt(request.getParameter("txtMarca_Id_marca"));
            int Tipo_materiales_Id_tipo_materiales = Integer.parseInt(request.getParameter("txtTipo_materiales_Id_tipo_materiales"));
            mtl.setId_materiales(Id_materiales);
            mtl.setNombre(Nombre);
            mtl.setDescripcion(Descripcion);
            mtl.setPrecio(Precio);
            mtl.setCantidad(Cantidad);
            mtl.setMarca_Id_marca(Marca_Id_marca);
            mtl.setTipo_materiales_Id_tipo_materiales(Tipo_materiales_Id_tipo_materiales);

            mtlDAO.editar(mtl);
            acceso = listar;
        }
        else if(action.equalsIgnoreCase("eliminarMateriales")){
            int Id_materiales = Integer.parseInt(request.getParameter("Id_materiales"));
            mtl.setId_materiales(Id_materiales);
            
            mtlDAO.eliminar(Id_materiales);
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
