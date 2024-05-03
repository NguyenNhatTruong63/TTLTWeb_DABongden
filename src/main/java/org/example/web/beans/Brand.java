package org.example.web.beans;

public class Brand {
    private String id;
    private String name;

    public Brand(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public Brand() {
    }

    public String getId() {return id;}

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Brand{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
