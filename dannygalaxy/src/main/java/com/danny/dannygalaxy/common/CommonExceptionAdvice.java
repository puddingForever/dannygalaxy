package com.danny.dannygalaxy.common;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
public class CommonExceptionAdvice {

	
	//500 에러 
	@ExceptionHandler(Exception.class)
	public String except(Exception ex, Model model) {
		model.addAttribute("myException" , ex) ;
		return "error_page";
	}
	
	//url 에러 
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	public String handle404() {
		return "error_page";
	}
	
}
