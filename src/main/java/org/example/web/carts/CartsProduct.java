package org.example.web.carts;

import org.example.web.beans.Product;

public class CartsProduct {
  private Product product;
  private int quantity;

  public CartsProduct() {
  }

  public CartsProduct(Product product, int quantity) {
    this.product = product;
    this.quantity = quantity;
  }

  public Product getProduct() {
    return product;
  }

  public void setProduct(Product product) {
    this.product = product;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }
  public boolean incri(int productid, int quantity){
    this.quantity += quantity;
    if(this.product.getQuantity() < this.quantity){
      this.quantity -=quantity;
      return false;
    }
    return true;
  }
  public boolean dencri(int productid, int quantity){
    this.quantity -= quantity;
    if(this.product.getQuantity() < this.quantity){
      this.quantity +=quantity;
      return false;
    }
    return true;
  }


  @Override
  public String toString() {
    return "CartsProduct{" +
            "product=" + product +
            ", quantity=" + quantity +
            '}';
  }
}
