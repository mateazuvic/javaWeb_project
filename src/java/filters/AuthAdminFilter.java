/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import dal.RepoFactory;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;

/**
 *
 * @author Teodor
 */
@WebFilter(filterName = "AuthAdminFilter", urlPatterns = {"/admin/*"})
public class AuthAdminFilter implements Filter {
    
     private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
       

    }    
    
    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
       
    }

   
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain)
            throws IOException, ServletException {
        
        
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);
        String loginURI = request.getContextPath() + "/login.jsp";

        boolean loggedIn = session != null && session.getAttribute("loggedUserEmail") != null;
        User user = null;
        boolean loggedInAdmin = false;
         if (loggedIn) {
            String email = (String) session.getAttribute("loggedUserEmail");
            user = RepoFactory.getRepository().getUsers().stream()
                    .filter(u -> u.getEmail().equals(email)).findFirst().get();
             if (user.isIsAdmin()) {
                 loggedInAdmin = true;
             }
         }
      
        boolean loginRequest = request.getRequestURI().equals(loginURI);

        if (loggedInAdmin || loginRequest) {
            chain.doFilter(request, response);
        } else {
            response.sendRedirect(loginURI);
        }

        
    }

    
    public void destroy() {        
    }

   
    public void init(FilterConfig filterConfig) {        
    }

   
}