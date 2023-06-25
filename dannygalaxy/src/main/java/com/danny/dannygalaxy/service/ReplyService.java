package com.danny.dannygalaxy.service;

import java.util.List;


import com.danny.dannygalaxy.domain.MyReplyVO;

public interface ReplyService {
	

	//특정 게시물에 대한 댓글 목록 조회 
	List<MyReplyVO> getMyReplyList(long bno);
	
	
	//특정 게시물에 대한 댓글 등록
	Long registerMyReplyForBoard(MyReplyVO myreply);
	
	//댓글에 대한 답글 등록
	Long registerMyReplyForReply(MyReplyVO myreply);
	
	//특정 게시물에 대한 특정 댓글/답글 조회 
	MyReplyVO getMyReply(long bno,long rno);
	
	//특정 게시물에 대한 댓글/답글 수정
	int modifyMyReply(MyReplyVO myreply);
	//특정 게시물에 대한 댓글/답글 삭제 
	int removeMyReply(long bno,long rno);
	//특정 게시글에 대한 삭제 요청 
    int modifyBdelFlagReply(long bno, long rno) ;

	
	//특정 게시물에 대한 모든 댓글 삭제
	//int removeAllReply(long bno);
	
	//특정 게시물에 대한 모든 댓글/답글 삭제요청
	//int updateBdelFlagAllReply(long bno);

}
