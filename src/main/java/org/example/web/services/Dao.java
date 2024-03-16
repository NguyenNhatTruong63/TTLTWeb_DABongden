package org.example.web.services;

import org.example.web.beans.Account;
import org.example.web.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dao {
    private static Jdbi jdbi;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static Jdbi get() {
        if (jdbi == null) ;
        return jdbi;
    }

    public Account login(String user, String pass) {
        String query = "select * from user where userName = ? and password = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }


        } catch (Exception e) {

        }
        return null;
    }

    public Account checkAccountExit(String user) {
        String query = "select * from users where userName = ?";

//        public Account checkAccountExist (String user){
//            String query = "select * from user where userName = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }


        } catch (Exception e) {

        }
        return null;
    }
    public void signup (String userName, String password, String repassword, String email, String phoneNumber){
        String query = "insert into user VALUES (7, ?, ?, ?, ?, 0)";
//        String query = "insert into user VALUES (0, ?, ?, ?, 0, 0 )";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);

//                public Account signup (String userName, String password, String repassword, String email, String phoneNumber){
//                    String query = "insert into user VALUES (0, ?, ?, ?, ?, 0 )";
//                    try {
//                        conn = new DBText().getConnection();
//                        ps = conn.prepareStatement(query);
//            ps.setInt(1, id);
            ps.setString(1, userName);
            ps.setString(2, password);
            ps.setString(3, email);
//                        ps.setString(4, phoneNumber);
//            ps.setString(4, phoneNumber);
//            ps.setString(6, idRole);
//            ps.setString(4, phone);
//            ps.setString(5, address);
            ps.executeUpdate();
            System.out.println("insert thÃ nh cÃ´ng");
        } catch (Exception e) {

        }
    }
    public Account getAccount(String id) {
        String query = "select * from user where id = ? ";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
            }


        } catch (Exception e) {

        }
        return null;
    }
}
