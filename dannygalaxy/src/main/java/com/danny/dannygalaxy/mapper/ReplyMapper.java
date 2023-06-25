package com.danny.dannygalaxy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.danny.dannygalaxy.domain.MyReplyVO;

public interface ReplyMapper {

	
	//특정 게시물에 대한 댓글 목록 조회 
	List<MyReplyVO> selectMyReplyList(long bno);
	
	
	//특정 게시물에 대한 댓글 등록
	int insertMyReplyForBoard(MyReplyVO myreply);
	
	//댓글에 대한 답글 등록
	int insertMyReplyForReply(MyReplyVO myreply);
	
	//특정 게시물에 대한 특정 댓글/답글 조회 
	MyReplyVO selectMyReply(@Param("bno")long bno,@Param("rno")long rno);
	
	//특정 게시물에 대한 댓글/답글 수정
	int updateMyReply(MyReplyVO myreply);
	
	//특정 게시물에 대한 댓글/답글 삭제 
	int deleteMyReply(@Param("bno")long bno,@Param("rno")long rno);
	
	//특정 게시물에 대한 특정 댓글/답글 삭제 요청
	int updateBdelFlagMyReply(@Param("bno") long bno, @Param("rno") long rno) ;
		
		
	//특정 게시물에 대한 모든 댓글 삭제
	int deleteAllReply(long bno);
	
	//특정 게시물에 대한 모든 댓글/답글 삭제요청
	int updateBdelFlagAllReply(long bno);
	
	
}
