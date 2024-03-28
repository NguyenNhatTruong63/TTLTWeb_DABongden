package org.example.web.services;

import org.example.web.beans.Category;
import org.example.web.beans.Product;
import org.example.web.db.JDBIConnector;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductByCategoryServices {
    private static ProductByCategoryServices instance;

    public ProductByCategoryServices() {
    }
    public static Jdbi jdbi;
    Connection conn=null;
    PreparedStatement ps =null;
    ResultSet rs= null;

    public static ProductByCategoryServices getInstance() {
        if (instance == null) {
            instance = new ProductByCategoryServices();
        }
        return instance;
    }
//    public List<Product> getListProductByCategory(String id){
//
//    }

    public List<Product> getListProductByCategory(String id) {
        List<Product> productList = new ArrayList<>();

        try (Handle handle = JDBIConnector.get().open()) {
            handle.registerRowMapper(BeanMapper.factory(Product.class));
            productList = handle.createQuery("SELECT * FROM products")
                    .mapTo(Product.class)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;

    }

    public List<Product> getsAllProduct() {
        List<Product> lists = new ArrayList<>();
        String query = "SELECT * FROM products where idCatgory = 1";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                lists.add(new Product(
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
        return lists;
    }
    public List<Product> getListProduct(String id){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from  products where idCatgory = ? ")
                    .mapToBean(Product.class).list();
        });
    }

  public List<Product> getAll() {
    return JDBIConnector.get().withHandle(handle -> {
      return handle.createQuery("select * from products")
        .mapToBean(Product.class).list();
    });
  }


//    public List<Product> getListProductByCategory(String id) {
//        return JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("select * from products where idCategory = ? ").bind(0, id)
//                    .mapToBean(Product.class).list();
//        });
//    }




//
//    public static void main(String[] args) throws SQLException {
////        List<Product> all = ProductByCategoryServices.getInstance().getListProductByCategory("3");
//
//        ProductByCategoryServices product = new ProductByCategoryServices();
//        List<Product> products = ProductByCategoryServices.getInstance().getListProduct("1");
//        System.out.println(getInstance().getAllProduct());
////        System.out.println(getInstance().getAll());
//
//    }



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
