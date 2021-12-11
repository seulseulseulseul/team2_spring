package com.itwill.dao;

import java.util.List;

import com.itwill.domain.TrainerDTO;

public interface MapDAO {
	
	public List<TrainerDTO> getAddress(String t_extraAddress);

}
