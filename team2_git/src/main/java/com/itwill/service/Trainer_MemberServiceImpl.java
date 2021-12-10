package com.itwill.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.Trainer_MemberDAO;
import com.itwill.dao.Trainer_MemberDAOImpl;
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
	   public List<Trainer_MemberDTO> trainer_getinfo(String t_id)  {
	      System.out.println("TrainerService getInfo()");
	      return trainer_memberDAO.trainer_getinfo(t_id);
	
	}
}




