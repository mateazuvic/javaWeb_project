/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import java.util.Optional;

/**
 *
 * @author Teodor
 */
public interface IRepository<T> {
    
    boolean create(T object) throws Exception;
    void create(List<T> objects) throws Exception;
    void update(int id, T data) throws Exception;
    void delete(int id) throws Exception;
    Optional<T> get(int id) throws Exception;
    List<T> getAll() throws Exception;   

    

     
}
