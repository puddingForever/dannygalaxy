package com.danny.dannygalaxy.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.danny.dannygalaxy.response.RoverApiResponse;
import com.fasterxml.jackson.core.json.ReaderBasedJsonParser;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

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
	public  HashMap<String, Object> getAsteroids() {
		//전달용 map 
		HashMap<String,Object> resultMap = new HashMap<>();
		//소행성 name저장 
		ArrayList<String> name = new ArrayList<>();
		//소행성 위험성
		ArrayList<String> hazardous = new ArrayList<>();
		//최고 근접 킬로미터 
		ArrayList<String> kilometers = new ArrayList<>();
		//날짜 map
		HashMap<String,String> putDate = getDates();
		String startDate = putDate.get("startDate");
		String endDate = putDate.get("endDate");		
		
		String urlStr = "https://api.nasa.gov/neo/rest/v1/feed?start_date="+startDate+"&end_date="+endDate+"&api_key="+apiKey;
		
		//json 데이터 가져오기 
		HttpURLConnection conn = null;
		
		try {
			//json -> string
			URL url = new URL(urlStr);
			conn = (HttpURLConnection) url.openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			while((line=br.readLine())!=null) {
				sb.append(line);
			}
			
			//Map으로 맵핑 
			Gson gson = new Gson();
			@SuppressWarnings("unchecked")
			Map<String,Object> myMap = gson.fromJson(sb.toString(), Map.class);
			String day = null;
			
		    for(String myKey : myMap.keySet()) {
		    	if(myKey.equals("element_count")){ //총 소행성 접근 갯수
		    		
		    		resultMap.put("element_count", myMap.get(myKey));
		    		
		    	}else if(myKey.equals("near_earth_objects")) { //소행성 정보 
		    		
		    		Map<String,Object> nearObjs = (Map<String,Object>)myMap.get(myKey); // 날짜별로 나눔 
		    		
		    		ArrayList<Object> startDateInfo = (ArrayList<Object>) nearObjs.get(startDate); // 어제날짜 
		    		
		    		for(Object obj : startDateInfo ) {
		    				Map<String, Object> astDetail= (Map<String, Object>) obj;
		    				if(astDetail.containsKey("name")) {
		    					name.add((String)astDetail.get("name"));	
		    					if(astDetail.containsKey("is_potentially_hazardous_asteroid")) {
			    					hazardous.add(String.valueOf(astDetail.get("is_potentially_hazardous_asteroid")));
			    						if(astDetail.containsKey("close_approach_data")) {
				    					  ArrayList<Object> closeData =  (ArrayList<Object>) astDetail.get("close_approach_data");
				    					  	System.out.println("closeData : " + closeData);
				    					  for(Object target : closeData) {
				    						 Map<String,Object> mapTarget = (Map<String, Object>) target;
				    						 Map<String,String> finalTarget = (Map<String, String>) mapTarget.get("miss_distance");
				    						 String result = finalTarget.get("kilometers");
				    						 kilometers.add(result);
				    					  }
				    					    

				    				}//end-if(close-approach-data)
		    					}//end-if(is-potentially-hazardous)
		    				}//end-if(name)
		    		}//end-for		    					
		      } //end-elseIf	
		    }//end-for   
		    
		    resultMap.put("name", name);
		    resultMap.put("hazardous", hazardous);
		    resultMap.put("kilo", kilometers);
		    
		   // return resultMap;
		    return resultMap;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
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
