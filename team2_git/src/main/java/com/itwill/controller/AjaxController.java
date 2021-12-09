package com.itwill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.domain.ReviewDTO;
import com.itwill.service.TrainerService;


@RestController
public class AjaxController {
	@Inject
	private TrainerService trainerService;
	
//	@RequestMapping(value="/member/idCheck",method=RequestMethod.GET)
//	public ResponseEntity<String> idCheck(HttpServletRequest request) {
//		// /member/idCheck?id=값
//		String id=request.getParameter("id");
//		MemberDTO memberDTO = memberService.getMember(id);
//		String result="";
//		if(memberDTO==null) {
//			result="idok"; //아이디 없음 아이디 사용가능
//		}else {
//			result="iddup"; //아이디 있음 아이디 중복
//		}
//		
//		ResponseEntity<String> entity=new ResponseEntity<String>(result, HttpStatus.OK);
//		
//		//데이터 담아서 ajax호출한 곳으로 리턴 
//		return entity;
//	}
	
	//회원목록
//	@RequestMapping(value="/trainer/review",method=RequestMethod.GET)
//	public ResponseEntity<List<ReviewDTO>> list(HttpServletRequest request) {
//	
//		List<ReviewDTO> reviewList = trainerService.getReviewList(String t_id);
//		
//		ResponseEntity<List<ReviewDTO>> entity = new ResponseEntity<List<ReviewDTO>>(reviewList, HttpStatus.OK);
//		
//		//memberList => 자동으로 JSON으로 변경하는 프로그램 설치
//		
//		//데이터 담아서 ajax호출한 곳으로 리턴 
//		return entity;
//	}
}
