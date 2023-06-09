package com.steph.ecommerce_app.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.models.User;
import com.steph.ecommerce_app.services.ProductService;
import com.steph.ecommerce_app.services.UserService;

@Controller
public class AdminController {
    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;

    // SHOW - Page
    // * display admin dash board
    @GetMapping("/admin/dashboard")
    public String adminDash(
            HttpSession session) {
        if (session.getAttribute("userId") == null) {
            // should take user back home
            return "redirect:/home";
        }

        // check admin status
        User user = userService.getUser((Long) session.getAttribute("userId"));
        if (!user.getIsAdmin()) {
            return "redirect:/home";
        }

        // show dash
        return "/admin/dashboard.jsp";
    }

    @GetMapping("/admin/users")
    public String manageCategories(
        Model model, 
        HttpSession session
    ) {
        if (session.getAttribute("userId") == null) {
            // should take user back home
            return "redirect:/home";
        }

        // check admin status
        User user = userService.getUser((Long) session.getAttribute("userId"));
        if (!user.getIsAdmin()) {
            return "redirect:/home";
        }

        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "admin/allUsers.jsp";
    }

    @GetMapping("/admin/products")
    public String manageProducts(
        Model model, 
        HttpSession session
    ) {
        if (session.getAttribute("userId") == null) {
            // should take user back home
            return "redirect:/home";
        }

        // check admin status
        User user = userService.getUser((Long) session.getAttribute("userId"));
        if (!user.getIsAdmin()) {
            return "redirect:/home";
        }

        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "admin/allProducts.jsp";
    }

    @GetMapping("admin/orders")
    public String manageOrders() {
        return "admin/wip.jsp";
    }

    @GetMapping("admin/organize")
    public String manageOrganization() {
        return "admin/wip.jsp";
    }

}
