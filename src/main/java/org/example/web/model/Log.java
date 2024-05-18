package org.example.web.model;

import java.io.Serializable;

public class Log implements Serializable {
    public static final String INSERT ="INSERT";
    public static final String UPDATE ="UPATE";
    public static final String DELETE ="DELETE";
    public static final String LOGIN_SERVICE ="LOGIN";

    //LEVELS
    public static final String LOG_LVL_INFO = "INFO";
    public static final String LOG_LVL_WARN = "WARN";
    public static final String LOG_LVL_ALERT = "ALERT";

    public int id;
    public String action;
    public String level;
    public String username;
    public String ip;
    public String value;

    public Log() {
    }

    public Log(String action, String level, String username, String ip, String value) {
        this.action = action;
        this.level = level;
        this.username = username;
        this.ip = ip;
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
