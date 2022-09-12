/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.util.List;

/**
 *
 * @author Teodor
 */
public class Cart {
    
    private List<CartItem> items;

    public Cart(List<CartItem> items) {
        this.items = items;
    }

    public Cart() {
    }
    
    

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }
    
    
    
}
