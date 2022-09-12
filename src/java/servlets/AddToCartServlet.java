/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dal.RepoFactory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Optional;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Cart;
import models.CartItem;
import models.Product;

/**
 *
 * @author Teodor
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCart"})
public class AddToCartServlet extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        
        String selectedProductName = request.getParameter("name");
        String quantity = request.getParameter("quantity");
        
        Optional<Product> foundProduct = RepoFactory.getRepository().getProducts()
                .stream()
                .filter(p -> p.getName().equals(selectedProductName))
                .findFirst();
        
        if(foundProduct.isPresent()) {
            Product selectedProduct = foundProduct.get();
       
            Cart cart = null;
            
            if(request.getSession().getAttribute("cart") != null) {
                cart = (Cart) request.getSession().getAttribute("cart");
            }
            else {
                cart = new Cart(new ArrayList<>());
            }
            
            boolean inCart = false;
            
            
             for (CartItem item : cart.getItems()) {
                if (item.getProduct().equals(selectedProduct)) {
                    inCart = true;
                    break;
                }
            }
            
            
            if (!inCart) {
                if (quantity == null || quantity.equals("")) {
                    cart.getItems().add(new CartItem(selectedProduct, 1));       
                }
                else {
                    cart.getItems().add(new CartItem(selectedProduct, Integer.parseInt(quantity)));       
                }
                        
            }
            
            request.getSession().setAttribute("cart", cart);
            
        }
        
        response.sendRedirect("cart.jsp");
    }

   
}
