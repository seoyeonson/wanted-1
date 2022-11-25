package com.example.dday.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
@RequestMapping("/product/*")
public class ProductController {
    @GetMapping("/category")
    public void category(){}

    @GetMapping("/categoryDetail")
    public void categoryDetail(){}
}