/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dal.RepoFactory;
import java.io.IOException;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.Product;

/**
 *
 * @author Teodor
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/EditProduct"})
public class EditProductServlet extends HttpServlet {

   
    
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
        
         int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String picture = request.getParameter("picture");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        
        Category category = new Category();
        Optional<Category> foundCat = RepoFactory.getRepository().getCategories()
                .stream()
                .filter(c -> categoryId == c.getId())
                .findFirst();
        
        if (foundCat.isPresent()) {
            category = foundCat.get();
        }
       
        
        Product p = new Product(name, price, picture, category);
        
        try {
            RepoFactory.getProductRepository().update(id,p);
             response.sendRedirect("/JavaWebProjekt/admin/products.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddCategoryServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("/JavaWebProjekt/404.jsp");
        }
    }
    

   

}
