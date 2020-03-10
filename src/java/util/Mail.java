/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

/**
 *
 * @author User
 */
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import modelo.DTOCorreoMasivo;

public class Mail {

	Properties emailProperties;
	Session mailSession;
	MimeMessage emailMessage;
	
	public void setMailServerProperties() {
		String emailPort = "587";//gmail's smtp port
		emailProperties = System.getProperties();
		emailProperties.put("mail.smtp.port", emailPort);
		emailProperties.put("mail.smtp.auth", "true");
		emailProperties.put("mail.smtp.starttls.enable", "true");
		emailProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	}

	public int createEmailMessage(String email) throws AddressException,
			MessagingException {
		
		String asuntoEmail = "Aplicación web java";
		int codigoValidacion = (int)(1000000 * Math.random());
		String cuerpoEmail = "Este Email es enviado para recuperar su contraseña. El código para recuperar su "
				+ "contraseña es "+codigoValidacion;

		cargarSesionMensaje(email, asuntoEmail, cuerpoEmail);
		/**
		 * Retornamos el codigo para ser validado
		 */
		return codigoValidacion;
	}
        public void createEmailBig(DTOCorreoMasivo informacionUsuario) throws AddressException,
			MessagingException {
		
		String asuntoEmail = "Aplicación web java";
		String cuerpoEmail = "Te queremos agradecer " + informacionUsuario.getNombre() + " " + informacionUsuario.getApellido()+" por hacer parte de nuestra familia ";

		cargarSesionMensaje(informacionUsuario.getCorreo(), asuntoEmail, cuerpoEmail);
		
	}

    private void cargarSesionMensaje(String email, String asuntoEmail, String cuerpoEmail) throws MessagingException {
        mailSession = Session.getDefaultInstance(emailProperties, null);
        /**
         * Arreglar excepcion could not convert socket to tls
         */
        mailSession.getProperties().put("mail.smtp.starttls.enable", "true");
        emailMessage = new MimeMessage(mailSession);
        
        
        emailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
        emailMessage.setSubject(asuntoEmail);
        emailMessage.setContent(cuerpoEmail, "text/html");//for a html email
    }
        

	public void sendEmail() throws AddressException, MessagingException {

		String emailHost = "smtp.gmail.com";
		String fromUser = "asiahorrosistemainformacion";//just the id alone without @gmail.com
		String fromUserEmailPassword = "asiAHORRO1234567890";
		Transport transport = mailSession.getTransport("smtp");		
		transport.connect(emailHost, fromUser, fromUserEmailPassword);
		transport.sendMessage(emailMessage, emailMessage.getAllRecipients());
		transport.close();
		System.out.println("Email enviado exitosamente.");
	}

}