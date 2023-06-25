package com.danny.dannygalaxy.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danny.dannygalaxy.domain.RocketVO;
import com.danny.dannygalaxy.service.RocketService;

@Controller
public class RocketController {
		
	
	private RocketService rocketService;
	
	public RocketController(RocketService rocketService) {
		this.rocketService = rocketService;
	}
	
	//첫화면 로켓상품 리스트 보여주기 
	@GetMapping("shop/rocketList")
	public void showRocketList(ModelMap model,
			@RequestParam(value="page",defaultValue="1")int page) {		
		
		model.put("rocketList" , rocketService.getRocketList(page));
	}

}
