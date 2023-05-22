package com.danny.dannygalaxy.mappertest;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.danny.dannygalaxy.domain.BoardsVO;
import com.danny.dannygalaxy.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
@Log4j
public class MyBoardMapperTest {

	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper; // 정의된 boardMapper 빈이 setter방식으로 등록이 된다.
	
	
//	@Test
//	public void testSelectBoardList() {
//	boardMapper.selectBoardList().forEach(myBoard -> log.info(myBoard));
//	}
	
	//게시글 등록 테스트 
	
//	@Test
//	public void testInsertBoard() {
//		
//		BoardsVO board = new BoardsVO();
//		board.setBtitle("테스트 제목");
//		board.setBcontent("테스트 내용");
//		board.setBwriter("test");
//		
//		boardMapper.insertBoards(board);
//		
//		log.info(board);
//	}
	
//	@Test
//	public void testInsertByBoardSelectKey() {
//		
//		BoardsVO board = new BoardsVO();
//		board.setBtitle("매퍼테스트 -selectkey");
//		board.setBcontent("매퍼테스트 selectkey");
//		board.setBwriter("test");
//		
//		boardMapper.insertBoardsSelectKey(board);
//		log.info(board);
//		
//	}
	
	//게시글 조회 테스트 
	
//	@Test
//	public void testSelectBoard() {
//		log.info(boardMapper.selectBoards(1L));
//	}
	
	//게시글 삭제 테스트
//	@Test
//	public void testUpdateBdelFlag() {
//		boardMapper.updateBdelFlag(10L);
//		log.info(boardMapper.selectBoards(10L));
//	}
	
	//게시글 삭제 테스트 
//	@Test
//	public void testDeleteBoard() {
//		log.info("DELET COUNT : " + boardMapper.deleteBoards(5L));
//		log.info(boardMapper.selectBoards(5L));
//	}
//	
//	@Test
//	public void testDeleteAllBoards() {
//		log.info("DELETE COUNT : " + boardMapper.deleteAllBoardSetDeleted());
//		log.info(boardMapper.selectBoards(10L));
//	}
	
	//게시글 수정 테스트 
//	@Test
//	public void testUpdateBoards() {
//		BoardsVO board = new BoardsVO();
//		board.setBno(1L);
//		board.setBtitle("수정된제목");
//		board.setBcontent("수정된 내용");
//		
//		log.info("UPDATE COUNT : " + boardMapper.updateBoards(board));
//		board = boardMapper.selectBoards(1L);
//		
//		System.out.println("수정된 행 값 : " + board.toString());
//	}
	
	//게시글 조회수 증가 테스트 
	@Test
	public void testeUpdateBviewsCnt() {
		boardMapper.updateBviewsCnt(1L);
		System.out.println("수정된 행 값 : " + boardMapper.selectBoards(1L));
	}
	
}



