package org.example.web.services;

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
    public List<Product> getListProductByCategory(String id) {
        List<Product> productList = new ArrayList<>();
        try (Handle handle = JDBIConnector.get().open()) {
            handle.registerRowMapper(BeanMapper.factory(Product.class));
            productList = handle.createQuery("SELECT * FROM products where idCatgory = :idCatgory")
                    .bind("idCatgory", id)
                    .mapTo(Product.class)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;

    }

//    public List<Product> getListProduct(String id){
//        return JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("select * from  products where idCatgory = ? ")
//                    .mapToBean(Product.class).list();
//        });
//    }
    public List<Product> getListProduct(String id){
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("select * from  products where idCatgory = ? ")
                    .mapToBean(Product.class).list();
        });
    }

//  public List<Product> getAll() {
//    return JDBIConnector.get().withHandle(handle -> {
//      return handle.createQuery("select * from products")
//        .mapToBean(Product.class).list();
//    });
//  }


//    public List<Product> getListProductByCategory(String id) {
//        return JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("select * from products where idCategory = idCategory ").bind(0, id)
//                    .mapToBean(Product.class).list();
//        });
//    }




//
    public static void main(String[] args) throws SQLException {
        List<Product> all = ProductByCategoryServices.getInstance().getListProductByCategory("1");
        System.out.println(all);

//        ProductByCategoryServices product = new ProductByCategoryServices();
//        List<Product> products = ProductByCategoryServices.getInstance().getListProduct("1");
//        System.out.println(products);
//        System.out.println(getInstance().getAllProduct());
//        System.out.println(getInstance().getAll());

    }


//    public static void main(String[] args) throws SQLException {
////        List<Product> all = ProductByCategoryServices.getInstance().getListProductByCategory("3");
//
//        ProductByCategoryServices product = new ProductByCategoryServices();
//        List<Product> products = ProductByCategoryServices.getInstance().getListProduct("1");
//        System.out.println(products);
////        System.out.println(getInstance().getAllProduct());
////        System.out.println(getInstance().getAll());
//
//    }


}
