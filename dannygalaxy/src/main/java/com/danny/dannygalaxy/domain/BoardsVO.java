package com.danny.dannygalaxy.domain;


import java.sql.Timestamp;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardsVO {
	
	private Long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private Date bregDate;
	private Timestamp bmodDate;
	private int bviewsCnt;
	private int breplyCnt;
	private String boardFile;
	
	private MultipartFile upload_file;
	
	
	
	
}
