package com.danny.dannygalaxy.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardPagingDTO {

	private int pageNum; //현재 페이지 번호 
	private int rowAmountPerPage; //페이지당 출력할 레코드 개수 
	
	
	//생성자를 통해 , 표시할 페이지 번호 , 출력할 레코드개 수르를 컨트롤러로 전달(디폴트)
	public BoardPagingDTO() {
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}
	
	//생성자 2 : 사용자가 선택한 페이지번호 , 페이지당 레코드 10
	public BoardPagingDTO(int pageNum) {
		if(pageNum<=0) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
		this.rowAmountPerPage = 10;
	}
	
	//생성자 3 , 페이지번호 , 페이지당 레코드 둘다 선택가능  
	public BoardPagingDTO(int pageNum, int rowAmountPerPage) {
		if(pageNum<=0) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
		if(rowAmountPerPage<=0) {
			this.rowAmountPerPage = 10;
		}else {
			this.rowAmountPerPage = rowAmountPerPage;
		}
	}
	
	
}
