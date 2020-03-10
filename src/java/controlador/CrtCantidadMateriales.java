package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.DTOMateriales1;
import modeloDAO.DAOMateriales1;

/**
 *
 * @author Daniel Avila
 */
public class CrtCantidadMateriales extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrtCantidadMateriales</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrtCantidadMateriales at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int cantidadDada = Integer.parseInt(request.getParameter("cantidad"));
        int idMaterial = Integer.parseInt(request.getParameter("idMaterial"));
        HttpSession session = request.getSession();
        List<DTOMateriales1> listaMaterialesGestionados = (List) session.getAttribute("listaAgregados");
        
        for (int i = 0; i < listaMaterialesGestionados.size(); i++) {
            if (listaMaterialesGestionados.get(i).getCodigoMaterial()==idMaterial) {
                listaMaterialesGestionados.get(i).setCantidad(request.getParameter("cantidad"));
            }
        }
       
        DAOMateriales1 materiales = new DAOMateriales1();
        if (materiales.cantidadMayorDisponible(cantidadDada, idMaterial)) {
            //no podemos poner esa cantidad
            try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
//                    out.println("<!DOCTYPE html>");
//                    out.println("<html>");
//                    out.println("<head>");
                    out.println("<script>");
                    out.println("alert('La cantidad dada es mayor que la cantidad disponible');");
                    out.println("</script>");
//                    out.println("<h2>La cantidad dada es mayor que la cantidad disponible</h2>");
                    
//                    out.println("</head>");
//                    out.println("</html>");
                }
        }
                
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
