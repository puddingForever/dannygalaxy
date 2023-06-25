package com.danny.dannygalaxy.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyReplyPagingDTO {
	
	private long bno;
	private Integer pageNum;
	private int rowAmountPerPage;
	
	public MyReplyPagingDTO(long bno,Integer pageNum) {
		this.bno = bno;
		
		if(pageNum == null) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
		
		this.rowAmountPerPage = 5;
	}

}
