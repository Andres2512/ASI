/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.DTOViaticos;
import modeloDAO.DAOViaticos;

/**
 *
 * @author Vannesa
 */
public class CtrViaticos extends HttpServlet {

    String listarViaticos = "vistasViaticos/listarViaticos.jsp";
    String agregarViaticos = "vistasViaticos/agregarViaticos.jsp";
    String editarViaticos = "vistasViaticos/editarViaticos.jsp";

    DTOViaticos vi = new DTOViaticos();
    DAOViaticos dao = new DAOViaticos();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrViaticos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrViaticos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso = "";
       
        

        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("listar")) {
            acceso = listarViaticos;
            System.out.println("Esta ingresando al CtrViaticos");
        } else if (action.equalsIgnoreCase("addv")) {
           acceso = agregarViaticos;
        } else if (action.equalsIgnoreCase("addvv")) {
             acceso = agregarViaticos;
           // int    id_viaticos = Integer.parseInt(request.getParameter("txtid_viaticos"));
            String Descripcion_viatico = request.getParameter("txtDescripcion_viatico");
            String Tipo_viatico = request.getParameter("txtTipo_viatico");
            String Nombre_trabajador = request.getParameter("txtNombre_trabajador");
            String id_usuario = request.getParameter("txtid_usuario");
            String valor_viatico = request.getParameter("txtvalor_viatico");
//            InputStream Insertar_evidencia = request.getParameter("txtInsertar_evidencia");
               String Insertar_evidencia =request.getParameter("txtInsertar_evidencia");
            System.out.println("controlador.CtrViaticos.doGet()" +Descripcion_viatico +Tipo_viatico + Nombre_trabajador +id_usuario +valor_viatico + Insertar_evidencia );
          
           /// vi.setId_viaticos(id_viaticos);
            vi.setDescripcion_viatico(Descripcion_viatico);
            vi.setTipo_viatico(Tipo_viatico);
            vi.setNombres_trabajador(Nombre_trabajador);
            vi.setId_usuario(Integer.parseInt(id_usuario));
            vi.setValor_viatico(Double.parseDouble (valor_viatico));
            vi.setInsertar_evidencia(Insertar_evidencia);
            dao.add(vi);
            acceso = listarViaticos;

        } else if (action.equalsIgnoreCase("Editar")) {
            request.setAttribute("Id_viaticos", request.getParameter("Id_viaticos"));
            acceso=editarViaticos;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            
            int id_viaticos = Integer.parseInt(request.getParameter("txtid_viaticos"));
            String Descripcion_viatico = request.getParameter("txtDescripcion_viatico");
            String Tipo_viatico = request.getParameter("txtTipo_viatico");
            String Nombre_trabajador = request.getParameter("txtNombre_trabajador");
            String Id_usuario = request.getParameter("txtid_usuario");
            String valor_viatico = request.getParameter("txtvalor_viatico");
            String Insertar_evidencia = request.getParameter("txtInsertar_evidencia");

            vi.setId_viaticos(id_viaticos);
            vi.setDescripcion_viatico(Descripcion_viatico);
            vi.setTipo_viatico(Tipo_viatico);
            vi.setNombres_trabajador(Nombre_trabajador);
            vi.setId_usuario(Integer.parseInt(Id_usuario));
            vi.setValor_viatico(Double.parseDouble(valor_viatico));
            vi.setInsertar_evidencia(Insertar_evidencia);
            
            dao.edit(vi);
            acceso = listarViaticos;
        }
        else if (action.equalsIgnoreCase("eliminar")){
        int id_viaticos=Integer.parseInt(request.getParameter("id_viaticos"));
        vi.setId_viaticos(id_viaticos);
        dao.eliminar(id_viaticos);
        acceso=listarViaticos;
        }
       RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
