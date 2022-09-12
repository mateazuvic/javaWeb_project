/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package listeners;

import dal.RepoFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import models.Order;

/**
 * Web application lifecycle listener.
 *
 * @author Teodor
 */
public class OnOrderPlacedListener implements HttpSessionAttributeListener {

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        
        if(event.getName().equals("addToOrders")){
            Order o  = (Order) event.getSession().getAttribute("addToOrders");
            try {
                boolean created = RepoFactory.getOrderRepository().create(o);
            } catch (Exception ex) {
                Logger.getLogger(OnOrderPlacedListener.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            event.getSession().setAttribute("addToOrders", null);
            
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        
    }
}
