package com.itwill.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.domain.Trainer_MemberDTO;
import com.itwill.service.Trainer_MemberService;

public class Trainer_MemberController {


	//객체생성관계 (의존관계)  => MemberController에서 MemberServiceImpl 필요로한다(의존한다)
//	MemberService memberService=new MemberServiceImpl();
	
	// 스프링 객체생성 방법 => 의존관계 주입 (DI Dependency Injection)
	// 멤버변수 정의  <= 외부에 있는 xml에서 MemberServiceImpl 객체생성한것을 전달해오면 받음
	// 받아오는 방법  1. 생성자  2. set메서드
	
	@Inject
	private Trainer_MemberService trainer_memberService;
	
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
	
	@RequestMapping(value = "/member/trainer_register", method = RequestMethod.GET)
	public String trainer_register() {
//		/WEB-INF/views/member/insertForm.jsp  => 이동
		
		return "member/trainer_register";
	}

	@RequestMapping(value = "/member/trainer_registerPro", method = RequestMethod.POST)
	public String trainer_registerPro(Trainer_MemberDTO trainer_memberDTO) {
		
//		http://localhost:8181/myweb/member/insertPro?id=dd&pass=d&name=d
		//회원가입 처리
		System.out.println(" MemberController  trainer_registerPro ");
		
		//한글처리  => web.xml 한글처리
//		request.setCharacterEncoding("utf-8");
		
		//request 사용 => MemberDTO 에 저장
//		MemberDTO memberDTO=new MemberDTO();
//		memberDTO.setId(request.getParameter("id"));
//		memberDTO.setPass(request.getParameter("pass"));
//		memberDTO.setName(request.getParameter("name"));
		// 폼태그 이름 과  MemberDTO 멤버변수 이름 => 일치
		System.out.println(trainer_memberDTO.getT_id());
		System.out.println(trainer_memberDTO.getT_pass());
		System.out.println(trainer_memberDTO.getT_name());
		System.out.println(trainer_memberDTO.getT_nic());
		System.out.println(trainer_memberDTO.getT_postcode());
		System.out.println(trainer_memberDTO.getT_address());
		System.out.println(trainer_memberDTO.getT_detailAddress());
		System.out.println(trainer_memberDTO.getT_phone());
		System.out.println(trainer_memberDTO.getT_email());
		
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
		trainer_memberService.trainer_register(trainer_memberDTO);
		
		return "redirect:/member/trainer_register";
	}
	
	@RequestMapping(value = "/member/trainer_login", method = RequestMethod.GET)
	public String login() {
//		/WEB-INF/views/member/loginForm.jsp  => 이동
		
		return "member/trainer_login";
	}
	
	@RequestMapping(value = "/member/loginPro", method = RequestMethod.POST)
	public String loginPro(Trainer_MemberDTO trainer_memberDTO,HttpSession session) {
//		http://localhost:8181/myweb/member/loginPro?id=dd&pass=d
		//로그인 처리
		System.out.println(" MemberController  loginPro ");
		System.out.println(trainer_memberDTO.getT_id());
		System.out.println(trainer_memberDTO.getT_pass());
		
		// 아이디 비밀번호 => 일치여부 확인 => 디비작업 메서드 호출  
		//  리턴할형 MemberDTO   userCheck(memberDTO)메서드
		Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
		
		if(trainer_memberDTO2!=null) {
			// 아이디 비밀번호 일치
			// 세션값 생성 
			session.setAttribute("t_id", trainer_memberDTO.getT_id());
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
		
		return "redirect:/member/main";
	}
	
	
	@RequestMapping(value = "/member/info", method = RequestMethod.GET)
	public String trainer_info(HttpSession session,Model model) {
		//세션값 가져오기
		String t_id=(String)session.getAttribute("t_id");
		// 디비에 데이터 가져오기
		// 리턴할형 MemberDTO getMember(String id)
		Trainer_MemberDTO trainer_memberDTO=trainer_memberService.trainer_getMember(t_id);
		// memberDTO 담아서 이동
		model.addAttribute("trainer_memberDTO", trainer_memberDTO);
		
//		/WEB-INF/views/member/info.jsp  => 이동
		return "member/info";
	}
	
	@RequestMapping(value = "/member/update", method = RequestMethod.GET)
	public String trainer_update(HttpSession session,Model model) {
		// 디비에 데이터 가져오기
		//세션값 가져오기
		String t_id=(String)session.getAttribute("t_id");
		// 디비에 데이터 가져오기
		// 리턴할형 MemberDTO getMember(String id)
		Trainer_MemberDTO trainer_memberDTO=trainer_memberService.trainer_getMember(t_id);
		// memberDTO 담아서 이동
		model.addAttribute("trainer_memberDTO", trainer_memberDTO);
		
//		/WEB-INF/views/member/updateForm.jsp  => 이동
		return "member/updateForm";
	}
	
	@RequestMapping(value = "/member/updatePro", method = RequestMethod.POST)
	public String trainer_updatePro(Trainer_MemberDTO trainer_memberDTO) {
//		http://localhost:8181/myweb/member/updatePro?id=dd&pass=d
		//수정작업
		System.out.println(" MemberController  updatePro ");
		
		// 아이디 비밀번호 => 일치여부 확인 => 디비작업 메서드 호출  
		//  리턴할형 MemberDTO   userCheck(memberDTO)메서드
		Trainer_MemberDTO trainer_memberDTO2=trainer_memberService.trainer_userCheck(trainer_memberDTO);
				
		if(trainer_memberDTO2!=null) {
			// 아이디 비밀번호 일치
			// 수정작업
			trainer_memberService.trainer_updateMember(trainer_memberDTO);
			return "redirect:/member/main";
					
		}else {
			// 아이디 비밀번호 틀림
//			/WEB-INF/views/member/msg.jsp  => 이동
			return "member/msg";
		}
		
	}

}
