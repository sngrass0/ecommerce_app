package com.steph.ecommerce_app.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.steph.ecommerce_app.models.LoginUser;
import com.steph.ecommerce_app.models.User;
import com.steph.ecommerce_app.repositories.UserRepository;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public User register(User newUser, BindingResult result) {
        System.out.println(newUser);
        // Reject values or register if no errors:
        // Reject if email is taken (present in database)
        if (userRegisted(newUser.getEmail())) {
            result.rejectValue("email", "Emial", "email taken");
            return null;
        }

        // Reject if password doesn't match confirmation
        if (!newUser.getPassword().equals(newUser.getConfirm())) {
            result.rejectValue("confirm", "Confirm", "passwords must match");
            return null;
        }

        // Return null if result has errors
        if (result.hasErrors()) {
            return null;
        }
        // Hash and set password, save user to database
        String hashedpw = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashedpw);
        return userRepository.save(newUser);
    }

    public User login(LoginUser newLoginObject, BindingResult result) {
        // Reject values or register if no errors:
        // Reject if email is taken (present in database)
        if (!userRegisted(newLoginObject.getEmail())) {
            result.rejectValue("email", "Emial", "Invalid credentials");
            return null;
        }
        User user = findUserByEmail(newLoginObject.getEmail());
        // reject if BCrypt password fails
        if (!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
            result.rejectValue("password", "Password", "Invalid Credentials");
            return null;
        }
        // Return null if result has errors
        if (result.hasErrors()) {
            return null;
        }
        // otherwise return user object
        return user;
    }

    public User getUser(Long id) {
        Optional<User> optionalbook = userRepository.findById(id);
        User user = optionalbook.orElse(null);
        return user;
    }

    // validating functions
    private boolean userRegisted(String email) {
        Optional<User> user = userRepository.findByEmail(email);
        return user.isPresent();
    }

    private User findUserByEmail(String email) {
        Optional<User> user = userRepository.findByEmail(email);
        return user.orElse(null);
    }
}
