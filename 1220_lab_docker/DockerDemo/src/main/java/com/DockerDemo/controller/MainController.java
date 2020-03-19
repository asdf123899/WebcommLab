package com.DockerDemo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {
	@RequestMapping("/hello")
	public String main () {
		System.out.println("Test!");
		return "Hello Docker!! I am v2";
	}
}
