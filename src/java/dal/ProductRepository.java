/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import java.util.Optional;
import models.Product;

/**
 *
 * @author Teodor
 */
public class ProductRepository implements IRepository<Product>{

    @Override
    public boolean create(Product pro) throws Exception {
        boolean proAlreadyExists = RepoFactory.getRepository().products.stream()
                .anyMatch(p -> p.getName().equals(pro.getName()));
        
        if (!proAlreadyExists) {
            RepoFactory.getRepository().products.add(pro);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void create(List<Product> products) throws Exception {
        RepoFactory.getRepository().products.addAll(products);
    }

    @Override
    public void update(int id, Product data) throws Exception {
        Optional<Product> pro = RepoFactory.getRepository().getProducts().stream()
                .filter(p -> p.getId() == id)
                .findFirst();
        
        pro.get().setName(data.getName());
        pro.get().setPrice(data.getPrice());
        pro.get().setPicturePath(data.getPicturePath());
        pro.get().setCategory(data.getCategory());
    }

    @Override
    public void delete(int id) throws Exception {
        Optional<Product> pro = RepoFactory.getRepository().getProducts().stream()
                .filter(p -> p.getId() == id)
                .findFirst();
        
        boolean removed = RepoFactory.getRepository().getProducts().remove(pro.get());
    }

    @Override
    public Optional<Product> get(int id) throws Exception {
        Optional<Product> foundPro = RepoFactory.getRepository().products.stream()
                                                                     .filter(p -> p.getId() == id)
                                                                     .findFirst();
        return foundPro;         
    }

    @Override
    public List<Product> getAll() throws Exception {
        return RepoFactory.getRepository().products;
    }
    
}
