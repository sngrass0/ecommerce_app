package com.steph.ecommerce_app.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.steph.ecommerce_app.models.LoginUser;
import com.steph.ecommerce_app.models.User;
import com.steph.ecommerce_app.services.UserService;

@Controller
public class MainController {
    @Autowired
    UserService userService;

    @GetMapping("/")
    public String index(Model model, HttpSession session) {
        if (session.getAttribute("userId") != null) {
            return "redirect:/home";
        }
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    // Register
    @PostMapping("/register")
    public String register(
            @Valid @ModelAttribute("newUser") User newUser,
            BindingResult result,
            Model model,
            HttpSession session) {
        // TO-DO Later -- call a register method in the service
        // to do some extra validations and create a new user!
        System.out.println(newUser);
        User user = userService.register(newUser, result);

        if (result.hasErrors()) {
            // Be sure to send in the empty LoginUser before
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        // Store user Id and user name into
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());
        return "redirect:/home";
    }

    // Login
    @PostMapping("/login")
    public String login(
        @Valid @ModelAttribute("newLogin") LoginUser newLogin,
        BindingResult result,
        Model model,
        HttpSession session
    ) {
        User user = userService.login(newLogin, result);

        // check for input errors
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }

        // No Errors
        // Login user
        session.setAttribute("userId", user.getId());
        session.setAttribute("userName", user.getUserName());

        return "redirect:/home";
    }

    // Logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
