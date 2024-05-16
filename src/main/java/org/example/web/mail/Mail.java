package org.example.web.mail;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Properties;

public class Mail {
    private static Properties prop = new Properties();

    static {
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.starttls.required", "true");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    }

    public static boolean sendMail(String to, String subject, String mess, String mess1) {

        Session session = Session.getInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(MailProperties.getUser(), MailProperties.getPass());
            }
        });
        try{
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(MailProperties.getUser()));
            message.setRecipients(
                    Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(mess);
            Transport.send(message);
            System.out.println("Gui thanh cong");
            return true;

        }catch (MessagingException e){
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        Mail mail = new Mail();
        sendMail("truongnhatnguyen06@gmail.com", "TEST MAIL","Hello", "OTP");
    }
}
