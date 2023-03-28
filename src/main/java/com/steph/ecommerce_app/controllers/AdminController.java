package com.steph.ecommerce_app.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.steph.ecommerce_app.models.User;
import com.steph.ecommerce_app.services.UserService;

@Controller
public class AdminController {
    @Autowired UserService userService;

    // SHOW - Page
    // * display admin dash board 
    @GetMapping("/admin/dashboard")
    public String adminDash(
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

        // show dash
        return "/admin/dashboard.jsp";
    }
    
}
