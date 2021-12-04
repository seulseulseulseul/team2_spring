package com.itwillbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.service.ReplyService;

@RestController
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	// 댓글작성
	@RequestMapping(value = "/reply/insert", method = RequestMethod.POST)
	public ResponseEntity<ReplyDTO> insert(HttpSession session, HttpServletRequest request) {
		// 로그인 여부 확인
		if(session.getAttribute("u_id")==null){
			return "redirect:/remember/login";
		}
		
		// ReplyDTO 객체 생성
		ReplyDTO replyDTO = new ReplyDTO();
		// 세션에서 id, 닉네임 받아오기
		replyDTO.setU_id(session.getAttribute("u_id").toString());
		replyDTO.setNic(session.getAttribute("nic").toString());
		// request에서 게시글 번호 받아오기
		int c_num = Integer.parseInt(request.getParameter("c_num"))
		replyDTO.setC_num(c_num);
		
		// replyDTO 전달하여 댓글 작성
		replyService.insertBoard(replyDTO);
		
		// 댓글 목록 불러오기
		replyService.getBoardList(c_num);
		
		String result="";
		if(replyDTO==null) {
			
		} else {
			
		}
		ResponseEntity<ReplyDTO> entity=new ResponseEntity<ReplyDTO>(result, HttpStatus.OK);
		
		//데이터 담아서 ajax 호출한 곳으로 리턴
		return entity;
	}
	// 댓글 목록
	@RequestMapping(value = "/reply/replyList", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyDTO>> list2(HttpServletRequest request) {
		
		int c_num = request.getParameter("c_num")
		
		List<ReplyDTO> replyList = ReplyService.getBoardList(c_num);
	
		ResponseEntity<List<MemberDTO>> entity=new ResponseEntity<List<MemberDTO>>(memberList, HttpStatus.OK);
		
		// memberList => 자동으로 JSON으로 변경하는 프로그램 설치 => pom.xml jackson-databind
		
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
		replyDTO.setR_num(Integer.parseInt(request.getParameter("r_num")));
		
		// 본인확인
		if(replyService.numCheck(replyDTO)!=null) { // 본인일 경우
			replyService.deleteBoard(replyDTO);
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
		// 글번호 request에서 가져오기
		replyDTO.setC_num(Integer.parseInt(request.getAttribute("c_num").toString()));
		
		// 본인확인
		if(replyService.numCheck(replyDTO)!=null) {
			return "redirect:/remember/login";
		}
		
		// commuDTO 전달
		commuService.getBoard(commuDTO);
		
		model.addAttribute();
		
		return "commu/update";
	}
	
	
	
	
	
	
//	@RequestMapping(value = "/member/list2", method = RequestMethod.GET)
//	public ResponseEntity<List<MemberDTO>> list2(HttpServletRequest request) {
//		
//		List<MemberDTO> memberList=MemberService.getMemberList();
//	
//		ResponseEntity<List<MemberDTO>> entity=new ResponseEntity<List<MemberDTO>>(memberList, HttpStatus.OK);
//		
//		// memberList => 자동으로 JSON으로 변경하는 프로그램 설치 => pom.xml jackson-databind
//		
//		//데이터 담아서 ajax 호출한 곳으로 리턴
//		return entity;
//	}
	
}
