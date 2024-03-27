package org.example.web.services;

import org.example.web.beans.Brand;
import org.example.web.db.JDBIConnector;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class brandServices {
    private static brandServices instance;

    public brandServices(){
    }

    public static brandServices getInstance() {
        if (instance == null) {
            instance = new brandServices();
        }
        return instance;
    }
    public List<Brand> getBrandList() {
        List<Brand> brandList = new ArrayList<>();
        try (Handle handle = JDBIConnector.get().open()) {
            handle.registerRowMapper(BeanMapper.factory(Brand.class));
            brandList = handle.createQuery("SELECT * FROM brands")
                    .mapTo(Brand.class)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return brandList;

    }
    public String nameBrand(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT name FROM brands WHERE id = ?")
                    .bind(0, id)
                    .mapTo(String.class)
                    .findOne()
                    .orElse(null);
        });
    }

    public static void main(String[] args) throws SQLException {
        brandServices brandServices = new brandServices();
        System.out.println(brandServices.getBrandList());
        System.out.println(brandServices.nameBrand("1"));

    }
}
