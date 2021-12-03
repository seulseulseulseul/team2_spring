package com.itwill.dao;

import java.util.List;

import com.itwill.domain.Trainer_MemberDTO;

public interface Trainer_MemberDAO {
	//부모의 공통된 틀 , 인터페이스
	// 추상메서드 정의
	public void trainer_register(Trainer_MemberDTO trainer_memberDTO);
	
//  리턴할형 MemberDTO   userCheck(memberDTO)메서드
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO);
	
	// 리턴할형 MemberDTO getMember(String id)
	public Trainer_MemberDTO trainer_getMember(String t_id);
	
	// memberService.updateMember(memberDTO);
		public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO);

}
