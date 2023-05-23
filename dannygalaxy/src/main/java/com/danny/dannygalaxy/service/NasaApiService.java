package com.danny.dannygalaxy.service;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.danny.dannygalaxy.response.RoverApiResponse;

@Service
public class NasaApiService {
	
	
	private String apiKey = "te7D0y8ycuRMsbRupHfZKL4ISLqp1Txm0VzaeNs1";
	
	//rover api 받기 
	public RoverApiResponse getRoverData(int marsSol) {
		int day = marsSol;
		RestTemplate rt = new RestTemplate();
		ResponseEntity<RoverApiResponse> response = rt.getForEntity("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol="+day+"&api_key="+apiKey,RoverApiResponse.class );
		return response.getBody();
		
	}
	

}
