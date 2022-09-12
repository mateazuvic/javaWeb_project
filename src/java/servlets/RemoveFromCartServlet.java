/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
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
@WebServlet(name = "RemoveFromCartServlet", urlPatterns = {"/RemoveFromCart"})
public class RemoveFromCartServlet extends HttpServlet {

  
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
        
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        
        for (CartItem item : cart.getItems()) {
            if (item.getProduct().getName().equals(selectedProductName)) {
                cart.getItems().remove(item);
                break;
            }
        }
        request.getSession().setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
        
        
    }

   
}
