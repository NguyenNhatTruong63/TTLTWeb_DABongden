package org.example.web.services;

import org.example.web.beans.Warehoue;
import org.example.web.db.JDBIConnector;

import java.util.List;

public class WarehoueDao {
    public List<Warehoue> findAll() {
        return JDBIConnector.get().withHandle(handle -> {
            return handle.createQuery("SELECT * FROM warehoue")
                    .mapToBean(Warehoue.class)
                    .list();
        });
    }

    public static void main(String[] args) {
        WarehoueDao warehoueDao = new WarehoueDao();
        System.out.println(warehoueDao.findAll());
    }

}
