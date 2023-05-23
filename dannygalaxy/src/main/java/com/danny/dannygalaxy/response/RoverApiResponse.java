package com.danny.dannygalaxy.response;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RoverApiResponse {

	ArrayList<MarsPhotos> photos = new ArrayList<>();
	
}
