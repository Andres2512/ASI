package controlador;

//package controlador;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import modelo.DTOHerramientas;
//import modeloDAO.DAOHerramientas;
//
//public class CtrHerramientas extends HttpServlet {
//
//    String listar = "vistasHerramientas/listarHerramientas.jsp";
//    String agregar = "vistasHerramientas/agregarHerramientas.jsp";
//    String editar = "vistasHerramientas/editarHerramientas.jsp";
//
//DTOHerramientas hta = new DTOHerramientas();
//    DAOHerramientas htaDAO = new DAOHerramientas();
//
//    int Id_herramientas;
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CtrHerramientas</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CtrHerramientas at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String acceso = "";
//        String action = request.getParameter("accion");
//        if (action.equalsIgnoreCase("listarHerramientas")) {
//            acceso = listar;
//        } else if (action.equalsIgnoreCase("agregarHerramientas")) {
//            acceso = agregar;
//        } else if (action.equalsIgnoreCase("btnAgregarHta")) {
//            String Nombre = request.getParameter("txtNombre");
//            String Descripcion = request.getParameter("txtDescripcionHta");
//            int Precio = Integer.parseInt(request.getParameter("txtPrecio"));
//            String Cantidad = request.getParameter("txtCantidad");
//            int Tipo_herramientas_Id_tipo_herramientas = Integer.parseInt(request.getParameter("txtTipo_herramientas_Id_tipo_herramientas"));
//            hta.setNombre(Nombre);
//            hta.setDescripcion(Descripcion);
//            hta.setPrecio(Precio);
//            hta.setCantidad(Cantidad);
//            hta.setTipo_herramientas_Id_tipo_herramientas(Tipo_herramientas_Id_tipo_herramientas);
//
//            htaDAO.agregar(hta);
//            acceso = listar;
//        } else if (action.equalsIgnoreCase("editarHerramientas")) {
//            request.setAttribute("Id_herramientas", request.getParameter("Id_herramientas"));
//            acceso = editar;
//        } else if (action.equalsIgnoreCase("btnActualizarHta")) {
//            Id_herramientas = Integer.parseInt(request.getParameter("txtId_herramientas"));
//            String Nombre = request.getParameter("txtNombre");
//            String Descripcion = request.getParameter("txtDescripcionHta");
//            int Precio = Integer.parseInt(request.getParameter("txtPrecio"));
//            String Cantidad = request.getParameter("txtCantidad");
//            int Tipo_herramientas_Id_tipo_herramientas = Integer.parseInt(request.getParameter("txtTipo_herramientas_Id_tipo_herramientas"));
//            hta.setId_herramientas(Id_herramientas);
//            hta.setNombre(Nombre);
//            hta.setDescripcion(Descripcion);
//            hta.setPrecio(Precio);
//            hta.setCantidad(Cantidad);
//            hta.setTipo_herramientas_Id_tipo_herramientas(Tipo_herramientas_Id_tipo_herramientas);
//
//            htaDAO.editar(hta);
//            acceso = listar;
//        } else if (action.equalsIgnoreCase("eliminarHerramientas")) {
//            Id_herramientas = Integer.parseInt(request.getParameter("Id_herramientas"));
//            hta.setId_herramientas(Id_herramientas);
//
//            htaDAO.eliminar(Id_herramientas);
//            acceso = listar;
//        } else if (action.equalsIgnoreCase("Buscar")) {
//            String dato = request.getParameter("txtBuscar");
//            List<DTOHerramientas> lista = htaDAO.buscar(dato);
//            request.setAttribute("datos", lista);
//            request.getRequestDispatcher("vistasHerramientas/listarHerramientas.jsp").forward(request, response);
//        }
//        RequestDispatcher vista = request.getRequestDispatcher(acceso);
//        vista.forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }
//
//}
