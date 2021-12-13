package com.itwill.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.MapDAO;
import com.itwill.domain.Trainer_MemberDTO;

@Service
public class MapServiceImpl implements MapService {
	
	@Inject
	private MapDAO mapDAO;
	
	@Override
	public List<Trainer_MemberDTO> getAddress(String t_extraAddress) {
		
		return mapDAO.getAddress(t_extraAddress);
		
	}


}
