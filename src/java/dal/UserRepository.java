/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import java.util.Optional;
import models.User;

/**
 *
 * @author Teodor
 */
public class UserRepository implements IRepository<User>{
    

    @Override
    public boolean create(User user) throws Exception {  //register
        boolean userAlreadyExists = RepoFactory.getRepository().users.stream()
                .anyMatch(u -> u.getEmail().equals(user.getEmail()));
        
        if (!userAlreadyExists) {
            RepoFactory.getRepository().users.add(user);
            return true;
        } else {
            return false;
        }
        
    }

    @Override
    public void create(List<User> users) throws Exception {
       RepoFactory.getRepository().users.addAll(users);
    }

    @Override
    public void update(int id, User data) throws Exception {
        
    }

    @Override
    public void delete(int id) throws Exception {
       
    }

    @Override
    public Optional<User> get(int id) throws Exception {  
        Optional<User> foundUser = RepoFactory.getRepository().users.stream()
                                                                     .filter(u -> u.getId() == id)
                                                                     .findFirst();
        return foundUser;             
    }

    @Override
    public List<User> getAll() throws Exception {
        return RepoFactory.getRepository().users;
    }
    


    public boolean logIn(String email, String password) {
        boolean foundUser = RepoFactory.getRepository().users.stream()
                .anyMatch(u -> u.getEmail().equals(email) && u.getPassword().equals(password));
        
         return foundUser;
    }
    
}
