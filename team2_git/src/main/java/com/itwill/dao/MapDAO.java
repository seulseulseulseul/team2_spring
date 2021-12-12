package com.itwill.dao;

import java.util.List;

import com.itwill.domain.Trainer_MemberDTO;


public interface MapDAO {
	
	public List<Trainer_MemberDTO> getAddress(String t_extraAddress);

}
