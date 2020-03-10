package modelo;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {

    public String correos;

    public Email() {
    }

    public Email(String correos) {
        this.correos = correos;
    }

    public String getCorreos() {
        return correos;
    }

    public void setCorreos(String correos) {
        this.correos = correos;
    }
    public boolean enviarCorreo(String[] para, String mensaje, String asunto, String arch) throws UnsupportedEncodingException {
        boolean enviado = false;
        try {
            String clave = "Cj00000000";
            String de = "sisstsena";
            String host = "smtp.gmail.com";
            Properties prop = System.getProperties();
            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user", de);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");
            String mensajere = "<h2>Hola, recibe este mensaje de: " + de + "</h2>";
            mensajere += "<br/> "
                    + mensaje
                    + "<br/><br/>Cordialmente,"
                    + "<br/><br/>"
                    + "SISTEMA DE RENDIMIENTO DEPORTIVO."
                    + "<br/><br/>"
                    + "Gracias por hacer parte de nossotros";
            mensajere += "<br/><br/>!Aviso!<br/><br/>";
            BodyPart texto = new MimeBodyPart();
            texto.setContent(mensajere, "text/html");
            BodyPart attached = new MimeBodyPart();
            attached.setDataHandler(new DataHandler(new FileDataSource(arch)));
            attached.setFileName("Archivo " + arch);
            MimeMultipart multiPart = new MimeMultipart();
            multiPart.addBodyPart(texto);
            multiPart.addBodyPart(attached);
            Session sesion = Session.getDefaultInstance(prop, null);
            MimeMessage message = new MimeMessage(sesion);
            message.setFrom(new InternetAddress(de));
            InternetAddress[] direcciones = new InternetAddress[para.length];
            for (int i = 0; i < para.length; i++) {
                direcciones[i] = new InternetAddress(para[i]);
            }
            for (int i = 0; i < direcciones.length; i++) {
                message.addRecipient(Message.RecipientType.TO, direcciones[i]);
            }
            String subject = asunto + "\u0141\u00f3d\u017a.";
            message.setFrom(new InternetAddress(de));
            message.setSubject(subject, "utf-8");
            message.setContent(multiPart);
            Transport transport = sesion.getTransport("smtp");
            transport.connect(host, de, clave);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            enviado = true;
        } catch (MessagingException e) {
            System.out.println(e.getMessage());
            return enviado = false;
        }
        return enviado;
    }
    public String Cargararchivo() {
        return "";
    }
}