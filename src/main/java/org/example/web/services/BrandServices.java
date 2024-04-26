package org.example.web.services;
import org.example.web.beans.Brand;
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

public class BrandServices {
    private static Jdbi jdbi;

    public static Jdbi get() {
        if (jdbi == null) ;
        return jdbi;
    }
    private static BrandServices instance;
    public BrandServices(){
    }

    public static BrandServices getInstance() {
        if (instance == null) {
            instance = new BrandServices();
        }
        return instance;
    }
    public List<Brand> getBrandList() {
        List<Brand> brandList = new ArrayList<>();
        try (Handle handle = JDBIConnector.get().open()) {
            handle.registerRowMapper(BeanMapper.factory(Brand.class));
            brandList = handle.createQuery("SELECT * FROM brand")
                    .mapTo(Brand.class)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return brandList;

    }

    public String nameBrand(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT name FROM brand WHERE id = ?")
                    .bind(0, id)
                    .mapTo(String.class)
                    .findOne()
                    .orElse(null);
        });
    }

    public static void main(String[] args) throws SQLException {
        BrandServices brandServices = new BrandServices();
        System.out.println(brandServices.getBrandList());
//        System.out.println(brandServices.nameBrand("1"));

    }
}
