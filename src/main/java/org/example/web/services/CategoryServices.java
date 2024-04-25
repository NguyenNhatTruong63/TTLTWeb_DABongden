package org.example.web.services;

import org.example.web.beans.Category;
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
    
    public String nameCategory(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT name FROM categories WHERE id = ?")
                    .bind(0, id)
                    .mapTo(String.class)
                    .findOne()
                    .orElse(null);
        });
    }


    public static void main(String[] args) throws SQLException {
        CategoryServices categoryServices = new CategoryServices();
        System.out.println(categoryServices.getCategoryList());
        System.out.println(categoryServices.nameCategory("3"));

    }
}
