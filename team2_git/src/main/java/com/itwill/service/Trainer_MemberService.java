package com.itwill.service;

import java.util.List;

import com.itwill.domain.ReservationDTO;
import com.itwill.domain.ReviewDTO;
import com.itwill.domain.Trainer_MemberDTO;

public interface Trainer_MemberService{
	// �ڽ�Ŭ���� ����� Ʋ ����, �θ��������̽� 
	// �߻� �޼��� ����
	public void trainer_register(Trainer_MemberDTO trainer_memberDTO);
		
	//  �������� MemberDTO   userCheck(memberDTO)�޼���
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO);
		
	// �������� MemberDTO getMember(String id)
	public Trainer_MemberDTO trainer_getMember(String t_id);
		
	// memberService.updateMember(memberDTO);
	public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO);
	
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO);

	// memberService.insert
	public void insertTrainer(Trainer_MemberDTO trainer_memberDTO);

	
	public void insertReview(ReviewDTO reviewDTO);
	
	public List<ReviewDTO> getReviewList(String t_id);
	
	public List<Trainer_MemberDTO> trainer_list();

	public void trainer_updateList(Trainer_MemberDTO trainer_memberDTO);
	
	public void insertReservation(ReservationDTO reservationDTO);
	
	public List<ReservationDTO> trainer_reservation(String t_id);
}