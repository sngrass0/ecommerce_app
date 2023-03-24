package com.steph.ecommerce_app.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.repositories.ProductRepository;

@Service
public class ProductService {
    @Autowired
    ProductRepository productRepository;

    // READ ALL
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }
    
    // READ ALL - products in a Category
    public List<Product> getAssignedProducts(Category category) {
        return productRepository.findAllByCategories(category);
    }

    // READ ALL - products not in a Category
    public List<Product> getUnAssignedProducts(Category category) {
        return productRepository.findByCategoriesNotContains(category);
    }

    // READ ONE
    public Product getOneProduct(Long id) {
        Optional<Product> optionalproduct = productRepository.findById(id);
        Product product = optionalproduct.orElse(null);
        return product;
    }

    // CREATE
    public Product createProduct(Product product) {
        return productRepository.save(product);
    }

    // UPDATE
    public Product updateProduct(Product product) {
        return productRepository.save(product);
    }

    // DELETE
    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
}
