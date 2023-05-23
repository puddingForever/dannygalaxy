package com.danny.dannygalaxy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.danny.dannygalaxy.domain.RoverDTO;
import com.danny.dannygalaxy.response.RoverApiResponse;
import com.danny.dannygalaxy.service.NasaApiService;


@Controller
@RequestMapping("/news")
public class NasaController {

	@Autowired
	private NasaApiService nasaService;
	
	//rover api 
	@GetMapping("/rover")
	public String getRover(RoverDTO roverDTO,Model model) {
		RoverApiResponse roverData = null;
		//null일떄 getter 밑 setter 사용시 NPE에러발생으로 RoverDTO 객체를 따로 씀 
		if(roverDTO == null || roverDTO.getMarsSol() == null || roverDTO.getMarsSol()==0) {
			RoverDTO rover = new RoverDTO();
			rover.setMarsSol(50);
			roverData = nasaService.getRoverData(rover.getMarsSol());
		}else {
			roverData = nasaService.getRoverData(roverDTO.getMarsSol());
		}

		model.addAttribute("roverData", roverData);
		return "nasa/rover";
	}
	
	
	
	
}
