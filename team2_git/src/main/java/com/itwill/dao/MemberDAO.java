package com.itwill.dao;



import java.util.List;

import com.itwill.domain.MemberDTO;



public interface MemberDAO {
	//부모의 공통된 틀, 인터페이스
	//추상메서드 정의
	public void insertMember(MemberDTO memberDTO); 
	
	//리턴할 형 MemberDTO userCheck(memberDTO) 메서드
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	//리턴할 형 MemberDTO getMember(String id) 메서드
	public MemberDTO getMember(String id);
	
	public MemberDTO updateMember(MemberDTO memberDTO);
	
	public void deleteMember(MemberDTO memberDTO);
	
	public List<MemberDTO> getMemberList();
}
