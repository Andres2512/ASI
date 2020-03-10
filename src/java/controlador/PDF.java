package controlador;

import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

public class PDF extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException, JRException {
       response.setContentType("text/html;charset=UTF-8");
        Connection conexion;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conexion = (Connection) DriverManager.getConnection("jdbc:mysql://us-cdbr-iron-east-04.cleardb.net:3306/heroku_49e662d46b8ce5c", "b66b7efddcc756", "37149f09");
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("reporteProyecto")) {
            Map parameters = new HashMap();
            //A nuestro informe de prueba le vamos a enviar la fecha de hoy
            parameters.put("", null);

            ServletOutputStream out;
            /// Creamos un objecto jasper con el fichero previamente compilado

            JasperReport jasperReportjasperReport;
            jasperReportjasperReport = (JasperReport) JRLoader.loadObject("C:\\Users\\Daniel Avila\\Documents\\NetBeansProjects\\ASI\\src\\java\\Reporte\\report1.jasper");

            // Generamos el informe pasandole como parametros el objecto creado anteriormente jasperReport, parameters que es el hashmap
            // creado anteriormente con todos los parametros que necesitemos enviarle al informe y conn una conexión activa con vuestro
            // servidor de BD
            byte[] fichero = JasperRunManager.runReportToPdf("C:\\Users\\Daniel Avila\\Documents\\NetBeansProjects\\ASI\\src\\java\\Reporte\\report1.jasper", parameters, conexion);

            // Y enviamos el pdf a la salida del navegador como podríamos hacer con cualquier otro pdf
            response.setContentType("application/pdf");
            response.setHeader("Content-disposition", "inline; filename=informeDemo.pdf");
            response.setHeader("Cache-Control", "max-age=30");
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentLength(fichero.length);
            out = response.getOutputStream();

            out.write(fichero, 0, fichero.length);
            out.flush();
            out.close();
        }else if(accion.equalsIgnoreCase("reportePerfilJugador")){
             Map parameters = new HashMap();
            //A nuestro informe de prueba le vamos a enviar la fecha de hoy
            parameters.put("", null);

            ServletOutputStream out;
            /// Creamos un objecto jasper con el fichero previamente compilado

            JasperReport jasperReportjasperReport;
            jasperReportjasperReport = (JasperReport) JRLoader.loadObject("D:\\Fernando\\Desktop\\hh\\CRUD-MVC-JAVA-FER\\src\\java\\Reporte\\report3.jasper");

            // Generamos el informe pasandole como parametros el objecto creado anteriormente jasperReport, parameters que es el hashmap
            // creado anteriormente con todos los parametros que necesitemos enviarle al informe y conn una conexión activa con vuestro
            // servidor de BD
            byte[] fichero = JasperRunManager.runReportToPdf("D:\\Fernando\\Desktop\\hh\\CRUD-MVC-JAVA-FER\\src\\java\\Reporte\\report3.jasper", parameters, conexion);

            // Y enviamos el pdf a la salida del navegador como podríamos hacer con cualquier otro pdf
            response.setContentType("application/pdf");
            response.setHeader("Content-disposition", "inline; filename=informeDemo.pdf");
            response.setHeader("Cache-Control", "max-age=30");
            response.setHeader("Pragma", "No-cache");
            response.setDateHeader("Expires", 0);
            response.setContentLength(fichero.length);
            out = response.getOutputStream();

            out.write(fichero, 0, fichero.length);
            out.flush();
            out.close();
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(PDF.class.getName()).log(Level.SEVERE, null, ex);
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
