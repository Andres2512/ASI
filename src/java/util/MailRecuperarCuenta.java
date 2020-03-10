package util;

import controlador.CtrRecuperarCuenta;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author User
 */
public class MailRecuperarCuenta {

    private static final Logger logger = Logger.getLogger(MailRecuperarCuenta.class.getName());

    public static String send(String to, String subject, String msg) {
        String codigoAleatorio = "";
        final String user = "maiksoft10";//change accordingly  
        final String pass = "Actual(10)";

//1st step) Get the session object    
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");//change accordingly  
        props.put("mail.smtp.auth", "true");
        //props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
//2nd step)compose message  
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            Random random = new Random();
            codigoAleatorio =String.valueOf(100000 + random.nextInt(900000));

            message.setText(msg + " codigo: " + codigoAleatorio);
            //3rd step)send message  
            Transport.send(message);
            logger.info("email enviado con codigo " + codigoAleatorio);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

        return codigoAleatorio;
    }

}
