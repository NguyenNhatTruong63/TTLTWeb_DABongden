package org.example.web.mail;

import java.io.IOException;
import java.util.Properties;

public class MailProperties {
    private static Properties prop = new Properties();
    static {
        try{
            prop.load(MailProperties.class.getClassLoader().getResourceAsStream("mail.properties"));
        }catch (IOException ioException){
            ioException.printStackTrace();
        }
    }
    public static String getHost(){
        return prop.get("mail.smtp.host").toString();
    }
    public static String getPort(){
        return prop.get("mail.smtp.port").toString();
    }
    public static String getUser(){
        return prop.get("mail.user").toString();
    }
    public static String getPass(){
        return prop.get("mail.pass").toString();
    }
    public static boolean getAuth(){
        return "True".equals(prop.get("mail.smtp.auth").toString());
    }
    public static boolean getTls(){
        return "True".equals(prop.get("mail.smtp.starttls.enable").toString());
    }

}
