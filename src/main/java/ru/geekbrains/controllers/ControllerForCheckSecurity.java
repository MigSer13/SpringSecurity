package ru.geekbrains.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import ru.geekbrains.entities.User;
import ru.geekbrains.services.UserService;

import java.security.Principal;

@RestController
@RequiredArgsConstructor
public class ControllerForCheckSecurity {
    private final UserService userService;

    @GetMapping("/")
    public String homePage(){
        return "home";
    }

    @GetMapping("/auth_page")
    public String authPage(){
        return "authenticated";
    }

    @GetMapping("/admin")
    public String adminPage(){
        return "admin";
    }

    @GetMapping("/user_info")
    public String userPage(Principal principal){
        User user = userService.findByUsername(principal.getName()).orElseThrow(
                ()-> new RuntimeException("User " + principal.getName() + " not found"));
        return "User info: " + user.getUsername() + ", " + user.getEmail();
    }

    @GetMapping("/unsecured")
    public String unsecuredPage() {
        return "unsecured";
    }
}
