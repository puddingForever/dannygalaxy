package com.danny.dannygalaxy.mapper;

import java.util.List;

import com.danny.dannygalaxy.domain.BoardsVO;

public interface BoardMapper {
	
	//전체 게시글 조회
	List<BoardsVO> selectBoardList();

	//게시글 등록 
	long insertBoardsSelectKey(BoardsVO board);
	
	//특정 게시글 조회 
	BoardsVO selectBoards(long bno);
	
	//특정 게시글 수정
	long updateBoards(BoardsVO board);
	
	//특정 게시글 삭제 요청 - 해당 글의 bdelFlag를 1로 수정
	long updateBdelFlag(long bno);
	
	//특정 게시글 삭제 - 실제 삭제 
	long deleteBoards(long bno);
	
	//특정 게시글 조회수 증가 
	void updateBviewsCnt(long bno);
	
	

}
