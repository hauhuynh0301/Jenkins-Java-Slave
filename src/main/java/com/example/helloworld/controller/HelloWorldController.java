package com.example.helloworld.controller;

import com.example.helloworld.entity.User;
import com.example.helloworld.service.UserService;
import org.springframework.web.bind.annotation.*;


import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@RestController
public class HelloWorldController {

    @Autowired
    private UserService userService;

    @GetMapping("/users")
    public List<User> getAllUsers() {
        return userService.findAll();
    }

    @PostMapping("/users")
    public User createUser(@RequestBody User user) {
        return userService.saveUser(user);
    }
}
