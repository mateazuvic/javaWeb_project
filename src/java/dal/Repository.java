/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import models.Address;
import models.Cart;
import models.CartItem;
import models.Category;
import models.Login;
import models.Order;
import models.Product;
import models.User;

/**
 *
 * @author Teodor
 */
public class Repository  {
    
    private static boolean first=true;
    public static List<User> users = new ArrayList<>();
    public static List<Product> products = new ArrayList<>();
    public static List<Order> orders = new ArrayList<>();
    public static List<Category> categories = new ArrayList<>();
    public static List<Login> logins = new ArrayList<>();
    

    public Repository() {
        if (first) {
            setData();
            first = false;
        }
        
    }
    
    private void setData() {
        users.add(new User("Matea", "Zuvic", "mzuvic@racunarstvo.hr", "Matea", false));
        users.add(new User("Pero", "Peric", "pperic@racunarstvo.hr", "Pero", false));
        users.add(new User("Admin", "A", "aadmin@racunarstvo.hr", "Admin", true));
        
        Category cat1 = new Category("Berries");
        Category cat2 = new Category("Citrus");
        Category cat3 = new Category("Tropical");
        
       categories.add(cat1);
       categories.add(cat2);
       categories.add(cat3);
        
        products.add(new Product("Strawberry", 50.00, "assets/img/products/product-img-1.jpg", cat1));
        products.add(new Product("Berry", 70.00, "assets/img/products/product-img-2.jpg", cat1));
        products.add(new Product("Lemon", 20.00, "assets/img/products/product-img-3.jpg", cat2));
        products.add(new Product("Kiwi", 58.00, "assets/img/products/product-img-4.jpg", cat3));
        products.add(new Product("Green Apple", 33.00, "assets/img/products/product-img-5.jpg", cat2));
        products.add(new Product("Raspberries", 81.00, "assets/img/products/product-img-6.jpg", cat1));
        
        List<CartItem> items = new ArrayList<>();
        CartItem ci = new CartItem(new Product("Lemon", 30, "", cat2), 2);
        items.add(ci);
        
        orders.add(new Order(new Address("Kupac", "kupac@mail.com", "Adresa", "01234567", "Komentar"), LocalDateTime.of(2022, Month.AUGUST, 20, 10, 50, 13), "cash", 
                new Cart(items), 85.0, 1));
        orders.add(new Order(new Address("Kupac", "kupac@mail.com", "Adresa", "01234567", "Komentar"), LocalDateTime.of(2022, Month.AUGUST, 21, 10, 50, 13), "cash", 
                new Cart(items), 85.0, 2));
        orders.add(new Order(new Address("Kupac", "kupac@mail.com", "Adresa", "01234567", "Komentar"), LocalDateTime.of(2022, Month.AUGUST, 25, 10, 50, 13), "cash", 
                new Cart(items), 85.0, 3));
    }

    public  List<User> getUsers() {
        return users;
    }

    public  void setUsers(List<User> users) {
        Repository.users = users;
    }

    public  List<Product> getProducts() {
        return products;
    }

    public  void setProducts(List<Product> products) {
        Repository.products = products;
    }

    public  List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        Repository.orders = orders;
    }

    public List<Category> getCategories() {
        return categories;
    }

    public void setCategories(List<Category> categories) {
        this.categories = categories;
    }

    public  List<Login> getLogins() {
        return logins;
    }

    public  void setLogins(List<Login> logins) {
        Repository.logins = logins;
    }
    
   
    
    
}
