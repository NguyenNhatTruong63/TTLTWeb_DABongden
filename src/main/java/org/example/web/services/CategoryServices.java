package org.example.web.services;

import org.example.web.beans.Category;
import org.example.web.beans.Product;
import org.example.web.beans.brandProduct;
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

public class CategoryServices {
    private static Jdbi jdbi;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static Jdbi get() {
        if (jdbi == null) ;
        return jdbi;
    }
    private static CategoryServices instance;

    public CategoryServices(){
    }

    public static CategoryServices getInstance() {
        if (instance == null) {
            instance = new CategoryServices();
        }
        return instance;
    }
    public List<Category> getCategoryList() {
        List<Category> categoryList = new ArrayList<>();
        try (Handle handle = JDBIConnector.get().open()) {
            handle.registerRowMapper(BeanMapper.factory(Category.class));
            categoryList = handle.createQuery("SELECT * FROM categories")
                    .mapTo(Category.class)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return categoryList;

    }
//    public String nameCategory(String name) {
//        return JDBIConnector.get().withHandle(handle -> {
//            return handle.createQuery("SELECT name FROM categories where name = name")
////                    .bind(0, name)
//                    .mapTo(String.class)
//                    .findOne()
//                    .orElse(null);
//        });
//    }
    public Category nameCategory(String id){
        String query = "SELECT * FROM categories where id = ?";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Category(rs.getInt(1),
                        rs.getString(2));
            }


        } catch (Exception e) {

        }
        return null;

    }

//    public static void main(String[] args) throws SQLException {
//        CategoryServices categoryServices = new CategoryServices();
////        System.out.println(categoryServices.getCategoryList());
////        System.out.println(Category.nameCategory("Bóng đèn âm trần"));
//        Category category = new Category();
//        System.out.println(category.getName());
//
//    }
    public static void main(String[] args) {
        try {
            JDBIConnector dao = new JDBIConnector();
            List<Product> list = dao.getAllCategory();

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
