package com.danny.dannygalaxy.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserVO {
	
	private long user_idx;
	private String user_id;
	private String user_name;
	private String user_password;
	private String user_email;
	private Date user_regDate;
	

}
