package com.itwill.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.user_MemberDAO;
import com.itwill.domain.ReservationDTO;
import com.itwill.domain.user_MemberDTO;

@Service
public class user_MemberServiceImpl implements user_MemberService {
	//멤버변수
//	MemberDAO memberDAO = new MemberDAOImpl();
	@Inject
	private user_MemberDAO user_memberDAO;
	//set메서드
//	@Inject
//	public void setMemberDAO(MemberDAO memberDAO) {
//		this.memberDAO = memberDAO;
//	}
	
	//리턴값 없음 insertMember(MemberDTO memberDTO) 메서드 정의
	@Override
	public void user_register(user_MemberDTO user_memberDTO) {
		System.out.println("user_MemberServiceImpl user_register()");
		//처리단계에서 날짜생성해서 저장
//		user_memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
		//1. 객체생성
//		MemberDAOImpl memberDAO = new MemberDAOImpl();
//		memberDAO.insertMember(memberDTO);
		
		//2. 객체생성 수정최소화 방법 => 부모인터페이스 틀 => 부모 = 자식 객체생성
		// 부모인터페이스 틀 패키지 com.itwillbs.service 인터페이스 파일 MemberDAO 추상메서드 정의
		//					MemberDAOImpl 부모인터페이스 상속 MemberDAO 메서드 오버라이딩
//		// 부모인터페이스 MemberDAO = 자식클래스 객체생성 MemberDAOImpl
//		MemberDAO memberDAO = new MemberDAOImpl();
//		// 부모인터페이스 변수.insertMember(memberDTO) 메서드 호출
//		memberDAO.insertMember(memberDTO);
		
		//3. 객체생성
		//스프링 객체생성 방법 => 의존관계 주입(DI Dependency Injection)
		//멤버변수 정의 <= 외부에 있는 xml에서 MemberServiceImpl 객체생성한 것을 전달해오면 받음
		//받아오는 방법 1. 생성자  2. set 메서드
		
		user_memberDAO.user_register(user_memberDTO);
		
	}

	@Override
	public user_MemberDTO user_userCheck(user_MemberDTO user_memberDTO) {
		System.out.println("user_MemberServiceImpl user_userCheck()");
		return user_memberDAO.user_userCheck(user_memberDTO);
	}

	@Override
	public user_MemberDTO user_getMember(String u_id) {
		System.out.println("user_MemberServiceImpl user_getMember()");
		return user_memberDAO.user_getMember(u_id);
	}

	@Override
	public void user_updateMember(user_MemberDTO user_memberDTO) {
		System.out.println("MemberServiceImpl updateMember()");
		user_memberDAO.user_updateMember(user_memberDTO);
	}
	
	@Override
	public int user_IdCheck(user_MemberDTO user_memberDTO){
		int result = user_memberDAO.user_IdCheck(user_memberDTO);
		return result;
	}
	
//
//	@Override
//	public void deleteMember(MemberDTO memberDTO) {
//		System.out.println("MemberServiceImpl deleteMember()");
//		memberDAO.deleteMember(memberDTO);
//	}
//
//	@Override
//	public List<MemberDTO> getMemberList() {
//		System.out.println("MemberServiceImpl getMemberList()");
//		return memberDAO.getMemberList();
//	}

	@Override
	public List<user_MemberDTO> user_list() {
		System.out.println("MemberServiceImpl user_list()");
		return user_memberDAO.user_list();
	}

	@Override
	public void user_updateList(user_MemberDTO user_memberDTO) {
		System.out.println("MemberServiceImpl updateMember()");
		user_memberDAO.user_updateList(user_memberDTO);
	}
	
	@Override
	public List<ReservationDTO> user_reservation(String u_id) {
		return user_memberDAO.user_reservation(u_id);
	}
}
