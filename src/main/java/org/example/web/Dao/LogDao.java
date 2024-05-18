package org.example.web.Dao;

import org.example.web.db.JDBIConnector;
import org.example.web.model.Log;
import org.jdbi.v3.core.Jdbi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LogDao implements InterfaceDao<Log> {

    private static Jdbi jdbi;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public static Jdbi get() {
        if (jdbi == null) ;
        return jdbi;
    }

    @Override
    public List<Log> getAll() {
        List<Log> logs = new ArrayList<>();
        String query = "Select * from logs";
        try {
            conn = new JDBIConnector().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                logs.add(new org.example.web.model.Log(
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return logs;
    }

    @Override
    public boolean insert(Log model) {
        String action = model.getAction();
        String level = model.getLevel();
        String user = model.getUsername();
        String ip = model.getIp();
        String value = model.getValue();
        int insertRow = jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO logs(action, level, user, ip, value,isDelete) VALUES(?,?,?,?,?,?)")
                        .bind(0,action)
                        .bind(1,level)
                        .bind(2,user)
                        .bind(3,ip)
                        .bind(4,value)
                        .bind(5,1)
                        .execute()
        );
        return insertRow > 0;
    }

    @Override
    public boolean update(Log model) {
        return false;
    }

    @Override
    public boolean delete(Log model) {
        return false;
    }


}
