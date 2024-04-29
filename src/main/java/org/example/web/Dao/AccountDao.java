package org.example.web.Dao;

import org.example.web.beans.Account;
import org.example.web.db.JDBIConnector;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AccountDao {
    public static void addAccount(final Account account) throws Exception {
        JDBIConnector db = new JDBIConnector();
        PreparedStatement sta = db.getStatement("insert into account (username, password, phone, role, date) values (?, ?, ?, 1, now())");
        sta.setString(1, account.getUserName());
        sta.setString(2, account.getPassword());
        sta.setString(3, account.getPhoneNumber());
        sta.setString(5, account.getEmail());
        sta.executeUpdate();
    }
    public List<Account> getAccountWeek() throws Exception {
        List<Account> list = new ArrayList<Account>();
        JDBIConnector db = new JDBIConnector();
        PreparedStatement sta = db.getStatement("select * from account where week(date) = week(now())");
        ResultSet rs = sta.executeQuery();
        Account account;
        while(rs.next()){
            account = new Account(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getDate(6),
                    rs.getInt(7));
//            account.setEnable(rs.getInt("enabled"));
            account.setDate(rs.getDate("date"));
            list.add(account);
        }
        return list;
    }

    public static boolean checkOTP(String username, String otp) throws Exception {
        JDBIConnector db = new JDBIConnector();
        PreparedStatement sta = db.getStatement("select * from account where otp=? and username=?");
        sta.setString(1, otp);
        sta.setString(2, username);
        ResultSet rs = sta.executeQuery();
        if(rs.next()){
            return true;
        }
        return false;
    }

    public static boolean checkTime(String username) throws Exception {
        JDBIConnector db = new JDBIConnector();
        PreparedStatement sta = db.getStatement("SELECT TIME_TO_SEC(TIMEDIFF(now(), time_otp)) as 'time' from account where username=?");
        sta.setString(1, username);
        ResultSet rs = sta.executeQuery();
        while(rs.next()){
            //muon setting thoi gian hieu luc bao lau thi sua tham so
            return rs.getInt("time")<=60 ? true : false;
        }
        return false;
    }


}
