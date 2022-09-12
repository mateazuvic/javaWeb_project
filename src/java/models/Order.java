/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.time.LocalDateTime;

/**
 *
 * @author Teodor
 */
public class Order {
    
    private int id;
    private Address address;
    private LocalDateTime date;
    private String paymentMethod;
    private Cart cart;
    private double price;
    private int userId;
    
    private static int counter = 1;

    public Order(Address address, LocalDateTime date, String paymentMethod, Cart cart, double price, int userId) {
        this.id = counter++;
        this.address = address;
        this.date = date;
        this.paymentMethod = paymentMethod;
        this.cart = cart;
        this.price = price;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public static int getCounter() {
        return counter;
    }

    public static void setCounter(int counter) {
        Order.counter = counter;
    }
    
    
    
    
    
}
