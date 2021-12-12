package com.itwill.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwill.dao.MapDAO;
import com.itwill.domain.TrainerDTO;

@Service
public class MapServiceImpl implements MapService {
	
	@Inject
	private MapDAO mapDAO;
	
	@Override
	public List<TrainerDTO> getAddress(String t_extraAddress) {
		
		return mapDAO.getAddress(t_extraAddress);
		
	}


}
