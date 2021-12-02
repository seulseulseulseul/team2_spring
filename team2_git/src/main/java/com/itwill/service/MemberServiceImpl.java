package com.itwill.service;


import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.MemberDAO;
import com.itwillbs.dao.MemberDAOImpl;
import com.itwillbs.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	//멤버변수
//	MemberDAO memberDAO = new MemberDAOImpl();
	@Inject
	private MemberDAO memberDAO;
	//set메서드
//	@Inject
//	public void setMemberDAO(MemberDAO memberDAO) {
//		this.memberDAO = memberDAO;
//	}
	
	//리턴값 없음 insertMember(MemberDTO memberDTO) 메서드 정의
	@Override
	public void insertMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl insertMember()");
		//처리단계에서 날짜생성해서 저장
		memberDTO.setDate(new Timestamp(System.currentTimeMillis()));
		
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
		memberDAO.insertMember(memberDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl userCheck()");
		return memberDAO.userCheck(memberDTO);
	}

	@Override
	public MemberDTO getMember(String id) {
		System.out.println("MemberServiceImpl getMember()");
		return memberDAO.getMember(id);
	}

	@Override
	public MemberDTO updateMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl updateMember()");
		return memberDAO.updateMember(memberDTO);
	}

	@Override
	public void deleteMember(MemberDTO memberDTO) {
		System.out.println("MemberServiceImpl deleteMember()");
		memberDAO.deleteMember(memberDTO);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		System.out.println("MemberServiceImpl getMemberList()");
		return memberDAO.getMemberList();
	}


}
