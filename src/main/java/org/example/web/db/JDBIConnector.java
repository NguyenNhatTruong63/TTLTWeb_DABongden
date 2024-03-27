package org.example.web.db;

import org.example.web.beans.Product;
import org.jdbi.v3.core.Jdbi;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JDBIConnector {
    private final String hostName="localhost:3306";
    private final String dbName="dabd";
    private final String username="root";
    private final String password="";
    private final String instance="";

    private String connectionURL="jdbc:mysql://"+hostName+"/"+dbName;
    public static Jdbi jdbi;
    Connection conn=null;
    PreparedStatement ps =null;
    ResultSet rs= null;

    public JDBIConnector() {
    }
    public static Jdbi get() {
        if (jdbi == null) ;
        return jdbi;
    }


    public Connection getConnection() throws Exception {
        String url="jdbc:mysql://"+hostName+"/"+dbName;
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url,username,password);
    }
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM products";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
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
                        rs.getDouble(8),
                        rs.getDouble(9)
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            // Đóng tài nguyên ở đây
        }
        return list;
    }
    public Product getById(int proid) {
        String query = "SELECT * FROM products WHERE id =?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, proid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getInt(8),
                        rs.getInt(9)

                );
                return p;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }


    public static void main(String[] args) {
        try {
            JDBIConnector dao = new JDBIConnector();
            List<Product> list = dao.getAllProduct();
//      List<Brand> list = dao.getBrand();
            if (!list.isEmpty()) {
                for (Product product : list) {
                    System.out.println(product);
                }
            } else {
                System.out.println("Danh sách sản phẩm trống.");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
