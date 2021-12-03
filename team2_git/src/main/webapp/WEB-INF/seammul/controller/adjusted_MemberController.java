package com.itwillbs.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.user_MemberDTO;
import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;
import com.itwillbs.service.MemberServiceImpl;

@Controller
public class MemberController {
	
	//객체생성관계 (의존관계)  => MemberController에서 MemberServiceImpl 필요로한다(의존한다)
//	MemberService memberService=new MemberServiceImpl();
	
	// 스프링 객체생성 방법 => 의존관계 주입 (DI Dependency Injection)
	// 멤버변수 정의  <= 외부에 있는 xml에서 MemberServiceImpl 객체생성한것을 전달해오면 받음
	// 받아오는 방법  1. 생성자  2. set메서드
	
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
	public String insert() {
//		/WEB-INF/views/member/insertForm.jsp  => 이동
		
		return "member/insertForm";
	}

	@RequestMapping(value = "/member/insertPro", method = RequestMethod.POST)
	public String insertPro(MemberDTO memberDTO) {
		
//		http://localhost:8181/myweb/member/insertPro?id=dd&pass=d&name=d
		//회원가입 처리
		System.out.println(" MemberController  insertPro ");
		
		//한글처리  => web.xml 한글처리
//		request.setCharacterEncoding("utf-8");
		
		//request 사용 => MemberDTO 에 저장
//		MemberDTO memberDTO=new MemberDTO();
//		memberDTO.setId(request.getParameter("id"));
//		memberDTO.setPass(request.getParameter("pass"));
//		memberDTO.setName(request.getParameter("name"));
		// 폼태그 이름 과  MemberDTO 멤버변수 이름 => 일치
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPass());
		System.out.println(memberDTO.getName());
		
		// 패키지 com.itwillbs.service  파일 MemberServiceImpl   @Service
		//                            리턴값없음 insertMember(MemberDTO memberDTO) 메서드 정의
		// 패키지 com.itwillbs.dao      파일 MemberDAOImpl  @Repository
		//                            리턴값없음 insertMember(MemberDTO memberDTO) 메서드 정의
		
		// MemberController => MemberServiceImpl => MemberDAOImpl
		// 1. 객체생성
		// MemberServiceImpl 객체생성
//		MemberServiceImpl memberService=new MemberServiceImpl();
		// insertMember(memberDTO) 메서드 호출
//		memberService.insertMember(memberDTO);
		
		// 2. 객체생성  수정최소화 방법 =>  부모인터페이스 틀  => 부모 = 자식 객체생성 
		//  부모인터페이스 틀  패키지 com.itwillbs.service 인터페이스 파일 MemberService 추상메서드 정의 
		//              MemberServiceImpl 부모인터페이스 상속 MemberService  메서드 오버라이딩 
		// 부모인터페이스 MemberService = MemberServiceImpl 객체생성
//		MemberService memberService=new MemberServiceImpl();
//		// insertMember(memberDTO) 메서드 호출
//		memberService.insertMember(memberDTO);
		
		
		// 3. 객체생성
		// 스프링 객체생성 방법 => 의존관계 주입 (DI Dependency Injection)
		// 멤버변수 정의  <= 외부에 있는 xml에서 MemberServiceImpl 객체생성한것을 전달해오면 받음
		// 받아오는 방법  1. 생성자  2. set메서드
		memberService.insertMember(memberDTO);
		
