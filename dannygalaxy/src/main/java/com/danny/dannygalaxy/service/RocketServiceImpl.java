package com.danny.dannygalaxy.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.danny.dannygalaxy.domain.RocketVO;
import com.danny.dannygalaxy.mapper.RocketMapper;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class RocketServiceImpl implements RocketService{

	private RocketMapper rocketMapper;
	
	public RocketServiceImpl(RocketMapper rocketMapper) {
		this.rocketMapper = rocketMapper;
	}
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	
	//로켓 리스트 보여주기 
	@Override
	public List<RocketVO> getRocketList(int page) {
		
		int start = (page -1) * page_listcnt; //페이지당 글의 갯수 
		RowBounds rowBounds = new RowBounds(start,page_listcnt);
		
		return rocketMapper.selectRocketlist(rowBounds);

		
	}

}
