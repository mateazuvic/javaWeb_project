/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dal.RepoFactory;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Address;
import models.Cart;
import models.Order;
import models.User;

/**
 *
 * @author Teodor
 */
@WebServlet(name = "PlaceOrderServlet", urlPatterns = {"/PlaceOrder"})
public class PlaceOrderServlet extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PlaceOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(PlaceOrderServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, Exception {
        List<String> validation = new ArrayList<>();
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String comment = request.getParameter("comment");
        
        String method = null;
        if (request.getParameter("method") != null) {
            method = request.getParameter("method");
        } else {
            response.sendRedirect("/JavaWebProjekt/user/checkout.jsp?validation=false");
            return;
        }
              
        validation.add(name);
        validation.add(email);
        validation.add(address);
        validation.add(phone);
        validation.add(method);
                
        for (String v : validation) {          
            if (v == null || v == "") {
                response.sendRedirect("/JavaWebProjekt/user/checkout.jsp?validation=false");
                return;
            }
        }
        
        
        Address a = new Address(name, email, address, phone, comment);
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        String userEmail = (String) request.getSession().getAttribute("loggedUserEmail");
        Optional<User> foundUser = RepoFactory.getRepository().getUsers().stream()
                    .filter(u -> u.getEmail().equals(userEmail))
                    .findFirst();
        int userId = 0;
        if (foundUser.isPresent()) {
            userId = foundUser.get().getId();
        }
        double price = Double.parseDouble( request.getParameter("price"));
        Order order = new Order(a, LocalDateTime.now(), method, cart, price, userId);
        
        
        
        String paid = null;
         if (request.getParameter("paid") != null) {
            paid = request.getParameter("paid");
        }
          String paidCash = null;
         if (request.getParameter("paidCash") != null) {
            paidCash = request.getParameter("paidCash");
        }
        
         
        if (method.equals("cash") && (paidCash == null || paidCash.equals(""))) {
            response.sendRedirect("/JavaWebProjekt/user/checkout.jsp?validation=true&method=cash&name=" + name + "&email=" + email + "&address=" + address + "&phone=" + phone + "&comment=" + comment);
        }
        else if(method.equals("cash") && paidCash != null && paidCash.equals("true")) {
            //RepoFactory.getOrderRepository().create(order);
            request.getSession().setAttribute("addToOrders", order);
            request.getSession().setAttribute("cart", null);
            response.sendRedirect("/JavaWebProjekt/user/orderSuccess.jsp?name=" + name);
        }
        else if(method.equals("paypal") && (paid == null || paid.equals(""))) {
            response.sendRedirect("/JavaWebProjekt/user/checkout.jsp?validation=true&method=paypal&name=" + name + "&email=" + email + "&address=" + address + "&phone=" + phone + "&comment=" + comment);
        } 
        else if(method.equals("paypal") && paid != null && paid.equals("true")) {
            //RepoFactory.getOrderRepository().create(order);
            request.getSession().setAttribute("addToOrders", order);
            response.sendRedirect("/JavaWebProjekt/user/orderSuccess.jsp?name=" + name);
        }
        
        
    }

   
}
