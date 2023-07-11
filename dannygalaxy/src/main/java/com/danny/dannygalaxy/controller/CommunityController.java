package com.danny.dannygalaxy.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.danny.dannygalaxy.domain.AttachFileVO;
import com.danny.dannygalaxy.domain.CommunityVO;
import com.danny.dannygalaxy.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	private CommunityService communityService;
	
	public CommunityController(CommunityService communityService) {
		this.communityService = communityService;
	}
	
	//글작성 메인페이지 
	@GetMapping("/main")
	public void showCommunityPage(@ModelAttribute CommunityVO community) {
	}
	
	//글작성리스트 ajax
	@GetMapping(value="/showCmtList",
				produces="application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<CommunityVO>> showCmtList(){
		  List<CommunityVO> communityList = communityService.getCommunityList();
		  return new ResponseEntity<List<CommunityVO>>(communityList,HttpStatus.OK);
	}
	
	// 글 작성 메소드
	// 글 작성 메소드
	@PostMapping(value="/registerCmt")
	@ResponseBody // 응답 본문에 데이터를 담아서 보낸다
	public ResponseEntity<String> registerCmt(@RequestParam("imageFile") MultipartFile imageFile, // @RequestParam으로 이미지 파일을 받는다
			  @RequestParam("cwriter") String cwriter, // @RequestParam으로 폼 데이터를 받는다
			  @RequestParam("ccontent") String ccontent){ 
		
		System.out.println("컨트롤러????"+cwriter);
		
		
//		MultipartFile imageFile = community.getImageFile(); // 커뮤니티 객체에서 이미지 파일을 가져온다
//		
//		if(imageFile != null) { // 이미지 파일이 있으면
//			
//			String uploadPath = "C:/myupload"; //로컬파일 저장경로 
//			String originalFileName = imageFile.getOriginalFilename();
//			String uuid = UUID.randomUUID().toString();
//			String fileName = uuid + "_" + originalFileName;
//				
//			File sendFileData = new File(uploadPath + fileName);//파일객체 생성 (해당 파일의 경로를 지정)
//			try {
//				imageFile.transferTo(sendFileData); // 파일 전송을 시도한다
//			}  catch (IOException e) {
//				e.printStackTrace();
//				return new ResponseEntity<>("실패",HttpStatus.INTERNAL_SERVER_ERROR); // 파일 전송에 실패하면 500 에러를 반환한다
//			}
//			
//			AttachFileVO attachFile = new AttachFileVO(); // 첨부파일 객체를 생성한다
//			
//			attachFile.setUuid(uuid);
//			attachFile.setUploadPath(uploadPath);
//			attachFile.setFileName(fileName);
//			
//			boolean result = communityService.registerComment(community,attachFile); // 커뮤니티 서비스에 글 작성 요청을 한다
//			
//			if(result) { // 글 작성이 성공하면
//				return new ResponseEntity<>("성공",HttpStatus.OK); // 200 상태 코드와 성공 메시지를 반환한다
//			} else { // 글 작성이 실패하면
//				return new ResponseEntity<>("실패",HttpStatus.BAD_REQUEST); // 400 상태 코드와 실패 메시지를 반환한다
//			}
//			
//		} else { // 이미지 파일이 없으면
//			
//			boolean result = communityService.registerComment(community,null); // 커뮤니티 서비스에 글 작성 요청을 한다
//			
//			if(result) { // 글 작성이 성공하면
//				return new ResponseEntity<>("성공",HttpStatus.OK); // 200 상태 코드와 성공 메시지를 반환한다
//			} else { // 글 작성이 실패하면
//				return new ResponseEntity<>("실패",HttpStatus.BAD_REQUEST); // 400 상태 코드와 실패 메시지를 반환한다
//			}
//			
//		}
		
		return null;

	}


}
