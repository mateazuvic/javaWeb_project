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
public class Login {
    
    private int id;
    private User user;
    private LocalDateTime dateTime;
    private String IPAddress;
    
    private static int counter = 1;

    public Login(User user, LocalDateTime dateTime, String IPAddress) {
        this.id = counter++;
        this.user = user;
        this.dateTime = dateTime;
        this.IPAddress = IPAddress;
    }

    public int getId() {
        return id;
    }

   
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public String getIPAddress() {
        return IPAddress;
    }

    public void setIPAddress(String IPAddress) {
        this.IPAddress = IPAddress;
    }
    
    
    
}
