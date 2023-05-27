package com.danny.dannygalaxy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.danny.dannygalaxy.domain.BoardsVO;
import com.danny.dannygalaxy.service.BoardsService;

@Controller
@RequestMapping("/boards")
public class BoardController {

	
	private BoardsService boardsService;
	
	public BoardController(BoardsService boardsService){
		this.boardsService = boardsService;
	}	
	
	//게시글 목록 조회 
	@GetMapping("/list")
	public void getBoardList(Model model) {
		model.addAttribute("boardList",boardsService.getBoardList());
	}
	
	//등록 페이지 
	@GetMapping("/register")
	public void getRegister() {
	}
	
	//등록 처리
	@PostMapping("/register")
	public String registerBoard(BoardsVO boards) {
		boardsService.registerBoard(boards);
		return "redirect:/boards/list";
	}
	
	//특정 게시글 조회 
	@GetMapping("/detail")
	public void getDetail(Long bno,Model model) {
		model.addAttribute("board", boardsService.getBoard(bno));
	}
	
	//조회 --> 수정페이지 호출
	@GetMapping("/modify")
	public void getModify(Long bno,Model model) {
		model.addAttribute("board", boardsService.getBoardDetailModify(bno));
	}
	
	//수정 처리 
	@PostMapping("/modify")
	public String modifyBoard(BoardsVO boards,
			RedirectAttributes redirectAttributes) {
		
		if(boardsService.modifyBoard(boards)) {
			redirectAttributes.addFlashAttribute("result", "수정이 완료되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("result", "수정이 실패하였습니다.");
		}
		redirectAttributes.addAttribute("bno",boards.getBno()); //get방식으로 전달
		return "redirect:/boards/detailmod";
	}
	
	//수정 후 -> 조회페이지 
	@GetMapping("/detailmod")
	public String showBoardDetailModify(Long bno,Model model) {
		model.addAttribute("board", boardsService.getBoardDetailModify(bno));
		return "/boards/detail";
	}
	
	//게시글 삭제 요청
	@PostMapping("/delete")
	public String deleteBoard(Long bno,RedirectAttributes redirectAttributes) {
		
		if(boardsService.setBoardDeleted(bno)) {
			redirectAttributes.addFlashAttribute("result", "삭제가 완료되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("result","삭제가 실패하였습니다.");
		}
		return "redirect:/boards/list";
	}
	
	
	//특정 게시글 삭제 
	@PostMapping("/remove")
	public String removeBoard(Long bno,RedirectAttributes redirectAttributes) {
		
		if(boardsService.removeBoard(bno)) {
			redirectAttributes.addFlashAttribute("result", "삭제가 완료되었습니다.");
		}else {
			redirectAttributes.addFlashAttribute("result", "삭제가 실패하였습니다");
		}
		return "redirect:/boards/list";
	}
	
	
}
