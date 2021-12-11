package com.itwill.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.domain.TrainerDTO;

@Service
public interface MapService {
	
	public List<TrainerDTO> getAddress(String t_extraAddress);

}
