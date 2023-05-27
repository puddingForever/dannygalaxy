package com.danny.dannygalaxy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import com.danny.dannygalaxy.domain.UserVO;
import com.danny.dannygalaxy.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	//로그인용 빈 가져오기 
	@Resource(name = "loginUserBean")
	@Lazy
	private UserVO loginUserBean;

	//전체 사용자 조회 
	@Override
	public List<UserVO> getUserList() {
		return userMapper.selectUserList();
	}

	//회원가입
	@Override
	public boolean registerUser(UserVO userVO) {
		return userMapper.insertUser(userVO)==1;
	}

	//회원탈퇴
	@Override
	public boolean removeUser(UserVO userVO) {
		return userMapper.deleteUser(userVO)==1;
	}

	//로그인 
	@Override
	public boolean getLoginUserInfo(UserVO tempLoginUserBean) {
		
		UserVO tempLoginUserBean2 = userMapper.selectLoginUserInfo(tempLoginUserBean);
		
		if(tempLoginUserBean2 != null) {
			loginUserBean.setUser_idx(tempLoginUserBean2.getUser_idx());
			loginUserBean.setUser_name(tempLoginUserBean2.getUser_name());
			loginUserBean.setUserLogin(true); //로그인 설정 변경 
			return true;
		}
		
		return false;
	}

	//아이디 중복 확인 
	@Override
	public String checkUserIdExist(long user_idx) {
		// TODO Auto-generated method stub
		return null;
	}

}
