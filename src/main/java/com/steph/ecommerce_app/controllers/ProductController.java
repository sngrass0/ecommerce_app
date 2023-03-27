package com.steph.ecommerce_app.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.services.CategoryService;
import com.steph.ecommerce_app.services.ProductService;

@Controller
public class ProductController {
    @Autowired ProductService productService;
    @Autowired CategoryService categoryService;
    
    @GetMapping("/products/new")
    public String newProduct(
        @ModelAttribute("product") Product product,
        Model model,
        HttpSession session
    ) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "/admin/newProduct.jsp";
    }

    @PostMapping("/products")
    public String createProduct(
        @Valid @ModelAttribute("product") Product product,
        BindingResult result
    ) {
        if (result.hasErrors()) {
            return "/admin/newProduct.jsp";
        }
        System.out.println(product);
        productService.createProduct(product);
        return "redirect:/home";
    }

    @GetMapping("/products/edit")
    public String editProduct(
        @ModelAttribute("product") Product product,
        Model model,
        HttpSession session
    ) {
        if(session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        return "admin/editProduct.jsp";
    }

    @PutMapping("/products")
    public String updateProduct(
        @Valid @ModelAttribute("product") Product product,
        BindingResult result
    ) {
        if (result.hasErrors()) {
            return "admin/editProduct.jsp";
        }
        return "redirect:/home";
    }
}
