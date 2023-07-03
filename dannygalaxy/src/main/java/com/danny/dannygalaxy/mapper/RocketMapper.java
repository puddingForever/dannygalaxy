package com.danny.dannygalaxy.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.danny.dannygalaxy.domain.RocketDTO;
import com.danny.dannygalaxy.domain.RocketVO;

public interface RocketMapper {
	
	
	//로켓리스트 가져오기  (sql문 그대로 쓰고 어디서부터 몇개를 쓸수 있음) 
	public List<RocketVO> selectRocketlist(RocketDTO rocketDTO);
	


	
}
