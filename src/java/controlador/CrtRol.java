package controlador;


import modeloDAO.DAORoles;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTORoles;

public class CrtRol extends HttpServlet {

//Ruta donde se encuentras las vistas
    String listar = "vistas/listar.jsp";
    String add = "vistas/add.jsp";
    String edit = "vistas/edit.jsp";
    DTORoles r = new DTORoles();
    DAORoles dao = new DAORoles();
    int Id_roles;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtRol</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtRol at " + request.getContextPath() + "</h1>");
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
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String id = request.getParameter("txtid");
            String Nombre = request.getParameter("txtnom");
            r.setId_roles(Integer.parseInt(id));
            r.setNombre(Nombre);
            dao.add(r);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("Id_roles", request.getParameter("Id_roles"));
            acceso = edit;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            Id_roles=Integer.parseInt(request.getParameter("txtid"));
            String Id_roles = request.getParameter("txtid");
            String Nombre = request.getParameter("txtnom");
            r.setId_roles(Integer.parseInt(Id_roles));
            r.setNombre(Nombre);
            dao.edit(r);
            acceso = listar;
        }else if(action.equalsIgnoreCase("eliminar")){
           Id_roles=Integer.parseInt(request.getParameter("Id_roles"));
            r.setId_roles(Id_roles);
           dao.Eliminar(Id_roles);
            acceso=listar;
        
    }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
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
