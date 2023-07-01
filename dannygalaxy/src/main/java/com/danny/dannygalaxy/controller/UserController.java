package com.danny.dannygalaxy.controller;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.danny.dannygalaxy.domain.UserVO;
import com.danny.dannygalaxy.service.UserService;
import com.danny.dannygalaxy.validator.UserValidator;


@Controller
@RequestMapping("/user")
public class UserController {
	
	private UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@Resource(name="loginUserBean")
	@Lazy
	private UserVO loginUserBean;
	
	//회원가입 페이지 조회 
	@GetMapping("/register")
	public void showRegister(@ModelAttribute("joinUserBean")UserVO userVO) {
	}
	
	//회원가입 등록 
	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("joinUserBean")UserVO userVO,
								BindingResult result) {		
		if(result.hasErrors()) {
			return "user/register";
		}
		
		userService.registerUser(userVO);
		
		return "user/register_success";
	}
	
	
	//로그인 페이지 조회
	@GetMapping("/login")
	public String showLoginPage(@ModelAttribute("tempLoginUserBean")UserVO tempLoginUserBean) {
		return "user/login";
	}
	
	//로그인 처리 
	@PostMapping("/login")
	public String loginUser(@Valid @ModelAttribute("tempLoginUserBean")UserVO tempLoginUserBean,
								BindingResult result) {
		if(result.hasErrors()) {
			return "user/login";
		}
		
		userService.loginUser(tempLoginUserBean);
		
		if(loginUserBean.isUserLogin()==true) {
			return "user/login_success";
		}else {
			return "user/login_fail";
		}
	}
	
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
			UserValidator validator1 = new UserValidator();
			binder.addValidators(validator1);
	}
	
}
