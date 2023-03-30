package com.steph.ecommerce_app.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.services.CategoryService;
import com.steph.ecommerce_app.services.ProductService;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    // CREATE - Page
    // * end point fetches the create form for a new product
    @GetMapping("/products/new")
    public String newProduct(
            @ModelAttribute("product") Product product,
            Model model,
            HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "/admin/newProduct.jsp";
    }

    // CREATE - Action
    // * end point handles the form submit and saves Product to the database
    @PostMapping("/products")
    public String createProduct(
            @Valid @ModelAttribute("product") Product product,
            BindingResult result) {
        if (result.hasErrors()) {
            return "/admin/newProduct.jsp";
        }
        System.out.println(product);
        productService.createProduct(product);
        return "redirect:/home";
    }

    // UPDATE - Page TODO
    // * end point fetches the edit form to update an existing product
    @GetMapping("/products/{id}/edit")
    public String editProduct(
            @PathVariable("id") Long id,
            Model model,
            HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Product product = productService.getOneProduct(id);
        model.addAttribute("product", product);
        return "admin/editProduct.jsp";
    }

    // UPDATE - Action TODO
    // * end point handles form submit and updates Product in databse
    @PutMapping("/products/{id}")
    public String updateProduct(
            @PathVariable("id") Long id,
            @Valid @ModelAttribute("product") Product product,
            BindingResult result) {
        if (result.hasErrors()) {
            return "admin/editProduct.jsp";
        }
        productService.updateProduct(product);
        return "redirect:/products/" + id;
    }

    // DELETE - Action TODO
    // * end point handles deleting a product
    @DeleteMapping("/products")
    public String deleteProduct() {
        return null;
    }
}
