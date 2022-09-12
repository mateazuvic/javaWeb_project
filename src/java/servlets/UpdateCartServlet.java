/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Cart;
import models.CartItem;

/**
 *
 * @author Teodor
 */
@WebServlet(name = "UpdateCartServlet", urlPatterns = {"/UpdateCart"})
public class UpdateCartServlet extends HttpServlet {

   

    
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

        Cart cart = null;

        if (request.getSession() != null && (Cart) request.getSession().getAttribute("cart") != null) {
            cart = (Cart) request.getSession().getAttribute("cart");
        } else {
            cart = new Cart(new ArrayList<CartItem>());
        }

        for (CartItem item : cart.getItems()) {
            int selectedProductQuantity =Integer.parseInt(request.getParameter("quantity" + item.getProduct().getName()));
            item.setQuantity(selectedProductQuantity);
        }
        request.getSession().setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }

}

    
