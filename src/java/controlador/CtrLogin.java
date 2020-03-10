package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.DTOUsuario;
import modeloDAO.DAOLongin;

public class CtrLogin extends HttpServlet {

    public boolean validar(DTOUsuario user) {
        DAOLongin uDao = new DAOLongin();
        return uDao.validar(user);
    }
    private static final Logger logger = Logger.getLogger(CtrLogin.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            String accion = request.getParameter("accion");
            if (accion.equalsIgnoreCase("Validar")) {
                String correo = request.getParameter("txtCorreo");
                String contrasena = request.getParameter("txtContrasenia");

                DTOUsuario user = new DTOUsuario(correo, contrasena);

                if (validar(user)) {
                    DAOLongin usd = new DAOLongin();
                    DTOUsuario user1 = (DTOUsuario) usd.list(correo);

                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("correo", correo);
                    sesion.setAttribute("rol", user1.getRoles_Id_roles());
                    sesion.setAttribute("nombres", user1.getNombres());
                    sesion.setAttribute("apellidos", user1.getApellidos());
                    sesion.setAttribute("Id_usuario", user1.getId_usuario());

                    if (user1.getRoles_Id_roles() == 1) {// acceso contratista
//                        request.getRequestDispatcher("ModuloContratista/InicioContratista.jsp").forward(request, response);
                        out.print("1");
                    } else if (user1.getRoles_Id_roles() == 2) {//acceso cliente
//                        request.getRequestDispatcher("ModuloCliente/InicioClientes.jsp").forward(request, response);
                        out.print("2");
                    } else if (user1.getRoles_Id_roles() == 3) {//acceso administrador
//                        request.getRequestDispatcher("ModuloAdministrador/InicioAdmin.jsp").forward(request, response);
                        out.print("3");
                    }
                } else {
//                    request.getRequestDispatcher("vistasLogin/login.jsp").forward(request, response);
                    out.println("4");
                }
            } else if (accion.equalsIgnoreCase("Logout")) {
                HttpSession sesion = request.getSession(true);
                sesion.removeValue("correo");
                response.sendRedirect("index.jsp");
            } else if (accion.equalsIgnoreCase("iniciarSesion")) {
                request.getRequestDispatcher("vistasLogin/login.jsp").forward(request, response);
            } else if (accion.equalsIgnoreCase("olvido_pass")) {
                logger.info("-----llegamos a olvido password");
                request.getRequestDispatcher("istasCotizacion/recuperar_cuenta.jsp").forward(request, response);
            } else if (accion.equalsIgnoreCase("envia_correo")) {
                String correo = request.getParameter("correo");
                logger.info("-----el correo es----" + correo);
            } else if (accion.equalsIgnoreCase("Salir")) {
                request.getRequestDispatcher("vistasLogin/login.jsp").forward(request, response);
            } else if (accion.equalsIgnoreCase("ModuloContratista")) {
                request.getRequestDispatcher("ModuloContratista/InicioContratista.jsp").forward(request, response);
            } else if (accion.equalsIgnoreCase("ModuloCliente")) {
                request.getRequestDispatcher("ModuloCliente/InicioClientes.jsp").forward(request, response);
            } else if (accion.equalsIgnoreCase("ModuloContratista")) {
                request.getRequestDispatcher("ModuloContratista/InicioContratista.jsp").forward(request, response);
            }
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
