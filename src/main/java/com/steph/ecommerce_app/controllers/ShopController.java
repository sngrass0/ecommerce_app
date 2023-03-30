package com.steph.ecommerce_app.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.services.ProductService;
import com.steph.ecommerce_app.services.UserService;

@Controller
public class ShopController {
    @Autowired ProductService productService;
    @Autowired UserService userService;

    // READ ALL - Page
    // home page : displays all products as default
    @GetMapping("/home")
    public String homepage(
        Model model,
        HttpSession session
    ) {
        List<Product> products = productService.getAllProducts();
        Collections.reverse(products);

        model.addAttribute("products", products);
        return "shop/index.jsp";
    }
    
    // READ ONE - Page
    // display information of a single product
    @GetMapping("/products/{id}")
    public String showInfo(
        @PathVariable("id") Long id,
        Model model,
        HttpSession session
    ) {
        Product product = productService.getOneProduct(id);
        model.addAttribute("product", product);
        return "shop/product.jsp";
    }

    // READ - Page
    // display cart contents
    @GetMapping("/cart")
    public String cart() {
        return "shop/cart.jsp";
    }
}
