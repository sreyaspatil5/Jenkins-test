package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class JenkinsTestApplication {


	@GetMapping
	public String messageString(){return "Welcome to Jenkins-test";}


	public static void main(String[] args) {
		SpringApplication.run(JenkinsTestApplication.class, args);
	}

}
