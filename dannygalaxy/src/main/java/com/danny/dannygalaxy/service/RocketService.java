package com.danny.dannygalaxy.service;

import java.util.List;

import com.danny.dannygalaxy.domain.RocketVO;

public interface RocketService {
	
	
	//로켓 리스트 보여주기
	public List<RocketVO> getRocketList(int page);
	
	
}
