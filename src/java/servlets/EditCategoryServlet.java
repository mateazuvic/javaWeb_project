/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dal.RepoFactory;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;

/**
 *
 * @author Teodor
 */
@WebServlet(name = "EditCategoryServlet", urlPatterns = {"/EditCategory"})
public class EditCategoryServlet extends HttpServlet {

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
        
        String categoryName = request.getParameter("name");
        int id = Integer.parseInt(request.getParameter("id"));
        
        Category c = new Category(categoryName);
        
        try {
            RepoFactory.getCategoryRepository().update(id,c);
             response.sendRedirect("/JavaWebProjekt/admin/categories.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddCategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("/JavaWebProjekt/404.jsp");
        }
    }

}
