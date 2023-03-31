package com.steph.ecommerce_app.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.repositories.CategoryRepository;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    // READ ALL
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    // READ ALL - products in a Category
    public List<Category> getAssignedCategorys(Product product) {
        return categoryRepository.findAllByProducts(product);
    }

    // READ ALL - products not in a Category
    public List<Category> getUnAssignedCategorys(Product product) {
        return categoryRepository.findByProductsNotContains(product);
    }

    // READ ONE
    public Category getOneCategory(Long id) {
        Optional<Category> optionalcategory = categoryRepository.findById(id);
        Category category = optionalcategory.orElse(null);
        return category;
    }

    // READ ONE
    public Category getOneCategoryByName(String name) {
        Optional<Category> optionalcategory = categoryRepository.findByName(name);
        Category category = optionalcategory.orElse(null);
        return category;
    }

    // CREATE
    public Category createCategory(Category category) {
        return categoryRepository.save(category);
    }

    // UPDATE
    public Category updateCategory(Category category) {
        return categoryRepository.save(category);
    }

    // DELETE
    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }
}
