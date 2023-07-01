package com.danny.dannygalaxy.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.danny.dannygalaxy.service.UserService;

@RestController
public class RestApiController {
	
	private UserService userService;
	
	public RestApiController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/user/checkUserIdExist/{userId}")
	public String checkUserIdExist(@PathVariable String userId) {
		String chk = userService.checkUserIdExist(userId);
		
		return chk;
	}
	

}
