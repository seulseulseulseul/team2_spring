package com.itwill.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.Trainer_MemberDAO;
import com.itwill.dao.Trainer_MemberDAOImpl;
import com.itwill.domain.ReservationDTO;
import com.itwill.domain.ReviewDTO;
import com.itwill.domain.Trainer_MemberDTO;

@Service
public class Trainer_MemberServiceImpl implements Trainer_MemberService{

	@Inject
	private Trainer_MemberDAO trainer_memberDAO;
	
	@Override
	public void trainer_register(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("MemberServiceImpl trainer_register()");
	
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
		System.out.println("MemberServiceImpl updateMember()");
		trainer_memberDAO.trainer_updateMember(trainer_memberDTO);
	}

	@Override
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO){
		int result = trainer_memberDAO.trainer_IdCheck(trainer_memberDTO);
		return result;
	}

	@Override
	public void insertTrainer(Trainer_MemberDTO trainer_memberDTO) {

		System.out.println("service insertT");
		trainer_memberDAO.insertTrainer(trainer_memberDTO);
			
		
	}
	
	@Override
	public void insertReview(ReviewDTO reviewDTO) {
		//b_num max(b_num)+1,  date (디폴트)
		if(trainer_memberDAO.getMaxNum()==null) {
			//글이 없는 경우 1로 설정
			reviewDTO.setRe_num(1);
		}else {
			//글이 있으면 max(b_num)+1
			reviewDTO.setRe_num(trainer_memberDAO.getMaxNum()+1);
		}
		trainer_memberDAO.insertReview(reviewDTO);
	}


	@Override
	public List<ReviewDTO> getReviewList(String t_id) {
		System.out.println("Service getReviewList");
		return trainer_memberDAO.getReviewList(t_id);
	}

//	@Override
//	   public List<Trainer_MemberDTO> trainer_getinfo(String t_id)  {
//	      System.out.println("TrainerService getInfo()");
//	      return trainer_memberDAO.trainer_getinfo(t_id);
//	
//	}
	@Override
	public List<Trainer_MemberDTO> trainer_list() {
		System.out.println("MemberServiceImpl user_list()");
		return trainer_memberDAO.trainer_list();
	}
	
	@Override
	public void trainer_updateList(Trainer_MemberDTO trainer_memberDTO) {
		System.out.println("MemberServiceImpl updateMember()");
		trainer_memberDAO.trainer_updateList(trainer_memberDTO);
	}

	@Override
	public void insertReservation(ReservationDTO reservationDTO) {
		System.out.println("MemberServiceImpl insertReservation()");
		trainer_memberDAO.insertReservation(reservationDTO);
	}

	@Override
	public List<ReservationDTO> trainer_reservation(String t_id) {
		return trainer_memberDAO.trainer_reservation(t_id);
	}

	@Override
	public void trainer_cashUpdate(String t_id) {
		System.out.println("MemberServiceImpl trainer_cashUpdate()");
		trainer_memberDAO.trainer_cashUpdate(t_id);
		
	}
}