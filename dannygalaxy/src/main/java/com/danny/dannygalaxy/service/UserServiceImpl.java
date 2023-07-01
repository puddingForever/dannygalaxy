package com.danny.dannygalaxy.service;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.danny.dannygalaxy.domain.UserVO;
import com.danny.dannygalaxy.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	private UserMapper userMapper;
	
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserVO loginUserBean;
	
	
	//중복체크 
	@Override
	public String checkUserIdExist(String userId) {
		return userMapper.checkUserIdExist(userId);	
	}

	//회원가입
	@Override
	public int registerUser(UserVO userVO) {
		return userMapper.insertUser(userVO);
	}


	//로그인 처리
	@Override
	public void loginUser(UserVO tempLoginUserBean) {
		
		UserVO tempLoginUserBean2 =userMapper.selectLoginUser(tempLoginUserBean);
		
		if(tempLoginUserBean2 != null) {
			loginUserBean.setUserIdx(tempLoginUserBean2.getUserIdx());
			loginUserBean.setUserName(tempLoginUserBean2.getUserName());
			loginUserBean.setUserLogin(true);
		}
	
	}
	 
	

}