		return "redirect:/member/login";
	}
	
	@RequestMapping(value = "/member/user_login", method = RequestMethod.GET)
	public String user_login() {
//		/WEB-INF/views/member/loginForm.jsp  => 이동
		
		return "member/user_login";
	}
	
	@RequestMapping(value = "/member/user_loginPro", method = RequestMethod.POST)
	public String user_loginPro(user_MemberDTO user_memberDTO,HttpSession session) {
//		http://localhost:8181/myweb/member/loginPro?id=dd&pass=d
		//로그인 처리
		System.out.println(" MemberController  user_loginPro ");
		System.out.println(user_memberDTO.getU_id());
		System.out.println(user_memberDTO.getU_pass());
		
		// 아이디 비밀번호 => 일치여부 확인 => 디비작업 메서드 호출  
		//  리턴할형 MemberDTO   userCheck(memberDTO)메서드
		user_MemberDTO user_memberDTO2=user_memberService.userCheck(user_memberDTO);
		
		if(user_memberDTO2!=null) {
			// 아이디 비밀번호 일치
			// 세션값 생성 
			session.setAttribute("u_id", user_memberDTO.getU_id());
			return "redirect:/member/main";
			
		}else {
			// 아이디 비밀번호 틀림
//			/WEB-INF/views/member/msg.jsp  => 이동
			return "member/msg";
		}
		
	}
	
	@RequestMapping(value = "/member/main", method = RequestMethod.GET)
	public String main() {
//		/WEB-INF/views/member/main.jsp  => 이동
		return "member/main";
	}
	
	@RequestMapping(value = "/member/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		//로그아웃 처리
		session.invalidate();
		
		return "redirect:/member/start_login";
	}
	
	
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String info(HttpSession session,Model model) {
		//세션값 가져오기
		String id=(String)session.getAttribute("id");
		// 디비에 데이터 가져오기
		// 리턴할형 MemberDTO getMember(String id)
		user_MemberDTO user_memberDTO=user_memberService.getMember(id);
		// memberDTO 담아서 이동
		model.addAttribute("user_memberDTO", user_memberDTO);
		
//		/WEB-INF/views/member/info.jsp  => 이동
		return "member/info";
	}
	
	@RequestMapping(value = "/member/user_update", method = RequestMethod.GET)
	public String update(HttpSession session,Model model) {
		// 디비에 데이터 가져오기
		//세션값 가져오기
		String u_id=(String)session.getAttribute("u_id");
		// 디비에 데이터 가져오기
		// 리턴할형 MemberDTO getMember(String id)
		user_MemberDTO user_memberDTO=user_memberService.getMember(u_id);
		// memberDTO 담아서 이동
		model.addAttribute("user_memberDTO", user_memberDTO);
		
//		/WEB-INF/views/member/updateForm.jsp  => 이동
		return "member/user_updateForm";
	}
	
	@RequestMapping(value = "/member/user_updatePro", method = RequestMethod.POST)
	public String user_updatePro(user_MemberDTO user_memberDTO) {
//		http://localhost:8181/myweb/member/updatePro?id=dd&pass=d
		//수정작업
		System.out.println(" MemberController  user_updatePro ");
		
		// 아이디 비밀번호 => 일치여부 확인 => 디비작업 메서드 호출  
		//  리턴할형 MemberDTO   userCheck(memberDTO)메서드
		user_MemberDTO user_memberDTO2=user_memberService.userCheck(user_memberDTO);
				
		if(user_memberDTO2!=null) {
			// 아이디 비밀번호 일치
			// 수정작업
			memberService.user_updateMember(user_memberDTO);
			return "redirect:/member/main";
					
		}else {
			// 아이디 비밀번호 틀림
//			/WEB-INF/views/member/msg.jsp  => 이동
			return "member/msg";
		}
		
	}
	
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String delete() {
				
//		/WEB-INF/views/member/deleteForm.jsp  => 이동
		
		return "member/deleteForm";
	}
	
	@RequestMapping(value = "/member/deletePro", method = RequestMethod.POST)
	public String deletePro(MemberDTO memberDTO, HttpSession session) {
//		http://localhost:8181/myweb/member/deletePro?id=dd&pass=d
		//삭제작업
		System.out.println(" MemberController  deletePro ");
		// 아이디 비밀번호 => 일치여부 확인 => 디비작업 메서드 호출  
		//  리턴할형 MemberDTO   userCheck(memberDTO)메서드
		MemberDTO memberDTO2=memberService.userCheck(memberDTO);
				
		if(memberDTO2!=null) {
			// 아이디 비밀번호 일치
			// 삭제작업
			memberService.deleteMember(memberDTO);
			// 세션값 초기화
			session.invalidate();
			return "redirect:/member/main";
					
		}else {
			// 아이디 비밀번호 틀림
//			/WEB-INF/views/member/msg.jsp  => 이동
			return "member/msg";
		}
		
	}
	
	@RequestMapping(value = "/member/list", method = RequestMethod.GET)
	public String list(Model model) {
		// 디비에 데이터 가져오기
		List<MemberDTO> memberList=memberService.getMemberList();
		
		// 데이터 담기
		model.addAttribute("memberList",memberList);
		
//		/WEB-INF/views/member/list.jsp  => 이동
		
		return "member/list";
	}
	
}
