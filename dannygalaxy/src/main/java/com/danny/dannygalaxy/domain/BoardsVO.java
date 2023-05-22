package com.danny.dannygalaxy.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardsVO {
	
	private long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private int bviewsCnt;
	private int breplyCnt;
	private int bdelFlag;
	private Date bregDate;
	private Timestamp bmodDate;
	
	
	
	
}
