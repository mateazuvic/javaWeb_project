/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

/**
 *
 * @author Teodor
 */
public class RepoFactory {
    
     public static Repository getRepository(){
        return new Repository();
    }
    
    public static UserRepository getUserRepository(){
        return new UserRepository();
    }
    
    public static IRepository getOrderRepository(){
        return new OrderRepository();
    }
    
    public static IRepository getCategoryRepository(){
        return new CategoryRepository();
    }
    
    public static IRepository getProductRepository(){
        return new ProductRepository();
    }
    
    public static IRepository getLoginRepository(){
        return new LoginRepository();
    }
    
}
