package org.example.web.beans;

public class Orderdetails {
    private String id;
    private String idOrder;
    private String idProduct;
    private String price;
    private String quantity;

    public Orderdetails() {
    }

    public Orderdetails(String id, String idOrder, String idProduct, String price, String quantity) {
        this.id = id;
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.price = price;
        this.quantity = quantity;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Orderdetails{" +
                "id='" + id + '\'' +
                ", idOrder='" + idOrder + '\'' +
                ", idProduct='" + idProduct + '\'' +
                ", price='" + price + '\'' +
                ", quantity='" + quantity + '\'' +
                '}';
    }
}
