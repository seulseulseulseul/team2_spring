package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.MemberDTO;

public interface MemberDAO {
	//부모의 공통된 틀 , 인터페이스
	// 추상메서드 정의
	public void insertMember(MemberDTO memberDTO);
	
//  리턴할형 MemberDTO   userCheck(memberDTO)메서드
	public MemberDTO userCheck(MemberDTO memberDTO);
	
	// 리턴할형 MemberDTO getMember(String id)
	public MemberDTO getMember(String id);
	
	// memberService.updateMember(memberDTO);
		public void updateMember(user_MemberDTO user_memberDTO);
		
		//memberService.deleteMember(memberDTO);
		public void deleteMember(MemberDTO memberDTO);
		
		//List<MemberDTO> memberList=memberService.getMemberList();
		public List<MemberDTO> getMemberList();
}
