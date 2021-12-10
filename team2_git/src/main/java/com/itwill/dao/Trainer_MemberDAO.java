package com.itwill.dao;

import java.util.List;

import com.itwill.domain.Trainer_MemberDTO;

public interface Trainer_MemberDAO {
public void trainer_register(Trainer_MemberDTO trainer_memberDTO);
	
	public Trainer_MemberDTO trainer_userCheck(Trainer_MemberDTO trainer_memberDTO);
	
	public Trainer_MemberDTO trainer_getMember(String t_id);
	
	public void trainer_updateMember(Trainer_MemberDTO trainer_memberDTO);
	
	public int trainer_IdCheck(Trainer_MemberDTO trainer_memberDTO);
	
	public void insertTrainer(Trainer_MemberDTO trainer_memberDTO);
	
	public List<Trainer_MemberDTO> trainer_getinfo(String t_id);
	
}
 	