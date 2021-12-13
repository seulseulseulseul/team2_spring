package com.itwill.dao;

import java.util.List;

import com.itwill.domain.PageDTO;
import com.itwill.domain.ReviewDTO;

public interface TrainerDAO {
	public List getTrainer(String t_id);
	public void insertReview(ReviewDTO reviewDTO);
	public Integer getMaxNum();
	public List<ReviewDTO> getReviewList(String t_id);
}
