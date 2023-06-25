package com.danny.dannygalaxy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.danny.dannygalaxy.domain.MyReplyVO;
import com.danny.dannygalaxy.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper replyMapper;
	
	//전체 댓글 목록
	@Override
	public List<MyReplyVO> getMyReplyList(long bno) {
		return replyMapper.selectMyReplyList(bno);
	}

	//게시글에 대한 댓글 등록 
	@Override
	public Long registerMyReplyForBoard(MyReplyVO myreply) {
		System.out.println("입력한 행수: " + replyMapper.insertMyReplyForBoard(myreply));
		return myreply.getRno();
	}
	
	
   //댓글에 대한 답글 등록 
	@Override
	public Long registerMyReplyForReply(MyReplyVO myreply) {
		
		System.out.println("입력된 행수" + replyMapper.insertMyReplyForReply(myreply));		
		return myreply.getRno();
	}
	
	//특정 댓글 조회 
	@Override
	public MyReplyVO getMyReply(long bno, long rno) {
		
		return replyMapper.selectMyReply(bno, rno);
	}

	//특정 댓글 수정
	@Override
	public int modifyMyReply(MyReplyVO myreply) {
	
		return replyMapper.updateMyReply(myreply);
	}

	//댓글 삭제
	@Override
	public int removeMyReply(long bno, long rno) {
	
		return replyMapper.deleteMyReply(bno, rno);
	}
	//특정 게시물에 대한 특정 댓글/답글 삭제 요청 
	@Override
	public int modifyBdelFlagReply(long bno, long rno) {
		
		return replyMapper.updateBdelFlagMyReply(bno, rno);
	}

}
