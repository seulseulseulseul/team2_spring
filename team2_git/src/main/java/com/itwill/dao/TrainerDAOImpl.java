package com.itwill.dao;

import java.util.List;

import com.itwill.domain.ReviewDTO;

public interface TrainerDAOImpl {
	public List getTrainer(String t_id);
	public void insertReview(ReviewDTO reviewDTO);
	public Integer getMaxNum();
}
