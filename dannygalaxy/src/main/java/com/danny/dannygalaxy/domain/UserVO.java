package com.danny.dannygalaxy.domain;


import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class UserVO {
	
	private Long userIdx;
	@Size(min=2, max=4)
	@Pattern(regexp = "[가-힣]*")
	private String userName;
	
	@Size(min=4,max=20)
	@Pattern(regexp="[a-zA-Z0-9]*")
	private String userId;
	
	@Size(min=4,max=20)
	@Pattern(regexp="[a-zA-Z0-9]*")
	private String userPw;
	
	//db 조회 X
	@Size(min=4, max=20)
	@Pattern(regexp="[a-zA-Z0-9]*")
	private String userPw2;
	
	//유효성 체크 확인
	private boolean userIdExist;
	
	//로그인 했는지에 대한 변수값 저장
	private boolean userLogin;
	
	public UserVO() {
		this.userIdExist = false;
		this.userLogin = false; //로그인 성공시 true 
	}
	
}
