package com.danny.dannygalaxy.service;

import java.util.List;

import com.danny.dannygalaxy.domain.RocketDTO;
import com.danny.dannygalaxy.domain.RocketVO;

public interface RocketService {
	
	
	//로켓 리스트 보여주기
	public List<RocketVO> getRocketList(RocketDTO rocketDTO);
	
	//추진력 높은 순 
	public List<RocketVO> getRocketListWithHighSpeed(RocketDTO rocketDTO);
	
	//가격 높은 순 
	public List<RocketVO> getRocketListWithHighPrice(RocketDTO rocketDTOe);
	
	//가격 낮은 순 
	public List<RocketVO> getRocketListWithLowPrice(RocketDTO rocketDTO);

}