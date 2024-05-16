package org.example.web.beans;

import java.io.Serializable;

public class Warehoue implements Serializable {
    public String id;
    public String soluong;
    public String name;
    public int soluongnhap;
    public int soluongban;
    public String gianhap;
    public String giaban;
    public String giatonkho;

    public Warehoue() {
    }

    public Warehoue(String id, String soluong, String name, int soluongnhap, int soluongban, String gianhap, String giaban, String giatonkho) {
        this.id = id;
        this.soluong = soluong;
        this.name = name;
        this.soluongnhap = soluongnhap;
        this.soluongban = soluongban;
        this.gianhap = gianhap;
        this.giaban = giaban;
        this.giatonkho = giatonkho;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSoluong() {
        return soluong;
    }

    public void setSoluong(String soluong) {
        this.soluong = soluong;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSoluongnhap() {
        return soluongnhap;
    }

    public void setSoluongnhap(int soluongnhap) {
        this.soluongnhap = soluongnhap;
    }

    public int getSoluongban() {
        return soluongban;
    }

    public void setSoluongban(int soluongban) {
        this.soluongban = soluongban;
    }

    public String getGianhap() {
        return gianhap;
    }

    public void setGianhap(String gianhap) {
        this.gianhap = gianhap;
    }

    public String getGiaban() {
        return giaban;
    }

    public void setGiaban(String giaban) {
        this.giaban = giaban;
    }

    public String getGiatonkho() {
        return giatonkho;
    }

    public void setGiatonkho(String giatonkho) {
        this.giatonkho = giatonkho;
    }

    @Override
    public String toString() {
        return "Warehoue{" +
                "id='" + id + '\'' +
                ", soluong='" + soluong + '\'' +
                ", name='" + name + '\'' +
                ", soluongnhap=" + soluongnhap +
                ", soluongban=" + soluongban +
                ", gianhap='" + gianhap + '\'' +
                ", giaban='" + giaban + '\'' +
                ", giatonkho='" + giatonkho + '\'' +
                '}';
    }

    public int slton(){
        return soluongnhap - soluongban;
    }
}
