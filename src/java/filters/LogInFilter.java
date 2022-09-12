/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filters;

import dal.RepoFactory;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import models.Login;
import models.User;

/**
 *
 * @author Teodor
 */
@WebFilter(filterName = "LogInFilter", urlPatterns = {"/LoginSuccess"})
public class LogInFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            t.printStackTrace();
        }
        Optional<User> user = Optional.empty();
        HttpServletRequest req = (HttpServletRequest) request;
        if (req.getSession().getAttribute("loggedUserEmail") != null) {
            String email = (String) req.getSession().getAttribute("loggedUserEmail");
            user = RepoFactory.getRepository().getUsers().stream().filter(u -> u.getEmail().equals(email)).findFirst();

            try {
                RepoFactory.getLoginRepository().create(new Login(user.get(), LocalDateTime.now(), req.getRemoteAddr()));
            } catch (Exception ex) {
                Logger.getLogger(LogInFilter.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {

    }

}
