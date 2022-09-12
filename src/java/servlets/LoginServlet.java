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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Teodor
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if ( "".equals(email)
                || "".equals(password)) {
            response.sendRedirect("login.jsp");
        } else {

            try {
                boolean loggedIn = RepoFactory.getUserRepository().logIn(email, password);

                if (loggedIn) {
                    request.getSession(loggedIn).setAttribute("loggedUserEmail", email);
                    response.sendRedirect("/JavaWebProjekt/LoginSuccess");
                } else {
                    response.sendRedirect("login.jsp");
                }
                

            } catch (Exception ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }

   
}
