package org.example.ttltweb_bd.beans;

import java.io.Serializable;

public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    private int id;
    private String idCategory;
    private String idBrand;
    private String name;
    private String img;
    private double price;
    private double discount;
    private double quantity;
    private double status;

    public Product() {
    }

    public Product(int id, String idCategory, String idBrand, String name, String img, double price, double discount, double quantity, double status) {
        this.id = id;
        this.idCategory = idCategory;
        this.idBrand = idBrand;
        this.name = name;
        this.img = img;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
    }

    public String getIdBrand() {
        return idBrand;
    }

    public void setIdBrand(String idBrand) {
        this.idBrand = idBrand;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public double getStatus() {
        return status;
    }

    public void setStatus(double status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", idCategory='" + idCategory + '\'' +
                ", idBrand='" + idBrand + '\'' +
                ", name='" + name + '\'' +
                ", img='" + img + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                ", quantity=" + quantity +
                ", status=" + status +
                '}';
    }


}
