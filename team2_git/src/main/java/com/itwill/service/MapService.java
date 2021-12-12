package com.itwill.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwill.domain.Trainer_MemberDTO;


@Service
public interface MapService {
	
	public List<Trainer_MemberDTO> getAddress(String t_extraAddress);

}
