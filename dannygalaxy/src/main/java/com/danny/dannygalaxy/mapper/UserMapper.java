package com.danny.dannygalaxy.mapper;

import java.util.List;

import com.danny.dannygalaxy.domain.UserVO;

public interface UserMapper {
	
	//회원 전체 목록 조회
	List<UserVO> selectUserList();
	
	//회원 가입
	int insertUser(UserVO userVO);
	
	//회원 탈퇴
	int deleteUser(UserVO userVO);
	
	//로그인
	UserVO selectLoginUserInfo(UserVO UserVO);
	
	//아이디 중복체크 
	String checkUserIdExist(long user_idx);
}
