package com.danny.dannygalaxy.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RocketPagingDTO {
	private int pageNum; // 현재 페이지 번호 
	private int rowAmountPerPage; // 페이지당 출력할 레코드 개수 
	
	public RocketPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}
	

}
