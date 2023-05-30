package com.danny.dannygalaxy.service;

import java.util.List;

import com.danny.dannygalaxy.common.BoardPagingDTO;
import com.danny.dannygalaxy.domain.BoardsVO;

public interface BoardsService {
	
	//전체 게시글 조회
	List<BoardsVO> getBoardList(BoardPagingDTO boardPagingDTO);
	//게시글 총 개수 
	public long getRowAmountTotal(BoardPagingDTO boardPagingDTO);
	//특정 게시글 보기 : 조회수 + 1
	BoardsVO getBoard(long bno);
	//수정 페이지
	BoardsVO getBoardDetailModify(long bno);
	//특정 게시글 수정
	boolean modifyBoard(BoardsVO board);
	//특정 게시글 삭제 요청 (bdelFlag = 1)
	boolean setBoardDeleted(long bno);
	//특정 게시글 삭제 - 실제 삭제
	boolean removeBoard(long bno);
	//게시글 등록 (selectkey 이용) 
	long registerBoard(BoardsVO board);
	
	
	
}
