package com.itwill.service;



import java.util.List;

import com.itwillbs.domain.MemberDTO;

public interface MemberService {
	//자식클래스 공통된 틀 제시, 부모인터페이스
	//추상 메서드 정의
	public void insertMember(MemberDTO memberDTO); 
	
	//리턴할 형 MemberDTO userCheck(memberDTO) 메서드
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	//리턴할 형 MemberDTO getMember(String id) 메서드
	public MemberDTO getMember(String id);
	
	public MemberDTO updateMember(MemberDTO memberDTO);
	
	public void deleteMember(MemberDTO memberDTO);
	
	public List<MemberDTO> getMemberList();
}
