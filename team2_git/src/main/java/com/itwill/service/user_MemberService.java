package com.itwill.service;

import java.util.List;

import com.itwill.domain.user_MemberDTO;

import com.itwill.domain.ReservationDTO;

public interface user_MemberService {
	//자식클래스 공통된 틀 제시, 부모인터페이스
	//추상 메서드 정의
	public void user_register(user_MemberDTO user_memberDTO); 
	
	//리턴할 형 MemberDTO userCheck(memberDTO) 메서드
	public user_MemberDTO user_userCheck(user_MemberDTO user_memberDTO);
	
	//리턴할 형 MemberDTO getMember(String id) 메서드
	public user_MemberDTO user_getMember(String u_id);
	
	public void user_updateMember(user_MemberDTO user_memberDTO);
	
	public int user_IdCheck(user_MemberDTO user_memberDTO);
//	
//	public void user_deleteMember(user_MemberDTO user_memberDTO);
//	
//	public List<user_MemberDTO> user_getMemberList();
	public List<user_MemberDTO> user_list();
	
	public void user_updateList(user_MemberDTO user_memberDTO);
	
	public List<ReservationDTO> user_reservation(String u_id);
}
