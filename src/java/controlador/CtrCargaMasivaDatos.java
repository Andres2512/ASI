package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadException;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadFile;
import java.util.Hashtable;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import modeloDAO.DAOCargaMasivaDatos;

/**
 *
 * @author Daniel Avila
 */
@MultipartConfig
public class CtrCargaMasivaDatos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/vnd.wap.xhtml+xml");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        MultipartFormDataRequest mrequest = null;
        String marca = null;
        String usuarios = null; //se puede comentar
        UploadBean upBean;
        String archivo;
        try {
            mrequest = new MultipartFormDataRequest(request);
            if (mrequest != null) {
                try {
                    marca = mrequest.getParameter("marca");
                    usuarios = mrequest.getParameter("usuarios"); //se puede comentar
                } catch (Exception e) {
                    System.out.println("Nullo en marca o usuario");
                }
            }
            if ((marca != null) && (marca.equalsIgnoreCase("upload"))) {
                Hashtable files = mrequest.getFiles();
                if ((files != null) && (!files.isEmpty())) {
                    UploadFile file = (UploadFile) files.get("fichero");
                    archivo = request.getParameter("fichero");
                    upBean = new UploadBean();
                    upBean.setFolderstore(getServletContext().getRealPath("/") + "/Archivos/");
                    upBean.store(mrequest, "fichero");
                    if (file != null && marca != null) {
                        archivo = getServletContext().getRealPath("/") + "/Archivos/" + file.getFileName();
                        DAOCargaMasivaDatos daoCarga = new DAOCargaMasivaDatos();
                        if(daoCarga.cargaMasivaMarca(archivo)){;
                             out.println("1");
                        }else{
                            out.println("2");
                        }                        
                    } else if (file != null && usuarios != null) {
                        archivo = getServletContext().getRealPath("/") + "/Archivos/" + file.getFileName();
                        DAOCargaMasivaDatos daoCarga = new DAOCargaMasivaDatos();
                        daoCarga.cargaMasivaUsuarios(archivo);
                    } else {
                        out.println("0");                    
                    }
                }
            }
        } catch (UploadException ex) {
            Logger.getLogger(CtrCargaMasivaDatos.class.getName()).log(Level.SEVERE, null, ex);
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
