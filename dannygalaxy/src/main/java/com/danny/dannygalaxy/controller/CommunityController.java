package com.danny.dannygalaxy.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.danny.dannygalaxy.domain.CommunityVO;
import com.danny.dannygalaxy.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private CommunityService communityService;
	
	public CommunityController(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	//글작성 메인페이지 
	@GetMapping("/main")
	public void showCommunityPage() {
	}
	
	//글작성리스트 ajax
	@GetMapping(value="/showCmtList",
				produces="application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<CommunityVO>> showCmtList(){
		  List<CommunityVO> communityList = communityService.getCommunityList();
		  return new ResponseEntity<List<CommunityVO>>(communityList,HttpStatus.OK);
	}
	
	//글작성 
	@PostMapping(value="/registerCmt",
				produces="text/plain; charset=UTF-8",
				consumes="application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<String> registerCmt(@RequestBody CommunityVO community){
		
		System.out.println(community.getCcontent());
		System.out.println(community.getCno());
		
		return communityService.registerComment(community)?new ResponseEntity<>("성공",HttpStatus.OK)
												 : new ResponseEntity<>("실패",HttpStatus.OK);
	}
	

}
