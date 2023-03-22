package com.steph.ecommerce_app.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {
    
    @GetMapping("/home")
    public String homepage(
        HttpSession session
    ) {
        if (session.getAttribute("userId") == null) {
            return "redirect:/logout";
        }
        return "shop/index.jsp";
    }
}
