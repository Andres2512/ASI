package controlador;

import modelo.Email;
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


@MultipartConfig
public class CargarFichero extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("application/vnd.wap.xhtml+xml");
        response.setContentType("text/html;charset=UTF-8");
        MultipartFormDataRequest mrequest = null;
        RequestDispatcher dispatcher = null;
        UploadBean upBean = null;
        String[] para = null;
        String mensaje = null;
        String asunto = null;
        String correos = "";
        String todo = null;
        String archivo = null;
        Email email = new Email();
        try {
            mrequest = new MultipartFormDataRequest(request);
            if (mrequest != null) {
                todo = mrequest.getParameter("todo");
            }
            if ((todo != null) && (todo.equalsIgnoreCase("upload"))) {
                Hashtable files = mrequest.getFiles();
                if ((files != null) && (!files.isEmpty())) {
                    UploadFile file = (UploadFile) files.get("fichero");
                    upBean = new UploadBean();
                    upBean.setFolderstore(getServletContext().getRealPath("/") + "/Archivos/");
                    upBean.store(mrequest, "fichero");
                    if (file != null){
                        archivo = getServletContext().getRealPath("/") + "/Archivos/" + file.getFileName();
                    } else {
                        System.out.println("<li>No uploaded files");
                    }
                    if (mrequest != null) {
                        correos = mrequest.getParameter("correosssssssss");
                        para = correos.split(";");
                        mensaje = mrequest.getParameter("mensaje");
                        asunto = mrequest.getParameter("asunto");                        
                        boolean resultado = email.enviarCorreo(para, mensaje, asunto, archivo);
                        if (resultado) {
                            out.println("1");
                        } else {
                            out.println("0");
                        }
                    }
                }
            }
        } catch (UploadException ex) {
            Logger.getLogger(CargarFichero.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
