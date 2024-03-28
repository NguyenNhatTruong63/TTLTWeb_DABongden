package org.example.web.beans;

public class ProductDetail {
    private int id;
    private int idProduct;
    private String wattage;
    private String voltage;
    private String luminousFlux;
    private String longevity;
    private String cri;

    public ProductDetail() {
    }

    public ProductDetail(int id, int idProduct, String wattage, String voltage, String luminousFlux, String longevity, String cri) {
        this.id = id;
        this.idProduct = idProduct;
        this.wattage = wattage;
        this.voltage = voltage;
        this.luminousFlux = luminousFlux;
        this.longevity = longevity;
        this.cri = cri;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public String getWattage() {
        return wattage;
    }

    public void setWattage(String wattage) {
        this.wattage = wattage;
    }

    public String getVoltage() {
        return voltage;
    }

    public void setVoltage(String voltage) {
        this.voltage = voltage;
    }

    public String getLuminousFlux() {
        return luminousFlux;
    }

    public void setLuminousFlux(String luminousFlux) {
        this.luminousFlux = luminousFlux;
    }

    public String getLongevity() {
        return longevity;
    }

    public void setLongevity(String longevity) {
        this.longevity = longevity;
    }

    public String getCri() {
        return cri;
    }

    public void setCri(String cri) {
        this.cri = cri;
    }

    @Override
    public String toString() {
        return "ProductDetail{" +
                "id=" + id +
                ", idProduct=" + idProduct +
                ", wattage='" + wattage + '\'' +
                ", voltage='" + voltage + '\'' +
                ", luminousFlux='" + luminousFlux + '\'' +
                ", longevity='" + longevity + '\'' +
                ", cri='" + cri + '\'' +
                '}';
    }
}
