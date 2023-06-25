package com.danny.dannygalaxy.domain;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MyReplyVO {

	private long bno;
	private long rno;
	private String rcontent;
	private String rwriter;
	private Date rregDate;
	private Timestamp rmodDate;
	private long prno;
	private int bdelFlag;
	
	//오라클 계층쿼리의 level값을 저장할 필드 
	private int lvl;
}
