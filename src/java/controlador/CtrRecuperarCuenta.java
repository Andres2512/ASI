package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modeloDAO.DAOLongin;
import util.Mail;

/**
 *
 * @author User
 */
@WebServlet(name = "CtrRecuperarCuenta", urlPatterns = {"/CtrRecuperarCuenta"})
public class CtrRecuperarCuenta extends HttpServlet {

    private static final Logger logger = Logger.getLogger(CtrRecuperarCuenta.class.getName());
    DAOLongin dao = new DAOLongin();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CtrRecuperarCuenta</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CtrRecuperarCuenta at " + request.getContextPath() + "</h1>");
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

        String correo = request.getParameter("correo");
        logger.log(Level.INFO, "------el correo con la cuenta a recuperar es {0}", correo);
        if (true) {

        }
        dao.validarCorreo(correo);

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
        Mail mail = new Mail();
        String email = request.getParameter("correo");
        logger.info("el correo enviado es " + email);
        if (dao.validarCorreo(email)) {
            int codigoAleatorio;
//            String codigoAleatorio;
            try {
                mail.setMailServerProperties();

//                codigoAleatorio = mail.createEmailMessage(email);
//                if (codigoAleatorio != 0) {
//                    //renderizar a otra vista.
//                }
                codigoAleatorio = mail.createEmailMessage(email);
                mail.sendEmail();
                if (codigoAleatorio > 0) {
                    //abrimos una sesión, dónde ira el códigoAleatorio
                    Object [] emailAndCodigo = new Object[2];
                    emailAndCodigo[0]= codigoAleatorio;
                    emailAndCodigo[1] = email;
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("codigoSesion", emailAndCodigo);
                    sesion.setMaxInactiveInterval(60 * 5); // 5 minutes
                    response.sendRedirect("vistasCotizacion/validacionCodigo.jsp");
                }

            } catch (MessagingException | IOException ex) {
                Logger.getLogger(CtrRecuperarCuenta.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            logger.info("el correo no existe");
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
