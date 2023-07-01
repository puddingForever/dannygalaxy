package com.danny.dannygalaxy.mapper;

import java.util.List;

import com.danny.dannygalaxy.domain.UserVO;

public interface UserMapper {
	
	//회원 가입
	int insertUser(UserVO userVO);
	
	
	//아이디 중복체크 
	String checkUserIdExist(String userId);
	
	//로그인 사용자 정보 가져오기
	UserVO selectLoginUser(UserVO tempLoginUserBean);
}
