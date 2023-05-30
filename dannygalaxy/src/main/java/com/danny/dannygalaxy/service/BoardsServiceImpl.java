package com.danny.dannygalaxy.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.danny.dannygalaxy.common.BoardPagingDTO;
import com.danny.dannygalaxy.domain.BoardsVO;
import com.danny.dannygalaxy.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardsServiceImpl implements BoardsService{
	
	private BoardMapper boardMapper;

	//전체 게시글
	@Override
	public List<BoardsVO> getBoardList(BoardPagingDTO boardPagingDTO) {
		return boardMapper.selectBoardList(boardPagingDTO);
	}
	//게시글 총 개수 
	@Override
	public long getRowAmountTotal(BoardPagingDTO boardPagingDTO) {
		return boardMapper.selectRowAmountTotal(boardPagingDTO);
	}

	//게시글 등록
	@Override
	public long registerBoard(BoardsVO board) {
		boardMapper.insertBoardsSelectKey(board);
		return board.getBno();//게시글 등록 후 , 변경된 boardVO값이 들어있음
	}
	//게시글 하나 조회, 조회수 증가 
	@Override
	public BoardsVO getBoard(long bno) {
		boardMapper.updateBviewsCnt(bno);
		return boardMapper.selectBoards(bno);
	}
	
	//수정 페이지 조회 , 조회수 그대로 
	@Override
	public BoardsVO getBoardDetailModify(long bno) {	
		return boardMapper.selectBoards(bno);
	}

	
	//게시글 수정
	@Override
	public boolean modifyBoard(BoardsVO board) {
		return boardMapper.updateBoards(board)==1;
	}

	//bdelFlag 컬럼 1로 수정
	@Override
	public boolean setBoardDeleted(long bno) {
		return boardMapper.updateBdelFlag(bno)==1;
	}
	
	//게시글 실제 삭제 
	@Override
	public boolean removeBoard(long bno) {
		return boardMapper.deleteBoards(bno)==1;
	}


}
