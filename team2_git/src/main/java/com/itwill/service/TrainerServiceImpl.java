package com.itwill.service;


import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.TrainerDAO;
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
	public List getTrainerInfo(String tid)  {
		System.out.println("TrainerService getInfo()");
		return trainerDAO.getTrainer(tid);
	}

//	@Override
//	public List<MemberDTO> getTrainerInfoList() throws Exception {
//		System.out.println("TrainerService getTrainerList()");
//		return memberDAO.getMemberList();
	
//	}


}
