package com.itwill.dao;

import java.util.List;

import com.itwill.domain.TrainerDTO;

public interface TrainerDAO {
	
	public void insertTrainer(TrainerDTO trainerDTO);
	
	public TrainerDTO trainerCheck(TrainerDTO trainerDTO);
	
	public TrainerDTO getTrainer(String t_id);
	
	public TrainerDTO updateTrainer(TrainerDTO trainerDTO);
	
	public List<TrainerDTO> getTrainerList();
	
		
}
