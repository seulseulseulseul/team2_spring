package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;

import com.itwillbs.domain.ReplyDTO;
import com.itwillbs.domain.PageDTO;


public interface ReplyDAO {
	
	public Integer getMaxNum();
	
	public void insertBoard(ReplyDTO commentDTO);
	
	public List<ReplyDTO> getBoardList(PageDTO pageDTO);

	public ReplyDTO numCheck(ReplyDTO commentDTO);
	
	public void updateBoard(ReplyDTO commentDTO);
	
	public void deleteBoard(int r_num);
	
	public Integer getBoardCount(int c_num);
}
