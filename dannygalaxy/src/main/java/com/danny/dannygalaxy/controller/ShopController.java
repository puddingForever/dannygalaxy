package com.danny.dannygalaxy.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.danny.dannygalaxy.domain.UserVO;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserVO userVO;
	
	@GetMapping("/reserve")
	public void getReserve() {
	}
	
	@PostMapping("/reserve")
	public String reserve_pro(Model model) {
		
		return "redirect:/";
	}
}
