package com.danny.dannygalaxy.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.danny.dannygalaxy.response.AsteroidsResponse;
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
	
	
	//소행성 
	public  AsteroidsResponse getAsteroids() {
				
		HashMap<String,String> putDate = getDates();
		String startDate = putDate.get("startDate");
		String endDate = putDate.get("endDate");
		RestTemplate rt = new RestTemplate();
		ResponseEntity<AsteroidsResponse> response = rt.getForEntity("https://api.nasa.gov/neo/rest/v1/feed?start_date="+startDate+"&end_date="+endDate+"&api_key="+apiKey, AsteroidsResponse.class);
		return response.getBody();
	}
	

	//날짜 
	public HashMap<String,String> getDates(){
		
		HashMap<String, String> dates = new HashMap<>();
				
		Calendar now = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		now.add(Calendar.DATE, -1);
		String startDate = sdf.format(now.getTime());
		dates.put("startDate", startDate);
		
		Date today = new Date();
		SimpleDateFormat sdf_ = new SimpleDateFormat("yyyy-MM-dd");
		String endDate = sdf_.format(today);	
		dates.put("endDate",endDate );
		
		return dates;
		
	}
	

}
