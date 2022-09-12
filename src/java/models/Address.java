/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Teodor
 */
public class Address {
    
    private int id;
    private String name;
    private String email;
    private String address;
    private String phone;
    private String comment;
    
    private static int counter = 1;

    public Address(String name, String email, String address, String phone, String comment) {
        this.id = counter++;
        this.name = name;
        this.email = email;
        this.address = address;
        this.phone = phone;
        this.comment = comment;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return address;
    }
    
    
    
}
