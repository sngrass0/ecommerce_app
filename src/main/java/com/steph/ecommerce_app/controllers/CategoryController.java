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
import com.steph.ecommerce_app.services.CategoryService;

@Controller
public class CategoryController {
    
    @Autowired CategoryService categoryService;
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
}
