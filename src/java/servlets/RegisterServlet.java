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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;

/**
 *
 * @author Teodor
 */
public class RegisterServlet extends HttpServlet {

   
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repeatedPassword = request.getParameter("password_repeat");

        if ("".equals(name)
                || "".equals(surname)
                || "".equals(email)
                || "".equals(password)
                || "".equals(repeatedPassword)
                || password.equals(repeatedPassword) == false) {
            response.sendRedirect("register.jsp");
        } else {

            User user = new User(name, surname, email, password, false);
            try {
                boolean created = RepoFactory.getUserRepository().create(user);

                if (created) {
                    response.sendRedirect("login.jsp");
                } else {
                    response.sendRedirect("register.jsp");
                }

            } catch (Exception ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    
}
