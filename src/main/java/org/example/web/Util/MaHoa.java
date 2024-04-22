package org.example.web.Util;

import org.mindrot.jbcrypt.BCrypt;

public class MaHoa {
    private static final int ROUNDS = 6;

    //chuyen doi password thanh hashpassword de luu tru
    public static String hashPassword(String password) {
        String salt = BCrypt.gensalt(ROUNDS);
        return BCrypt.hashpw(password, salt);
    }

    public static boolean checkPassword(String password, String hashedPassword) {
        return BCrypt.checkpw(password, hashedPassword);
    }

    public static void main(String[] args) {

        System.out.println(hashPassword("123456789"));
    }

//    public static String toSHA1(String encode){
//        String salt = "aethvnr1257fnvudwmcgwy;cudidbvjvnc";
//        String result = null;
//        encode = encode + salt;
//        try {
//            byte[] dataBytes = encode.getBytes(StandardCharsets.UTF_8);
//            MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
//            result = Base64.getEncoder().toString();
//
//        }catch (Exception e){
//            e.printStackTrace();
//
//        }
//        return result;
//    }

//    public static void main(String[] args) {
//        System.out.println(toSHA1("123456"));
//    }
}
