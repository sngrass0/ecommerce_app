package com.steph.ecommerce_app.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long>{
    List<Category> findAll();
    Category findByIdIs(Long id);
    Optional<Category> findByName(String name);
    List<Category> findAllByProducts(Product product);
    List<Category> findByProductsNotContains(Product product);
}
