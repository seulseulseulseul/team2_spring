package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.service.CommuService;
import com.itwillbs.service.ReplyService;

@RestController
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	// 댓글작성
	@RequestMapping(value = "/reply/insert", method = RequestMethod.POST)
	public ResponseEntity<List<ReplyDTO>> insert(HttpSession session, HttpServletRequest request) {
		// 로그인 여부 확인
		if(session.getAttribute("u_id")==null){ // 비로그인
			return null;
		}
		
		// ReplyDTO 객체 생성
		ReplyDTO replyDTO = new ReplyDTO();
		// 세션에서 id, 닉네임 받아오기
		replyDTO.setU_id(session.getAttribute("u_id").toString());
		replyDTO.setNic(session.getAttribute("nic").toString());
		// request에서 댓글 정보 가져오기
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		replyDTO.setC_num(c_num);
		replyDTO.setParent(Integer.parseInt(request.getParameter("parent")));
		replyDTO.setDepth(Integer.parseInt(request.getParameter("depth")));
		replyDTO.setContent(request.getParameter("content"));
		
		// replyDTO 전달하여 댓글 작성
		replyService.insertBoard(replyDTO);
		
		// 한화면에 보여줄 댓글개수 10개 설정
		int pageSize=10;
		// 댓글 마지막 페이지번호 불러오기 
		String pageNum= replyService.getLastPage(c_num, pageSize).toString();
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		// 댓글 목록 불러오기
		List<ReplyDTO> replyList=replyService.getBoardList(c_num, pageDTO);
		
		ResponseEntity<List<ReplyDTO>> entity=new ResponseEntity<List<ReplyDTO>>(replyList, HttpStatus.OK);
		
		// replyList => 자동으로 JSON으로 변경하는 프로그램 설치 => pom.xml jackson-databind
		
		//데이터 담아서 ajax 호출한 곳으로 리턴
		return entity;
	}
	// 댓글 목록
	@RequestMapping(value = "/reply/replyList", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDTO>> list2(HttpServletRequest request) {
		// request에서 게시글 번호 받아오기
		int c_num = Integer.parseInt(request.getParameter("c_num"));
		
		// 한화면에 보여줄 댓글개수 10개 설정
		int pageSize=10;
		// 댓글 페이지번호 가져오기 
		String pageNum=request.getParameter("pageNum");
		// 페이지번호가 없으면 -> 1
		if(pageNum==null){
			pageNum="1";
		}
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		
		List<ReplyDTO> replyList = replyService.getBoardList(c_num, pageDTO);
	
		ResponseEntity<List<ReplyDTO>> entity=new ResponseEntity<List<ReplyDTO>>(replyList, HttpStatus.OK);
		
		// replyList => 자동으로 JSON으로 변경하는 프로그램 설치 => pom.xml jackson-databind
		
		//데이터 담아서 ajax 호출한 곳으로 리턴
		return entity;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/reply/delete", method = RequestMethod.GET)
	public String delete(HttpSession session, HttpServletRequest request){
		// CommuDTO 객체 생성
		ReplyDTO replyDTO = new ReplyDTO();
		// 본인확인에 필요한 아이디 session에서 가져오기
		replyDTO.setU_id(session.getAttribute("u_id").toString());
		// 본인확인에 필요한 댓글번호 request에서 가져오기
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		replyDTO.setR_num(r_num);
		
		// 본인확인
		if(replyService.numCheck(replyDTO)!=null) { // 본인일 경우
			replyService.deleteBoard(r_num);
			return "commu/delete";
			
		} else { // 본인이 아닐 경우
			return "redirect:/commu/list";
			
		}
	}
	
	// 댓글 수정
	@RequestMapping(value = "/reply/update", method = RequestMethod.GET)
	public String update(HttpSession session, HttpServletRequest request, Model model){
		// CommuDTO 객체 생성
		ReplyDTO replyDTO = new ReplyDTO();
		// 본인확인에 필요한 정보 session에서 가져오기
		replyDTO.setU_id(session.getAttribute("u_id").toString());
		// 본인확인에 필요한 글번호 request에서 가져오기
		replyDTO.setC_num(Integer.parseInt(request.getAttribute("c_num").toString()));
		
		String result="";
		// 본인확인
		if(replyService.numCheck(replyDTO)!=null) {
			
			return "redirect:/member/login";
		}
		// request에서 댓글 정보 가져오기
		replyDTO.setContent(request.getParameter("content"));
		// replyDTO 전달
		replyService.updateBoard(replyDTO);
		
		// 헤더에서 이전 페이지를 읽는다
		String referer = request.getHeader("Referer");
		// 이전 페이지로 리다이렉트
		return "redirect:"+ referer; 
	}
	
}