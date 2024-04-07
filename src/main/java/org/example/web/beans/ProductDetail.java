package org.example.web.beans;

public class ProductDetail {
    private int id;
    private int idProduct;
    private String wattage;
    private String voltage;
    private String luminousFlux;
    private String longevity;
    private String cri;
    private String consumption;
    private String light_color;
    private int warranty;
    private String material;
    private String colorCover;
    private String size;

    public ProductDetail() {
    }

    public ProductDetail(int id, int idProduct, String wattage, String voltage, String luminousFlux, String longevity, String cri, String consumption, String light_color, int warranty, String material, String colorCover, String size) {
        this.id = id;
        this.idProduct = idProduct;
        this.wattage = wattage;
        this.voltage = voltage;
        this.luminousFlux = luminousFlux;
        this.longevity = longevity;
        this.cri = cri;
        this.consumption = consumption;
        this.light_color = light_color;
        this.warranty = warranty;
        this.material = material;
        this.colorCover = colorCover;
        this.size = size;
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

    public String getConsumption() {
        return consumption;
    }

    public void setConsumption(String consumption) {
        this.consumption = consumption;
    }

    public String getLight_color() {
        return light_color;
    }

    public void setLight_color(String light_color) {
        this.light_color = light_color;
    }

    public int getWarranty() {
        return warranty;
    }

    public void setWarranty(int warranty) {
        this.warranty = warranty;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getColorCover() {
        return colorCover;
    }

    public void setColorCover(String colorCover) {
        this.colorCover = colorCover;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
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
                ", consumption='" + consumption + '\'' +
                ", light_color='" + light_color + '\'' +
                ", warranty=" + warranty +
                ", material='" + material + '\'' +
                ", colorCover='" + colorCover + '\'' +
                ", size='" + size + '\'' +
                '}';
    }
}
