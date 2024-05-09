package org.example.web.services;

import org.example.web.beans.Orderdetails;
import org.example.web.db.JDBIConnector;

public class OrderDel {
    public Orderdetails findByOrderId(String id) {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM orderdetails WHERE idOrder = :id")
                    .bind("id", id)
                    .mapToBean(Orderdetails.class)
                    .findOne()
                    .orElse(null);

        });
    }

    public static void main(String[] args) {
        OrderDel orderDel = new OrderDel();
        System.out.println(orderDel.findByOrderId("1"));
    }

}

