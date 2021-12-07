package com.itwill.service;


import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.TrainerDAO;
import com.itwill.domain.ReviewDTO;
//import com.itwill.domain.MemberDTO;
import com.itwill.domain.TrainerDTO;



@Service
public class TrainerServiceImpl implements TrainerService {
	//멤버변수
//	TrainerDAO trainerDAO = new TrainerDAO();
//	@Inject
//	private TrainerDTO trainerDTO;
	@Inject
	private TrainerDAO trainerDAO;
	//리턴값 없음 insertMember(MemberDTO memberDTO) 메서드 정의


	@Override
	public List getTrainerInfo(String t_id)  {
		System.out.println("TrainerService getInfo()");
		return trainerDAO.getTrainer(t_id);
	}


	@Override
	public void insertReview(ReviewDTO reviewDTO) {
		//b_num max(b_num)+1,  date (디폴트)
		if(trainerDAO.getMaxNum()==null) {
			//글이 없는 경우 1로 설정
			reviewDTO.setRe_num(1);
		}else {
			//글이 있으면 max(b_num)+1
			reviewDTO.setRe_num(trainerDAO.getMaxNum()+1);
		}
		trainerDAO.insertReview(reviewDTO);
	}

//	@Override
//	public List<MemberDTO> getTrainerInfoList() throws Exception {
//		System.out.println("TrainerService getTrainerList()");
//		return memberDAO.getMemberList();
	
//	}


}
