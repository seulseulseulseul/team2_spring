package com.itwill.dao;

import java.util.List;

import com.itwill.domain.ReviewDTO;
import com.itwill.domain.Trainer_MemberDTO;

public interface Trainer_MemberDAO {

	public void trainer_register(Trainer_MemberDTO trainer_memberDTO);
	
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO);
	
	// �������� MemberDTO getMember(String id)
	public Trainer_MemberDTO trainer_getMember(String t_id);
	
	// memberService.updateMember(memberDTO);
	public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO);
	
	// ���̵� �ߺ�üũ
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO);
	
	// insert
	public void insertTrainer(Trainer_MemberDTO trainer_memberDTO);

	public void insertReview(ReviewDTO reviewDTO);
	public Integer getMaxNum();
	public List<ReviewDTO> getReviewList(String t_id);
	public List<Trainer_MemberDTO> trainer_list();
	
	public void trainer_updateList(Trainer_MemberDTO trainer_memberDTO);
}
 	