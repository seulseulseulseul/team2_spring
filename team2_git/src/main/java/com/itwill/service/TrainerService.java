package com.itwill.service;

import java.util.List;


import com.itwill.domain.TrainerDTO;

public interface TrainerService {

		public void insertTrainer(TrainerDTO trainerDTO);
		
		
		//리턴할 형 MemberDTO userCheck(trainerDTO) 메서드
		public TrainerDTO trainerCheck(TrainerDTO trainerDTO);
		
		//리턴할 형 MemberDTO getMember(String id) 메서드
		public TrainerDTO getTrainer(String id);
		
		public TrainerDTO updateTrainer(TrainerDTO trainerDTO);
		
	
		
		public List<TrainerDTO> getTrainerList();
	
		
}
