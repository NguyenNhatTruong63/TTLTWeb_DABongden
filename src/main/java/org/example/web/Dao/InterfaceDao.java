package org.example.web.Dao;

import java.util.List;

public interface InterfaceDao<T> {
    public List<T> getAll();
    public boolean insert(T model);
    public boolean update(T model);
    public boolean delete(T model);

}
