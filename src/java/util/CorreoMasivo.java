/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import modelo.DTOCorreoMasivo;

/**
 *
 * @author Daniel Avila
 */
public class CorreoMasivo {

    public boolean enviarCorreoMasivo(final List<DTOCorreoMasivo> listadoCorreos) {
        Mail mail = new Mail();
        mail.setMailServerProperties();
        boolean resultado = false;
        try {
            for (DTOCorreoMasivo listadoCorreo : listadoCorreos) {
                mail.createEmailBig(listadoCorreo);
                mail.sendEmail();
            }
        } catch (final MessagingException ex) {
            Logger.getLogger(CorreoMasivo.class.getName()).log(Level.SEVERE, null, ex);
            return resultado;
        }
        resultado = true;
        return resultado;
    }

}
