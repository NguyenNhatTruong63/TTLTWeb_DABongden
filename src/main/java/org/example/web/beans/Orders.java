package org.example.web.beans;

import java.io.Serializable;

public class Orders implements Serializable {
    private String id;
    private String id_user;
    private String fullname;
    private String address;
    private String phoneNumber;
    private String email;
    private String status;


    public Orders() {

    }

    public Orders(String id, String id_user, String fullname, String address, String phoneNumber, String email, String status) {
        this.id = id;
        this.id_user = id_user;
        this.fullname = fullname;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id='" + id + '\'' +
                ", id_user='" + id_user + '\'' +
                ", fullname='" + fullname + '\'' +
                ", address='" + address + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", email='" + email + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
