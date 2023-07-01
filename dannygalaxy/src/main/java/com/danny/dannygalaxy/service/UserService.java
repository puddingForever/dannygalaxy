package com.danny.dannygalaxy.service;

import com.danny.dannygalaxy.domain.UserVO;

public interface UserService {

	//아이디 중복체크
	public String checkUserIdExist(String userId); 

	//회원가입
	public int registerUser(UserVO userVO);
	
	//로그인정보 가져오기
	public void loginUser(UserVO tempLoginUserBean);
}
