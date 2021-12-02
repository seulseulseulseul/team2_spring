package com.itwill.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.MemberDTO;
import com.itwill.service.MemberService;
import com.mysql.jdbc.interceptors.SessionAssociationInterceptor;

@Controller
public class MemberController {
	
	//객체생성관계(의존관계) => MemberController에서 MemberServiceImpl 필요로 한다(의존한다)
//	MemberService memberService=new MemberServiceImpl();
	
	//스프링 객체생성 방법 => 의존관계 주입(DI Dependency Injection)
	//멤버변수 정의 <= 외부에 있는 xml에서 MemberServiceImpl 객체생성한 것을 전달해오면 받음
	//받아오는 방법 1. 생성자  2. set 메서드
	@Inject
	private MemberService memberService;
	
	//생성자 <= MemberServiceImpl 받는 생성자
//	@Inject
//	public MemberController(MemberService memberService) {
//		this.memberService=memberService;
//	}
	
	//set메서드
//	@Inject
//	public void setMemberService(MemberService memberService) {
//		this.memberService = memberService;
//	}
	@RequestMapping(value = "/member/insert", method = RequestMethod.GET)
	public String insert(){
		return "member/insertForm";
	}
	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro");
		
		//한글처리
//		request.setCharacterEncoding("utf-8");
		//request 사용 => MemberDTO에 저장
//		MemberDTO memberDTO = new MemberDTO();
//		memberDTO.setId(request.getParameter("id"));
		
		//폼태그 이름과 MemberDTO 멤버변수 이름 => 일치
		//한글처리=> web.xml
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());
		
		//패키지 com.itwillbs.service 파일 MemberServiceImpl 
		//							리턴값 없음 insertMember(MemberDTO memberDTO) 메서드 정의
		//패키지 com.itwillbs.dao 		파일 MemberDAOImpl
		//							리턴값 없음 insertMember(MemberDTO memberDTO) 메서드 정의
		//MemberController => MemberServiceImpl => MemberDAOImpl
		//MemberServiceImpl 객체 생성
//		MemberServiceImpl memberService = new MemberServiceImpl();
		//insertMember(memberDTO) 메서드 호출
//		memberService.insertMember(memberDTO);
		
		//2. 객체생성 수정최소화 방법 => 부모인터페이스 틀 => 부모 = 자식 객체생성
		// 부모인터페이스 틀 패키지 com.itwillbs.service 인터페이스 파일 MemberService
		//					MemberServiceImpl 부모인터페이스 상속 MemberService 메서드 오버라이딩
		// 부모인터페이스 = MemberService = MemberServiceImpl 객체 생성
//		MemberServiceImpl memberService = new MemberServiceImpl();
		//insertMember(memberDTO) 메서드 호출
//		memberService.insertMember(memberDTO);
		
		//3. 객체생성
		//스프링 객체생성 방법 => 의존관계 주입(DI Dependency Injection)
		//멤버변수 정의 <= 외부에 있는 xml에서 MemberServiceImpl 객체생성한 것을 전달해오면 받음
		//받아오는 방법 1. 생성자  2. set 메서드
		memberService.insertMember(memberDTO);
		return "redirect:/member/login";
	}
	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login() {
		// /WEB-INF/views/member/loginForm.jsp => 이동
		return "member/loginForm";
	}
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(MemberDTO memberDTO,HttpSession session) {
		//로그인 처리
		System.out.println("MemberController loginPro");
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		
		//아이디 비밀번호 => 일치여부 확인 => 디비작업 메서드 호출
		//리턴할형 MemberDTO  userCheck(memberDTO) 메서드
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		//아이디 비밀번호 일치
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			//세션값 생성
			session.setAttribute("id", memberDTO.getId());
			return "redirect:/member/main";
		}else {
			//아이디 비밀번호 틀림
//			/WEB-INF/views/member/msg.jsp => 이동
			return "member/msg";
		}
	}
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
		// /WEB-INF/views/member/main.jsp => 이동
		return "member/main";
	}
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String update(HttpSession session,Model model) {
		//세션값 가져오기
		String id = (String)session.getAttribute("id");
		//디비에 데이터 가져오기
		//리턴할형 MemberDTO getMember(String id)
		MemberDTO memberDTO = memberService.getMember(id);
		//memberDTO 담아서 이동
		model.addAttribute("memberDTO", memberDTO);
		return "member/updateForm";
	}
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String updatePro(MemberDTO memberDTO) {
		//아이디 비밀번호 => 일치여부 확인 => 디비작업 메서드 호출
		//리턴할형 MemberDTO  userCheck(memberDTO) 메서드
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		//아이디 비밀번호 일치
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			//수정작업
			memberService.updateMember(memberDTO);
			return "redirect:/member/main";
		}else {
			//아이디 비밀번호 틀림
//			/WEB-INF/views/member/msg.jsp => 이동
			return "member/msg";
		}
	}
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info(HttpSession session,Model model) {
		//세션값 가져오기
		String id = (String)session.getAttribute("id");
		//디비에 데이터 가져오기
		//리턴할형 MemberDTO getMember(String id)
		MemberDTO memberDTO = memberService.getMember(id);
		//memberDTO 담아서 이동
		model.addAttribute("memberDTO", memberDTO);
		
		return "member/info";
	}
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete() {

		return "member/deleteForm";
	}
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO memberDTO, HttpSession session) {
		//삭제작업
		System.out.println("MemberController deletePro");
		//리턴할형 MemberDTO  userCheck(memberDTO) 메서드
		MemberDTO memberDTO2 = memberService.userCheck(memberDTO);
		//아이디 비밀번호 일치
		if(memberDTO2!=null) {
			//아이디 비밀번호 일치
			//수정작업
			memberService.deleteMember(memberDTO);
			session.invalidate();
			return "redirect:/member/main";
		}else {
			//아이디 비밀번호 틀림
//			/WEB-INF/views/member/msg.jsp => 이동
			return "member/msg";
		}
	}
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list(Model model) {
		//디비에 데이터 가져오기
		List<MemberDTO> memberList = memberService.getMemberList();
		
		//데이터 담기
		model.addAttribute("memberList", memberList);
		
		return "member/list";
	}
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		//로그아웃 처리
		session.invalidate();
		
		return "redirect:/member/main";
	}
}
