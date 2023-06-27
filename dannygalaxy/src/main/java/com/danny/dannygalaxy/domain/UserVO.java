package com.danny.dannygalaxy.domain;


import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
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
	
}
