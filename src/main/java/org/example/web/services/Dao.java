package org.example.web.services;

import org.example.web.beans.*;
import org.example.web.db.JDBIConnector;
import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
        String query = "select * from user where username = ? and password = ?";
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
        String query = "select * from user where userName = ?";

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
    public void signup (String username, String password, String email, String phoneNumber){
//        String query = "insert into user VALUES (7, ?, ?, ?, ?, 0)";
<<<<<<< HEAD
        String query = "insert into user VALUES (7, ?, ?, ?, ?, 1)";
=======
        String query = "insert into user VALUES (8, ?, ?, ?, ?, 1)";
>>>>>>> main
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);
            ps.setString(4, phoneNumber);
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

    public Account checkAccountExist(String user, String email) {
        String query = "select * from user where userName = ? or email = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, email);
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
    public List<Product> searchbyname(String search) {
        List<Product> list = new ArrayList<>();
        String query = "select * from products where name like ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getInt(9)


                ));
            }
        } catch (Exception e) {

        }
        return list;
    }
    public int getTotalPage() {
        String query = "select count(*) from products";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {

        }

        return 0;
    }

    public brandProduct getBrandProduct(String id) {
        String query = "SELECT products.name, brand.name FROM products, brand WHERE brand.id = products.idBrand and products.id = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new brandProduct(rs.getString(1),
                        rs.getString(2));
            }


        } catch (Exception e) {

        }
        return null;
    }


    public Product getProduct(String id) {
        String query = "select * from products where id = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getInt(9)
                );

            }
        } catch (Exception e) {

        }
        return null;
    }
    public ProductDetail getProductDetail(String id) {
        String query = "select * from productdetails where idProduct = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new ProductDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getString(9),
                        rs.getInt(10),
                        rs.getString(11),
                        rs.getString(12),
                        rs.getString(13)
                );
            }
        } catch (Exception e) {

        }


        return null;
    }

    public Category getNameCategory(String id) {
        String query = "SELECT name FROM categories";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
//            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1),
                        rs.getString(2));
            }


        } catch (Exception e) {

        }
        return null;
    }

    public Orders order(String id_user, String fullname, String address, String phoneNumber, String email) {
        String query = "insert into orders values (0, ?, ?, ?, ?, ?, 1)";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id_user);
            ps.setString(2, fullname);
            ps.setString(3, address);
            ps.setString(4, phoneNumber);
            ps.setString(5, email);
            ps.executeUpdate();
            System.out.println("tạo đơn hàng thành công");
        } catch (Exception e) {

        }


        return null;
    }


    public Account changePassword(String username, String newPassword) {
        String query = "update user set password = ? where userName = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            int effectedRow = ps.executeUpdate();
            System.out.println("So dong da cap nhat: " + effectedRow);

        } catch (Exception e) {

        }
        return null;
    }
}
