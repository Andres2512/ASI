package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CtrGeneral extends HttpServlet {

    //variables Administrador
    String Inicio = "index.jsp";
    String ListarRecursos = "vistasRecursos/listarecursos.jsp";
    String AsignarRecursos = "vistasRecursos/agregarecursos.jsp";
    String novedades = "vistasNovedades/agregarNovedad.jsp";
    String ListarNovedad = "vistasNovedades/listarNovedad.jsp";
    String Editarnovedades = "vistasNovedades/editarNovedad.jsp";
    String Trabajador = "vistaEmpleado/agregarEmpleado.jsp";
    String ListarTrabajador = "vistaEmpleado/listarEmpleado.jsp";
    String ListarC = "vistasCotizacion/ListarCotizacion.jsp";
    String ListarP = "vistasProyecto/ListarProyecto.jsp";
    String AgregarP = "vistasProyecto/AddProyecto.jsp";
    String ListarCiudad = "vistasCiudades/ListarCiudades.jsp";
    String AgregarCoti = "vistasCotizacion/AddCotizacion.jsp";
    String listarTe = "VistasTipo_Estado/ListarTipo_Estado.jsp";
    
    String listarViaticos = "vistasViaticos/listarViaticos.jsp";

    String ConsultarHta = "vistasHerramientas/listarHerramientas.jsp";
    String ConsultarMtl = "vistasMateriales/listarMateriales.jsp";

    String ConsultarTipoHta = "vistasTipo_Herramientas/listarTipo_Herramientas.jsp";
    String ConsultarTipoMtl = "vistasTipo_Materiales/listarTipo_Materiales.jsp";

    String ConsultarMrca = "vistasMarca/listarMarca.jsp";

    //variables Contratista
    String listaR = "vistasRecursos/listarecursos.jsp";
    String AsignaR = "vistasRecursos/agregarecursos.jsp";
    String novedad = "vistasNovedades/agregarNovedad.jsp";
    String listarN = "vistasNovedades/listarNovedad.jsp";
    String editarN = "vistasNovedades/editarNovedad.jsp";
    String trabaja = "vistaEmpleado/agregarEmpleado.jsp";
    String listaT = "vistaEmpleado/listarEmpleado.jsp";
    String AgregaCoti = "vistasCotizacion/AddCotizacion.jsp";
    String EditarCoti = "vistasCotizacion/EditCotizacion.jsp";
    String ListarCoti = "vistasCotizacion/ListarCotizacion.jsp";
    

//variables clientes
    String Listacotizacion = "vistasCotizacion/ListarCotizacion.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CtrGeneral</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CtrGeneral at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");
        String acceso = "";
        //redirección Administrador
        if (action.equalsIgnoreCase("Inicio")) {
            acceso = Inicio;
        } 
        else if (action.equalsIgnoreCase("agregarrecurso")) {
            acceso = AsignarRecursos;
        } else if (action.equalsIgnoreCase("agregarNovedad")) {
            acceso = novedades;
        } else if (action.equalsIgnoreCase("listarNovedad")) {
            acceso = ListarNovedad;
        } else if (action.equalsIgnoreCase("Trabajador")) {
            acceso = Trabajador;
        } else if (action.equalsIgnoreCase("ListarTrabajador")) {
            acceso = ListarTrabajador;
        } else if (action.equalsIgnoreCase("listaderecursos")) {
            acceso = ListarRecursos;
        } else if (action.equalsIgnoreCase("ListarC")) {
            acceso = ListarC;
        } else if (action.equalsIgnoreCase("ListarProyecto")) {
            acceso = ListarP;
        } else if (action.equalsIgnoreCase("AddProyecto")) {
            acceso = AgregarP;
        } else if (action.equalsIgnoreCase("ListarCiudades")) {
            acceso = ListarCiudad;
        } else if (action.equalsIgnoreCase("ListarTipo_Estado")) {
            acceso = listarTe;
            
        } else if (action.equalsIgnoreCase("ListarViaticos")) {
            acceso = listarViaticos;    

        } else if (action.equalsIgnoreCase("ConsultarHta")) {
            acceso = ConsultarHta;
        } else if (action.equalsIgnoreCase("ConsultarMtl")) {
            acceso = ConsultarMtl;
        } else if (action.equalsIgnoreCase("ConsultarMrca")) {
            acceso = ConsultarMrca;
        } else if (action.equalsIgnoreCase("ConsultarTipoHta")) {
            acceso = ConsultarTipoHta;
            } else if (action.equalsIgnoreCase("ConsultarTipoMtl")) {
            acceso = ConsultarTipoMtl;

            //redirección contratista
        } else if (action.equalsIgnoreCase("listaR")) {
            acceso = listaR;
        } else if (action.equalsIgnoreCase("AsignaR")) {
            acceso = AsignaR;
        } else if (action.equalsIgnoreCase("novedad")) {
            acceso = novedad;
        } else if (action.equalsIgnoreCase("listarN")) {
            acceso = listarN;
        } else if (action.equalsIgnoreCase("editarN")) {
            acceso = editarN;
        } else if (action.equalsIgnoreCase("trabaja")) {
            acceso = trabaja;
        } else if (action.equalsIgnoreCase("listaT")) {
            acceso = listaT;
        } else if (action.equalsIgnoreCase("AgregaCoti")) {
            acceso = AgregaCoti;
        } else if (action.equalsIgnoreCase("EditarCoti")) {
            acceso = EditarCoti;
        } else if (action.equalsIgnoreCase("ListarCoti")) {
            acceso = ListarCoti;   
        } else if (action.equalsIgnoreCase("ListarProyecto")) {
            acceso = ListarP;
        } else if (action.equalsIgnoreCase("AddProyecto")) {
            acceso = AgregarP;
        } else if (action.equalsIgnoreCase("ListarCiudades")) {
            acceso = ListarCiudad;

            //redireccion clientes
        } else if (action.equalsIgnoreCase("Listacotizacion")) {
            acceso = Listacotizacion;
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
