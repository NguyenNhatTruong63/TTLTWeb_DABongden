package org.example.web.services;

import org.example.web.beans.Product;
import org.example.web.db.JDBIConnector;
import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductByBrandServices {
    private static ProductByBrandServices instance;

    public ProductByBrandServices() {
    }

    public static ProductByBrandServices getInstance() {
        if (instance == null) {
            instance = new ProductByBrandServices();
        }
        return instance;
    }

    public List<Product> getListProductByBrand(String id) {
        List<Product> productList = new ArrayList<>();
        try (Handle handle = JDBIConnector.get().open()) {
            handle.registerRowMapper(BeanMapper.factory(Product.class));
            productList = handle.createQuery("SELECT * FROM products where idBrand = :idBrand")
                    .bind("idBrand", id)
                    .mapTo(Product.class)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;

    }

    public static void main(String[] args) throws SQLException {
        List<Product> all = ProductByBrandServices.getInstance().getListProductByBrand("3");
        ProductByBrandServices product = new ProductByBrandServices();

        System.out.println(all);

    }

}
