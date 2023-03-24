package com.steph.ecommerce_app.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{
    List<Product> findAll();
    Product findByIdIs(Long id);
    List<Product> findAllByCategories(Category category);
    List<Product> findByCategoriesNotContains(Category category);
}
