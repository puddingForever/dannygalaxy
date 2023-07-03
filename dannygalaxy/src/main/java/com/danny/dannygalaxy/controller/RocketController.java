package com.danny.dannygalaxy.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danny.dannygalaxy.domain.RocketDTO;
import com.danny.dannygalaxy.domain.RocketVO;
import com.danny.dannygalaxy.service.RocketService;

@Controller
@RequestMapping("/shop")
public class RocketController {
		
	
	private RocketService rocketService;
	
	public RocketController(RocketService rocketService) {
		this.rocketService = rocketService;
	}
	
	//첫화면 로켓상품 리스트 보여주기 
	@GetMapping("/rocketList")
	public void showRocketList(ModelMap model,RocketDTO rocketDTO) {		
		
		model.put("rocketList" , rocketService.getRocketList(rocketDTO));
	}
	
	
	//로켓 추진력 높은 순 정렬
	@GetMapping("/rocketSpeed/{highSpeed}")
	@ResponseBody
	public ResponseEntity<List<RocketVO>> showRocketHighSpeed(@PathVariable("highSpeed")int highSpeed){
		
		RocketDTO rocketDTO = new RocketDTO();
		rocketDTO.setHighSpeed(highSpeed);
			
		return new ResponseEntity<List<RocketVO>>(rocketService.getRocketListWithHighSpeed(rocketDTO),HttpStatus.OK);
	}	
	
	
	//가격 높은 순 
	@GetMapping("/rocketOrderHigh/{highPrice}")
	@ResponseBody
	public ResponseEntity<List<RocketVO>> showRocketHighPrice(@PathVariable("highPrice")int highPrice){
		
		RocketDTO rocketDTO = new RocketDTO();
		rocketDTO.setPriceOrder(highPrice);
			
		return new ResponseEntity<List<RocketVO>>(rocketService.getRocketListWithHighPrice(rocketDTO),HttpStatus.OK);
	}
	
	
	//가격 낮은 순 
	@GetMapping("/rocketOrderLow/{lowPrice}")
	@ResponseBody
	public ResponseEntity<List<RocketVO>> showRockeLowPrice(@PathVariable("lowPrice")int lowPrice){
		
		RocketDTO rocketDTO = new RocketDTO();
		rocketDTO.setPriceOrder(lowPrice);
		
		return new ResponseEntity<List<RocketVO>>(rocketService.getRocketListWithLowPrice(rocketDTO),HttpStatus.OK);
	}
}
