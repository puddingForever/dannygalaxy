package com.danny.dannygalaxy.common;

import java.util.List;

import com.danny.dannygalaxy.domain.MyReplyVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MyReplyPagingCreatorDTO {
	
	private MyReplyPagingDTO myReplyPaging; // pageNum , rowAmountPerPage
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long rowTotal; //총 레코드의 개수 
	private int pagingNumCnt; //페이지당 페이지 번호 갯수 
	private int lastPageNum;
	
	private List<MyReplyVO> replyList;
	
	public MyReplyPagingCreatorDTO(long rowTotal,
									MyReplyPagingDTO myReplyPaging,
									List<MyReplyVO> replyList) {
		
		this.myReplyPaging = myReplyPaging;
		this.rowTotal = rowTotal;
		this.replyList = replyList;
		
		this.pagingNumCnt = 3;
		
		//계산된 끝 페이징 번호  1/3 = 0.3 = > 1 = 10
		this.endPagingNum = (int)Math.ceil((double)myReplyPaging.getPageNum()/this.pagingNumCnt)*this.pagingNumCnt;
		//10 - 9 = 1
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt-1);
		
		
		//총 페이지 수 = 맨 마지막 페이지 번호  100 / 10 = 10
		this.lastPageNum =(int)Math.ceil((this.rowTotal*1.0)/this.myReplyPaging.getRowAmountPerPage());
		
		
		//맨 마지막 페이지 번호를 endPagingNum에 대입
		if(this.lastPageNum < this.endPagingNum) {
			this.endPagingNum = this.lastPageNum;
		}
		
		//이전 버튼 표시 여부 
		this.prev = this.startPagingNum > 1;
		
	    //다음 버튼 표시 여부 
		this.next = this.endPagingNum < this.lastPageNum;
		
		
		
	}
}
