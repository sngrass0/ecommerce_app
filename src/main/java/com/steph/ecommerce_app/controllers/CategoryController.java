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
import org.springframework.web.bind.annotation.RequestParam;

import com.steph.ecommerce_app.models.Category;
import com.steph.ecommerce_app.models.Product;
import com.steph.ecommerce_app.models.User;
import com.steph.ecommerce_app.services.CategoryService;
import com.steph.ecommerce_app.services.ProductService;
import com.steph.ecommerce_app.services.UserService;

@Controller
public class CategoryController {
    
    @Autowired CategoryService categoryService;
    @Autowired UserService userService;
    @Autowired ProductService productService;
    // CREATE - Page
    // * end point fetches the create form for a new category
    @GetMapping("/categories/new")
    public String newCategory(
            @ModelAttribute("category") Category category,
            Model model,
            HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "/admin/newCategory.jsp";
    }

    // CREATE - Action
    // * end point handles the form submit and saves Category to the database
    @PostMapping("/categories")
    public String createCategory(
            @Valid @ModelAttribute("category") Category category,
            BindingResult result) {
        if (result.hasErrors()) {
            return "/admin/newCategory.jsp";
        }
        System.out.println(category);
        categoryService.createCategory(category);
        return "redirect:/categories/new";
    }

    // UPDATE - Page
    // * end point fetches the edit form to update an existing category
    @GetMapping("/categories/{id}/edit")
    public String editCategory(
            @PathVariable("id") Long id,
            Model model,
            HttpSession session) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }

        Category category = categoryService.getOneCategory(id);
        model.addAttribute("category", category);
        return "admin/editCategory.jsp";
    }

    // UPDATE - Action
    // * end point handles form submit and updates Category in databse
    @PutMapping("/categories/{id}")
    public String updateCategory(
            @PathVariable("id") Long id,
            @Valid @ModelAttribute("category") Category category,
            BindingResult result) {
        if (result.hasErrors()) {
            return "admin/editCategory.jsp";
        }
        categoryService.updateCategory(category);
        return "redirect:/categories/" + id;
    }

    // DELETE - Action TODO
    // * end point handles deleting a category
    @DeleteMapping("/categories")
    public String deleteCategory() {
        return null;
    }

    @GetMapping("/categories/{id}")
    public String viewCategory(
        @PathVariable("id") Long id,
        HttpSession session,
        Model model
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
        
        Category category = categoryService.getOneCategory(id);
        List<Product> assignedProducts = productService.getAssignedProducts(category);
        List<Product> unassignedProducts = productService.getUnAssignedProducts(category);

        model.addAttribute("category", category);
        model.addAttribute("assignedProducts", assignedProducts);
        model.addAttribute("unassignedProducts", unassignedProducts);

        return "admin/showCategory.jsp";
    }

    @PostMapping("/categories/{id}")
    public String addProductToCategory(
        @PathVariable("id") Long id,
        @RequestParam(value = "productId") Long productId,
        Model model
    ) {
        Category category = categoryService.getOneCategory(id);
        Product product = productService.getOneProduct(productId);
        category.getProducts().add(product);
        categoryService.updateCategory(category);
        return "redirect:/categories/" + id;
    }
}
