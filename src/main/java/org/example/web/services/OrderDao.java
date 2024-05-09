package org.example.web.services;

import org.example.web.beans.Orders;
import org.example.web.db.JDBIConnector;

import java.util.List;

public class OrderDao {
    public List<Orders> findAll() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM order1 where status != 'isdelete'")
                    .mapToBean(Orders.class)
                    .list();
        });
    }

    public Orders findById(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM order1 WHERE id = :id")
                    .bind("id", id)
                    .mapToBean(Orders.class)
                    .findOne()
                    .orElse(null);

        });
    }

    public static void main(String[] args) {
        OrderDao orderDao = new OrderDao();
        System.out.println(orderDao.findById("3"));
    }
}
