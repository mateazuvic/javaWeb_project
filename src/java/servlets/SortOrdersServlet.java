/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dal.RepoFactory;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;

/**
 *
 * @author Teodor
 */
@WebServlet(name = "SortOrdersServlet", urlPatterns = {"/SortOrders"})
public class SortOrdersServlet extends HttpServlet {

 
   
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
        
        int customerId = Integer.parseInt(request.getParameter("customer"));
        String date = request.getParameter("date");
        
        List<Order> orders = RepoFactory.getRepository().getOrders();
        List<Order> ordersToShow = new ArrayList<>();
        
        for (Order order : orders) {
            if (customerId == -1) {
                ordersToShow.add(order);
            }
            else if (order.getUserId() == customerId) {
                ordersToShow.add(order);
            }
                      
        }
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        List<Order> ordersToRemove = new ArrayList<>();
        
        for (Order order : ordersToShow) {
            if (date.equals("")) {
                break;
            }
            String dateTime = order.getDate().format(formatter);
            if (!dateTime.equals(date)) {
                ordersToRemove.add(order);
            }
        }
        
        ordersToShow.removeAll(ordersToRemove);
       
        request.getSession().setAttribute("ordersToShow", ordersToShow);
        response.sendRedirect("/JavaWebProjekt/admin/orderHistoryAdmin.jsp?cus=" + customerId +"&date=" + date);
        
    }

   
}
