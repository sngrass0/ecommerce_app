package com.steph.ecommerce_app.controllers;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.steph.ecommerce_app.models.Cart;
import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.services.CategoryService;
import com.steph.ecommerce_app.services.ProductService;
import com.steph.ecommerce_app.services.UserService;

@Controller
public class ShopController {
    @Autowired ProductService productService;
    @Autowired UserService userService;
    @Autowired CategoryService categoryService;

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
    public String cart(
        HttpSession session,
        Model model
    ) {
        if (session.getAttribute("cart") == null) {
            model.addAttribute("cart", null);
        } else {
            Cart cart = (Cart) session.getAttribute("cart");
            model.addAttribute("cart", cart.getItems());
            model.addAttribute("total", cart.getTotal());
        }
        return "shop/cart.jsp";
    }
    
    // READ - About
    @GetMapping("/about")
    public String about() {
        return "shop/about.jsp";
    }

    @GetMapping("products/{id}/addtocart")
    public String addToCart(
        @PathVariable("id") Long id,
        HttpSession session) {
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart());
        }

        Product product = productService.getOneProduct(id);
        Cart cart = (Cart) session.getAttribute("cart");
        cart.addCartItem(product);

        return "redirect:/cart";
    }

    @GetMapping("products/{index}/removefromcart")
    public String addToCart(
        @PathVariable("index") Integer index,
        HttpSession session) {
        if (session.getAttribute("cart") == null) {
            session.setAttribute("cart", new Cart());
        }

        Cart cart = (Cart) session.getAttribute("cart");
        cart.removeCartItem(index);

        return "redirect:/cart";
    }

    @GetMapping("products/category/{category}")
    public String displayCategoryPage(
        @PathVariable("category") String name,
        Model model
    ) {
        Category category = categoryService.getOneCategoryByName(name);
        model.addAttribute("category", category);
        return "/shop/category.jsp";
    }
}
