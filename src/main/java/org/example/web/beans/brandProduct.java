package org.example.web.beans;

public class brandProduct {
    private String nameProduct;
    private String nameBrand;

    public brandProduct() {
    }

    public brandProduct(String nameProduct, String nameBrand) {
        this.nameProduct = nameProduct;
        this.nameBrand = nameBrand;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getNameBrand() {
        return nameBrand;
    }

    public void setNameBrand(String nameBrand) {
        this.nameBrand = nameBrand;
    }

    @Override
    public String toString() {
        return "BrandProduct{" +
                "nameProduct='" + nameProduct + '\'' +
                ", nameBrand='" + nameBrand + '\'' +
                '}';
    }
}
