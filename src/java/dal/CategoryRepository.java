/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import models.Category;
import models.Product;

/**
 *
 * @author Teodor
 */
public class CategoryRepository implements IRepository<Category>{

    @Override
    public boolean create(Category cat) throws Exception {
         boolean catAlreadyExists = RepoFactory.getRepository().categories.stream()
                .anyMatch(c -> c.getName().equals(cat.getName()));
        
        if (!catAlreadyExists) {
            RepoFactory.getRepository().categories.add(cat);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void create(List<Category> cats) throws Exception {
        RepoFactory.getRepository().categories.addAll(cats);
    }

    @Override
    public void update(int id, Category data) throws Exception {
        Optional<Category> cat = RepoFactory.getRepository().getCategories().stream()
                .filter(c -> c.getId() == id)
                .findFirst();
        
        cat.get().setName(data.getName());
    }

    @Override
    public void delete(int id) throws Exception {
        List<Product> products = RepoFactory.getRepository().getProducts().stream()
                .filter(p -> p.getCategory().getId() == id)
                .collect(Collectors.toList());
        
        products.forEach(p -> RepoFactory.getRepository().getProducts().remove(p));
        
        
        Optional<Category> cat = RepoFactory.getRepository().getCategories().stream()
                .filter(c -> c.getId() == id)
                .findFirst();
        
        boolean removed = RepoFactory.getRepository().getCategories().remove(cat.get());
    }

    @Override
    public Optional<Category> get(int id) throws Exception {
        Optional<Category> foundCat = RepoFactory.getRepository().categories.stream()
                                                                     .filter(c -> c.getId() == id)
                                                                     .findFirst();
        return foundCat;             
    }

    @Override
    public List<Category> getAll() throws Exception {
        return RepoFactory.getRepository().categories;
    }
    
}
