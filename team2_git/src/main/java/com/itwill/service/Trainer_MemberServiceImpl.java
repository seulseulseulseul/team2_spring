package com.itwill.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.Trainer_MemberDAO;
import com.itwill.dao.Trainer_MemberDAOImpl;
import com.itwill.domain.Trainer_MemberDTO;

@Service
public class Trainer_MemberServiceImpl implements Trainer_MemberService{

	//멤버변수 
//	MemberDAO memberDAO=new MemberDAOImpl();
	@Inject
	private Trainer_MemberDAO trainer_memberDAO;
	
	//set메서드 
//	@Inject
//	public void setMemberDAO(MemberDAO memberDAO) {
//		this.memberDAO = memberDAO;
//	}

	// 리턴값없음 insertMember(MemberDTO memberDTO) 메서드 정의
	@Override
	public void trainer_register(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("MemberServiceImpl trainer_register()");
		
		// 1. 객체생성
		// MemberDAOImpl 객체생성
//	MemberDAOImpl 
		//trainer_memberDAO=new Trainer_MemberDAOImpl();
	// insertMember(memberDTO) 메서드 호출
//	memberDAO.insertMember(memberDTO);
		
		// 2. 객체생성  수정최소화 방법 =>  부모인터페이스 틀  => 부모 = 자식 객체생성 
		//  부모인터페이스 틀  패키지 com.itwillbs.dao 인터페이스 파일 MemberDAO 추상메서드 정의 
		//              MemberDAOImpl 부모인터페이스 상속 MemberDAO  메서드 오버라이딩
//		// 부모인터페이스 MemberDAO  = 자식클래스 객체생성 MemberDAOImpl 
//		MemberDAO memberDAO=new MemberDAOImpl();
//		// 부모인터페이스 변수.insertMember(memberDTO) 메서드 호출
//		memberDAO.insertMember(memberDTO);
		
		// 3. 객체생성
		// 스프링 객체생성 방법 => 의존관계 주입 (DI Dependency Injection)
		// 멤버변수 정의  <= 외부에 있는 xml에서 MemberDAOImpl 객체생성한것을 전달해오면 받음
		// 받아오는 방법  1. 생성자  2. set메서드
		
		trainer_memberDAO.trainer_register(trainer_memberDTO);
		
	}

	@Override
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("MemberServiceImpl trainer_userCheck()");
		return trainer_memberDAO.trainer_userCheck(trainer_memberDTO);
	}

	@Override
	public Trainer_MemberDTO trainer_getMember(String t_id) {
		
		return trainer_memberDAO.trainer_getMember(t_id);
	}

	@Override
	public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO) {
		
		trainer_memberDAO.trainer_updateMember(trainer_memberDTO);
	}

	@Override
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO){
		int result = trainer_memberDAO.trainer_IdCheck(trainer_memberDTO);
		return result;
	}

}




