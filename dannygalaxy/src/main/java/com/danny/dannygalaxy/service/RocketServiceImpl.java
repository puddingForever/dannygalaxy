package com.danny.dannygalaxy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.danny.dannygalaxy.domain.RocketDTO;
import com.danny.dannygalaxy.domain.RocketVO;
import com.danny.dannygalaxy.mapper.RocketMapper;

@Service
public class RocketServiceImpl implements RocketService{

	private RocketMapper rocketMapper;
	
	public RocketServiceImpl(RocketMapper rocketMapper) {
		this.rocketMapper = rocketMapper;
	}

	
	
	//로켓 리스트 보여주기 
	@Override
	public List<RocketVO> getRocketList(RocketDTO rocketDTO) {
		return rocketMapper.selectRocketlist(rocketDTO);
	}


	//추진력 높은 순 
	@Override
	public List<RocketVO> getRocketListWithHighSpeed(RocketDTO rocketDTO) {
		return rocketMapper.selectRocketlist(rocketDTO);
	}

	//가격 높은 순 
	@Override
	public List<RocketVO> getRocketListWithHighPrice(RocketDTO rocketDTO) {
		return rocketMapper.selectRocketlist(rocketDTO);
	}


	//가격 낮은 순 
	@Override
	public List<RocketVO> getRocketListWithLowPrice(RocketDTO rocketDTO) {
		return rocketMapper.selectRocketlist(rocketDTO);
	}
	
	

}
