package com.danny.dannygalaxy.common;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class BoardPagingCreatorDTO {
	
	private BoardPagingDTO boardPagingDTO; // 페이지번호 , 행 개수 저장 객체
	private int startPagingNum; // 화면표시 시작번호
	private int endPagingNum; // 화면표시 끝 페이징번호 
	private boolean prev; //이전 버튼 표시여부 결정변수 
	private boolean next; // 다음버튼 표시여부 결정변수 
	private long rowAmountTotal; // 전체행개수 
	private int pagingNumCnt; // 화면 하단에 표시할 기본 페이지 번호 개수 (10개)
	private int lastPageNum; // 행 총수를 기준으로 한 실제 마지막 페이지 번호 
	
	
	public BoardPagingCreatorDTO(long rowAmountTotal,BoardPagingDTO boardPagingDTO) {
		this.boardPagingDTO = boardPagingDTO;
		this.rowAmountTotal = rowAmountTotal;
		this.pagingNumCnt = 10;
		
		//계산된 끝 , 시작 페이징 번호 
		// 2 / 10 * 10 = 20
		this.endPagingNum =(int)( Math.ceil(boardPagingDTO.getPageNum()/(this.pagingNumCnt*1.0))) * this.pagingNumCnt;
		// 20 - 9 = 11 
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt-1);
	
		//행 총수를 기준으로 한 실제 마지막 페이지 번호 저장 
		this.lastPageNum = (int)(Math.ceil((rowAmountTotal*1.0)/boardPagingDTO.getRowAmountPerPage()));
		
		//계산된 끝 페이징번호가 실제 마지막 페이지 번호보다 크면 , endPagingNum 값을 lastPageNum으로 대체 
		if(lastPageNum < this.endPagingNum) { //여분의 값이 남는 다는 뜻이라서 .. 
			this.endPagingNum = lastPageNum;
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum;
	}
	 
	

}
