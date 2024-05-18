package org.example.web.services;

import org.example.web.Dao.LogDao;

public class LogServices {
    LogDao dao;
    public LogServices(){
        dao = new LogDao();
    }
}
