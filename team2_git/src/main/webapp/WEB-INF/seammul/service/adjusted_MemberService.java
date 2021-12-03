package com.itwill.service;



import java.util.List;

import com.itwill.domain.MemberDTO;



public interface MemberService {
	//자식클래스 공통된 틀 제시, 부모인터페이스
	//추상 메서드 정의
	public void insertMember(MemberDTO memberDTO); 
	
	//리턴할 형 MemberDTO userCheck(memberDTO) 메서드
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	//리턴할 형 MemberDTO getMember(String id) 메서드
	public MemberDTO getMember(String id);
	
	// memberService.updateMember(user_memberDTO);
	public user_MemberDTO updateMember(user_MemberDTO user_memberDTO);
	
	//memberService.deleteMember(memberDTO);
	public void deleteMember(MemberDTO memberDTO);
	
	//List<MemberDTO> memberList=memberService.getMemberList();
	public List<MemberDTO> getMemberList();
}
