package com.danny.dannygalaxy.service;

import java.util.List;

import com.danny.dannygalaxy.domain.UserVO;

public interface UserService {
	
	//전체 회원 조회 
	List<UserVO> getUserList();
	
	//회원가입
	boolean registerUser(UserVO userVO);
	
	//회원탈퇴 
	boolean removeUser(UserVO userVO);
	
	//로그인: 로그아웃은 서비스에서..
	boolean getLoginUserInfo(UserVO userVO);
	
	//아이디 중복체크
	String checkUserIdExist(long user_idx);

}
